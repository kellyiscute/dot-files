#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# 极速状态获取脚本
# 1. Wifi: 使用 nmcli device status (不扫描，瞬时)
# 2. Battery: 直接读取 /sys/class 文件 (比 upower 更快)
# -----------------------------------------------------------------------------

# === 图标配置 (Nerd Fonts) ===
ICON_WIFI=" "       # nf-fa-wifi
ICON_NO_WIFI="󰤭 "    # nf-md-wifi_off
ICON_BATTERY=" "    # nf-fa-battery_full
ICON_CHARGING=""    # nf-fa-bolt

# === 1. 获取 WiFi 名称 (极速模式) ===
# 命令解释：
# nmcli -t: 简洁模式 (以冒号分隔)
# -f TYPE,STATE,CONNECTION: 只获取类型、状态和连接名
# device status: 获取设备状态列表
# grep: 筛选出 类型为wifi 且 状态为connected 的行
# cut: 提取第3个字段 (CONNECTION 即 WiFi 名称)
WIFI_NAME=$(nmcli -t -f TYPE,STATE,CONNECTION device status | grep "^wifi:connected" | head -n 1 | cut -d':' -f3)

# 处理 WiFi 输出
if [ -n "$WIFI_NAME" ]; then
    # 有连接：图标 + 名称
    WIFI_TEXT="${ICON_WIFI} ${WIFI_NAME}"
else
    # 无连接：只显示断开图标 (保持极简)
    WIFI_TEXT="${ICON_NO_WIFI}"
fi

# === 2. 获取电池电量 (直接读取系统文件，最快) ===
# 尝试找到第一个电池 (通常是 BAT0 或 BAT1)
BAT_PATH=$(find /sys/class/power_supply/BAT* -maxdepth 0 -print -quit 2>/dev/null)

BAT_TEXT=""

if [ -n "$BAT_PATH" ]; then
    # 读取电量百分比
    CAPACITY=$(cat "$BAT_PATH/capacity" 2>/dev/null)
    # 读取状态 (Charging, Discharging, Full)
    STATUS=$(cat "$BAT_PATH/status" 2>/dev/null)

    if [ -n "$CAPACITY" ]; then
        BAT_TEXT="${ICON_BATTERY} ${CAPACITY}%"
        
        # 如果正在充电，追加闪电图标
        if [ "$STATUS" = "Charging" ]; then
            BAT_TEXT="${BAT_TEXT} ${ICON_CHARGING}"
        fi
    fi
fi

# === 3. 组合输出 ===
# 如果是台式机(无电池)，只显示 WiFi
if [ -z "$BAT_TEXT" ]; then
    echo "$WIFI_TEXT"
else
    # 笔记本：用竖线分隔
    echo "$WIFI_TEXT  |  $BAT_TEXT"
fi
