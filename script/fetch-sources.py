#!/usr/bin/env python3
"""Shallow-clone every project of a repo manifest without the repo tool (used by CI).

usage: fetch-sources.py MANIFEST TOP_DIR [--skip PATH ...] [--only PATH ...]
Revisions may be branches, tags or full commit SHAs.
"""
import argparse
import os
import subprocess
import xml.etree.ElementTree as ET


def git(*args, cwd=None):
    subprocess.run(["git", *args], cwd=cwd, check=True)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("manifest")
    ap.add_argument("top")
    ap.add_argument("--skip", action="append", default=[])
    ap.add_argument("--only", action="append", default=[])
    a = ap.parse_args()

    root = ET.parse(a.manifest).getroot()
    remotes = {r.get("name"): r.get("fetch") for r in root.findall("remote")}
    default = root.find("default")
    default_remote = default.get("remote")
    default_rev = default.get("revision")

    for p in root.findall("project"):
        path = p.get("path")
        if path in a.skip or (a.only and path not in a.only):
            continue
        fetch = remotes[p.get("remote", default_remote)].rstrip("/")
        url = "%s/%s.git" % (fetch, p.get("name"))
        rev = p.get("revision", default_rev)
        dest = os.path.join(a.top, path)
        print("== %s <- %s @ %s" % (path, url, rev), flush=True)
        os.makedirs(dest, exist_ok=True)
        git("init", "-q", cwd=dest)
        git("remote", "add", "origin", url, cwd=dest)
        git("fetch", "-q", "--depth", "1", "origin", rev, cwd=dest)
        git("checkout", "-q", "FETCH_HEAD", cwd=dest)
        for c in p.findall("copyfile"):
            src = os.path.join(dest, c.get("src"))
            with open(src, "rb") as fi, open(os.path.join(a.top, c.get("dest")), "wb") as fo:
                fo.write(fi.read())


if __name__ == "__main__":
    main()
