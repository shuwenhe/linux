#!/bin/bash
set -e

echo "请输入要配置的连接名称（例如 Diamondtiming_5G）:"
read IF_NAME
if [ -z "$IF_NAME" ]; then
  echo "连接名称不能为空，退出。"
  exit 1
fi

echo "请输入静态IP地址及掩码（例如 192.168.0.124/24）:"
read STATIC_IP
if [ -z "$STATIC_IP" ]; then
  echo "静态IP不能为空，退出。"
  exit 1
fi

echo "请输入网关地址（例如 192.168.0.1）:"
read GATEWAY
if [ -z "$GATEWAY" ]; then
  echo "网关不能为空，退出。"
  exit 1
fi

echo "请输入DNS服务器地址，多个用空格分隔（例如 8.8.8.8 8.8.4.4）:"
read DNS
if [ -z "$DNS" ]; then
  echo "DNS不能为空，退出。"
  exit 1
fi

echo "开始配置网络连接：$IF_NAME"
echo "IP地址：$STATIC_IP"
echo "网关：$GATEWAY"
echo "DNS：$DNS"

sudo nmcli connection modify "$IF_NAME" ipv4.addresses "$STATIC_IP" ipv4.gateway "$GATEWAY" ipv4.dns "$DNS" ipv4.method manual
sudo nmcli connection up "$IF_NAME"

echo "✅ 网络配置已应用"

