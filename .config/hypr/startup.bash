sleep 2
wireplumber
random_wallpaper=$(find ~/Pictures/wallpapers/ | shuf -n 1)
swww img --transition-type="grow" --transition-fps="120" --transition-duration="0.4" $random_wallpaper && wal -i $random_wallpaper
