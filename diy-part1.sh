#!/bin/bash
# 添加 passwall 相关feed源（passwall这两个是feed，可以写进feeds.conf）
sed -i '$a src-git passwall_luci https://github.com/Openwrt-Passwall/openwrt-passwall.git;main' feeds.conf.default
sed -i '$a src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main' feeds.conf.default

# Argon主题：直接clone到package目录，不要加到feeds！
rm -rf package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
