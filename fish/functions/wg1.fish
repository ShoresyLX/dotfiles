function wg1
    # Safely starts or switches to local WG config
    if sudo wg | grep -q "wg1"
        echo "Already on wg1"
        return 1
    else if test -n (checknfs)
        echo "Unmount nfs drives first"
        return 1
    else if sudo wg | grep -q "wg0"
        echo "Stopping wg0"
        sudo wg-quick down wg0
    end
    echo "Starting wg1"
    sudo wg-quick up wg1
end
