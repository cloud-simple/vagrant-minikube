### Install docker
apt-get remove docker docker-engine docker.io containerd runc -y

apt-get update -y
apt-get upgrade -y
apt-get install ca-certificates curl gnupg lsb-release -y

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

chmod a+r /etc/apt/keyrings/docker.gpg

apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

### Docker post-installation steps
groupadd docker
usermod -aG docker vagrant

systemctl enable docker.service
systemctl enable containerd.service

### Get arkade
curl -sLS https://get.arkade.dev | sh

### User ~/.profile
sudo -u vagrant -i << '_EOF'
cat >> ~/.profile << '_EOF_EOF'

# set PATH so it includes arkade bin's if they exist
if [ -d "$HOME/.arkade/bin" ] ; then
    PATH="$PATH:$HOME/.arkade/bin"
fi
_EOF_EOF

### Install ark's bins
source ~/.profile
arkade get kubectl minikube
_EOF
