### Установка
###### Без использования git:
[Скачайте](https://github.com/vterdunov/ansible-apt/archive/master.zip) репозиторий в виде архива и распакуйте.
###### Требуется установленный git:
```
git clone https://github.com/vterdunov/ansible-apt.git
make ansible
```

### Общее ПО (VirtualBox, Vagrant, etc)
```
make common-software
```

### Установка пакетов для разработки
```
make development
```
Так же, можно задать тег `ruby`устанавливающий rbenv, ruby и несколько нужных гемов.
```
make development TAGS=ruby
```

Настройка приглашения PS1, терминала и т.п.
### dotfiles
```
make dotfiles
```
