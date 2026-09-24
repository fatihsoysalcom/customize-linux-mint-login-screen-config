#!/bin/bash

# This script demonstrates how to modify a mock configuration file
# for the Linux Mint LightDM greeter (slick-greeter), simulating
# the customization of the login screen.
# In a real Linux Mint environment, the target file would be
# /etc/lightdm/slick-greeter.conf and would require sudo privileges.

MOCK_CONFIG_FILE="mock_slick-greeter.conf"

# --- 1. Create a mock configuration file --- 
echo "--- Creating a mock configuration file: $MOCK_CONFIG_FILE ---"
cat << EOF > "$MOCK_CONFIG_FILE"
[greeter]
background=/usr/share/backgrounds/linuxmint/default_background.jpg
draw-user-backgrounds=false
theme-name=Mint-Y
icon-theme-name=Mint-Y
font-name=Ubuntu 11
xft-antialias=true
xft-hinting=true
xft-rgba=rgb
indicators=~host;~spacer;~session;~a11y;~clock;~power
EOF
echo "Mock config created."
echo ""

echo "--- Original mock config content ---"
cat "$MOCK_CONFIG_FILE"
echo ""

# --- 2. Demonstrate changing the background image path ---
echo "--- Changing background image path ---"
NEW_BACKGROUND="/home/user/my_custom_background.png"
# The 'sed' command finds the 'background=' line and replaces its value.
# This illustrates how to change the login screen's background image.
sed -i "s|^background=.*|background=$NEW_BACKGROUND|" "$MOCK_CONFIG_FILE"
echo "Background path updated to: $NEW_BACKGROUND"
echo ""

# --- 3. Demonstrate changing the greeter theme ---
echo "--- Changing greeter theme ---"
NEW_THEME="Mint-Y-Dark"
# The 'sed' command finds the 'theme-name=' line and replaces its value.
# This illustrates how to change the overall visual theme of the login screen.
sed -i "s|^theme-name=.*|theme-name=$NEW_THEME|" "$MOCK_CONFIG_FILE"
echo "Theme name updated to: $NEW_THEME"
echo ""

# --- 4. Demonstrate enabling user backgrounds ---
echo "--- Enabling user backgrounds ---"
# The 'sed' command finds 'draw-user-backgrounds=' and sets it to 'true'.
# This illustrates how to allow user-specific backgrounds on the login screen.
sed -i "s|^draw-user-backgrounds=.*|draw-user-backgrounds=true|" "$MOCK_CONFIG_FILE"
echo "User backgrounds enabled."
echo ""

echo "--- Modified mock config content ---"
cat "$MOCK_CONFIG_FILE"
echo ""

echo "--- Cleanup: Removing mock config file ---"
rm "$MOCK_CONFIG_FILE"
echo "Mock config file removed."
