unit Opt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls,  BaseUnix;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckGroup1: TCheckGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);  // nautilus
    procedure CheckBox2Change(Sender: TObject);  // dolphin
    procedure CheckBox3Change(Sender: TObject);  // caja
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject); // выбор языка программы
    procedure lng; // перевести на выбранный язык эту форму
    procedure AddUsers(wrd: string); // Добавить строку wrd к массиву строк users
    procedure Setcheck; // установка чекбоксов по текущему состоянию интеграции
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form3: TForm3;
  users: array of string; // список пользователей в системе (в папке home)
  pram: string; // Строка параметров

implementation

{$R *.lfm}

uses start;

{ TForm3 }

procedure TForm3.RadioButton1Change(Sender: TObject);
begin
  if radiobutton1.Checked then start.lng:=0 else start.lng:=1;
  form1.SetLng;
  lng;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  pram:='';
  lng;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  radiobutton2.Checked:=start.lng=1;
  form3.Height:=204;
end;

procedure TForm3.Button1Click(Sender: TObject);
// интеграция в контекстное меню
begin
  if form3.Height <> 372 then
    begin
       setcheck;
       form3.Height:=372
    end  else form3.Height:=204;
  //getusers;
end;

procedure tform3.setcheck;
// установка чекбоксов по текущему состоянию интеграции
var
  pt: string;
  sr: tsearchrec;
  i: integer;
  fl: textfile;
  prnt: string;
begin
  pt := '/home/*';
  if RadioButton1.Checked then prnt:='Печать' else prnt:='Print';
  if findfirst(pt, faDirectory, sr) = 0 then
    repeat
         if pos('.', sr.Name) = 0 then addusers('/home/' + sr.Name + '/');
    until findnext(sr) <> 0;
  findclose(sr);
  for i:=0 to high(users) do
     begin
        pt:=users[i]+'.gnome2/nautilus-scripts';
        if DirectoryExists(pt) then // to gnome
          begin
             checkbox1.Enabled:=true;
             checkbox1.Checked:=false;
             if FileExists(pt+'/Печать') then checkbox1.Checked:=true;
             if FileExists(pt+'/Print') then checkbox1.Checked:=true;
          end else checkbox1.Enabled:=false;
        pt:=users[i]+'.config/caja/scripts';  // to caja
         if DirectoryExists(pt) then
           begin
              checkbox3.Enabled:=true;
              checkbox3.Checked:=false;
              if FileExists(pt+'/Печать') then checkbox3.Checked:=true;
              if FileExists(pt+'/Print') then checkbox3.Checked:=true;
           end else checkbox3.Enabled:=false;
        pt:=users[i]+'.kde/share/kde4/services/ServiceMenus';
        if DirectoryExists(pt) then // to kde
          begin
             checkbox2.Enabled:=true;
             checkbox2.Checked:=false;
             if FileExists(pt+'/Печать.descktop') then checkbox2.Checked:=true;
             if FileExists(pt+'/Print.descktop') then checkbox2.Checked:=true;
          end else checkbox2.Enabled:=false;
     end;
end;

procedure TForm3.Button2Click(Sender: TObject);
// сохранить настройки программы
begin
  //в конфигурационном файле:
  // размер бумаги
  case form1.ComboBox1.ItemIndex of
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
  if start.orn=1 then form1.SaveSett('orn','L') else form1.SaveSett('orn','default');
  // Язык
  if radiobutton2.Checked then form1.SaveSett('lang','i') else form1.SaveSett('lang','default');
  // масштаб
  if (start.ScaleX<>100) or (start.ScaleY<>100) then
     form1.SaveSett('scale', 'x>' + inttostr(start.ScaleX) + 'y>' + inttostr(start.ScaleY))
                             else  form1.SaveSett('scale', 'default');
  // поля
  if start.pol<>10 then form1.SaveSett('mrg', inttostr(start.pol)) else form1.SaveSett('mrg','default');
  // заполнить
  if form1.CheckBox3.Checked then form1.SaveSett('fill', 'yes') else form1.SaveSett('fill', 'default');
  // не увеличивать мелкие
  if not(form1.CheckBox2.Checked) then form1.SaveSett('sml', 'yes') else form1.SaveSett('sml', 'default');

end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  if checkbox1.Enabled then checkbox1.Checked:=true;
  if checkbox2.Enabled then checkbox2.Checked:=true;
  if checkbox3.Enabled then checkbox3.Checked:=true;
end;


procedure TForm3.CheckBox1Change(Sender: TObject);
var
  pt: string;
  sr: tsearchrec;
  i: integer;
  fl: textfile;
  prnt: string;
begin
  pt := '/home/*';
  if RadioButton1.Checked then prnt:='Печать' else prnt:='Print';
  if findfirst(pt, faDirectory, sr) = 0 then
  repeat
    if pos('.', sr.Name) = 0 then addusers('/home/' + sr.Name + '/');
  until findnext(sr) <> 0;
  findclose(sr);
  for i:=0 to high(users) do
     begin
        pt:=users[i]+'.gnome2/nautilus-scripts';
         if DirectoryExists(pt) then
            if checkbox1.Checked then
              begin
                 assignfile(fl, pt+'/'+prnt);
                rewrite(fl);
                writeln(fl, '#!/bin/sh');
                writeln(fl, ' ');
                writeln(fl, ParamStr(0)+' '+ pram +' $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS');
                closefile(fl);
                fpChmod (pt+'/'+prnt,&777);
              end else
              begin
                 if FileExists(pt+'/Печать') then deletefile(pt+'/Печать');
                 if FileExists(pt+'/Print') then deletefile(pt+'/Print');
              end;
     end;
end;

procedure TForm3.CheckBox2Change(Sender: TObject);
var
  pt: string;
  sr: tsearchrec;
  i: integer;
  fl: textfile;
  prnt: string;
begin
  pt := '/home/*';
  if RadioButton1.Checked then prnt:='Печать' else prnt:='Print';
  if findfirst(pt, faDirectory, sr) = 0 then
  repeat
    if pos('.', sr.Name) = 0 then addusers('/home/' + sr.Name + '/');
  until findnext(sr) <> 0;
  findclose(sr);
  for i:=0 to high(users) do
     begin
        pt:=users[i]+'.kde/share/kde4/services/ServiceMenus';
         if DirectoryExists(pt) then
            if checkbox2.Checked then
              begin
                  assignfile(fl, pt+'/'+prnt+'.descktop');
                  rewrite(fl);
                  writeln(fl, '[Desktop Entry]');
                  writeln(fl, 'Actions=add');
                  writeln(fl, 'Icon=preferences-desktop-printer');
                  writeln(fl, 'ServiceTypes=KonqPopupMenu/Plugin,all/allfiles');
                  writeln(fl, 'Type=Service');
                  writeln(fl, 'X-KDE-Priority=TopLevel');
                  writeln(fl, ' ');
                  writeln(fl, '[Desktop Action add]');
                  writeln(fl, 'Exec='+ParamStr(0)+' '+ pram +' %F');
                  writeln(fl, 'Icon=document-print');
                  writeln(fl, 'Name=' + prnt);
                  closefile(fl);                     ;
              end else
              begin
                  if FileExists(pt+'/Печать.descktop') then deletefile(pt+'/Печать.descktop');
                  if FileExists(pt+'/Print.descktop') then deletefile(pt+'/Print.descktop');
              end;
     end;
end;

procedure TForm3.CheckBox3Change(Sender: TObject);
var
  pt: string;
  sr: tsearchrec;
  i: integer;
  fl: textfile;
  prnt: string;
begin
  pt := '/home/*';
  if RadioButton1.Checked then prnt:='Печать' else prnt:='Print';
  if findfirst(pt, faDirectory, sr) = 0 then
  repeat
    if pos('.', sr.Name) = 0 then addusers('/home/' + sr.Name + '/');
  until findnext(sr) <> 0;
  findclose(sr);
  for i:=0 to high(users) do
     begin
        pt:=users[i]+'.config/caja/scripts';
         if DirectoryExists(pt) then
            if checkbox3.Checked then
              begin
                 assignfile(fl, pt+'/'+prnt);
                rewrite(fl);
                writeln(fl, '#!/bin/sh');
                writeln(fl, ' ');
                writeln(fl, ParamStr(0)+' '+ pram +' $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS');
                closefile(fl);
                fpChmod (pt+'/'+prnt,&777);
              end else
              begin
                 if FileExists(pt+'/Печать') then deletefile(pt+'/Печать');
                 if FileExists(pt+'/Print') then deletefile(pt+'/Print');
              end;
     end;
end;





procedure tform3.AddUsers(wrd: string); // Добавить строку wrd к массиву строк users
var
  i: integer;
begin
  i:=Length(users)+1;
  setlength(users, i);
  dec(i);
  users[i]:=wrd;
end;

procedure tform3.lng;
// переключение языка этого окна
begin
   case start.lng of
        0: begin
          form3.Caption:='Настройки';
          button1.Caption:='Интеграция';
          button1.Hint:='Интегрировать программу в контекстное меню Nautilus и Dolphin'+#13+'Обязательно запустите программу с root-правами';
          button2.Caption:='Сохранить настройки';
          button2.Hint:='Сохранить текущие настройки как настройки по умолчанию';
         end;
        1: begin
           form3.Caption:='Settings';
           button1.Caption:='Integration';
           button1.Hint:='Integrate the program into the context menu Nautilus and Dolphin'+#13+'Be sure to run the program with root-rights';
           button2.Caption:='Save Settings';
           button2.Hint:='Save the current settings as the default settings';
         end;
   end;
end;


end.

