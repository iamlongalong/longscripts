#!/bin/bash

logmsg() {
  local current_time
  local script_name
  local message

  current_time=$(date '+%Y-%m-%d %H:%M:%S') # 获取当前时间
  script_name=$(basename "$0")               # 获取当前脚本的文件名
  message="$@"                               # 获取全部传入参数作为日志消息

  # 输出带时间戳和脚本名称的日志消息
  echo "[$current_time][$script_name] $message"
}
