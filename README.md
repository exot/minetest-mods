Mods for our personal minetest server
=====================================

This is a collection of mods as used by our personal minetest
server.  Additionally, changes to these modes (like disabling
certain features) are included as separate patches.  They can be
applied by

    for diff in *.diff; od
      patch -p1 < $diff
    done

Before updating mods, unapply the patches by passing the `-R` switch to the
patch command.

For licenses and copyrights see the corresponding mods.  The rest is licensed
under an MIT License.
