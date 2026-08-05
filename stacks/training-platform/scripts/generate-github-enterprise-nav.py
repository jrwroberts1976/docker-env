#!/usr/bin/env python3

from pathlib import Path


BASE = Path("docs/courses/github-enterprise/modules")


def title_from_filename(filename):
    name = filename.stem

    if name.startswith("lesson-"):
        name = name.replace("lesson-", "", 1)

    name = name.replace("-", " ")

    return name.title()


def generate():

    print("      - GitHub Enterprise Server:")

    for module in sorted(BASE.iterdir()):

        if not module.is_dir():
            continue

        print(f"          - {module.name.replace('-', ' ').title()}:")

        readme = module / "README.md"

        if readme.exists():
            print(
                f"              - Overview: courses/github-enterprise/modules/{module.name}/README.md"
            )

        for md in sorted(module.rglob("*.md")):

            if md.name == "README.md":
                continue

            path = md.as_posix()

            title = title_from_filename(md)

            print(
                f"              - {title}: courses/github-enterprise/{path.split('github-enterprise/',1)[1]}"
            )


if __name__ == "__main__":
    generate()