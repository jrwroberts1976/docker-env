#!/usr/bin/env python3

from pathlib import Path


BASE = Path("docs/courses/github-enterprise/modules")
MKDOCS = Path("mkdocs.yml")


def clean_title(title):

    title = title.replace("-", " ").title()

    # Brand names
    title = title.replace("Github", "GitHub")

    # Common acronyms
    replacements = {
        "Sso": "SSO",
        "Dns": "DNS",
        "Cicd": "CI/CD",
        "Api": "API",
        "Idam": "IDAM",
        "Oauth": "OAuth",
        "Vm": "VM",
        "Ssl": "SSL",
        "Ssh": "SSH",
    }

    for old, new in replacements.items():
        title = title.replace(old, new)

    return title


def sort_key(path):

    """
    Sort markdown files numerically by lesson number.
    Supports:
      lesson-01-name.md
      01-name.md
      10-name.md
    """

    name = path.stem

    for part in name.split("-"):

        if part.isdigit():

            return int(part)

    return 999


def title_from_filename(filename):

    name = filename.stem

    # Remove lesson prefix
    if name.startswith("lesson-"):

        name = name.replace("lesson-", "", 1)

    parts = name.split("-", 1)

    if len(parts) == 2 and parts[0].isdigit():

        number = parts[0]

        title = clean_title(parts[1])

        return f"Lesson {number} - {title}"

    return clean_title(name)


def module_title_from_directory(directory):

    name = directory.name

    parts = name.split("-", 1)

    if len(parts) == 2 and parts[0].isdigit():

        number = parts[0]

        title = clean_title(parts[1])

        return f"Module {number} - {title}"

    return clean_title(name)


def generate_nav():

    lines = []

    lines.append("      - GitHub Enterprise Server:")

    for module in sorted(BASE.iterdir()):

        if not module.is_dir():
            continue

        lines.append(
            f"          - {module_title_from_directory(module)}:"
        )

        readme = module / "README.md"

        if readme.exists():

            lines.append(
                f"              - Overview: courses/github-enterprise/modules/{module.name}/README.md"
            )

        markdown_files = sorted(
            module.rglob("*.md"),
            key=sort_key
        )

        for md in markdown_files:

            if md.name == "README.md":
                continue

            title = title_from_filename(md)

            path = (
                f"courses/github-enterprise/modules/"
                f"{module.name}/{md.name}"
            )

            lines.append(
                f"              - {title}: {path}"
            )

    return "\n".join(lines)


def update_mkdocs():

    if not MKDOCS.exists():

        raise FileNotFoundError(
            "mkdocs.yml not found in current directory"
        )

    content = MKDOCS.read_text()

    start_marker = (
        "      - GitHub Enterprise Server:"
    )

    start = content.find(start_marker)

    if start == -1:

        raise Exception(
            "GitHub Enterprise navigation block not found"
        )

    # Find next top-level navigation item
    end = content.find(
        "\n      - ",
        start + len(start_marker)
    )

    if end == -1:

        end = len(content)

    new_nav = generate_nav()

    updated = (
        content[:start]
        + new_nav
        + content[end:]
    )

    MKDOCS.write_text(updated)

    print(
        "Updated mkdocs.yml GitHub Enterprise navigation"
    )


if __name__ == "__main__":

    update_mkdocs()
