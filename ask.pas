unit ask;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    StaticText1: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form4: TForm4; 

implementation

{$R *.lfm}

uses opt, start;

{ TForm4 }



procedure TForm4.FormShow(Sender: TObject);
begin
  combobox1.Items:=opt.usr;
  combobox1.Text:=combobox1.Items[0];
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  form4.Close;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
   form4.Close;
end;

procedure TForm4.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   opt.ptuser:='/home/'+combobox1.Text+'/';
   start.MyFolder:=opt.ptuser;
   form3.Label1.Caption:=combobox1.Text+':';
end;



end.

