function kk
	kustomize build . | kubectl apply -f -
end