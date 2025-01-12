# A Collection of Minetest Mods

This is a collection of mods as used by our personal minetest server.  Each mod is included as a
git-submodule.  Necessary local modifications (like disabling particular features) are included as
separate patches in the [patches](./patches) directory and are managed by
[quilt](https://savannah.nongnu.org/projects/quilt).  These patches can be applied in one go with
`quilt push -a` or individually.  Before updating mods, unapply the patches with `quilt pop -a` to
not let Git think that there are uncommited changes.  See also [Setting up Git Hooks for Remote
Updating](#git-setup) below.

After cloning, use git to check out all submodules like so:

```sh
git submodule update --init --recursive
```

Then start minetest, edit `world.mt` to enable all desired modules, and restart again.  Note that
Luanti might consider the patches directory as a mod on its own.  To prevent errors, add
`load_mod_patches = false` to your world.mt.

Enjoy! 😀

## <a name="git-setup">Setting up Git Hooks for Remote Updating</a>

To automatically update a local cone of this git repository on updates, perform the following
configuration:

- Make the local copy update its worktree on push, instead of barfing:

  ```sh
  git config receive.denyCurrentBranch updateInstead
  ```

- Add a hook that when updating the worktree after push, first removes all patches, then updates the
  actual worktree, then updates all submodules, and then reapplys all patches:

  ```sh
  cat <<_SCRIPT > .git/hooks/push-to-checkout
  #!/bin/sh

  quilt pop -a
  git read-tree -u -m HEAD "$1"
  git submodule update --init --recursive
  quilt push -a
  chmod -R a+rX .
  _SCRIPT
  chmod +x .git/hooks/push-to-checkout
  ```

## Licensing

For licenses and copyrights see the corresponding mods.  All that remains is licensed under an MIT
License.
