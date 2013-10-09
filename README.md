These bibliography files suit my personal needs for citations, but they collect
all citations I need.
To get started follow these instructions (but if you don't have write access to
this repo, you should replace the GIT address with one you can access):

```bash
$ git remote add bibs git@github.com:Blaisorblade/Bibs.git
$ git fetch bibs
$ git subtree add --squash -P Bibs -m $YOUR_COMMIT_MESSAGE bibs/master
```

To fetch updates:

```
$ git subtree pull --squash -P Bibs bibs
```

To split and push updates, first fetch updates, and then run:

```bash
git subtree push -P Bibs bibs master
```

## Warning

Git subtree was broken in Git 1.8.3.3 and 1.8.3.4, and only [fixed in release 1.8.4][Regression].
Avoid using push or split with a broken `git subtree`: otherwise, spurious '-n' will be added to extracted commit
messages. Rewinding history in the bibs repo, and running `git fetch bibs` in the parent repo will undo the averse effects; repeating the operation with a fixed `git subtree` will not run again in the problem.

[Regression]: http://stackoverflow.com/a/17891139/53974
