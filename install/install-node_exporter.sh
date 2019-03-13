mkdir -p ~/ops/node_exporter
cd ~/ops/node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v0.17.0/node_exporter-0.17.0.linux-amd64.tar.gz
tar -xvzf node_exporter-0.17.0.linux-amd64.tar.gz
sudo ln -sf ~/ops/node_exporter/node_exporter-0.17.0.linux-amd64/node_exporter /usr/bin/node_exporter

cat <<EOF > node_exporter.service
[Unit]
Description=Prometheus Node Exporter
Documentation=https://prometheus.io/docs/introduction/overview/
After=network-online.target

[Service]
#User=prometheus
Restart=on-failure
ExecStart=/usr/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

sudo mv node_exporter.service /etc/systemd/system/.

sudo systemctl daemon-reload

sudo service node_exporter start

sudo service node_exporter status
