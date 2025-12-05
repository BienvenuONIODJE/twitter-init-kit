"""Twitter-Init-Kit CLI Tool - Main Entry Point"""

import sys
from pathlib import Path
from typing import Optional

import typer
from rich.console import Console
from rich.panel import Panel

from .commands.init import init_command
from .commands.check import check_command

__version__ = "0.1.0"

app = typer.Typer(
    help="twitterify - Twitter marketing toolkit powered by spec-driven development",
    no_args_is_help=True,
)
console = Console()


# Register commands
app.command(name="init")(init_command)
app.command(name="check")(check_command)


@app.command()
def version() -> None:
    """Show version information."""
    console.print(f"[bold]twitterify[/bold] version {__version__}")
    console.print("Twitter marketing toolkit powered by spec-driven development")
    console.print("\nFor more information, visit: https://github.com/yourusername/twitter-init-kit")


def main() -> None:
    """Main entry point."""
    app()


if __name__ == "__main__":
    main()
