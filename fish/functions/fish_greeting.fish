function fish_greeting
    set_color -i green
    set -f kitty "󰄛"
    set -f fortune (fortune myquotes)
    set -f kitty_fortune (printf '%s %s %s' $kitty $fortune $kitty) # lazy solution
    echo $kitty_fortune
    set_color normal
end
