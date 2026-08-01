#!/bin/bash

set -e

BASE_DIR="$HOME/docker"

PLATFORM_DIR="$BASE_DIR/stacks/training-platform"

FAILED=0


echo
echo "======================================"
echo "Platform Verification"
echo "======================================"


echo
echo "Checking directories..."

DIRECTORIES=(
"$PLATFORM_DIR"
"$PLATFORM_DIR/docs"
"$PLATFORM_DIR/repos"
"$PLATFORM_DIR/training-content"
)


for DIR in "${DIRECTORIES[@]}"
do

    if [ -d "$DIR" ]
    then
        echo "✓ $DIR"
    else
        echo "✗ Missing $DIR"
        FAILED=1
    fi

done



echo
echo "Checking submodules..."


SUBMODULES=(
"azure"
"cloud"
"kubernetes"
"portfolio"
)


for MODULE in "${SUBMODULES[@]}"
do

    if [ -e "$PLATFORM_DIR/repos/$MODULE/.git" ]
    then
        echo "✓ $MODULE"
    else
        echo "✗ Missing $MODULE"
        FAILED=1
    fi

done



echo
echo "Checking CV..."


if [ -f "$PLATFORM_DIR/docs/courses/cv/content/James_Roberts_CV.docx" ]
then

    echo "✓ CV available"

else

    echo "⚠ CV missing"

fi



echo
echo "Checking MkDocs..."


if [ -x "$PLATFORM_DIR/.venv/bin/mkdocs" ]
then

    echo "Using virtual environment MkDocs"

    cd "$PLATFORM_DIR"

    if "$PLATFORM_DIR/.venv/bin/mkdocs" build
    then

        echo "✓ MkDocs build successful"

    else

        echo "✗ MkDocs build failed"
        FAILED=1

    fi


elif command -v mkdocs >/dev/null 2>&1
then

    echo "Using system MkDocs"

    cd "$PLATFORM_DIR"

    if mkdocs build
    then

        echo "✓ MkDocs build successful"

    else

        echo "✗ MkDocs build failed"
        FAILED=1

    fi


else

    echo "✗ MkDocs not installed"
    FAILED=1

fi



echo

if [ "$FAILED" -eq 0 ]
then

    echo "======================================"
    echo "✓ PLATFORM READY"
    echo "======================================"

else

    echo "======================================"
    echo "✗ PLATFORM CHECK FAILED"
    echo "======================================"

    exit 1

fi
