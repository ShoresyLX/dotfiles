function wg0
    if sudo wg | grep -q wg0
        echo "Already on wg0"
        return 1
    else if checknfs
        echo "Unmount nfs drives first"
        return 1
    else if sudo wg | grep -q wg1
        echo "Currently on wg1, switching"
        sudo wg-quick down wg1
    end
    echo "Turning on wg0"
    sudo wg-quick up wg0
end
