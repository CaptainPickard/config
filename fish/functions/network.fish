function connect-net
    # Ensure NetworkManager is running
    sudo systemctl start NetworkManager

    # Show available Wi-Fi networks
    nmcli device wifi list

    # Prompt for SSID and password (password entered silently)
    read -P "SSID: " ssid
    read -s -P "Password (leave empty for open network): " pass
    echo

    # Basic validation
    if test -z "$ssid"
        echo "No SSID provided — aborting."
        return 1
    end

    # Try to connect (handle open networks)
    if test -z "$pass"
        nmcli device wifi connect "$ssid"
    else
        nmcli device wifi connect "$ssid" password "$pass"
    end

    # Check nmcli result
    if test $status -eq 0
        echo "✅ Connected to '$ssid'."
        return 0
    else
        echo "❌ Failed to connect to '$ssid'."
        # Optionally show nmcli's last message for debugging
        nmcli -f GENERAL,STATE,ACTIVE,SSID device wifi list
        return 2
    end
end

function homenet
    nmcli connection delete id "Winter is Coming"
    sudo systemctl start NetworkManager
    nmcli dev wifi list
    nmcli dev wifi connect "Winter is Coming" password "Roadapplelucypicklehat922!"
end

function boost
    nmcli connection delete id "Boost"
    sudo systemctl start NetworkManager
    nmcli dev wifi list
    nmcli dev wifi connect Boost password "#AgentBoost1"
end
