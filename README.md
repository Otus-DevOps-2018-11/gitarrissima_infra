#7 Сборка образов VM с помощью Packer

1. Перенесла наработки с предыдущего ДЗ в директорию config-scripts.

2. Установила и авторизовала packer для работы с gcp

3. Сбилдила образ ubuntu16.json, подробно описанный в домашнем задании
   Раздеплоила приложение на основе данного образа
   Установила зависимости приложения, запустила его и проверила работу

4. Параметризовала исходный шаблон как сказано в задании ubuntu16.variables.json
   Учла обязательные и необязательные переменные
   Создала файл variables.json

5. Исследовала другие опции builder для gcp

6. В качестве практики подхода к управлению инфраструктурой Immutable infrastructure
   создала новый шаблон для создания образа immutable.json, 
   который содержит описание установки самого приложения 
   и всех его зависимостей поверх базового образа
   Запуск приложения при старте организовала с помощью systemd unit

7. Создала shell-скрипт create-redditvm.sh с командой, 
   которая на основе подготовленного мною образа запускает виртуальную машину

#6 Деплой тестового приложения

testapp_IP = 35.195.199.207
testapp_port = 9292


В качестве доп. задания используйте созданные ранее скрипты
для создания , который будет запускаться при
создании инстанса. Передавать startup скрипт необходимо как
дополнительную опцию уже использованной ранее команде gcloud.
Startup скрипт
необходимо закомитить, а используемую команду gcloud добавить
в описание репозитория (README.md)

gcloud compute instances create reddit-app2 --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --metadata-from-file startup-script=startup.sh


Удалите созданное через веб интерфейс правило для работы
приложения default-puma-server.
Создайте аналогичное правило из консоли с помощью gcloud.
Используемую команду gcloud необходимо добавить в описание
репозитория (README.md)

gcloud compute firewall-rules create default-puma-server --allow=tcp:9292 --direction=ingress --source-ranges=0.0.0.0/0 --target-tags=puma-server


#5
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

