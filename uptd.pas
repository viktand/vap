unit Uptd;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Httpsend;

type

  { TForm6 }

  TForm6 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form6: TForm6; 

implementation

{$R *.lfm}

{ TForm6 }

procedure TForm6.Button1Click(Sender: TObject);
var
 fs: TFileStream;
 link: string;
 myfile: string;
begin
 // Ссылка для закачки
 link:='http://uploadingit.com/file/0nn5hpy0fcl6qrac/uptd.vap';
 // Путь к файлу на диске
 myfile:='upt.txt';

  // Создаём файловый поток
 fs:=TFileStream.Create(myfile, fmCreate);


 with THTTPSend.Create do
  begin
   if HTTPMethod('GET', link) then
    try
      Document.SaveToStream(fs);
    except
      showmessage('не смогли сохранить поток');
    end
   else showmessage('не смогли получить файл по ссылке');
   Free;
  end;

end;

end.

