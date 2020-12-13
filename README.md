A Collection of Minetest Mods
=============================

This is a collection of mods as used by our personal minetest server.  Each mod
is either included as a git-submodule (preferred) or, if that is not possible,
directly contained in this repository.  Additionally, local modifications of
certain modes (like disabling particular features) are included as separate
patches in the `patches` directory.  These can be applied with `quilt push -a`
Before updating mods, unapply the patches with `quilt pop -a`.

Some standard extension mods are not included here, because they are shipped
with Debian.  Examples are `basic-materials`, `homedecor`, `infinite-chest`,
`intllib`, `meseconds`, `moreblocks`, `moreores`, `torches`,
`unified-inventory`, `unifieddyes`, and `worldedit`, among others.

For licenses and copyrights see the corresponding mods.  All that remains is
licensed under an MIT License.

