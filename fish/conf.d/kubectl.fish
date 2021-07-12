function kubectl --description "A safer kubectl"
  set kube (which kubectl)
  set kube_command $argv[1] 
  set unsafe_commands deploy create apply set delete scale

  if contains $kube_command $unsafe_commands
    set CURRENT_CLUSTER ($kube config view --template='{{ range .contexts }}{{ if eq .name "'($kube config current-context)'" }}{{ .context.cluster }}{{ end }}{{ end }}')
    set FILE ".k8s-clusters"
    read -x FILE_CONTENT < $FILE
    if test -e $FILE
      if not string match -r "K8S_CLUSTERS=\"$CURRENT_CLUSTER\"" $FILE_CONTENT
        echo "Current k8s Cluster: $CURRENT_CLUSTER"
        echo "K8S Target Clusters (from .k8s-clusters file): $FILE_CONTENT"
        set_color red
        echo "WRONG CLUSTER!!! Exiting."
        set_color normal
        return 1
      end
    end 
  end

  $kube $argv

end
