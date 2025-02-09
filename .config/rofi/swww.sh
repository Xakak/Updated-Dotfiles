#!/bin/zsh

# all wallpapers array
wallpapers=(~/Pictures/wallpapers/*)

# getting the current wallpaper with `swww query`
current_wallpaper_path=$(swww query | sed "s/.*image: \(.*\)/\1/") 

# if the daemon is not running
if [[ $current_wallpaper_path == "" ]] then;
    swww-daemon &!
fi

current_wallpaper_name=${current_wallpaper_path:t}

# show menu (with icon)
selected_wallpaper=$(for a in $wallpapers; do
    if [[ ${a:t} == $current_wallpaper_name ]] then;
        echo -en "${a:t} (current)\0icon\x1f$a\n"
    else
        echo -en "${a:t}\0icon\x1f$a\n"
    fi
done | rofi -dmenu -p " " -theme config-drun.rasi)

# removing the added " (current)" from the selected wallpaper (no matter the item selected)
final_wallpaper=$(echo $selected_wallpaper | sed "s/ (current)//")
wallpaper_ext=$(echo $final_wallpaper | sed "s/.*\.\(.*\)/\1/")

# changing the wallpaper and the colorscheme if selected wallpaper is not empty
if [[ $selected_wallpaper != "" ]]; then
    wal -i ~/Pictures/wallpapers/$final_wallpaper





fi
