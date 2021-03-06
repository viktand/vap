unit Opt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls,  BaseUnix,  Process;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    CheckBox10: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioGroup1: TRadioGroup;
    StaticText1: TStaticText;
    UpDown1: TUpDown;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox10Change(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);  // nautilus
    procedure CheckBox2Change(Sender: TObject);  // dolphin
    procedure CheckBox3Change(Sender: TObject);  // caja
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure CheckBox6Change(Sender: TObject);
    procedure CheckBox7Change(Sender: TObject);
    procedure CheckBox8Change(Sender: TObject);
    procedure CheckBox9Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject); // выбор языка программы
    procedure lng; // перевести на выбранный язык эту форму
    procedure Setcheck; // установка чекбоксов по текущему состоянию интеграции
    procedure DoRoot; // перезапуск прграммы под рутом
    function GetGCinfo: boolean; // узнать есть ли интеграция в gnome-commander
    procedure Save; // Сохранить настройки
    procedure SetInte(b: boolean); // изменить количество подключенных fm: b=true -> добавить одну
    function  GetNautilusVer: boolean; // получить версию наутилуса, true -> ver >=3
    procedure SetCurOwner(fl: string); // установить для файла fl владельцем указанного пользователя
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean); // изменить масштаб
    procedure ShowScale; // показать масштаб (если надо)

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form3: TForm3;
  pram: string; // Строка параметров
  flag: boolean; // флаг разрешения настройки интеграции
  usr: tstringlist; // список самих юзеров
  ptuser: string; // путь к выбранному юзеру

implementation

{$R *.lfm}

uses start;

{ TForm3 }

procedure TForm3.RadioButton1Change(Sender: TObject);
begin
  if radiobutton1.Checked then start.lng:=0 else start.lng:=1;
  form1.SetLng;
  lng;
  save;
end;

procedure tform3.SetInte(b: boolean);
var
  i: integer;
  p: string;
begin
  p:=form1.LoadSett('integ');
  if p='' then p:='0';
  i:= strtoint(p);
  if b then inc(i) else dec(i);
  p:=inttostr(i);
  form1.SaveSett('integ', p);
end;

procedure TForm3.FormCreate(Sender: TObject);
var
    s: string;
begin
  pram:='';
  lng;
  flagsett:=false;
  form3.close;
  if GetEnvironmentVariable('LOGNAME') = 'root' then button1.Visible:=false;
  s:=form1.loadsett('button_pict');
  CheckBox6.Checked:=(s='');
  s:=form1.loadsett('autosave');
  CheckBox7.Checked:=(s='');
  s:=form1.loadsett('view');
  CheckBox8.Checked:=(s='');
  flagsett:=true;
end;

procedure tform3.showscale;
begin
   s:= form1.LoadSett('scale');
   if s<>'' then
     begin
       CheckBox10.Checked:=true;
       Label2.Visible:=true;
       Label2.Caption:=s+'% ';
       UpDown1.Visible:=true;
       updown1.Position:=strtoint(s);
     end;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  combobox1.Items.Clear;

  radiobutton2.Checked:=start.lng=1;
  label1.Caption:='for '+start.imuser;
  if imuser='' then
     begin
       panel1.Top:=64;
       panel1.left:=64;
       panel1.Visible:=true;
       combobox1.Items:=usr;
       combobox1.Text:=combobox1.Items[0];
       RadioGroup1.Enabled:=false;
       GroupBox1.Enabled:=false;
       CheckBox6.Enabled:=false;
       CheckBox7.Enabled:=false;
       CheckBox8.Enabled:=false;
     end else showscale;
  flag:=false;
  setcheck;
  flag:=true;
end;


procedure TForm3.Button3Click(Sender: TObject);
begin
  panel1.Visible:=false;
  start.imuser:=combobox1.Text;
  form1.bitbtn11.Enabled:=true;
  form1.MenuItem12.Enabled:=true;
  label1.Caption:='for '+start.imuser;
  flag:=false;
  setcheck;
  start.confflag:=false;
  flag:=true;
  RadioGroup1.Enabled:=true;
  GroupBox1.Enabled:=true;
  CheckBox6.Enabled:=true;
  CheckBox7.Enabled:=true;
  CheckBox8.Enabled:=true;
  showscale;
end;

procedure TForm3.Button1Click(Sender: TObject);
// интеграция в контекстное меню
begin
   doroot;
end;



procedure tform3.DoRoot;   // запуск root-экземпляра
var
  AProcess: TProcess;
begin
   AProcess := TProcess.Create(nil);
   AProcess.CommandLine := 'gksu "'+ '/usr/bin/vap -root"';
   AProcess.Options := AProcess.Options + [poWaitOnExit];
   AProcess.Execute;
   AProcess.Free;
end;

procedure tform3.setcheck;
// установка чекбоксов по текущему состоянию интеграции
var
  pt, p: string;
  i, j: integer;
begin
  i:=0;
  p:=MyFolder+imuser;
  checkbox1.Enabled:=false;  checkbox1.Checked:=false;
  checkbox2.Enabled:=false;  checkbox2.Checked:=false;
  checkbox3.Enabled:=false;  checkbox3.Checked:=false;
  checkbox4.Enabled:=false;  checkbox4.Checked:=false;
  checkbox9.Enabled:=false;  checkbox9.Checked:=false;
        if FileExists('/usr/bin/nautilus') then // to gnome
          begin
             checkbox1.Enabled:=true;
             pt:=p+'/.gnome2/nautilus-scripts';             // nautilus <3.6
             if FileExists(pt+'/Печать') then checkbox1.Checked:=true;
             if FileExists(pt+'/Print') then checkbox1.Checked:=true;
             pt:=p+'/.local/share/nautilus/scripts';        // nautilus >=3.6
             if FileExists(pt+'/Печать') then checkbox1.Checked:=true;
             if FileExists(pt+'/Print') then checkbox1.Checked:=true;
          end;
        if FileExists('/usr/bin/nemo') then // to nemo
          begin
             checkbox9.Enabled:=true;
             pt:=p+'/.gnome2/nemo-scripts';
             if FileExists(pt+'/Печать') then checkbox9.Checked:=true;
             if FileExists(pt+'/Print') then checkbox9.Checked:=true;
          end;
        pt:=p+'/.gnome-commander';
        if DirectoryExists(pt) then // to gnome commander
          begin
             checkbox5.Enabled:=true;
             if GetGCinfo then checkbox5.Checked:=true;
          end;
        pt:=p+'/.config/caja/scripts';  // to caja
         if DirectoryExists(pt) then
           begin
              checkbox3.Enabled:=true;
              if FileExists(pt+'/Печать') then checkbox3.Checked:=true;
              if FileExists(pt+'/Print') then checkbox3.Checked:=true;
           end;
        pt:=p+'/.kde/share/kde4/services/ServiceMenus';
        if DirectoryExists(pt) then // to kde
          begin
             checkbox2.Enabled:=true;
             if FileExists(pt+'/Печать.desktop') then checkbox2.Checked:=true;
             if FileExists(pt+'/Print.desktop') then checkbox2.Checked:=true;
          end;
        pt:=p+'/.local/share/extended-actions';
        if FileExists('/usr/bin/marlin') then
          if DirectoryExists(pt) then // to marlin
            begin
              checkbox4.Enabled:=true;
              if FileExists(pt+'/vap.desktop') then checkbox4.Checked:=true;
            end;
        if checkbox1.Checked then inc(i);
        if checkbox2.Checked then inc(i);
        if checkbox3.Checked then inc(i);
        if checkbox4.Checked then inc(i);
        if checkbox5.Checked then inc(i);
        if checkbox9.Checked then inc(i);
        p:=form1.LoadSett('integ');
        if p='' then p:='0';
        j:=strtoint(p);
        if i<>j then form1.SaveSett('integ', inttostr(i));
end;

procedure savecomp;
begin
 //в конфигурационном файле:
 // размер бумаги
 if form3.checkbox8.Checked then
   begin
      form1.SaveSett('paper','default');
      form1.SaveSett('comp', 'default');
      form1.SaveSett('orn','default');
      form1.SaveSett('mrg','default');
      form1.SaveSett('fill', 'default');
      form1.SaveSett('sml', 'default');
      form1.SaveSett('view', 'default');
      exit;
   end;
 case start.cmbx of
      0: form1.SaveSett('paper','A4');
      1: form1.SaveSett('paper','A5');
      2: form1.SaveSett('paper','A6');
      3: form1.SaveSett('paper','10x15');
      4: form1.SaveSett('paper','15x20');
      5: form1.SaveSett('paper','x'+ inttostr(start.frms[5][0]) + 'y' + inttostr(start.frms[5][1]));
 end;
 //компоновка
 form1.SaveSett('comp',inttostr(start.comp-1));
 // ориентация бумаги
 if start.orn then form1.SaveSett('orn','default') else form1.SaveSett('orn','L');
// поля
 if start.pol<>10 then form1.SaveSett('mrg', inttostr(start.pol)) else form1.SaveSett('mrg','default');
 // заполнить
 if form1.CheckBox3.Checked then form1.SaveSett('fill', 'yes') else form1.SaveSett('fill', 'default');
 // не увеличивать мелкие
 if not(form1.CheckBox2.Checked) then form1.SaveSett('sml', 'yes') else form1.SaveSett('sml', 'default');
 form1.SaveSett('view', 'users');
end;

procedure TForm3.save;
// сохранить настройки программы
begin
  // Язык
  if radiobutton2.Checked then form1.SaveSett('lang','1') else form1.SaveSett('lang','default');
  if not(CheckBox6.Checked) then form1.SaveSett('button_pict', 'no') else form1.SaveSett('button_pict', 'default');
  if not(CheckBox7.Checked) then form1.SaveSett('autosave', 'no') else form1.SaveSett('autosave', 'default');
end;



procedure TForm3.Button4Click(Sender: TObject);
begin
  if checkbox1.Enabled then checkbox1.Checked:=true;
  if checkbox2.Enabled then checkbox2.Checked:=true;
  if checkbox3.Enabled then checkbox3.Checked:=true;
  if checkbox4.Enabled then checkbox4.Checked:=true;
end;

procedure TForm3.CheckBox10Change(Sender: TObject);
begin
  label2.Visible:=checkbox10.Checked;
  updown1.Visible:=checkbox10.Checked;
  if checkbox10.Checked then
    begin
      updown1.Position:=start.sclp;
      label2.Caption:=inttostr(start.sclp)+'% ';
    end else
    begin
      form1.SaveSett('scale', 'default');
      form1.SclForms(form1.GetScreenSize);
    end;
end;


procedure TForm3.CheckBox1Change(Sender: TObject);
var
  pt, p: string;
  fl: textfile;
  prnt: string;
begin                             // to Nauntilus
  try
  if not flag then exit;
  p:=MyFolder+imuser;
  if RadioButton1.Checked then prnt:='Печать' else prnt:='Print';
        if GetNautilusVer then pt:=p+'/.local/share/nautilus/scripts'
                          else pt:=p+'/.gnome2/nautilus-scripts';
        if not(DirectoryExists(pt)) then
           begin
             CreateDir(pt);
             SetCurOwner(pt);
           end;
        if checkbox1.Checked then
              begin
                assignfile(fl, pt+'/'+prnt);
                rewrite(fl);
                writeln(fl, '#!/bin/sh');
                writeln(fl, ' ');
                writeln(fl, '/usr/bin/vap $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS');
                closefile(fl);
                fpChmod (pt+'/'+prnt,&777);
                if GetEnvironmentVariable('LOGNAME') = 'root' then SetCurOwner(pt+'/'+prnt);
              end else
              begin
                 if FileExists(pt+'/Печать') then deletefile(pt+'/Печать');
                 if FileExists(pt+'/Print') then deletefile(pt+'/Print');
              end;
              SetInte(checkbox1.Checked);
  Except
      case start.lng of
        0: showmessage('Конфигурационный файл Nautilus потребовал особых прав доступа. Включите root.');
        1: showmessage('The configuration file Nautilus requested special privileges. Turn on the root.');
      end;
  end;
end;

function tform3.GetNautilusVer: boolean;
var
   AProcess: TProcess;
   AStringList: TStringList;
begin
   AProcess := TProcess.Create(nil);
   AStringList := TStringList.Create;
   AProcess.CommandLine := 'nautilus --version';
   AProcess.Options := AProcess.Options + [poWaitOnExit, poUsePipes];
   AProcess.Execute;
   AStringList.LoadFromStream(AProcess.Output);
   result:=(ansipos('nautilus 3', AStringList[0])>0);
   AStringList.Free;
   AProcess.Free;
end;

procedure tform3.SetCurOwner(fl: string);
var
  AProcess: TProcess;
begin
  AProcess := TProcess.Create(nil);
  AProcess.CommandLine := 'chown '+start.imuser+':'+start.imuser+' '+fl;
  AProcess.Options := AProcess.Options + [poWaitOnExit];
  AProcess.Execute;
  AProcess.Free;
end;

procedure TForm3.UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
begin
  form1.SclForms(updown1.Position);
  label2.Caption:=inttostr(start.sclp)+'% ';
end;


procedure TForm3.CheckBox2Change(Sender: TObject);
var
  pt, p: string;
  fl: textfile;
  prnt: string;
begin
  try
  if not flag then exit;
  p:=MyFolder+imuser;
  if RadioButton1.Checked then prnt:='Печать' else prnt:='Print';
        pt:=p+'/.kde/share/kde4/services/ServiceMenus';
         if DirectoryExists(pt) then
            if checkbox2.Checked then
              begin
                  assignfile(fl, pt+'/'+prnt+'.desktop');
                  rewrite(fl);
                  writeln(fl, '[Desktop Entry]');
                  writeln(fl, 'Actions=vap');
                  writeln(fl, 'Icon=vap');
                  writeln(fl, 'ServiceTypes=KonqPopupMenu/Plugin,all/allfiles');
                  writeln(fl, 'Type=Service');
                  writeln(fl, 'X-KDE-Priority=TopLevel');
                  writeln(fl, ' ');
                  writeln(fl, '[Desktop Action vap]');
                  writeln(fl, 'Exec=vap %F');
                  writeln(fl, 'Icon=vap');
                  writeln(fl, 'MimeType=image');
                  writeln(fl, 'Name=' + prnt);
                  closefile(fl);
                  if GetEnvironmentVariable('LOGNAME') = 'root' then SetCurOwner(pt+'/'+prnt+'.desktop');
              end else
              begin
                  if FileExists(pt+'/Печать.desktop') then deletefile(pt+'/Печать.desktop');
                  if FileExists(pt+'/Print.desktop') then deletefile(pt+'/Print.desktop');
              end;
              SetInte(checkbox2.Checked);
  Except
      case start.lng of
        0: showmessage('Конфигурационный файл Dolphin потребовал особых прав доступа. Включите root.');
        1: showmessage('The configuration file Dolphin requested special privileges. Turn on the root.');
      end;
  end;
end;

procedure TForm3.CheckBox3Change(Sender: TObject);
var
  pt, p: string;
  fl: textfile;
  prnt: string;
begin
  try
  if not flag then exit;
  p:=MyFolder+imuser;
  if RadioButton1.Checked then prnt:='Печать' else prnt:='Print';
         pt:=p+'/.config/caja/scripts';
         if DirectoryExists(pt) then
            if checkbox3.Checked then
              begin
                 assignfile(fl, pt+'/'+prnt);
                rewrite(fl);
                writeln(fl, '#!/bin/sh');
                writeln(fl, ' ');
                writeln(fl, '/usr/bin/vap $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS');
                closefile(fl);
                fpChmod (pt+'/'+prnt,&777);
                if GetEnvironmentVariable('LOGNAME') = 'root' then SetCurOwner(pt+'/'+prnt);
              end else
              begin
                 if FileExists(pt+'/Печать') then deletefile(pt+'/Печать');
                 if FileExists(pt+'/Print') then deletefile(pt+'/Print');
              end;
              SetInte(checkbox3.Checked);
  Except
      case start.lng of
        0: showmessage('Конфигурационный файл Caja потребовал особых прав доступа. Включите root.');
        1: showmessage('The configuration file Caja requested special privileges. Turn on the root.');
      end;
  end;
end;

procedure TForm3.CheckBox4Change(Sender: TObject);
var
  pt: string;
  fl: textfile;
  AProcess: TProcess;
begin
  try
  if not flag then exit;
  pt:=MyFolder+imuser;
  pt:=pt+'/.local/share/extended-actions';
  if DirectoryExists(pt) then
     if checkbox4.Checked then
        begin
           assignfile(fl, pt+'/vap.desktop');
           rewrite(fl);
           writeln(fl, '[Extended Action Entry]');
           writeln(fl, 'MimeType=image');
           writeln(fl, 'Name=vap');
           writeln(fl, 'Exec=vap %F');
           writeln(fl, 'Icon=vap');
           writeln(fl, 'Comment=Fast printig pictures');
           writeln(fl, 'Comment[ru]=Быстрая печать миниатюр изображений');
           writeln(fl, 'Description=Печать');
           closefile(fl);
           AProcess := TProcess.Create(nil);
           AProcess.CommandLine := 'chmod 666 ' + name;
           AProcess.Options := AProcess.Options + [poWaitOnExit];   // ждать окончания
           AProcess.Execute;
           AProcess.Free;
           if GetEnvironmentVariable('LOGNAME') = 'root' then SetCurOwner(pt+'/vap.desktop');
        end else
           begin
             if FileExists(pt+'/vap.desktop') then deletefile(pt+'/vap.desktop');
           end;
           SetInte(checkbox1.Checked);

  Except
      case start.lng of
        0: showmessage('Конфигурационный файл Marlin потребовал особых прав доступа. Включите root.');
        1: showmessage('The configuration file Marlin requested special privileges. Turn on the root.');
      end;
  end;
end;

procedure TForm3.CheckBox5Change(Sender: TObject);
var
  pt: string;
  fl, fl2: textfile;
  s: string;
  f: boolean;
  AProcess: TProcess;
begin
  try
  if not flag then exit;
  pt:=MyFolder+imuser;
  pt:=pt+'/.gnome-commander';
  f:=false;
  if DirectoryExists(pt) then
     if checkbox5.Checked then
        begin
           assignfile(fl, pt+'/fav-apps');
           append(fl);
           writeln(fl, '%D0%9F%D0%B5%D1%87%D0%B0%D1%82%D1%8C	%2Fusr%2Fbin%2Fvap%20%25F	%2Fusr%2Fshare%2Fpixmaps%2Fvap64.png	3	*.jpg%3B*.png%3B*.ico%3B*.bmp%3B*.jpeg	0	0	0');
           closefile(fl);
        end else
           if getgcinfo then
              begin
                assignfile(fl, pt+'/fav-apps');
                reset(fl);
                assignfile(fl2, pt+'/fav-apps2');
                rewrite(fl2);
                while not(eof(fl)) do
                   begin
                     readln(fl, s);
                     if not(ansipos('%2Fusr%2Fbin%2Fvap%20%25F', s)>0) then writeln(fl2, s);
                   end;
                 closefile(fl);
                 closefile(fl2);
                 deletefile(pt+'/fav-apps');
                 RenameFile(pt+'/fav-apps2', pt+'/fav-apps');
              end;
        SetInte(checkbox1.Checked);
        AProcess := TProcess.Create(nil);
        AProcess.CommandLine := 'chmod 666 ' + pt+'/fav-apps';
        AProcess.Options := AProcess.Options + [poWaitOnExit];   // ждать окончания
        AProcess.Execute;
        AProcess.Free;
        if GetEnvironmentVariable('LOGNAME') = 'root' then SetCurOwner(pt+'/fav-apps');
  Except
      case start.lng of
        0: showmessage('Конфигурационный файл Gnome-Commander потребовал особых прав доступа. Включите root.');
        1: showmessage('The configuration file Gnome-Commander requested special privileges. Turn on the root.');
      end;
  end;
end;

procedure TForm3.CheckBox6Change(Sender: TObject);
begin
       form1.bitbtn1.Visible:=checkbox6.Checked;
       form1.bitbtn2.Visible:=checkbox6.Checked;
       form1.bitbtn3.Visible:=checkbox6.Checked;
       form1.bitbtn4.Visible:=checkbox6.Checked;
       form1.bitbtn5.Visible:=checkbox6.Checked;
       form1.bitbtn6.Visible:=checkbox6.Checked;
       form1.bitbtn7.Visible:=checkbox6.Checked;
       form1.bitbtn8.Visible:=checkbox6.Checked;
       form1.bitbtn9.Visible:=checkbox6.Checked;
       form1.bitbtn10.Visible:=checkbox6.Checked;
       form1.bitbtn11.Visible:=checkbox6.Checked;
       form1.bitbtn12.Visible:=checkbox6.Checked;
       form1.Button4.Visible:=not(checkbox6.Checked);
       form1.Button5.Visible:=not(checkbox6.Checked);
       form1.Button1.Visible:=not(checkbox6.Checked);
       form1.Button2.Visible:=not(checkbox6.Checked);
       form1.Button3.Visible:=not(checkbox6.Checked);
       form1.Button12.Visible:=not(checkbox6.Checked);
       form1.Button13.Visible:=not(checkbox6.Checked);
       form1.Button7.Visible:=not(checkbox6.Checked);
       form1.setbtnpos;
       save;
end;

procedure TForm3.CheckBox7Change(Sender: TObject);
begin
  save;
end;

procedure TForm3.CheckBox8Change(Sender: TObject);
begin
  savecomp;
end;

procedure TForm3.CheckBox9Change(Sender: TObject);
var
  pt, p: string;
  fl: textfile;
  prnt: string;
begin                             // to Nemo
  try
  if not flag then exit;
  p:=MyFolder+imuser;
  if RadioButton1.Checked then prnt:='Печать' else prnt:='Print';
        pt:=p+'/.gnome2/nemo-scripts';
            if checkbox9.Checked then
              begin
                assignfile(fl, pt+'/'+prnt);
                rewrite(fl);
                writeln(fl, '#!/bin/sh');
                writeln(fl, ' ');
                writeln(fl, '/usr/bin/vap $NEMO_SCRIPT_SELECTED_FILE_PATHS');
                closefile(fl);
                fpChmod (pt+'/'+prnt,&777);
                if GetEnvironmentVariable('LOGNAME') = 'root' then SetCurOwner(pt+'/'+prnt);
              end else
              begin
                 if FileExists(pt+'/Печать') then deletefile(pt+'/Печать');
                 if FileExists(pt+'/Print') then deletefile(pt+'/Print');
              end;
              SetInte(checkbox1.Checked);
  Except
      case start.lng of
        0: showmessage('Конфигурационный файл Nemo потребовал особых прав доступа. Включите root.');
        1: showmessage('The configuration file Nemo requested special privileges. Turn on the root.');
      end;
  end;
end;

procedure TForm3.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if not flagsett then exit;
  if checkbox10.Checked then form1.SaveSett('scale', inttostr(start.sclp));
end;


function tform3.GetGCinfo: boolean;
var
  pt: string;
  fl: textfile;
  s: string;
begin
  result:=false;
  pt:=MyFolder+imuser;
  pt:=pt+'/.gnome-commander';
  if DirectoryExists(pt) then
        begin
           assignfile(fl, pt+'/fav-apps');
           reset(fl);
           while not(eof(fl)) do
                 begin
                   readln(fl, s);
                   if ansipos('%2Fusr%2Fbin%2Fvap%20%25F', s)>0 then result:=true;
                 end;
           closefile(fl);
        end;
end;

procedure tform3.lng;
// переключение языка этого окна
begin
   case start.lng of
        0: begin
          form3.Caption:='Настройки';
          Groupbox1.Caption:='Интеграция';
          checkbox6.Caption:='Кнопки с пиктограммами';
          checkbox7.Caption:='Автосохранение при выходе';
          checkbox8.Caption:='Стандартная начальная компоновка';
          button4.Caption:='Включить все доступное';
          button1.Caption:='Включить root';
         end;
        1: begin
           form3.Caption:='Settings';
           Groupbox1.Caption:='Integration';
           checkbox6.Caption:='Buttons with icons';
           checkbox7.Caption:='Auto save on exit';
           checkbox8.Caption:='Standard initial layout';
           button4.Caption:='Enable all available';
           button1.Caption:='Turn on the root';
         end;
   end;
end;


end.

