@echo off
title 下载BungeeCord中...
color af
echo 使用本程序前，请注意:
echo 本程序仅用于下载BungeeCord,且不一定下载成功,或者不是最新版本
echo 请确保此bat在服务器文件夹中
if exist *.* (if exist *.bat (echo Starting Download...) else md BungeeCord & cd BungeeCord)
set downloaddir=%cd%\Server.jar
md modules
set cmd_alert=%cd%\modules\cmd_alert.jar
set cmd_find=%cd%\modules\cmd_find.jar
set cmd_list=%cd%\modules\cmd_list.jar
set cmd_send=%cd%\modules\cmd_send.jar
set cmd_server=%cd%\modules\cmd_server.jar
set reconnect_yaml=%cd%\modules\reconnect_yaml.jar
bitsadmin /transfer "服务端下载中，请不要关闭" /download /priority normal "https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar" "%downloaddir%"
bitsadmin /transfer "服务端下载中，请不要关闭" /download /priority normal "https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-alert/target/cmd_alert.jar" "%cmd_alert%"
bitsadmin /transfer "服务端下载中，请不要关闭" /download /priority normal "https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-find/target/cmd_find.jar" "%cmd_find%"
bitsadmin /transfer "服务端下载中，请不要关闭" /download /priority normal "https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-list/target/cmd_list.jar" "%cmd_list%"
bitsadmin /transfer "服务端下载中，请不要关闭" /download /priority normal "https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-send/target/cmd_send.jar" "%cmd_send%"
bitsadmin /transfer "服务端下载中，请不要关闭" /download /priority normal "https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/cmd-server/target/cmd_server.jar" "%cmd_server%"
bitsadmin /transfer "服务端下载中，请不要关闭" /download /priority normal "https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/module/reconnect-yaml/target/reconnect_yaml.jar" "%reconnect_yaml%"
cd %downloaddir%
echo. > 点我启动服务器.bat
mshta http://bathome.net/s/hta/ type('点我启动服务器.bat') >点我启动服务器.bat
echo @echo off > 点我启动服务器.bat
echo title EggPixel.github.io获取启动器 >> 点我启动服务器.bat
echo : start >> 点我启动服务器.bat
echo java -Xms1G -Xmx1G -jar Server.jar >> 点我启动服务器.bat
echo goto start >> 点我启动服务器.bat
echo 程序运行完毕!
pause & exit
rem ByEmeraldsEgg
