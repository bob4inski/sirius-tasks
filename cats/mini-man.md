```bash
sudo apt-get install devscripts build-essential debhelper dh-make
mkdir mypackage
cd mypackage
dh_make --native --packagename mypackage_1.0
cd debian
# Edit changelog, control, and rules files
```

```bash
cd ..
debuild -us -uc
cd ..
ls *.deb
sudo dpkg -i mypackage_1.0_amd64.deb
```
Так вы получите максимально простой пакет
Теперь нужно сделать следующее:
0. понять как правильно менять файлы в debian (для этого есть пример в текущей папке) (mini-cat.py надо передвинуть в usr/bin)
1. Добавить зависимости
2. Добавить конфигурационный файл для nginx
3. Добавить юнит файл
