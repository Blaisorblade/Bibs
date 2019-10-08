#!/bin/sh
cd `git rev-parse --show-toplevel`
git subtree push -P Bibs rbibs master
