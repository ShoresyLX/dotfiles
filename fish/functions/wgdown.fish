function wgdown
# Disables whatever wireguard configs are spun up
	if checknfs
		echo "Unmount nfs drive first!"
		return 1
	end
	if sudo wg | grep -q "wg1"
		sudo wg-quick down wg1
	else if sudo wg | grep -q "wg0"
		sudo wg-quick down wg0
	else
		echo "Wireguard not running"
		return 1
	end
end
