vap

This program to print images from the context menu of the file manager in Linux (as in Windows).
Allows you to quickly compose pictures on the page for a few pieces.
Works in Ubuntu, and probably other distributions.

Программа для печати картинок из контекстного меню файлового менеджера в Linux (как в windiws).
Позволяет быстро скомпоновать картинки на листе по несколько штук.
Работает в Ubuntu, и навернов других дистрибутивах.


Installation
1. Copy the file to any available vap local directory of your choice.
2. Run the file vap as root:
"sudo / ... path to the file ... /vap"
3. In the program, click the "Settings" -> "Integration" - the program will be available in the context menu.
(Nautilus in the submenu "Scripts")
4. (optional) In the settings specify the language, click "Save Settings"
5. If step 4 to close the settings window and change the layout, paper size, page orientation, scaling,
and then perform step 4, these settings are saved and will always be used at startup.

Establish and abolish integration only as root.

Установка
1. Скопируйте файл vap в любую доступную вам папку на свой вкус.
2. Запустите файл vap с правами администратора:
"sudo /...путь к файлу.../vap"
3. В программе нажмите "Настройки" -> "Интеграция" - программа станет доступна в контекстном меню.
(в Nautilus в подменю "Сценарии") 
4. (не обязательно) В настройках укажите язык интерфейса, нажмите "Сохранить настройки"
5. Если перед п.4 Закрыть окно настроек и поменять компоновку, размер бумаги, ориентацию листа, масштаб,
а потом выполнить п.4, то эти настройки сохранятся и будут всегда применяться при запуске.

Устанавливать и отменять интеграцию можно только из-под root'а.


 




Устарело, но работает, если поместить файл vap в папку /etc/:

Установка в контекстное меню Nautilus:

Файл "Печать" из архива скопировать в /home/USER/.gnome2/nautilus-scripts/

Установка в контекстное меню Dolphin:

Файл "Печать.desktop" из архива скопировать в /home/USER/.kde/share/kde4/services/ServiceMenus/

Для настройки исходного состояния программы при запуске можно добавить параметры в строку запуска:

*x=N – установить масштаб печати N% по горизонтали (норма 100%)
*y=N – установить масштаб печати N% по вертикали (норма 100%)
*ns – снять флажок «Синхронно». Без этого параметра масштаб по х и y всегда будет одинаковый, т.е. команда 
           «*x=50» установит сжатие в два раза как по горизонтали, так и по вертикали.
*рА4, *рА5, *рА6, *р10х15, *p15x20 - установить соответствующий формат бумаги
*px210y297 – установить пользовательский формат бумаги (размеры x и y в миллиметрах).
*с0, *с1 … *с9 – установить соответствующую компоновку.
*oL - ландшафтная ориентация (портретная по умолчанию)
*i - включить английский интерфейс.

Все символы латинские в любом регистре
===
