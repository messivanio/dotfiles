function kubectl --description "A safer kubectl"
  set kube_args $argv[1] 
  set unsafe_commands deploy create apply set delete scale diff

  if contains $kube_args $unsafe_commands
    set CURRENT_CLUSTER (command kubectl config view --template='{{ range .contexts }}{{ if eq .name "'(command kubectl config current-context)'" }}{{ .context.cluster }}{{ end }}{{ end }}')
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

  command kubectl $argv
end
