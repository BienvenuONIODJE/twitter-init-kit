"""Twitter-Init-Kit Init Command - Project Initialization"""

import shutil
import subprocess
from pathlib import Path
from typing import Optional

import typer
from rich.console import Console
from rich.panel import Panel

from ..template_engine import TemplateEngine
from ..git_utils import GitUtils

console = Console()


def init_command(
    project_name: Optional[str] = typer.Argument(
        None,
        help="Project name or '.' for current directory",
    ),
    ai: Optional[str] = typer.Option(
        None,
        "--ai",
        help="AI assistant: claude, cursor, windsurf, gemini, copilot, etc.",
    ),
    script: Optional[str] = typer.Option(
        "sh",
        "--script",
        help="Script variant: sh (bash/zsh) or ps (PowerShell)",
    ),
    here: bool = typer.Option(
        False,
        "--here",
        help="Initialize in current directory",
    ),
    force: bool = typer.Option(
        False,
        "--force",
        help="Force initialization in non-empty directory",
    ),
    no_git: bool = typer.Option(
        False,
        "--no-git",
        help="Skip git repository initialization",
    ),
    ignore_agent_tools: bool = typer.Option(
        False,
        "--ignore-agent-tools",
        help="Skip AI agent tool checks",
    ),
    github_token: Optional[str] = typer.Option(
        None,
        "--github-token",
        envvar="GITHUB_TOKEN",
        help="GitHub API token for enhanced features",
    ),
    debug: bool = typer.Option(
        False,
        "--debug",
        help="Enable debug output",
    ),
) -> None:
    """Initialize a new twitter-init-kit project."""

    if debug:
        console.print("[yellow]Debug mode enabled[/yellow]")

    # Determine target directory
    if here:
        target_dir = Path.cwd()
    elif project_name:
        target_dir = Path.cwd() / project_name if project_name != "." else Path.cwd()
    else:
        console.print("[red]Error: Project name required (or use --here)[/red]")
        raise typer.Exit(1)

    # Check if directory exists and has content
    if target_dir.exists() and any(target_dir.iterdir()) and not force:
        console.print(
            f"[yellow]Directory {target_dir} is not empty.[/yellow]\n"
            f"Use --force to override, or --here to use current directory."
        )
        raise typer.Exit(1)

    # Create directory
    target_dir.mkdir(parents=True, exist_ok=True)

    if debug:
        console.print(f"[dim]Target directory: {target_dir}[/dim]")

    # Initialize git repository if not disabled
    if not no_git:
        git_utils = GitUtils(debug=debug)
        if not git_utils.is_git_repo(target_dir):
            if git_utils.init_repo(target_dir):
                console.print("[green]✓[/green] Initialized git repository")
            else:
                console.print("[yellow]⚠[/yellow] Git initialization failed (continuing...)")
        else:
            console.print("[dim]Git repository already exists[/dim]")

    # Copy .twitterkit/ package to target directory
    source_twitterkit = Path(__file__).parent.parent.parent.parent / ".twitterkit"
    target_twitterkit = target_dir / ".twitterkit"

    if source_twitterkit.exists():
        if debug:
            console.print(f"[dim]Copying .twitterkit/ from {source_twitterkit}[/dim]")

        shutil.copytree(source_twitterkit, target_twitterkit, dirs_exist_ok=True)
        console.print("[green]✓[/green] Installed .twitterkit/ package")
    else:
        console.print("[yellow]⚠[/yellow] .twitterkit/ source not found")

    # Copy slash commands to .claude/commands/ if AI agent specified
    if ai and ai.lower() in ["claude", "claude-code"]:
        claude_commands_dir = target_dir / ".claude" / "commands"
        claude_commands_dir.mkdir(parents=True, exist_ok=True)

        commands_source = target_twitterkit / "templates" / "commands"
        if commands_source.exists():
            for cmd_file in commands_source.glob("twitterkit.*.md"):
                dest_file = claude_commands_dir / cmd_file.name
                if dest_file.exists() and not force:
                    console.print(f"[yellow]⚠[/yellow] Skipping {cmd_file.name} (already exists)")
                else:
                    shutil.copy2(cmd_file, dest_file)
                    if debug:
                        console.print(f"[dim]Installed: {cmd_file.name}[/dim]")

            console.print(f"[green]✓[/green] Installed slash commands for Claude Code")
        else:
            console.print(f"[yellow]⚠[/yellow] Command templates not found")

    # Create initial directory structure
    specs_dir = target_dir / "specs"
    specs_dir.mkdir(exist_ok=True)

    refs_dir = target_dir / "refs"
    refs_dir.mkdir(exist_ok=True)

    # Create README if it doesn't exist
    readme_path = target_dir / "README.md"
    if not readme_path.exists():
        readme_content = f"""# {target_dir.name}

Twitter marketing campaign powered by twitter-init-kit

## Quick Start

1. Run `/twitterkit.constitution` to define project principles
2. Run `/twitterkit.specify` to create your Twitter campaign spec
3. Run `/twitterkit.plan` to generate your growth plan
4. Run `/twitterkit.tasks` to break down execution tasks
5. Run `/twitterkit.implement` to execute systematically

## Documentation

- `.twitterkit/memory/constitution.md` - Project principles
- `specs/` - Campaign specifications
- `refs/` - Reference materials and research

## Resources

- [Twitter-Init-Kit Documentation](https://github.com/yourusername/twitter-init-kit)
- [Spec-Kit Original](https://github.com/github/spec-kit)
"""
        readme_path.write_text(readme_content)
        console.print("[green]✓[/green] Created README.md")

    # Display success message
    next_steps = [
        f"1. cd {target_dir.name if target_dir != Path.cwd() else '.'}",
        "2. Run your AI agent (claude, cursor, windsurf, etc.)",
        "3. Use /twitterkit.constitution to define project principles",
        "4. Use /twitterkit.specify to create your Twitter spec",
        "5. Use /twitterkit.plan to generate your growth plan",
        "6. Use /twitterkit.tasks to break down execution",
        "7. Use /twitterkit.implement to execute tasks",
    ]

    if ai:
        next_steps.insert(1, f"   AI Agent: {ai}")

    console.print(
        Panel(
            f"[green]✓ Project initialized at {target_dir}[/green]\n\n"
            f"Next steps:\n" + "\n".join(next_steps),
            title="[bold blue]twitter-init-kit[/bold blue]",
        )
    )
