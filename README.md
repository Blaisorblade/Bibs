These bibliography files suit my personal needs for citations, but they collect
all citations I need.
I integrate them in other repositories where I need them using [git subtree][1].
I created this repo following [this link][Creation], and I integrate it in other
repos using [these instructions][2]. [This][3] is also relevant.

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

# Alternatives
These alternatives are the procedure I originally [read on the Internet][Creation].

To fetch updates:

```bash
$ git fetch bibs
$ git subtree merge --squash -P Bibs bibs/master
```

I found the shorter variant through `git subtree`'s manual.

To split and push updates, first fetch updates, and then run:

```bash
$ git subtree split -P Bibs -b bibs-backport
$ git push bibs bibs-backport:master
```

I found the shorter variant through `git subtree`'s manual and experimentation.
The obvious variant failed; it was:

```bash
git subtree push -d -P Bibs bibs bibs-backport:master
```

# Discussion
One important thing is that, unlike I thought, one does not need to pull the
`bibs-backport` branch from `bibs/master`.

To show that, assume that some commits are on `bibs/master` and have been merged
on HEAD but are not on `bibs-backport`: `git subtree` will then extract those
commits and regenerate the same commits, which can then be pushed.

If you instead split updates before fetching existing ones, you get spurious
commits like [Blaisorblade/Bibs@b6c1121d][4], but integrity is still preserved.

[1]: https://github.com/apenwarr/git-subtree
[Creation]: http://psionides.eu/2010/02/04/sharing-code-between-projects-with-git-subtree/
[2]: http://www.ashday.com/blogs/russell-keppner/git-subtree-easier-way-import-repository-dev-cloud
[3]: http://h2ik.co/2011/03/having-fun-with-git-subtree/
[4]: https://github.com/Blaisorblade/Bibs/commit/b6c1121db5e0b06a13ad60dd36721dd46491949b
[Regression]: http://stackoverflow.com/a/17891139/53974
