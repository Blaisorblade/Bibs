#!/bin/sh
cd `git rev-parse --show-toplevel`
git subtree pull --squash -P Bibs bibs master -m "Merge from Bibs"
