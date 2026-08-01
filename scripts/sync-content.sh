#!/bin/bash

set -e

BASE_DIR="$HOME/docker"

PLATFORM_DIR="$BASE_DIR/stacks/training-platform"

DOCS_DIR="$PLATFORM_DIR/docs"

echo
echo "======================================"
echo "Synchronising website content"
echo "======================================"

#
# Create course directories
#

echo
echo "Creating documentation structure..."

mkdir -p "$DOCS_DIR/courses/cv/content"
mkdir -p "$DOCS_DIR/courses/linux"
mkdir -p "$DOCS_DIR/courses/cloud"
mkdir -p "$DOCS_DIR/courses/kubernetes"
mkdir -p "$DOCS_DIR/courses/azure"


#
# Sync CV
#

echo
echo "Syncing CV..."

if [ -f "$PLATFORM_DIR/repos/cv/James_Roberts_CV.docx" ]
then

    cp \
    "$PLATFORM_DIR/repos/cv/James_Roberts_CV.docx" \
    "$DOCS_DIR/courses/cv/content/"

    echo "✓ CV copied"

else

    echo "⚠ CV file not found"

fi


#
# Linux training
#

echo
echo "Checking Linux training..."

if [ -d "$PLATFORM_DIR/training-content" ]
then

    echo "✓ Linux training repository available"

else

    echo "⚠ Linux training repository missing"

fi


#
# Other courses
#

for COURSE in azure cloud kubernetes
do

    if [ -d "$DOCS_DIR/courses/$COURSE" ]
    then

        echo "✓ $COURSE course available"

    fi

done


echo
echo "======================================"
echo "Content synchronisation complete"
echo "======================================"
