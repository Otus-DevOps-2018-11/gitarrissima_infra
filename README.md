#7
terraform-1

1. установила terraform

2. написала и проверила выполнение кода создания виртуальной машины 
   на основе image = reddit-base как было показано в основной части ДЗ

3. научилась использовать утилиту terraform c ключами plan, apply, show
   определять входные переменные, задавать им дефолтные значения
   задавать правила парсинга output команды terraform apply в выходные переменные
   использовать provisioners

4. выполнила самостоятельные задания:
   - определила input переменную для приватного ключа 
     использующегося в определении подключения для провижинеров
   - пределила input переменную для задания зоны в ресурсе
     "google_compute_instance" "app". Задала значение по умолчанию
   - отформатировала все конигурационные файлы
   - добавила несколько ssh ключей для разворачиваемого образа
   - в файле terraform/lb/lf.tf описала создание HTTP балансировщика
     на основе образа reddit-full из предыдущей домашней работы
   - вынесла определение количества инстансов в переменную count
     с дефолтным значением = 1

#6
gitarrissima Infra repository

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

