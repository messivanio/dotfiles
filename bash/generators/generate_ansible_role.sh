#!/bin/sh

mkdir -p roles/$1/tasks
mkdir -p roles/$1/handlers
mkdir -p roles/$1/templates
mkdir -p roles/$1/files
mkdir -p roles/$1/vars

tee roles/$1/tasks/main.yml << EOF
---

  - name: be sure ntp is installed
    package: name=ntp state=installed
    tags: ntp

  - name: be sure ntp is configured
    template: src=ntp.conf.j2 dest=/etc/ntp.conf
    notify:
      - restart ntpd
    tags: ntp

  - name: be sure ntpd is running and enabled
    service: name=ntpd state=started enabled=yes
    tags: ntp
EOF


tee roles/$1/handlers/main.yml << EOF
---

  - name: restart ntpd
    service: name=ntpd state=restarted
EOF


tee roles/$1/vars/main.yml << EOF
---
asdf: 10
EOF