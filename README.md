A Collection of Minetest Mods
=============================

This is a collection of mods as used by our personal minetest server.  Each mod
is either included as a git-submodule (preferred) or, if that is not possible,
directly contained in this repository.  Additionally, local modifications of
certain modes (like disabling particular features) are included as separate
patches in the `patches` directory.  These can be applied with `quilt push -a`
Before updating mods, unapply the patches with `quilt pop -a`.  See also section
on [setting up git](#git-setup) below.

After cloning, use git to check out all submodules like so:

```sh
git submodule update --init --recursive
```

Then start minetest, edit `world.mt` to enable all desired modules, and restart
again.  Enjoy! ☺

For licenses and copyrights see the corresponding mods.  All that remains is
licensed under an MIT License.

<a name="git-setup">Setting up git hooks for remote updating</a>
-----------------------------------------------------------------

To automatically update a local copy of this git repository on updates, perform
the following configuration

- Make the local copy update its worktree on push, instead of barfing:

  ~~~sh
  git config receive.denyCurrentBranch updateInstead
  ~~~

- When updating the worktree after push, first remove all patches, then update,
  then update all submodules, and then reapply all patches:

  ~~~sh
  cat <<SCRIPT > .git/hooks/push-to-checkout
  #!/bin/sh

  quilt pop -a
  git read-tree -u -m HEAD "$1"
  git submodule update --init
  quilt push -a
  chmod -R a+rX .
  SCRIPT
  chmod +x .git/hooks/push-to-checkout
  ~~~
