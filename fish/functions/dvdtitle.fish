function dvdtitle
while true
read -l -P 'Enter device:' dvddevice
dvdbackup -i $dvddevice -I | grep "DVD-Video" | cut -d '"' -f2
return 0
end
end
