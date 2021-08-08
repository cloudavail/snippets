FROM amazonlinux:2
RUN yum update -y && yum install -y initscripts;
RUN amazon-linux-extras install -y epel && yum install -y openvpn
RUN yum -y install easy-rsa
CMD [ "/usr/sbin/openvpn", "--config /etc/openvpn/cloudavail.conf" ]
