# gitarrissima_infra
gitarrissima Infra repository


testapp_IP = 35.210.223.91
testapp_port = 15518


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
