FROM ubuntu:focal
MAINTAINER Torkalis

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

# Install all apps
RUN apt-get install -y pkg-config
RUN apt-get install -y attr acl samba smbclient ldap-utils winbind libnss-winbind libpam-winbind krb5-user krb5-kdc supervisor
# Install OpenVPN
RUN apt-get install -y openvpn
# Install Diagnostic tools
RUN apt-get install -y nano dnsutils net-tools inetutils-ping

# Set up script and run
ADD init.sh /init.sh
RUN chmod 755 /init.sh
CMD /init.sh setup
