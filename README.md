A Collection of Minetest Mods
=============================

This is a collection of mods as used by our personal minetest server.  Each mod
is either included as a git-submodule (preferred) or, if that is not possible,
directly contained in this repository.  Additionally, local modifications of
certain modes (like disabling particular features) are included as separate
patches.  These can be applied by

    for diff in *.diff; od
      patch -p1 < $diff
    done

Before updating mods, unapply the patches by passing the `-R` switch to the
patch command.

For licenses and copyrights see the corresponding mods.  All that remains is
licensed under an MIT License.
