#!/usr/bin/env python3
"""Fetch public API examples and save their JSON responses."""
from pathlib import Path
from urllib.request import Request, urlopen
import json
ROOT = Path(__file__).resolve().parent
URLS = {"github_profile.json": "https://api.github.com/users/itzpritam7x", "sample_posts.json": "https://jsonplaceholder.typicode.com/posts"}
for filename, url in URLS.items():
    request = Request(url, headers={"User-Agent": "DeveloperPortfolio-capstone"})
    with urlopen(request, timeout=20) as response:
        payload = json.load(response)
        if response.status != 200:
            raise RuntimeError(f"Unexpected HTTP status {response.status} for {url}")
    (ROOT / filename).write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    print(f"Saved {filename}")
