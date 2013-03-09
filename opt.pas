unit Opt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls,  BaseUnix,  Process;

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
    Label1: TLabel;
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
    procedure Setcheck; // установка чекбоксов по текущему состоянию интеграции
    procedure DoRoot; // перезапуск прграммы под рутом
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

uses start, ask;

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
  form3.close;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  radiobutton2.Checked:=start.lng=1;
  form3.Height:=204;
  if imuser='' then form4.Show;
end;

procedure TForm3.Button1Click(Sender: TObject);
// интеграция в контекстное меню
begin
  if form3.Height <> 407 then
    begin
       if GetEnvironmentVariable('LOGNAME') = 'root' then
         begin
           flag:=false;
           setcheck;
           flag:=true;
           form3.Height:=407;
           label1.Caption:='for '+start.imuser;
         end else
           begin
             showmessage('Настройка интеграции возможна только'+#13#10+
                    'при запуске программы с правами администратора.'+#13#10+
                    'В Ubuntu и других подобных  системах в терминале:' + #13#10+
                    '"sudo /{путь}/vap"'+#13#10+
                    'Т.к. Вы запустили программу без этих прав, то сейчас '+
                    'будет запущен другой экземпляр, но уже с такими правами. В нем Вы сможете '+
                    'настроить интеграцию. Закрыв root-экземпляр, Вы вернетесь к этому варианту.');
             doroot;
           end;
    end  else form3.Height:=204;
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
begin
  p:=MyFolder+imuser;
  checkbox1.Enabled:=false;  checkbox1.Checked:=false;
  checkbox2.Enabled:=false;  checkbox2.Checked:=false;
  checkbox3.Enabled:=false;  checkbox3.Checked:=false;
        pt:=p+'/.gnome2/nautilus-scripts';
        if DirectoryExists(pt) then // to gnome
          begin
             checkbox1.Enabled:=true;
             if FileExists(pt+'/Печать') then checkbox1.Checked:=true;
             if FileExists(pt+'/Print') then checkbox1.Checked:=true;
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
end;

procedure TForm3.Button2Click(Sender: TObject);
// сохранить настройки программы
begin
  //в конфигурационном файле:
  // размер бумаги
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
  if start.orn=1 then form1.SaveSett('orn','L') else form1.SaveSett('orn','default');
  // Язык
  if radiobutton2.Checked then form1.SaveSett('lang','i') else form1.SaveSett('lang','default');
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
  pt, p: string;
  fl: textfile;
  prnt: string;
begin
  if not flag then exit;
  p:=MyFolder+imuser;
  if RadioButton1.Checked then prnt:='Печать' else prnt:='Print';
        pt:=p+'.gnome2/nautilus-scripts';
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

procedure TForm3.CheckBox2Change(Sender: TObject);
var
  pt, p: string;
  fl: textfile;
  prnt: string;
begin
  if not flag then exit;
  p:=MyFolder+imuser;
  if RadioButton1.Checked then prnt:='Печать' else prnt:='Print';
        pt:=p+'.kde/share/kde4/services/ServiceMenus';
         if DirectoryExists(pt) then
            if checkbox2.Checked then
              begin
                  assignfile(fl, pt+'/'+prnt+'.desktop');
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

procedure TForm3.CheckBox3Change(Sender: TObject);
var
  pt, p: string;
  fl: textfile;
  prnt: string;
begin
  if not flag then exit;
  p:=MyFolder+imuser;
  if RadioButton1.Checked then prnt:='Печать' else prnt:='Print';
         pt:=p+'.config/caja/scripts';
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

