properties() { "
kernel.string=but i will soon forget the color of your eyes
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=alioth
device.name2=aliothin
device.name3=
device.name4=
device.name5=
supported.versions=
"; }

block=/dev/block/bootdevice/by-name/boot;
is_slot_device=1;
ramdisk_compression=auto;

. tools/ak3-core.sh;

set_perm_recursive 0 0 750 750 $ramdisk/*;

dump_boot;

if [ -d $ramdisk/overlay ]; then
    rm -rf $ramdisk/overlay;
fi;

write_boot;

if [ "$is_slot_device" = "1" ]; then
    block=/dev/block/bootdevice/by-name/vendor_boot;
    ramdisk_compression=auto;
    patch_vbmeta_flag=auto;
    reset_ak;
    dump_boot;
    write_boot;
fi
