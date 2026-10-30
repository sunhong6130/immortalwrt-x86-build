#!/bin/bash
# 只拉取 Argon 主题，不再添加任何passwall feeds
rm -rf package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
