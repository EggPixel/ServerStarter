::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFD5ZSRaDMG+fAbIgzO3o5P6IsnE5W/UxdIDa3ojccLJDuxS1Icd9gygPyJJfWiRdfwGyZww7p1FMs3C6YZPSugzuKg==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCeDJGqB5lQ1OidASReWAO1G6zD2KW0CJ293bcj3nGfGsN2Vi/qLOOVz
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
rem 
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
echo 服务端名称=Server.jar >>./config.yml
echo 最大内存=4G >> ./config.yml
echo #默认4G >> ./config.yml
echo 最小内存=4G >> ./config.yml
echo #默认4G >> ./config.yml
echo 是否自动重启=True >> ./config.yml
echo #请填写True或者False >> ./config.yml
echo 优化参数= >> ./config.yml
echo 是否不要java自带控制台=nogui >> ./config.yml
echo #即nogui参数,开启填写nogui >> ./config.yml
echo 自定义窗口标题=By EmeraldEgg >> ./config.yml
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
if exist *.jar (echo 即将开服...) else start https://yivesmirror.com/downloads/paper & exit
::大神
for /f "tokens=1,* delims==" %%a in (
'findstr "服务端名称=" "config.yml"'
) do (
set Name=%%b
)
for /f "tokens=1,* delims==" %%a in (
'findstr "最大内存=" "config.yml"'
) do (
set Xmx=%%b
)
for /f "tokens=1,* delims==" %%a in (
'findstr "最小内存=" "config.yml"'
) do (
set Xms=%%b
)
for /f "tokens=1,* delims==" %%a in (
'findstr "是否自动重启=" "config.yml"'
) do (
set Reboot=%%b
)
for /f "tokens=1,* delims==" %%a in (
'findstr "自定义窗口标题=" "config.yml"'
) do (
set Title=%%b
)
for /f "tokens=1,* delims==" %%a in (
'findstr "是否不要java自带控制台=" "config.yml"'
) do (
set nogui=%%b
)
for /f "tokens=1,* delims==" %%a in (
'findstr "优化参数=" "config.yml"'
) do (
set YouHua=%%b
)
title %title%
goto start
: getinfos
if exist *.jar (echo 即将开服...) else start https://yivesmirror.com/downloads/paper & exit
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
title %title%
goto start
: start
set count=1
echo 成功读取信息:
echo 最大内存=%Xmx%
echo 最小内存=%Xms%
echo 服务器是否重启=%Reboot%
echo 服务端名称=%Name%
echo ==============================
: javastart
java -Xmx%Xmx% -Xms%Xms% %YouHua% -jar %Name% %nogui%
if "%Reboot%" == "False" pause&exit
set /a count=%count%+1
echo %count%
ping 127.0.0.1 /n 4 >nul
if %count% == 10 echo 检测到重启次数过多，自动关闭此程序 &ping localhost /n 4 >nul &exit
goto javastart