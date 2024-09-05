@echo off
REM 启用Windows中的Bing AI
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\Shell\Copilot\BingChat' -Name 'IsUserEligible' -Value 1"

REM 打开“个性化 > 任务栏 > 任务栏项”页面
start ms-settings:taskbar

REM 等待2秒以确保设置页面完全加载
timeout /t 2

REM 如果Windows中的Copilot（预览）已经启用，则关闭Windows中的Copilot（预览）【该操作的目的是刷新状态，有的时候Windows会有Bug】
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowCopilotButton' -Value 0"

REM 启用Windows中的Copilot（预览）
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowCopilotButton' -Value 1"

echo Copilot is enabled now.

REM 等待2秒以确保设置页面完全加载
timeout /t 2

REM 关闭“个性化 > 任务栏 > 任务栏项”页面
powershell -Command "Stop-Process -Name SystemSettings"

REM 关闭.bat窗口
exit