function fish_prompt --description 'Informative prompt'
    # #Save the return status of the previous command
    # set -l last_pipestatus $pipestatus

    # switch "$USER"
    #     case root toor
    #         printf '%s@%s %s%s%s# ' $USER (prompt_hostname) (set -q fish_color_cwd_root
    #                                                          and set_color $fish_color_cwd_root
    #                                                          or set_color $fish_color_cwd) \
    #             (prompt_pwd) (set_color normal)
    #     case '*'
    #         set -l pipestatus_string (__fish_print_pipestatus "[" "] " "|" (set_color $fish_color_status) \
    #                                   (set_color --bold $fish_color_status) $last_pipestatus)

    #         printf '\n[%s] \n%s%s@%s %s%s %s%s%s \f\r> ' (date "+%H:%M:%S") (set_color brblue) \
    #             $USER (prompt_hostname) (set_color $fish_color_cwd) $PWD $pipestatus_string \
    #             (set_color normal)
    # end

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

    if test -e .git/ 
        set_color 268bd2
        printf " [%s]" (git branch --show-current) 
    end

    if test -e ~/.kube/config; #and type "kubectl" > /dev/null
        set_color 2aa198
        printf " [k8s: %s | ns: %s]" \
        (kubectl config current-context) \
        (kubectl config view --minify --output 'jsonpath={..namespace}')
    end

    printf '\n\r'

end
