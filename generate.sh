days=30
total_commit=20
size=$((days*24*60))
a=$(shuf -i 1-$size -n $total_commit | sort -r -n)
for i in ${a}
    do 
        if [[ $(date -d "-$i minutes" +%u) -gt 5 ]]; then
            echo 'weekend.'
        else
            git commit --allow-empty -m "add bounce, fadeout, fadein animation"
            git commit --amend --allow-empty --no-edit --date "$(date -d "-$i minutes")"
        fi
    done 
read  -n 1 -p "Press any key to exit:" mainmenuinput
