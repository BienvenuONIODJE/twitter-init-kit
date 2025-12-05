"""Twitter-Init-Kit Template Engine - Variable Substitution"""

import re
from pathlib import Path
from typing import Dict, List, Optional

from rich.console import Console

console = Console()


class TemplateEngine:
    """Template engine for rendering .twitterkit/ templates with variable substitution."""

    def __init__(self, debug: bool = False):
        """Initialize template engine.

        Args:
            debug: Enable debug output
        """
        self.debug = debug
        self._cache: Dict[str, str] = {}

    def render_template(
        self,
        template_path: Path,
        variables: Dict[str, str],
        validate: bool = True,
    ) -> str:
        """Render a template file with variable substitution.

        Args:
            template_path: Path to template file
            variables: Dictionary of variable name -> value mappings
            validate: Whether to validate all variables are provided

        Returns:
            Rendered template content

        Raises:
            FileNotFoundError: If template file doesn't exist
            ValueError: If validation fails (missing variables)
        """
        if not template_path.exists():
            raise FileNotFoundError(f"Template not found: {template_path}")

        # Check cache
        cache_key = str(template_path)
        if cache_key not in self._cache:
            self._cache[cache_key] = template_path.read_text()

        template_content = self._cache[cache_key]

        # Find all variables in template
        template_vars = self._extract_variables(template_content)

        if self.debug:
            console.print(f"[dim]Template variables found: {template_vars}[/dim]")
            console.print(f"[dim]Variables provided: {list(variables.keys())}[/dim]")

        # Validate all variables are provided
        if validate:
            missing_vars = set(template_vars) - set(variables.keys())
            if missing_vars:
                raise ValueError(
                    f"Missing required variables for template {template_path.name}: "
                    f"{', '.join(sorted(missing_vars))}"
                )

        # Perform substitution
        rendered = template_content
        for var_name, var_value in variables.items():
            # Replace $VAR_NAME and ${VAR_NAME} patterns
            rendered = rendered.replace(f"${var_name}", var_value)
            rendered = rendered.replace(f"${{{var_name}}}", var_value)

        return rendered

    def render_and_write(
        self,
        template_path: Path,
        output_path: Path,
        variables: Dict[str, str],
        validate: bool = True,
        overwrite: bool = False,
    ) -> bool:
        """Render template and write to output file.

        Args:
            template_path: Path to template file
            output_path: Path to output file
            variables: Dictionary of variable name -> value mappings
            validate: Whether to validate all variables are provided
            overwrite: Whether to overwrite existing file

        Returns:
            True if successful, False otherwise
        """
        try:
            # Check if output exists
            if output_path.exists() and not overwrite:
                if self.debug:
                    console.print(f"[dim]Skipping {output_path.name} (already exists)[/dim]")
                return False

            # Render template
            rendered = self.render_template(template_path, variables, validate)

            # Ensure output directory exists
            output_path.parent.mkdir(parents=True, exist_ok=True)

            # Write output
            output_path.write_text(rendered)

            if self.debug:
                console.print(f"[dim]✓ Rendered: {output_path.name}[/dim]")

            return True

        except Exception as e:
            console.print(f"[red]Error rendering template {template_path.name}: {e}[/red]")
            return False

    def _extract_variables(self, content: str) -> List[str]:
        """Extract all variable names from template content.

        Args:
            content: Template content

        Returns:
            List of variable names (without $ prefix)
        """
        # Match $VAR_NAME and ${VAR_NAME} patterns
        pattern = r'\$(?:\{)?([A-Z_][A-Z0-9_]*)(?:\})?'
        matches = re.findall(pattern, content)

        return sorted(set(matches))

    def get_required_variables(self, template_path: Path) -> List[str]:
        """Get list of required variables for a template.

        Args:
            template_path: Path to template file

        Returns:
            List of required variable names
        """
        if not template_path.exists():
            return []

        content = template_path.read_text()
        return self._extract_variables(content)

    def clear_cache(self) -> None:
        """Clear the template cache."""
        self._cache.clear()

    def validate_template(self, template_path: Path, variables: Dict[str, str]) -> tuple[bool, List[str]]:
        """Validate that all required variables are provided.

        Args:
            template_path: Path to template file
            variables: Dictionary of variable name -> value mappings

        Returns:
            Tuple of (is_valid, list_of_missing_variables)
        """
        required_vars = self.get_required_variables(template_path)
        missing_vars = set(required_vars) - set(variables.keys())

        return (len(missing_vars) == 0, sorted(missing_vars))
