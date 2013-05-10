unit CaptMod;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Start;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    LEdit1: TLabeledEdit;
    StaticText1: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form2: TForm2;
  pict: tpict;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button3Click(Sender: TObject);
begin
  if fontdialog1.Execute then
    begin
       pict.fnt_Name:=fontdialog1.Font.Name;
       pict.fnt_Size:=fontdialog1.Font.size;
       pict.fnt_Style:=fontdialog1.Font.Style;
       pict.fnt_Color:=colordialog1.Color;
       ledit1.Font.Name:=fontdialog1.Font.Name;
       ledit1.Font.Style:=fontdialog1.Font.Style;
       label2.Caption:=inttostr(fontdialog1.Font.Size);
    end;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  if colordialog1.Execute then
    begin
       fontdialog1.Font.Color:=colordialog1.Color;
       ledit1.Font.Color:=colordialog1.Color;
       pict.fnt_Color:=colordialog1.Color;
    end;
end;

procedure TForm2.CheckBox1Change(Sender: TObject);
begin
  pict.showcomm:=checkbox1.Checked;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  form2.Visible:=false;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  form2.Close;
end;

procedure TForm2.Button2Click(Sender: TObject);   // Ok
begin
   pict.comm:=ledit1.Text;
   start.toprint[start.num]:=pict;
   form1.ShowCapts(form1.CheckBox1.Checked);
   form2.Close;
end;


procedure TForm2.FormShow(Sender: TObject);
begin
   ledit1.Text:=pict.comm;
   fontdialog1.Font.Name:=pict.fnt_Name;
   fontdialog1.Font.Size:=pict.fnt_Size;
   fontdialog1.Font.Style:=pict.fnt_Style;
   fontdialog1.Font.Color:=pict.fnt_Color;
   colordialog1.Color:=pict.fnt_Color;
   ledit1.Font.Name:=pict.fnt_Name;
   ledit1.Font.Style:=pict.fnt_Style;
   ledit1.Font.Color:=pict.fnt_Color;
   label2.Caption:=inttostr(pict.fnt_Size);
   checkbox1.Checked:=pict.showcomm;
  if start.lng=0 then
      begin
         form2.Caption:='Подпись';
         button3.Caption:='Шрифт';
         button4.Caption:='Цвет';
         ledit1.EditLabel.Caption:='Текст подписи';
         checkbox1.Caption:='Показывать эту подпись';
         statictext1.Caption:='Подпись - короткий текст,' +#13+'привязанный к картинке.' +#13+
                                  'Только одна строка.' +#13+'Если нужен большой текст,' +#13+
                                  'воспользуйтесь функцией' +#13+'"Вставить надпись".' +#13+
                                  'Подпись в окне предпросмотра' +#13+'может отличаться от вида на' +#13+
                                  'бумаге - это следствие' +#13+'масштабирования.';
         label1.Caption:='Размер= ';
      end;
   if start.lng=1 then
     begin
        form2.Caption:='Caption';
        button4.Caption:='Color';
        label1.Caption:='Size= ';
        button3.Caption:='Font';
        ledit1.EditLabel.Caption:='Caption:';
        checkbox1.Caption:='Show this caption';
        statictext1.Caption:='Caption - a short text' +#13+'attached to the picture.' +#13+
                                      'Only one line.' +#13+'If you need a large amount of text' +#13+
                                      'please use the' +#13+'"Insert the inscription."' +#13+
                                      'Text in the preview window' +#13+'can differ from species to' +#13+
                                      'paper - it is a consequence' +#13+ 'scaling.';
     end;
end;

end.

