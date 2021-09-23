function fish_prompt --description 'Informative prompt'
    #Save the return status of the previous command
    set -l last_pipestatus $pipestatus

    printf '\n'

    if test $last_pipestatus[1] != 0
        set_color $fish_color_status
        printf "Status: %s  " $last_pipestatus
        set_color normal
    end

    if test $CMD_DURATION
        # notify-send foo bar
        # Show duration of the last command in seconds
        if test $CMD_DURATION -ge 120000
            set duration (echo "$CMD_DURATION 60000" | awk '{printf "%.1fmin", $1 / $2}')
        else
            set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')
        end

        set color -dim normal
        printf "took "
        printf $duration
        set_color normal
    end

    printf '\n'

    set_color cb4b16
    printf $USER

    set_color normal
    printf '@'

    set_color b58900
    printf $hostname

    set_color normal
    printf ': '

    set_color 859900
    printf (string replace $HOME '~' (pwd)) 
    set_color normal

    if git rev-parse --git-dir > /dev/null 2>&1
        set_color 268bd2
        printf " [%s]" (git branch --show-current) 
    end

    if test -e ~/.kube/config; #and type "kubectl" > /dev/null
        set_color 2aa198
        printf " [k8s: %s/%s]" \
        (kubectl config current-context) \
        (kubectl config view --minify --output 'jsonpath={..namespace}')
    end

    printf '\n\r'

end
