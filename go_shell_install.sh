#!/bin/bash
System=$(uname -s)-$(uname -m)
        case $System in
                Linux-x86_64)
                        Sys_tag="linux-amd64.tar.gz";;
        esac

go_version="1.10"
tar_ball="go$go_version.$Sys_tag"

## Go install
cd ~
curl -L https://dl.google.com/go/$tar_ball -o ./$tar_ball
sudo tar -C /usr/local -xzf $tar_ball
export PATH="$PATH:/usr/local/go/bin"
echo 'export PATH=$PATH:/usr/local/go/bin' > ./go_path.sh
chmod +x ./go_path.sh
sudo cp -f ./go_path.sh /etc/profile.d/go_path.sh
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bash_profile
go get github.com/erning/gorun
sudo mv ~/go/bin/gorun /usr/local/bin/
echo ':golang:E::go::/usr/local/bin/gorun:OC' | sudo tee /proc/sys/fs/binfmt_misc/register
bash -i
