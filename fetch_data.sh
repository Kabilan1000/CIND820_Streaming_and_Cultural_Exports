#!/usr/bin/env bash
set -euo pipefail

mkdir -p notebooks/data/{netflix,disney_plus,amazon_prime}

echo "[Fetch Instructions]"
echo "Kaggle CLI (requires kaggle auth):"
echo "  kaggle datasets download -d shivamb/netflix-shows -p notebooks/data/netflix --unzip"
echo "  kaggle datasets download -d shivamb/disney-movies-and-tv-shows -p notebooks/data/disney_plus --unzip"
echo "  kaggle datasets download -d shivamb/amazon-prime-movies-and-tv-shows -p notebooks/data/amazon_prime --unzip"
echo ""
echo "[Optional IMDb] Keep large dumps OUT of Git."
