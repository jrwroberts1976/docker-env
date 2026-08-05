#!/usr/bin/env python3

from pathlib import Path


BASE = Path("docs/courses/github-enterprise/modules")
MKDOCS = Path("mkdocs.yml")


def title_from_filename(filename):
    name = filename.stem

    if name.startswith("lesson-"):
        name = name.replace("lesson-", "", 1)

    return name.replace("-", " ").title()


def generate_nav():

    lines = []

    lines.append("      - GitHub Enterprise Server:")

    for module in sorted(BASE.iterdir()):

        if not module.is_dir():
            continue

        lines.append(
            f"          - {module.name.replace('-', ' ').title()}:"
        )

        readme = module / "README.md"

        if readme.exists():
            lines.append(
                f"              - Overview: courses/github-enterprise/modules/{module.name}/README.md"
            )

        for md in sorted(module.rglob("*.md")):

            if md.name == "README.md":
                continue

            title = title_from_filename(md)

            relative = md.as_posix().split(
                "docs/",
                1
            )[1]

            lines.append(
                f"              - {title}: {relative}"
            )

    return "\n".join(lines)


def update_mkdocs():

    if not MKDOCS.exists():
        raise FileNotFoundError("mkdocs.yml not found")

    content = MKDOCS.read_text()

    start_marker = "      - GitHub Enterprise Server:"

    start = content.find(start_marker)

    if start == -1:
        raise Exception(
            "GitHub Enterprise navigation block not found"
        )

    end = content.find(
        "\n      - ",
        start + len(start_marker)
    )

    if end == -1:
        end = len(content)

    updated = (
        content[:start]
        + generate_nav()
        + content[end:]
    )

    MKDOCS.write_text(updated)

    print("Updated mkdocs.yml GitHub Enterprise navigation")


if __name__ == "__main__":
    update_mkdocs()
