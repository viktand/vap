unit inic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form4: TForm4; 
  flup: integer;
implementation

{$R *.lfm}

{ TForm4 }

procedure TForm4.Timer1Timer(Sender: TObject);
begin
  if ((image1.Left = 0) and (flup = -1)) then flup := 1;
  if ((image1.Left = 205) and (flup = 1)) then flup := -1;
  image1.left:=image1.Left+flup;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  flup:=1;
  timer1.Enabled:=true;
end;

procedure TForm4.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  timer1.enabled:=false;
end;

end.

