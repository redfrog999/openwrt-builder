#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

sudo rm /var/lib/dpkg/lock-frontend 2>/dev/null
sudo dpkg --configure -a

# 强行删除 Rust feed，防止它参与编译干扰
./scripts/feeds uninstall -a rust
./scripts/feeds install -a

# Modify default IP 
sed -i 's/192.168.1.1/192.168.68.1/g' package/base-files/files/bin/config_generate

# 最大连接数修改为65535
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

echo '替换golang到1.25.x'
rm -rf feeds/packages/lang/golang
git clone -b 25.x --single-branch https://github.com/sbwml/packages_lang_golang feeds/packages/lang/golang
echo '=========Replace golang OK!========='
