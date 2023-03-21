## TWRP Device Tree for the realme 9 5G Speed Edition (RMX1851)

### Build Instructions
```sh
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch twrp_RMX3461-eng
make bootimage
```

```
fastboot flash boot boot.img
```
