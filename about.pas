unit about;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls;

type

  { TForm5 }

  TForm5 = class(TForm)
    Image2: TImage;
    Image3: TImage;
    Memo1: TMemo;
    Memo2: TMemo;
    PageControl1: TPageControl;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form5: TForm5; 

implementation

{$R *.lfm}

{ TForm5 }

procedure TForm5.FormCreate(Sender: TObject);
begin
  form5.Visible:=false;
end;

end.

