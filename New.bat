@echo off
rem 可自行复制
rem 复制/使用前，你需要阅读以下条款
rem 1.禁止在此源码的基础下重新构建脚本
rem 2.你可以适当借鉴一些代码来完成你的程序
rem 3.请在转发此程序时标明原作者
rem 4.你可以随便转发，但是要标明原作者
title 欢迎使用
if exist dashen.donotremove goto getinfo
if exist xinshou.donotremove goto getinfos
goto uselevel
: uselevel
echo 请选择你的级别:
echo 1为大神，2为萌新
set /p level=请输入:
if "%level%"=="1" goto createconfig
if "%level%"=="2" goto createsetting
echo 输入错误，请重新输入!
goto uselevel
: createconfig
echo 您选择的为大神级别
echo 创建文件...
echo 如果要更换级别，请删除此文件! > ./dashen.donotremove
echo. > ./config.yml
@mshta http://bathome.net/s/hta/ type('config.yml') >config.yml
echo #请适当修改 >> ./config.yml
echo 服务端名称: Server.jar >>./config.yml
echo 最大内存: 4G >> ./config.yml
echo #默认4G >> ./config.yml
echo 最小内存: 4G >> ./config.yml
echo #默认4G >> ./config.yml
echo 是否自动重启: True >> ./config.yml
echo #请填写True或者False >> ./config.yml
echo 优化参数:  >> ./config.yml
echo 是否不要java自带控制台: nogui >> ./config.yml
echo #即nogui参数,开启填写nogui >> ./config.yml
echo 自定义窗口标题: By EmeraldEgg >> ./config.yml
echo 重启等待时长(单位s): 4 >> ./config.yml
echo 生成文件成功!请自行配置
ping 127.0.0.1 /n 4 >nul
exit
: createsetting
echo 您选择的为新手级别
echo 创建文件...
echo 如果要更换级别，请删除此文件! > ./xinshou.donotremove
echo. > ./设置.txt
@mshta http://bathome.net/s/hta/ type('设置.txt') >设置.txt
echo #请适当修改 >> ./设置.txt
echo 服务端名称=Server.jar >>./设置.txt
echo 最大内存=4G >> ./设置.txt
echo #默认4G >> ./设置.txt
echo 最小内存=4G >> ./设置.txt
echo #默认4G >> ./设置.txt
echo 是否自动重启=True >> ./设置.txt
echo #请填写True或者False >> ./设置.txt
echo 自定义窗口标题=By EmeraldEgg >> ./设置.txt
echo 生成文件成功!请自行配置
ping 127.0.0.1 /n 4 >nul
exit
: getinfo
if exist *.jar (echo 即将开服...) else goto download
::大神
for /f "tokens=1,* delims=: " %%a in (
'findstr "服务端名称:" "config.yml"'
) do (
set Name=%%b
)
for /f "tokens=1,* delims=: " %%a in (
'findstr "最大内存:" "config.yml"'
) do (
set Xmx=%%b
)
for /f "tokens=1,* delims=: " %%a in (
'findstr "最小内存:" "config.yml"'
) do (
set Xms=%%b
)
for /f "tokens=1,* delims=: " %%a in (
'findstr "是否自动重启:" "config.yml"'
) do (
set Reboot=%%b
)
for /f "tokens=1,* delims=: " %%a in (
'findstr "自定义窗口标题:" "config.yml"'
) do (
set Title=%%b
)
for /f "tokens=1,* delims=: " %%a in (
'findstr "是否不要java自带控制台:" "config.yml"'
) do (
set nogui=%%b
)
for /f "tokens=1,* delims=: " %%a in (
'findstr "优化参数:" "config.yml"'
) do (
set YouHua=%%b
)
for /f "tokens=1,* delims=: " %%a in (
'findstr "重启等待时长(单位s):" "config.yml"'
) do (
set Wait=%%b
)
title %title%
goto start
: getinfos
if exist *.jar (echo 即将开服...) else goto download
::新手
for /f "tokens=1,* delims==" %%a in (
'findstr "服务端名称=" "设置.txt"'
) do (
set Name=%%b
)
for /f "tokens=1,* delims==" %%a in (
'findstr "最大内存=" "设置.txt"'
) do (
set Xmx=%%b
)
for /f "tokens=1,* delims==" %%a in (
'findstr "最小内存=" "设置.txt"'
) do (
set Xms=%%b
)
for /f "tokens=1,* delims==" %%a in (
'findstr "是否自动重启=" "设置.txt"'
) do (
set Reboot=%%b
)
for /f "tokens=1,* delims==" %%a in (
'findstr "自定义窗口标题=" "设置.txt"'
) do (
set Title=%%b
)
set nogui=nogui
set YouHua=
set Wait=4
title %title%
goto start
: start
set count=1
echo 成功读取信息:
echo 最大内存=%Xmx%
echo 最小内存=%Xms%
echo 服务器是否重启=%Reboot%
echo 服务端名称=%Name%
echo 重启等待时间=%Wait%
echo ==============================
: javastart
java -Xmx%Xmx% -Xms%Xms% %YouHua% -jar %Name% %nogui%
if "%Reboot%" == "False" pause&exit
set /a count=%count%+1
ping 127.0.0.1 /n %Wait% >nul
if %count% == 10 echo 检测到重启次数过多，自动关闭此程序 &ping localhost /n 4 >nul &exit
goto javastart
: download
title 未检测到服务端
color 1a
echo 未检测到服务端
echo 是否自动下载服务端?
echo [Y/N](Y为是,N为否，区分大小写)
set /p auto=
cls
: downloadsel
if %auto%=="N" exit
echo ========================
echo 请输入对应数字来下载服务端:
echo 1.Paper1.16.4 #345 官方下载源
echo 2.Paper1.16.3 #253 官方下载源
echo 3.Paper1.16.2 #189 官方下载源
echo 4.Paper1.16.1 #138 官方下载源
echo 5.BungeeCord #leatest 官方下载源
echo 6.我自己下载
set downloaddir=%cd%\Server.jar
echo ========================
set /p downloads=请输入对应数字:
title 正在下载,请勿关闭此界面!
if %downloads%==1 bitsadmin /transfer "服务端下载中，请不要关闭" /download /priority normal "https://papermc.io/ci/job/Paper-1.16/lastSuccessfulBuild/artifact/paperclip-345.jar" "%downloaddir%" &exit
if %downloads%==2 bitsadmin /transfer "服务端下载中，请不要关闭" /download /priority normal "https://papermc.io/ci/job/Paper-1.16/253/artifact/paperclip-253.jar" "%downloaddir%" &exit
if %downloads%==3 bitsadmin /transfer "服务端下载中，请不要关闭" /download /priority normal "https://papermc.io/ci/job/Paper-1.16/189/artifact/paperclip-189.jar" "%downloaddir%" &exit
if %downloads%==4 bitsadmin /transfer "服务端下载中，请不要关闭" /download /priority normal "https://papermc.io/ci/job/Paper-1.16/138/artifact/paperclip-138.jar" "%downloaddir%" &exit
if %downloads%==5 goto bun
if %downloads%==6 exit
goto downloadsel
: bun
md BungeeCord & cd BungeeCord
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
rem 可自行复制
rem 复制/使用前，你需要阅读以下条款
rem 1.禁止在此源码的基础下重新构建脚本
rem 2.你可以适当借鉴一些代码来完成你的程序
rem 3.请在转发此程序时标明原作者
rem 4.你可以随便转发，但是要标明原作者

