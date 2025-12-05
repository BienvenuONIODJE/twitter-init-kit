"""Twitter-Init-Kit Git Utilities - Git Operations"""

import subprocess
from pathlib import Path
from typing import Optional, List

from rich.console import Console

console = Console()


class GitUtils:
    """Git operations utility class."""

    def __init__(self, debug: bool = False):
        """Initialize Git utilities.

        Args:
            debug: Enable debug output
        """
        self.debug = debug

    def is_git_repo(self, path: Path) -> bool:
        """Check if directory is a git repository.

        Args:
            path: Directory to check

        Returns:
            True if git repository, False otherwise
        """
        try:
            result = subprocess.run(
                ["git", "rev-parse", "--git-dir"],
                cwd=path,
                capture_output=True,
                timeout=5,
            )
            return result.returncode == 0
        except Exception as e:
            if self.debug:
                console.print(f"[dim]Git check error: {e}[/dim]")
            return False

    def init_repo(self, path: Path) -> bool:
        """Initialize a new git repository.

        Args:
            path: Directory to initialize

        Returns:
            True if successful, False otherwise
        """
        try:
            result = subprocess.run(
                ["git", "init"],
                cwd=path,
                capture_output=True,
                timeout=10,
            )

            if result.returncode == 0:
                if self.debug:
                    console.print(f"[dim]✓ Git repository initialized at {path}[/dim]")
                return True
            else:
                if self.debug:
                    console.print(f"[dim]✗ Git init failed: {result.stderr.decode()}[/dim]")
                return False

        except Exception as e:
            if self.debug:
                console.print(f"[dim]✗ Git init error: {e}[/dim]")
            return False

    def get_current_branch(self, path: Path) -> Optional[str]:
        """Get current git branch name.

        Args:
            path: Repository directory

        Returns:
            Branch name or None if not in a git repo
        """
        try:
            result = subprocess.run(
                ["git", "branch", "--show-current"],
                cwd=path,
                capture_output=True,
                timeout=5,
                text=True,
            )

            if result.returncode == 0:
                return result.stdout.strip()
            return None

        except Exception as e:
            if self.debug:
                console.print(f"[dim]Git branch check error: {e}[/dim]")
            return None

    def create_branch(self, path: Path, branch_name: str, checkout: bool = True) -> bool:
        """Create a new git branch.

        Args:
            path: Repository directory
            branch_name: Name of branch to create
            checkout: Whether to checkout the new branch

        Returns:
            True if successful, False otherwise
        """
        try:
            cmd = ["git", "checkout", "-b", branch_name] if checkout else ["git", "branch", branch_name]

            result = subprocess.run(
                cmd,
                cwd=path,
                capture_output=True,
                timeout=10,
            )

            if result.returncode == 0:
                if self.debug:
                    action = "created and checked out" if checkout else "created"
                    console.print(f"[dim]✓ Branch '{branch_name}' {action}[/dim]")
                return True
            else:
                if self.debug:
                    console.print(f"[dim]✗ Branch creation failed: {result.stderr.decode()}[/dim]")
                return False

        except Exception as e:
            if self.debug:
                console.print(f"[dim]✗ Branch creation error: {e}[/dim]")
            return False

    def commit_changes(
        self,
        path: Path,
        message: str,
        add_all: bool = True,
    ) -> bool:
        """Commit changes to git repository.

        Args:
            path: Repository directory
            message: Commit message
            add_all: Whether to add all changes before committing

        Returns:
            True if successful, False otherwise
        """
        try:
            # Add all changes if requested
            if add_all:
                add_result = subprocess.run(
                    ["git", "add", "."],
                    cwd=path,
                    capture_output=True,
                    timeout=10,
                )

                if add_result.returncode != 0:
                    if self.debug:
                        console.print(f"[dim]✗ Git add failed: {add_result.stderr.decode()}[/dim]")
                    return False

            # Commit changes
            commit_result = subprocess.run(
                ["git", "commit", "-m", message],
                cwd=path,
                capture_output=True,
                timeout=10,
            )

            if commit_result.returncode == 0:
                if self.debug:
                    console.print(f"[dim]✓ Changes committed: {message}[/dim]")
                return True
            else:
                if self.debug:
                    console.print(f"[dim]✗ Git commit failed: {commit_result.stderr.decode()}[/dim]")
                return False

        except Exception as e:
            if self.debug:
                console.print(f"[dim]✗ Git commit error: {e}[/dim]")
            return False

    def get_status(self, path: Path) -> Optional[str]:
        """Get git status output.

        Args:
            path: Repository directory

        Returns:
            Status output or None if error
        """
        try:
            result = subprocess.run(
                ["git", "status", "--short"],
                cwd=path,
                capture_output=True,
                timeout=5,
                text=True,
            )

            if result.returncode == 0:
                return result.stdout
            return None

        except Exception as e:
            if self.debug:
                console.print(f"[dim]Git status error: {e}[/dim]")
            return None

    def list_branches(self, path: Path) -> List[str]:
        """List all git branches.

        Args:
            path: Repository directory

        Returns:
            List of branch names
        """
        try:
            result = subprocess.run(
                ["git", "branch", "--format=%(refname:short)"],
                cwd=path,
                capture_output=True,
                timeout=5,
                text=True,
            )

            if result.returncode == 0:
                return [b.strip() for b in result.stdout.strip().split("\n") if b.strip()]
            return []

        except Exception as e:
            if self.debug:
                console.print(f"[dim]Git branch list error: {e}[/dim]")
            return []
