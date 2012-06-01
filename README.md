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

```bash
$ git subtree merge --squash -P Bibs bibs/master
```

[1]: https://github.com/apenwarr/git-subtree
[Creation]: http://psionides.eu/2010/02/04/sharing-code-between-projects-with-git-subtree/
[2]: http://www.ashday.com/blogs/russell-keppner/git-subtree-easier-way-import-repository-dev-cloud
[3]: http://www.ashday.com/blogs/russell-keppner/git-subtree-easier-way-import-repository-dev-cloud
