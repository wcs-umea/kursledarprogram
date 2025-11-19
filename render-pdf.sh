#!/bin/bash
set -euo pipefail

echo "Rendering changed slides:"
for file in materials/*.qmd; do
  echo " - $file"
  quarto render "$file"
done

echo "Rendering HTML slides to PDF..."
for f in materials/*.qmd; do
  base=$(basename "$f" .qmd)
  html="_site/materials/$base.html"
  pdf="materials/$base.pdf"

  if [ -f "$html" ]; then
    echo "Generating PDF for $html"
    docker run --rm -t \
      -v "$(pwd)":/slides \
      ghcr.io/astefanutti/decktape \
      reveal \
      "$html" "$pdf" --fragments
    git add "$pdf"
  else
    echo "Skipping: $html not found"
  fi
done

