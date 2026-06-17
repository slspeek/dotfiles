#!/usr/bin/env bash

set -e

iso_path=$1

function wait_for_usb_disk() {
    # Set timeout from first argument, default to 60 seconds if empty
    local timeout="${1:-60}"
    local elapsed=0

    echo "Waiting for USB drive (timeout in ${timeout}s)..." >&2

    # List current drives before insertion
    local initial_drives
    initial_drives=$(lsblk --nodeps --noheadings --output NAME)

    while [ "$elapsed" -lt "$timeout" ]; do
        # Check current drives
        local current_drives
        current_drives=$(lsblk --nodeps --noheadings --output NAME)

        # Find any new drive that was not there initially
        local new_drive
        new_drive=$(comm -13 <(echo "$initial_drives" | sort) \
            <(echo "$current_drives" | sort))

        if [ -n "$new_drive" ]; then
            # Verify if it is a removable USB drive (RM = 1)
            if [ "$(lsblk --nodeps --noheadings --output RM "/dev/$new_drive" \
                2> /dev/null)" = "1" ]; then

                # Wait briefly for the device path to stabilize
                sleep 2

                # Return only the entire disk path
                echo "/dev/$new_drive"
                return 0
            fi
        fi

        sleep 1
        ((elapsed++))
    done

    echo "Error: Timed out waiting for USB drive." >&2
    return 1
}

# Function to ask for user confirmation
function confirm() {
    local prompt="${1:-Are you sure?}"
    local response

    while true; do
        # -r prevents backslash escapes; -p specifies the prompt string
        read -r -p "$prompt [y/N]: " response

        # Default to 'No' if the user just hits Enter
        case "${response:-n}" in
            [Yy] | [Yy][Ee][Ss])
                return 0 # Success / True
                ;;
            [Nn] | [Nn][Oo])
                return 1 # Failure / False
                ;;
            *)
                echo "Invalid input. Please answer yes (y) or no (n)."
                ;;
        esac
    done
}

if usb_drive=$(wait_for_usb_disk 30); then
    if confirm "Write to $(lsblk "$usb_drive" --noheadings \
        --nodeps --output VENDOR,MODEL,SIZE)?"; then
        echo Writing "$iso_path" to "$usb_drive"
        sudo sh -c "pv $(realpath "$iso_path") > $usb_drive"
        sync-progress.sh
    else
        echo "Cancelled"
    fi
fi
