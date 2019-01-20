# gitarrissima_infra
gitarrissima Infra repository

1. Исследовать способ подключения к someinternalhost в одну
   команду из вашего рабочего устройства:

   ssh -i /root/.ssh/test -o ProxyCommand='ssh -i /root/.ssh/test test@35.210.223.91 nc 10.132.0.3 22' test@10.132.0.3

2. Предложить вариант решения для подключения из консоли при
   помощи команды вида ssh someinternalhost из локальной
   консоли рабочего устройства, чтобы подключение выполнялось по
   алиасу someinternalhost:

   Пописать в /etc/ssh/ssh_config настроки для хоста
   Host internalhost
       IdentityFile ~/.ssh/test
       User test
       ProxyCommand ssh -i ~/.ssh/test test@35.210.223.91 nc 10.132.0.3 22

   После этого будет работать команда:
   ssh internalhost

3. Настроила подключение по vpn
   bastion_IP = 35.210.223.91
   someinternalhost_IP = 10.132.0.3


