echo "Unregister"

VBoxManage unregistervm Sport

VBoxManage closemedium disk  "/VMs/Sport/Sport.vdi"  --delete

echo "Delete folders"



rm -rf "/VMs/Sport"

echo "New PC"
VBoxManage createvm --name Sport --ostype "Windows2012_64" --register


echo "config HW"

VBoxManage createhd --filename "/VMs/Sport/Sport.vdi" --size 64000

VBoxManage storagectl Sport --name "SATA Controller" --add sata --controller IntelAHCI

VBoxManage storagectl Sport --name "IDE Controller" --add ide

VBoxManage storageattach Sport --storagectl "SATA Controller" --port 0 --device 0  --type hdd --medium "/VMs/Sport/Sport.vdi"

VBoxManage storageattach Sport --storagectl "IDE Controller"  --port 0 --device 0 --type dvddrive --medium /VMs/WinServer2012_v2.iso

VBoxManage modifyvm Sport --ioapic on

VBoxManage modifyvm Sport --memory 8000 --vram 228

echo "network"

VBoxManage modifyvm Sport --nic1 bridged --bridgeadapter1 wlx004f77000e39

VBoxManage modifyvm Sport --macaddress1 "01005G07243E"

echo "cd - iso"
VBoxManage modifyvm Sport --boot1 dvd --boot2 disk --boot3 none --boot4 none

echo "virtual-access"
#VBoxManage modifyvm Sport --vrde on

#VBoxManage modifyvm Sport --vrdeport 6000

#VBoxManage modifyvm Sport --vrdeauthtype external

#VBoxManage modifyvm Sport --vrdeproperty "Security/Method"="negotiate"

#VBoxManage modifyvm Sport --vrdeaddress "0.0.0.0"

#VBoxManage setextradata Sport "GUI/MaxGuestResolution" 1280,800

#VBoxManage  setextradata Sport "VBoxAuthSimple/users/him" "111111111111111122222222222222233333333iiiii"


# After first inicial boot and deploy
echo 'VBoxManage storageattach Sport --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium none'
