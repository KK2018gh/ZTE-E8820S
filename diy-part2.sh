#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

device_name='E8820S'
wifi_name='ZTE-E8820S-%s'
lan_ip='192.168.123.1'        # Lan Ip地址
utc_name='Asia\/Shanghai'   # 时区
 
#修改机器名称
echo "设置主机名"
sed -i "s/E8820S/$device_name/g" package/base-files/files/bin/config_generate


# Modify default IP
echo "设置lan ip"
sed -i "s/192.168.123.1/$lan_ip/g" package/base-files/files/bin/config_generate


#修改默认时区
echo "修改时区"
sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='$utc_name'/g" package/base-files/files/bin/config_generate


echo "修改wifi名称"

sed -i "s/ZTE-E8820S-%s/$wifi_name/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

