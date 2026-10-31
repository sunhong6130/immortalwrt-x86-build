#!/bin/bash
mkdir -p files/etc/uci-defaults

# 设置LuCI默认简体中文
cat > files/etc/uci-defaults/99-luci-lang << EOF
uci set luci.main.lang='zh-cn'
uci commit luci
EOF
chmod +x files/etc/uci-defaults/99-luci-lang

# 网络预置：eth0=LAN，eth1=WAN DHCP
cat > files/etc/uci-defaults/98-network-wanlan << EOF
uci del network.wan
uci del network.wan6
uci del network.lan
uci commit network

uci set network.lan=interface
uci set network.lan.proto='static'
uci set network.lan.ifname='eth0'
uci set network.lan.ipaddr='192.168.1.1'
uci set network.lan.netmask='255.255.255.0'
uci set network.lan.dns='223.5.5.5'

uci set network.wan=interface
uci set network.wan.proto='dhcp'
uci set network.wan.ifname='eth1'
uci set network.wan6=interface
uci set network.wan6.proto='dhcpv6'
uci set network.wan6.ifname='eth1'

uci set firewall.@zone[0].network='lan'
uci set firewall.@zone[1].network='wan wan6'
uci commit network
uci commit firewall

uci set dhcp.lan.interface='lan'
uci set dhcp.lan.start='100'
uci set dhcp.lan.limit='150'
uci set dhcp.lan.leasetime='12h'
uci commit dhcp
EOF
chmod +x files/etc/uci-defaults/98-network-wanlan

