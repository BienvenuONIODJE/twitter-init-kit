"""Twitter-Init-Kit Check Command - Tool Verification"""

import subprocess
from typing import Dict, List, Tuple

import typer
from rich.console import Console
from rich.table import Table

console = Console()


def check_command(
    debug: bool = typer.Option(
        False,
        "--debug",
        help="Enable debug output",
    ),
) -> None:
    """Check for installed required tools."""

    if debug:
        console.print("[yellow]Debug mode enabled[/yellow]")

    # Check essential tools
    essential_tools = {
        "git": "git --version",
        "python": "python --version",
    }

    # Check optional AI agent tools
    agent_tools = {
        "claude": "claude --version",
        "cursor": "cursor --version",
        "windsurf": "windsurf --version",
    }

    # Run checks
    essential_results = _check_tools(essential_tools, debug)
    agent_results = _check_tools(agent_tools, debug)

    # Create results table
    table = Table(title="System Check Results")
    table.add_column("Tool", style="cyan")
    table.add_column("Status", style="white")
    table.add_column("Version", style="dim")

    # Add essential tools
    for tool, (found, version) in essential_results.items():
        status = "[green]✓ Found[/green]" if found else "[red]✗ Missing[/red]"
        table.add_row(tool, status, version or "N/A")

    # Add agent tools
    for tool, (found, version) in agent_results.items():
        status = "[green]✓ Found[/green]" if found else "[dim]Not installed[/dim]"
        table.add_row(f"{tool} (optional)", status, version or "N/A")

    console.print("\n")
    console.print(table)

    # Check if essential tools are missing
    missing_essential = [tool for tool, (found, _) in essential_results.items() if not found]

    if missing_essential:
        console.print("\n[yellow]⚠ Warning:[/yellow] Missing essential tools:")
        for tool in missing_essential:
            console.print(f"  • {tool}")
        console.print("\nPlease install missing tools before proceeding.")
        raise typer.Exit(1)

    # Show recommendations
    found_agents = [tool for tool, (found, _) in agent_results.items() if found]

    if not found_agents:
        console.print("\n[cyan]💡 Tip:[/cyan] Install an AI coding agent for the best experience:")
        console.print("  • Claude Code: https://docs.claude.com/claude-code")
        console.print("  • Cursor: https://cursor.sh")
        console.print("  • Windsurf: https://codeium.com/windsurf")

    console.print("\n[green]✓[/green] System check complete!\n")


def _check_tools(tools: Dict[str, str], debug: bool = False) -> Dict[str, Tuple[bool, str]]:
    """Check if tools are installed and get versions.

    Args:
        tools: Dictionary mapping tool names to version commands
        debug: Enable debug output

    Returns:
        Dictionary mapping tool names to (found, version) tuples
    """
    results = {}

    for tool, cmd in tools.items():
        try:
            result = subprocess.run(
                cmd,
                shell=True,
                capture_output=True,
                timeout=5,
                text=True,
            )

            if result.returncode == 0:
                # Extract version from output
                version = result.stdout.strip().split("\n")[0]
                results[tool] = (True, version)

                if debug:
                    console.print(f"[dim]✓ {tool}: {version}[/dim]")
            else:
                results[tool] = (False, None)
                if debug:
                    console.print(f"[dim]✗ {tool}: not found[/dim]")

        except (subprocess.TimeoutExpired, FileNotFoundError, Exception) as e:
            results[tool] = (False, None)
            if debug:
                console.print(f"[dim]✗ {tool}: {type(e).__name__}[/dim]")

    return results
