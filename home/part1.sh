#!/bin/bash

sed -i '1i src-git redfrog999 https://github.com/redfrog999/openwrt.git;openwrt-23.05' feeds.conf.default
cp -rf ../config/diff/* .

# Add a feed source
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;luci-smartdns-dev" >> "feeds.conf.default"
#echo "src-git mihomo https://github.com/morytyann/OpenWrt-mihomo.git;main" >> "feeds.conf.default"

# 添加插件源码
#sed -i '$a src-git kiddin9 https://github.com/redfrog999/kiddin9-openwrt-packages' feeds.conf.default
sed -i '$a src-git-full kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i 's/+firewall/+uci-firewall/g' feeds/luci/applications/luci-app-firewall/Makefile
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
