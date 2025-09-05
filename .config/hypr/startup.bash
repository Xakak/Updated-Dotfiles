sleep 2
wireplumber 
random_wallpaper=$(find ~/Pictures/Wallpapers/ | shuf -n 1)
matugen image "$random_wallpaper"

#current wallpaper to a file
#echo "\$path=$random_wallpaper" > ~/.config/hypr/.current_wallpaper

