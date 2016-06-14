class MyMacos < Formula
  desc 'System-wide macOS UI tweak'
  url 'https://github.com/Jeppesen-io/homebrew-macos'
  homepage 'https://github.com/Jeppesen-io/homebrew-macos'
  version '0.1'

  bottle :unneeded

  def install

    # Set all finder windows to list by default
    `defaults write com.apple.finder FXPreferredViewStyle -string "clmv"`
    `find ~ -name .DS_Store -delete`

    # Never show the dock!
    `defaults write com.apple.dock autohide-delay -float 0`

    # Disable transparency in the menu bar and elsewhere on Yosemite
    `defaults write com.apple.universalaccess reduceTransparency -bool true`

    # Set sidebar icon size to medium
    `defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2`

    # Always show scrollbars
    `defaults write NSGlobalDomain AppleShowScrollBars -string "Always"`

    # Increase window resize speed for Cocoa applications
    `defaults write NSGlobalDomain NSWindowResizeTime -float 0.001`

    # Expand save panel by default
    `defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true`
    `defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true`

    # Check for software updates daily, not just once per week
    `defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1`

    # Disable Notification Center and remove the menu bar icon
    `launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null`

    # Disable “natural” (Lion-style) scrolling
    `defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false`

    # Enable subpixel font rendering on non-Apple LCDs
    `defaults write NSGlobalDomain AppleFontSmoothing -int 2`

    # Finder: show status bar
    `defaults write com.apple.finder ShowStatusBar -bool true`

    # Finder: show path bar
    `defaults write com.apple.finder ShowPathbar -bool true`

    # Display full POSIX path as Finder window title
    `defaults write com.apple.finder _FXShowPosixPathInTitle -bool true`

    # Disable the warning before emptying the Trash
    `defaults write com.apple.finder WarnOnEmptyTrash -bool false`

    # Don’t animate opening applications from the Dock
    `defaults write com.apple.dock launchanim -bool false`

    # Speed up Mission Control animations
    `defaults write com.apple.dock expose-animation-duration -float 0.1`
    `defaults write com.apple.dock expose-group-by-app -bool false`

    # Remove the auto-hiding Dock delay
    `defaults write com.apple.dock autohide-delay -float 0`

    # Remove the animation when hiding/showing the Dock
    `defaults write com.apple.dock autohide-time-modifier -float 0`

    # Automatically hide and show the Dock
    `defaults write com.apple.dock autohide -bool true`

    # Hot corners
    # Possible values:
    #  0: no-op
    #  2: Mission Control
    #  3: Show application windows
    #  4: Desktop
    #  5: Start screen saver
    #  6: Disable screen saver
    #  7: Dashboard
    # 10: Put display to sleep
    # 11: Launchpad
    # 12: Notification Center
    # Top left screen corner → Mission Control
    `defaults write com.apple.dock wvous-tl-corner     -int 0`
    `defaults write com.apple.dock wvous-tl-modifier   -int 0`
    `defaults write com.apple.dock wvous-tr-corner     -int 0`
    `defaults write com.apple.dock wvous-tr-modifier   -int 0`
    `defaults write com.apple.dock wvous-br-corner     -int 0`
    `defaults write com.apple.dock wvous-br-modifier   -int 0`
    `defaults write com.apple.dock wvous-bl-corner     -int 0`
    `defaults write com.apple.dock wvous-bl-modifier   -int 0`

    # Send the dock to the left of the screen
    `defaults write com.apple.dock  orientation -string "right"`

    # Set the size of icons in the dock
    `defaults write com.apple.dock tilesize -int 50`

    # Restart dock
    `killall Dock`

    # Restart finder
    `killall Finder`

  end

end
