# requires CUDA toolkit for nvidia (fedora 34)
```
yum install nano wget git -y



cd /opt

wget https://github.com/c4pt000/kernel-5.11.6-expSEHDsec-cgroup-virtio/releases/download/5.11.6-expSEHDsec/kernel-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
wget https://github.com/c4pt000/kernel-5.11.6-expSEHDsec-cgroup-virtio/releases/download/5.11.6-expSEHDsec/kernel-devel_5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
wget https://github.com/c4pt000/kernel-5.11.6-expSEHDsec-cgroup-virtio/releases/download/5.11.6-expSEHDsec/kernel-headers-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm

rm -rf /boot/initramfs*
rm -rf /boot/vmlinuz*

sed -i 's/GRUB_ENABLE_BLSCFG=true/GRUB_ENABLE_BLSCFG=false/g' /etc/default/grub 

sleep 2s
grub2-editenv create
rpm -e --nodeps kernel-core kernel-modules kernel-headers kernel-devel kernel-srpm-macros kernel

rpm -Uvh kernel-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
rpm -Uvh kernel-headers-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
rpm -UVh kernel-devel-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm


 
   nano /root/.bashrc 
   source /root/.bashrc 



grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
grub2-mkconfig -o /boot/grub2/grub.cfg

echo "SCRIPT HAS TO REBOOT FOR KERNEL CHANGES script will sleep for 10 seconds Ctrl-C to cancel script and reboot"
sleep 10s

```

```
yum groupinstall "C Development Tools and Libraries" -y
wget https://download.nvidia.com/XFree86/Linux-x86_64/460.56/NVIDIA-Linux-x86_64-460.56.run
bash NVIDIA-Linux-x86_64-460.56.run
modprobe nvidia
nvidia-smi


wget https://developer.download.nvidia.com/compute/cuda/11.1.1/local_installers/cuda_11.1.1_455.32.00_linux.run
chmod +x cuda_11.1.1_455.32.00_linux.run
./cuda_11.1.1_455.32.00_linux.run --override


cat << EOF > /root/.bashrc
if [ -z "${LD_LIBRARY_PATH}" ]; then
      LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64
    else
        LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64:$LD_LIBRARY_PATH
     fi
     export PATH LD_LIBRARY_PATH
     EOF
  
  
  
source /root/.bashrc 

 echo $PATH
 echo $LD_LIBRARY_PATH

  cd /root/NVIDIA_CUDA-11.1_Samples/1_Utilities/deviceQuery
  make -j24
  ./deviceQuery 

```
```
yum install p7zip p7zip-plugins -y


wget https://github.com/praetorian-inc/Hob0Rules/raw/master/wordlists/rockyou.txt.gz
gunzip rockyou.txt.gz

python bitcoin2john.py wallet.dat > hash.txt
hashcat --stdout rockyou.txt -r OneRuleToRuleThemAll.rule | hashcat -m 11300 hash.txt
```


