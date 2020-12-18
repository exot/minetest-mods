A Collection of Minetest Mods
=============================

This is a collection of mods as used by our personal minetest server.  Each mod
is either included as a git-submodule (preferred) or, if that is not possible,
directly contained in this repository.  Additionally, local modifications of
certain modes (like disabling particular features) are included as separate
patches in the `patches` directory.  These can be applied with `quilt push -a`
Before updating mods, unapply the patches with `quilt pop -a`.

Some standard extension mods are not included here, because they are shipped
with Debian.  Run the following command to satisfy these dependencies:

```sh
sudo apt install                    \
     minetest-mod-character-creator \
     minetest-mod-craftguide        \
     minetest-mod-currency          \
     minetest-mod-infinite-chest    \
     minetest-mod-intllib           \
     minetest-mod-mesecons          \
     minetest-mod-moreblocks        \
     minetest-mod-torches           \
     minetest-mod-unified-inventory \
     minetest-mod-unifieddyes       \
     minetest-mod-worldedit
```

Afterwards, use git to check out all submodules like so:

```sh
git submodule update --init
```

Then start minetest, edit `world.mt` to enable all wanted modules, and restart
again.  Enjoy! ☺

For licenses and copyrights see the corresponding mods.  All that remains is
licensed under an MIT License.

