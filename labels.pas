unit Labels;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  SynMemo, SynHighlighterAny, SynEdit;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Memo1: TMemo;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure RadioButton3Change(Sender: TObject);
    procedure Leng;
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form4: TForm4;
  lst: integer; // номер листа, куда прикрепить надпись
  name: string; // имя image, вызвавшего редактирование
  index: integer; // индекс надписи, связанной с image


implementation

uses start;
{$R *.lfm}

{ TForm4 }

procedure TForm4.FormCreate(Sender: TObject);
begin
  form4.Visible:=false;
  fontdialog1.Font:=form4.Font;
  tofontvar(form4.Font);
  name:='';
  index:=-1;
end;

procedure TForm4.FormResize(Sender: TObject);
begin
  memo1.Width:=form4.Width-304;
  memo1.Height:=form4.Height-32;
  button1.Left:=form4.Width-114;
  button6.left:=form4.width-114;
  groupbox1.Left:=form4.Width-138;
  button2.left:=form4.width-114;
  button2.top:=form4.Height-47;
end;

procedure TForm4.FormShow(Sender: TObject);
var
  i: integer;
begin
  lst:=start.curlist;
  memo1.Font:=fontdialog1.Font;
  memo1.Font.Color:=colordialog1.Color;
  leng;
  if index <>-1 then // если редактирование
    begin
      memo1.Clear;
      for i:=0 to start.lbs[index].text.Count-1 do
        begin
           memo1.Text:=memo1.Text + start.lbs[index].text.Strings[i];
           if i <> start.lbs[index].text.Count-1 then memo1.Text:=memo1.Text+#13;
        end;
      memo1.Font:=start.lbs[index].font;
      fontdialog1.Font:=memo1.Font;
      radiobutton1.Checked:=true;
      if start.lbs[index].alignment=taCenter then radiobutton2.Checked:=true;
      if start.lbs[index].alignment=taRightJustify then radiobutton3.Checked:=true;
    end;
  label1.Caption:=fontdialog1.Font.Name + ' ' +inttostr(fontdialog1.Font.Size);
end;

procedure tform4.Leng;
begin
  case  start.lng of
     0:begin
         button5.Caption:='Удалить';
         button5.Hint:='Удалить эту надпись';
         button3.Hint:='Передвинуть на предыдущий лист';
         button4.Hint:='Передвинуть на следующий лист';
         button1.Caption:='Шрифт';
         button6.Caption:='Цвет';
         groupbox1.Caption:='Выравнивать';
         RadioButton1.Caption:='Левый край';
         RadioButton2.Caption:='Центр';
         RadioButton3.Caption:='Правый край';
         Memo1.Text:='Текст надписи';
         form4.Caption:='Редактор надписей';
      end;
     1:begin
         button5.Caption:='Delete';
         button5.Hint:='Remove this caption';
         button3.Hint:='Move to the previous sheet';
         button4.Hint:='Move to the next sheet';
         button1.Caption:='Font';
         button6.Caption:='Color';
         groupbox1.Caption:='Align';
         RadioButton1.Caption:='Left';
         RadioButton2.Caption:='Center';
         RadioButton3.Caption:='Right';
         Memo1.Text:='Caption text';
         form4.Caption:='Caption editor';
      end;
  end;
end;

procedure TForm4.RadioButton1Change(Sender: TObject);
begin
  memo1.Alignment:=taLeftJustify;
end;

procedure TForm4.RadioButton2Change(Sender: TObject);
begin
  memo1.Alignment:=taCenter;
end;

procedure TForm4.RadioButton3Change(Sender: TObject);
begin
  memo1.Alignment:=taRightJustify;
end;

procedure TForm4.Button2Click(Sender: TObject);
var
  txt: tstringlist;
  i: integer;
begin
  tofontvar(memo1.Font);
  txt:=tstringlist.Create;
  for i:=0 to memo1.Lines.Count-1 do
    begin
       txt.Add(memo1.Lines[i]);
    end;
  if index=-1 then form1.AddLbs(txt, memo1.Alignment)
   else
     begin
        start.lbs[index].alignment:=memo1.Alignment;
        start.lbs[index].text:=txt;
        start.lbs[index].font:=FromFontVar;
        start.lbs[index].show:=false;
        form1.ShowLabs;
        index:=-1;
     end;
  form4.Close;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  if start.lbs[index].list > 0 then
    begin
      start.lbs[index].list:=start.lbs[index].list-1;
      start.lbspic[start.lbs[index].index].Visible:=false;
      form1.ShowLabs;
      index:=-1;
      form4.Close;
    end;
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  start.lbs[index].list:=start.lbs[index].list+1;
  start.lbspic[start.lbs[index].index].Visible:=false;
  index:=-1;
  form1.ShowLabs;
  form4.Close;
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  form1.DeleteLabs(index);
  index:=-1;
  form4.Close;
end;

procedure TForm4.Button6Click(Sender: TObject);
begin
  if colordialog1.Execute then memo1.Font.Color:=colordialog1.Color;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  if fontdialog1.Execute then
    begin
      memo1.Font:=fontdialog1.Font;
      memo1.Font.Color:=colordialog1.Color;
      label1.Caption:=fontdialog1.Font.Name + ' ' +inttostr(fontdialog1.Font.Size);
    end;
end;

end.
