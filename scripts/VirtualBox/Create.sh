echo "Unregister"

VBoxManage unregistervm Windows2008

VBoxManage closemedium disk  "/VMs/Windows2008/Windows2008.vdi"  --delete


echo "Delete folders"

rm -rf  "/VMs/Windows2008"


echo "New PC"
VBoxManage createvm --name Windows2008 --ostype "Windows2008_64" --register


echo "config HW"

VBoxManage createhd --filename "/VMs/Windows2008/Windows2008.vdi" --size 64000

VBoxManage storagectl Windows2008 --name "SATA Controller" --add sata --controller IntelAHCI

VBoxManage storagectl Windows2008 --name "IDE Controller" --add ide

VBoxManage storageattach Windows2008 --storagectl "SATA Controller" --port 0 --device 0  --type hdd --medium "/VMs/Windows2008/Windows2008.vdi"

VBoxManage storageattach Windows2008 --storagectl "IDE Controller"  --port 0 --device 0 --type dvddrive --medium /VMs/Windows2008_slipstreamed.iso

VBoxManage modifyvm Windows2008 --ioapic on

VBoxManage modifyvm Windows2008 --memory 8000 --vram 228

echo "network"

VBoxManage modifyvm Windows2008 --nic1 bridged --bridgeadapter1 wlx004f7700ee39

VBoxManage modifyvm Windows2008 --macaddress1 "08002e07543E"

echo "cd - iso"
VBoxManage modifyvm Windows2008 --boot1 dvd --boot2 disk --boot3 none --boot4 none

echo "virtual-access"
#VBoxManage modifyvm Windows2008 --vrde on

#VBoxManage modifyvm Windows2008 --vrdeport 6000

#VBoxManage modifyvm Windows2008 --vrdeauthtype external

#VBoxManage modifyvm Windows2008 --vrdeproperty "Security/Method"="negotiate"

#VBoxManage modifyvm Windows2008 --vrdeaddress "0.0.0.0"

#VBoxManage setextradata Windows2008 "GUI/MaxGuestResolution" 1280,800

#VBoxManage  setextradata Windows2008 "VBoxAuthSimple/users/admin" "d151346fe7eea3c6a0865199579ca6017487dbf981d59cdd1fcadadb03518dc8"


# After first inicial boot and deploy
echo "Pockat hodinu asi a ked bude vypnute VM:"
#rem VBoxManage storageattach Windows2008 --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium none
echo 'VBoxManage storageattach Windows2008 --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium none'


echo "Starting"
echo '/VMs/Windows2008.start.sh'

