This repo is highly personalized but you are free to modify or take inspiration as you please. I made it focusing on keyboard-driven workflow (i3 + Neovim). I also prefer using the terminal over GUI as much as possible (several TUI and CLI apps installed).

This is cloned alongside my [setup script](https://github.com/risbi0/arch-setup). Check `pacman_packages.txt` and `aur_packages.txt` for the list of packages I use, `i3/config` for the apps and scripts I run on boot, `i3/layouts/` for the layouts I use in each workspace.

Notes:
- The spacing is optimized for resolutions 1920x1080 and higher. For smaller resolutions, edit the values of `window` padding in `rofi/config.rasi`, and `min_width` in `i3/blocks.conf` accordingly.
- When using in VM's with no GPU passthrough/low video memory, don't use picom (it would be very laggy). Remove its exec script in `i3/config`.

### Configuration

Display manager: LightDM
- Greeter: Web Greeter
- Theme: Aether

Window manager: i3
- App launcher: Rofi
- Bar: i3blocks
    - Font: SFNS Display
    - Icons: Font Awesome 6 Free
- Compositor: picom
- Theme: Arc
    - Font: Noto Sans
    - Icons: Papirus
- Cursor: Phinger Cursors

Terminal emulator: kitty
- Shell: zsh (oh-my-zsh)
    - Theme: agnoster
- Text editor: Neovim (kickstarter)
- Font: Fira Code
- Icons: Noto Color Emoji

### Applications

Web browser: Mercury / Thorium

Resource monitor: btop

File explorer: ranger / Thunar

Image viewer: feh

Video player: mpv

### Browser setup

Download extensions not in the official site:
- [OldTwitter](https://github.com/dimdenGD/OldTwitter)
- [7TV](https://7tv.app/)

Restore configurations/settings for the following extensions:
- uBlock Origin
- SponsorBlock
- Enhancer for YouTube
- Tampermonkey
- Reddit Enhancement Suite
- Old Twitter Layout
