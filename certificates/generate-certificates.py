#!/usr/bin/env python3

from __future__ import annotations

import re
import subprocess
from pathlib import Path


BASE_DIR = Path(__file__).resolve().parent
TEMPLATE = BASE_DIR / "certificate.typ"
NAMES_FILE = BASE_DIR / "names.txt"
OUTPUT_DIR = BASE_DIR / "output"

COURSE = "Kursledarprogram WCS"
ISSUER = "West Coast Swing Umeå"
DATE = "April 2026"
SIGNER = "Nina Norgren"
ROLE = "Kursledare"


def slugify(value: str) -> str:
    value = value.strip().lower()
    value = value.replace("å", "a").replace("ä", "a").replace("ö", "o")
    value = re.sub(r"[^a-z0-9]+", "_", value)
    return value.strip("_")


def load_names(path: Path) -> list[str]:
    names = []
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if line:
            names.append(line)
    return names


def run_typst(name: str, cert_id: str, output_path: Path) -> None:
    cmd = [
        "typst",
        "compile",
        str(TEMPLATE),
        str(output_path),
        "--input",
        f"name={name}",
        "--input",
        f"date={DATE}",
        "--input",
        f"cert_id={cert_id}",
        "--input",
        f"course={COURSE}",
        "--input",
        f"issuer={ISSUER}",
        "--input",
        f"signer={SIGNER}",
        "--input",
        f"role={ROLE}",
    ]
    subprocess.run(cmd, check=True)


def main() -> None:
    if not TEMPLATE.exists():
        raise FileNotFoundError(f"Template not found: {TEMPLATE}")
    if not NAMES_FILE.exists():
        raise FileNotFoundError(f"Names file not found: {NAMES_FILE}")

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    names = load_names(NAMES_FILE)

    if not names:
        print("No names found.")
        return

    for i, name in enumerate(names, start=1):
        cert_id = f"WCS-STEG1-2025-{i:03d}"
        filename = f"{slugify(name)}.pdf"
        output_path = OUTPUT_DIR / filename

        print(f"Generating certificate for {name} -> {output_path.name}")
        run_typst(name=name, cert_id=cert_id, output_path=output_path)

    print(f"Done. Generated {len(names)} certificate(s) in {OUTPUT_DIR}")


if __name__ == "__main__":
    main()