This module is intended for ASUS ROG type laptops with the N-Key device to enable all FN+Key combos.

The preferred way to build and install the module is using dkms.

```
$ make dkms
$ make onboot
```

`make onboot` will deny `hid_asus` module from loading, `hid_asus_rog` replaces it.

Packaging and auto-builds are available [here](https://build.opensuse.org/package/show/home:luke_nukem:asus/hid-asus)
Download repositories are available [here](https://download.opensuse.org/repositories/home:/luke_nukem:/asus/)
