This repository contains my BibTeX bibliographies, together with instructions for
reusing them in other repositories with [git-subtree][Subtree].

Feel free to use them.

# Intro

To reuse these bibliographies for a paper, managed in a Git repository, add
this repository as a subdirectory of the paper repository. You can then use git
subtree to propagate changes between the paper repository and the bibliography
repository; this setup scales to more paper repositories.

Your paper coauthors can work with you without learning any of this.

## Get started:

1. Fork this repo, unless you have write access to it.
2. Let $remote be a Git URL for your fork (for instance, `remote=git@github.com:Blaisorblade/Bibs.git`).
3. Run the following bash commands, replacing `$remote` as above.

    ```bash
    $ git remote add bibs $remote
    $ git fetch bibs
    $ git subtree add --squash -P Bibs bibs/master
    ```

4. Your editor will be invoked, like for `git commit`. Enter a commit message
   describing the merge operation, for instance:

   Integrate bibliographies from github.com/Blaisorblade/Bibs

## Pulling changes
To fetch updates from the bibliography repo to the paper repo, run *from the
repository root*:

```bash
./Bibs/pull-updates.sh
```

## Pushing changes
To split and push updates, first pull updates as above, then run *from the
repository root*:

```bash
./Bibs/push-updates.sh
```

Caveat: If you care about commit messages in your bibliography repo, you need to
ask them to have separate commits (with specific commit messages) for the
bibliography directory. But this is not technically required: git subtree will
remove unrelated changes from commits without problems.

## Warning

* Git subtree was broken in Git 1.8.3.3 and 1.8.3.4, and only [fixed in release 1.8.4][Regression].
  Avoid using push or split with a broken `git subtree`: otherwise, spurious '-n' will be added to extracted commit
  messages. Rewinding history in the bibs repo, and running `git fetch bibs` in the parent repo will undo the averse effects; repeating the operation with a fixed `git subtree` will not run again in the problem.

* Avoid having branches in the bibliography repositories. It seems that git
  subtree might pick some branch other than master.

[Regression]: http://stackoverflow.com/a/17891139/53974
[Subtree]: https://github.com/apenwarr/git-subtree
