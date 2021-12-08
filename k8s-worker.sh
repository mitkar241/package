# set hostname
# needs to be different for different workers
hostnamectl set-hostname kworker

# for testing
ufw disable

# off swap
swapoff -a; sed -i '/swap/d' /etc/fstab

# Update sysctl settings for Kubernetes networking
cat >>/etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

# Install docker engine
{
  apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  apt update
  apt install -y docker-ce=5:19.03.10~3-0~ubuntu-focal containerd.io
}

# Add Apt repository
{
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
}

# Install Kubernetes components
apt update && apt install -y kubeadm=1.18.5-00 kubelet=1.18.5-00 kubectl=1.18.5-00

# In the end of installation, run
# sudo kubeadm join 192.168.0.105:6443 --token a28itn.1jd9xmndf83z499n     --discovery-token-ca-cert-hash sha256:9c9f398f531ad04dc9f8b66600063bf03f4878fbb3e51c13ab276b5468ef3ae7
