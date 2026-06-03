@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~dp0FM26-Player-Editor.exe' -Verb RunAs"
