unit start;

{$mode objfpc}{$H+}{$R+}

interface

uses
  Classes, SysUtils, process, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, printers, ComCtrls, Menus, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    ODl1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SaveDialog1: TSaveDialog;
    SDD1: TSelectDirectoryDialog;
    Shape1: TShape;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    TrackBar1: TTrackBar;
    TrackBar3: TTrackBar;
     procedure BitBtn10Click(Sender: TObject);
     procedure BitBtn11Click(Sender: TObject);
     procedure BitBtn12Click(Sender: TObject);
     procedure BitBtn9Click(Sender: TObject);
     procedure Button10Click(Sender: TObject);
     procedure Button11Click(Sender: TObject);
     procedure Button12Click(Sender: TObject);
     procedure Button13Click(Sender: TObject);
     procedure Button14Click(Sender: TObject);
     procedure Button15Click(Sender: TObject);
     procedure Button16Click(Sender: TObject);
     procedure Button17Click(Sender: TObject);
     procedure Button3Click(Sender: TObject);
     procedure Button5Click(Sender: TObject);
     procedure Button6Click(Sender: TObject);
     procedure Button7Click(Sender: TObject);
     procedure Button8Click(Sender: TObject);
     procedure Button9Click(Sender: TObject);
     procedure CheckBox1Change(Sender: TObject);
     procedure CheckBox2Change(Sender: TObject);
     procedure CheckBox3Change(Sender: TObject);
     procedure ComboBox1Change(Sender: TObject);
     procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure Image12Click(Sender: TObject);
     procedure Image1Click(Sender: TObject);
     procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
       Shift: TShiftState; X, Y: Integer);
     procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
       Shift: TShiftState; X, Y: Integer);
     procedure Image2Click(Sender: TObject);
     procedure Image3Click(Sender: TObject);
     procedure Image4Click(Sender: TObject);
     procedure Image5Click(Sender: TObject);
     procedure Image6Click(Sender: TObject);
     procedure Image7Click(Sender: TObject);
     procedure Image9Click(Sender: TObject);
     procedure Image10Click(Sender: TObject);
     procedure LabeledEdit1Change(Sender: TObject);
     procedure MenuItem14Click(Sender: TObject);
     procedure MenuItem15Click(Sender: TObject);
     procedure MenuItem16Click(Sender: TObject);
     procedure MenuItem17Click(Sender: TObject);
     procedure MenuItem1Click(Sender: TObject);
     procedure MenuItem20Click(Sender: TObject);
     procedure MenuItem23Click(Sender: TObject);
     procedure MenuItem25Click(Sender: TObject);
     procedure MenuItem26Click(Sender: TObject);
     procedure MenuItem2Click(Sender: TObject);
     procedure MenuItem3Click(Sender: TObject);
     procedure MenuItem6Click(Sender: TObject);
     procedure MenuItem7Click(Sender: TObject);
     procedure MenuItem8Click(Sender: TObject);
     procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
       Y: Integer);
     procedure Panel3Click(Sender: TObject);
     procedure Panel3MouseDown(Sender: TObject; Button: TMouseButton;
       Shift: TShiftState; X, Y: Integer);
     procedure Panel3MouseUp(Sender: TObject; Button: TMouseButton;
       Shift: TShiftState; X, Y: Integer);
     procedure Panel4Click(Sender: TObject);
     procedure PopupMenu1Popup(Sender: TObject);
     procedure PopupMenu2Popup(Sender: TObject);
     function steplist(i: integer): integer; // шаг листания картинок в зависит от компоновки
     procedure AddPict(p: string); // Загрузить картинку в буфер для компоновки p - путь к файлу
     procedure ShowPict(index: integer); // предпросмотр  начиная с картинки № index
     procedure CreateList; // создать лист в соответствии с вариантом компоновки
     procedure List1; // создать лист  с 1 картинкой  (далее процедуры аналогично по смыслу)
     procedure List2;
     procedure List3;
     procedure List4;
     procedure List6;
     procedure List8;
     procedure List9;
     procedure List15;
     procedure List20;
     procedure ShowPic(index: integer; cou: integer); // показать cou+1картинок начиная с картинки index
     procedure Button2Click(Sender: TObject);
     procedure Button1Click(Sender: TObject); // показать картинку по первому варианту компоновки
     procedure OpenFolder;
     procedure Button4Click(Sender: TObject); // Открыть папку (если вход без параметров)
     procedure SetSize(im: timage); // Подогнать размер image под картинку
     procedure SetPos(im: timage); // уточнить позицию image
     function GetmX: integer;
     function GetmY: integer;
     procedure DrawList2(index: integer); // Нарисовать лист сразу в принтере
     procedure showlistnum; // показать номер текущего листа предпросмотра и сколько всего листов
     procedure EndClick(im: timage); // завершение перехода на новую компоновку (общее для всех)
     procedure EndStep(index: integer); // завершение перелистывания страниц (общее для всех)
     procedure EndList(i: integer);//завершение построения листа предпросмотра (общее для всех)
     procedure RefreshScreen; // обновить изображение (после игр с настройками)
     procedure FillList; // Заполнение листа картинкой
     procedure TrackBar1Change(Sender: TObject);
     procedure TrackBar3MouseUp(Sender: TObject; Button: TMouseButton;
       Shift: TShiftState; X, Y: Integer);
     procedure MoveStart(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer); // процедуры перемещения showp[0]
     procedure MoveNow(Sender: TObject; Shift: TShiftState; X, Y: Integer);
     procedure MoveEnd(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
     procedure MoveStartLab(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer); // процедуры перемещения подписей
     procedure MoveNowLab(Sender: TObject; Shift: TShiftState; X, Y: Integer);
     procedure MoveEndLab(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
     procedure MoveStartLbs(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer); // процедуры перемещения надписей
     procedure MoveNowLbs(Sender: TObject; Shift: TShiftState; X, Y: Integer);
     procedure MoveEndLbs(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
     procedure GetUserSize; // установить произвольные размеры листа
     procedure EndFrms; // завершение изменения формата листа
     function GetPictIndex(sender:  TObject): integer; // получить номер картинки в общем списке по image, в котором ее видно
     procedure LoadFiles; // загрузка файлов из командной строки, т.е. переданных как параметры запуска (выделенных мышкой перед запуском)
     procedure SetPg(p: string); // Установить формат бумаги из командной строки при запуске программы
     procedure SetPg2(p: string); // -//- для пользовательского формата
     procedure SetComp(index: integer); // установка начальной компоновки
     procedure SetLng; // Установка языка
     procedure SetWords; // Заготовки фраз на разных языках
     procedure SaveSett(Key, Word: string); // Сoхранить в файле конфигурации значение word c ключем key
     Procedure ReadSett2; // прочитать существующий файл конфигурации
     Procedure WriteSett2; // записать новые значения в файл конфигурации
     function LoadSett(key: string):string; // получить значение ключа key
     procedure LoadConfig; // загрузить конфигурацию из файла
     function sign(n: integer): integer;
     procedure GetIm; // Узнать пользователя
     procedure GetCurz; // расчитать значение curz и при необходимости поднять картинки
     function EscToUTF8(word: string):string; // преобразование строки из escape последовательности в UTF8
     function HexToInt(ch: char):integer; // преобразование символа из шестнадцатеричного счисления в десятичное
     procedure setbtnpos; // установка координат буквенных кнопок
     procedure ShowCapts(key: boolean); // включить/выключить подписи к картинкам
     procedure AddLbs(txt: string); // Создать новую надпись
     procedure ShowLabs; // показать (обновить) надписи текущего листа
     procedure AddNewLabsPicture(index: integer); // создать новый Pictutre, привязанный к надписи № index
     procedure DeleteLabs(index: integer); // удалить надпись № index
     procedure EnableButtons; // установить доступность кнопок
     procedure LoadCompPicture; // Установить титульную картинку компоновки (при загрузке сеанса)
     procedure ClearSNS; // очистить память от текущего сеанса

     //function Rotor(im: tImage; g: integer): tImage; // вращение pictute
                         // g = 1 - 90, 2 - 180, 3 - 270 градусов по часой стрелке

  private
    { private declarations }
  public
    { public declarations }
  end;

  tpict = record
    pict: string; // путь к файлу
    rot: integer; // 0 - нормально, угол поворота по часовой стрелке
    pct: tPicture;  // картинка
    left: integer; // координата Х
    top: integer;  // координата Y
    heigth: integer; // высота
    width: integer; // ширина
    show: boolean; // флаг того, что картинка уже была расчитана для данной компоновки, ее надо просто показать
    load: boolean; // флаг того, картинка уже загружена в память
    z: integer; // z-порядок
    comm: string; // комментарий (подпись) к картинке
    showcomm: boolean; // показывать подпись или нет
    xl: integer; // Х подписи
    yl: integer; // Y подписи
    fnt_Name: string[31]; // имя фонта подписи
    fnt_Size: integer; // размер фонта подписи
    fnt_Style: tfontstyles; // стиль фонта подписи
    fnt_Color: tColor; // цвет
  end;

  tlabs = record     // Надпись
    text: tStringList; // текст надписи
    top: integer;      // X
    left: integer;     // Y
    list: integer;     // номер листа, к которому привязана надпись
    fnt_Name: string[31]; // имя фонта подписи
    fnt_Size: integer; // размер фонта подписи
    fnt_Style: tfontstyles; // стиль фонта подписи
    fnt_Color: tColor; // цвет
    z: integer;        // z-порядок
    show: boolean;     // признак того, что текущее значение уже отображено
    index: integer;    // индекс pictere, с которым связана надпись
    alignment: tAlignment; //выравнивание
    transp: boolean; // прозрачность фона
    fon_color: tColor; // цвет фона
  end;

  tSvPict = record   //модефикация tpict для записи в файл
     pict: string[255]; // путь к файлу с картинкой
     comm: string[255]; // комментарий (подпись) к картинке
     rot: integer; // 0 - нормально, угол поворота по часовой стрелке
     left: integer; // координата Х
     top: integer;  // координата Y
     heigth: integer; // высота
     width: integer; // ширина
     show: boolean; // флаг того, что картинка уже была расчитана для данной компоновки, ее надо просто показать
     z: integer; // z-порядок
     xl: integer; // Х подписи
     yl: integer; // Y подписи
     fnt_Name: string[31]; // имя фонта подписи
     fnt_Size: integer; // размер фонта подписи
     fnt_Style: tfontstyles; // стиль фонта подписи
     fnt_Color: tColor; // цвет
     alignment: tAlignment; //выравнивание
     showcomm: boolean; // показывать подпись или нет
     image: boolean; // признак того, что это картинка, а не надпись
     transp: boolean; // прозрачность фона
     fon_color: tColor; // цвет фона
   end;


  var
    Form1: TForm1;
    cmbx: integer; // Выбранная в комбобокс1 позиция
    num: integer; // временная переменная для передачи параметров
    pol, tmp_pol: integer; // Ширина полей
    orn: integer; // ориентация 0 - книжная, 1 - альбомная
    frm: integer; // формат листа 0 - А4, 1 - A5
    ver, gor: integer; // текущие размеры листа
    lists, curlist: integer; // всего листов и текущий лист
    frms: array[0..5,0..3] of integer; // массив размеров: первый индекс - формат А4, А6 ... (frm)
                                       // второй индекс 0 - X, 1 - Y - размеры листа в мм 2 - scl
    scl: integer; // Масштаб на экране - чтобы красиво вписать в форму
    cap: array[0..5] of string; // массив заготовок надписей в центре листа предпросмотра
                  //листы разного формата в окно программы A4 - scl = 1;
    s: string;
    toprint: array of tpict; // массив картинок для печати
    buf: integer; // количество загруженных картинок
    comp: integer;// вариант компановки
    tstr: string; // временная строковая переменная
    showp: array[0..19] of timage; // массив картинок предпросмотра
    showl: array[0..19] of tlabel; // массив подписей
    ex: array[0..19] of boolean; // Массив существования картинок
    showindex: integer; // смещение картинок предпросмотра,
                        //т.е. с какой по номеру загруженной картинки
                        //начинать рисовать предпросмотр (чтобы листать страницы)
    getx, gety: integer; // максимальный размер image для текущей компоновки
    FlagMove, flagmove2, flagmove3: boolean; // флаг разрешения передвижения
    ttx, tty: integer; // координаты мышки, где она была нажата для расчета перемещения
    difx, dify: integer; //разница координат рисунка и подписи (для синхронного перемещения)
    imindex: integer; // индекс картинки, на image которой нажали кнопку мышки
    fl: boolean; // просто флаг для промежуточных операций
    lng: integer; // 0 - русский язык, 1 - английский язык
    lngn: array[0..1,0..100] of string; // массив надписей рус/анг
    labs: array[0..9] of string; // массив заготовок подписей под выбранной компоновкой
    userprinter: string; // Выбранный принтер
    config: tstringlist; // копия конфига в памяти - чтобы не читать диск каждый раз
    confflag: boolean;  // признак необходимости прочитать конфиг с диска
    MyFolder: string; // Папка программы
    PrinterIndex: integer; // index выбранного принтера
    repo: string; // рапорт о завершении печати
    sndr: TObject; // ссылка на имадж, на котором нажата и отпущена кнопка мыши
    sndh, sndw: integer; // исходные размеры имадже перед корректировкой
    imuser: string; // current user
    curz: integer; // z порядок для текущей страницы, используется для расчета наложений
    errt: string; // текст ошибки
    xll, yll: integer; // временные переменные хранения координат подписи
    alp: array[1040..1103] of string[3] = ('А','Б','В','Г','Д','Е','Ж','З','И',
         'Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ',
         'Ъ','Ы','Ь','Э','Ю','Я','а','б','в','г','д','е','ж','з','и','й','к',
         'л','м','н','о','п', 'р','с','т','у','ф','х','ц','ч','ш','щ','ъ',
         'ы','ь','э','ю','я');
    flagsett: boolean; // флаг, разрешающий запись в файл конфигурации
    lbspic: array of timage; // массив изображений надписей
    lbscoupic: integer; // количество изображений надписей
    lbs: array of tlabs; // массив надписей
    lbscou: integer; // количество надписей
    sclfont: integer; // масштаб для шрифта при предпросмотре, для А4 = 2
    noshowlabs: boolean; // запрет работы процедуры ShowLabs  true - не исполнять
    sesName: string; // имя открытого сеанса

    fff: integer;


implementation

{$R *.lfm}

uses about, opt, CaptMod, Labels, Uptd;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject); // Начало
var
  i: integer;
begin
  getim; // кто Я?!!!
  flagsett:=false;
  noshowlabs:=false;
  confflag:=false; // файл конфига не прочитан
  config := tstringlist.Create;
  for i:=0 to 19 do ex[i]:=false;
  userprinter:=loadsett('printer');          fff:=0;
  form1.BorderStyle:=bsSingle;
  flagmove:=false;
  showindex := 0;
  sesName:='';
  sclfont:=2;
  lbscou:=0;
  scl := 1;
  pol := 10;
  orn := 0;
  frm := 0;
  ver := 594;
  gor := 420;
  fl:=true;
  lng:=0;
  comp:=1;
  buf := 0;
  setwords;
  setlng;
  // labs[0] и labs[1] присваиваются в процедуре setlng
  labs[2]:='1 x 2';
  labs[3]:='1 x 3';
  labs[4]:='2 x 2';
  labs[5]:='2 x 3';
  labs[6]:='2 x 4';
  labs[7]:='3 x 3';
  labs[8]:='3 x 5';
  labs[9]:='4 x 5';
  label2.Caption := labs[comp-1];
  // поддерживаемые размеры (книжная ориентация) (может быть потом будет смысл вынести во внешний файл)
  frms[0][0]:=210; frms[0][1]:=297; frms[0][2]:=2; // A4
  frms[1][0]:=148; frms[1][1]:=210; frms[1][2]:=3; // A5
  frms[2][0]:=105; frms[2][1]:=148; frms[2][2]:=4; // A6
  frms[3][0]:=100; frms[3][1]:=150; frms[3][2]:=4; // Фото 10х15
  frms[4][0]:=150; frms[4][1]:=200; frms[4][2]:=3; // Фото 15х20
  frms[5][0]:=0; frms[5][1]:=0; frms[5][2]:=0; // Users format
  loadconfig;
  if paramstr(1) <> '' then loadfiles; // загрузка параметров, т.е. выделенных файлов
  for i := 0 to 19 do ex[i] := false;
  setcomp(comp); // установить компоновку
  if orn=1 then panel4click(panel4);
  if lng=1 then setlng;
  setbtnpos;  // расстановка словестных кнопок
end;


procedure tForm1.ClearSNS; // удалить сеанс
var
  i: integer;
begin
  if  buf>0 then
  for i:=0 to steplist(comp)-1 do
    if ex[i] then
      begin
        showp[i].Visible:=false;
        showl[i].Visible:=false;
      end;
   buf:=0;
   setlength(toprint, 0);
   lbscou:=0;
   setlength(lbs, 0);
   for i:=0 to lbscoupic-1 do
       begin
         lbspic[i].Destroy;
       end;
   lbscoupic:=0;
   setlength(lbspic, 0);
end;


procedure tform1.setbtnpos;
begin
  button5.Top:=0;
  button5.left:=0;
  button4.Top:=0;
  button4.left:=105;
  button1.Top:=0;
  button1.left:=210;
  button2.Top:=0;
  button2.left:=260;
  button3.Top:=0;
  button3.left:=310;
  button12.Top:=0;
  button12.left:=415;
  button13.Top:=0;
  button13.left:=520;
  button7.Top:=0;
  button7.left:=625;
end;

procedure tform1.getim;
var
  fl: textfile;
  us, lin, s: string;
  i: integer;
  f: boolean;
begin
  if GetEnvironmentVariable('LOGNAME') <> 'root' then
     begin
       imuser:= GetEnvironmentVariable('LOGNAME');
       bitbtn11.Enabled:=true;
       MenuItem12.Enabled:=true;
     end
    else
    begin
       assignfile(fl, '/etc/passwd');
       reset(fl);
       opt.usr:=tstringlist.Create;
       while not(eof(fl)) do
         begin
           readln(fl, lin);
           i:= pos('/home/',lin);
           if i > 0 then
             begin
                s:='';
                i:=pos(':', lin);
                us:=copy(lin, 1, i-1);
                f:=false;
                for i:=i+1 to length(lin) do
                  begin
                       if (lin[i]=':') and f then break;
                       if f then s:=s+lin[i];
                       if lin[i]=':' then f:=true;
                  end;
                i:=strtoint(s);
                if i>999 then opt.usr.Add(us);
              end;
         end;
         closefile(fl);
         if opt.usr.Count>1 then imuser:='' else imuser:=opt.usr[0];
    end;
   MyFolder:='/home/'+imuser+'/.config/vap';
   if not(DirectoryExists(myfolder)) then createdir(myfolder);
   myfolder:='/home/';
end;



procedure tform1.LoadConfig; // загрузить конфигурацию из файла
var
  s: string;
begin
  flagsett:=false;
  s:=loadsett('paper');
  if s<>'' then setpg('*p'+s);
  s:=loadsett('comp');
  if s<>'' then comp:=strtoint(s);
  s:=loadsett('orn');
  if s<>'' then
     if s='L' then orn:=1 else orn:=0;
  s:=loadsett('lang');
  if s<>'' then lng:=strtoint(s);
  s:=loadsett('mrg');
  if s<>'' then pol:=strtoint(s);
  s:=loadsett('fill');
  CheckBox3.Checked:=(s<>'');
  s:=loadsett('sml');
  CheckBox2.Checked:=(s='');
  s:=loadsett('button_pict');
  form3.CheckBox6.Checked:=(s='');
  s:=loadsett('autosave');
  form3.CheckBox7.Checked:=(s='');
  s:=loadsett('view');
  form3.CheckBox8.Checked:=(s='');
  flagsett:=true;
end;

procedure tForm1.LoadCompPicture;
begin
  label2.Caption:=labs[comp-1];
  case comp of
     1: image8.Picture:=image1.Picture;
     2: image8.Picture:=image2.Picture;
     3: image8.Picture:=image3.Picture;
     4: image8.Picture:=image4.Picture;
     5: image8.Picture:=image5.Picture;
     6: image8.Picture:=image6.Picture;
     7: image8.Picture:=image7.Picture;
     8: image8.Picture:=image9.Picture;
     9: image8.Picture:=image10.Picture;
     10:image8.Picture:=image12.Picture;
  end;
end;

procedure tform1.AddLbs(txt: string); // Создать новую надпись
var
  i, j: integer;
begin
    setlength(lbs, lbscou+1);
    lbs[lbscou].text:=tstringlist.Create;
    j:=1;
    i:=1;
    repeat
       if txt[i]=#1 then
          begin
             lbs[lbscou].text.Add(copy(txt, j, i-j));
             j:=i+1;
          end;
     inc(i);
     until txt[i]=#2 ;
    lbs[lbscou].left:=10;
    lbs[lbscou].top:=10;
    inc(curz);
    lbs[lbscou].z:=curz;
    lbs[lbscou].fnt_Name:=Form4.Memo1.Font.Name;
    lbs[lbscou].fnt_Size:=Form4.Memo1.font.Size;
    lbs[lbscou].fnt_Style:=Form4.Memo1.font.Style;
    lbs[lbscou].fnt_Color:=Form4.Memo1.font.Color;
    lbs[lbscou].transp:=not(form4.CheckBox1.Checked);
    lbs[lbscou].fon_color:=form4.Memo1.Color;
    lbs[lbscou].show:=false;
    lbs[lbscou].index:=-1;
    lbs[lbscou].list:=curlist;
    lbs[lbscou].alignment:=taLeftJustify;
    inc(lbscou);
    showlabs;
end;

procedure tform1.ShowLabs; // показать(обновить) все надписи текущего листа
var
  i, j, k: integer;
  hs: integer; // высота строки
  h: integer; // высота текста
  w: integer; // макс. длина строки
begin
  if noshowlabs then exit;
  for i:=0 to lbscou-1 do
    begin
      if (lbs[i].list=curlist) and not(lbs[i].show) then
        begin
           if lbs[i].index=-1 then AddNewLabsPicture(i);
           // настройки шрифта
           lbspic[lbs[i].index].Canvas.Font.Name :=lbs[i].fnt_Name;
           lbspic[lbs[i].index].Canvas.Font.Style:=lbs[i].fnt_Style;
           lbspic[lbs[i].index].Canvas.Font.Color:=lbs[i].fnt_Color;
           lbspic[lbs[i].index].Canvas.Font.Size :=lbs[i].fnt_Size div sclfont;
           // высота строки
           hs := lbspic[lbs[i].index].Canvas.font.GetTextHeight('|');
           //высота image

           h:= lbs[i].text.Count;
           h:=hs* h;
           lbspic[lbs[i].index].Height:=h;
           // расчет длины image
           w:=0;
           for j:=0 to lbs[i].text.Count-1 do
             begin
               k:=lbspic[lbs[i].index].Picture.Bitmap.Canvas.font.GetTextWidth(lbs[i].text.Strings[j]);
               if w<k then w:=k;
             end;
           lbspic[lbs[i].index].Width:=w;
           // настройка bitmap image

           with lbspic[lbs[i].index].Picture.Bitmap do
             begin
              //Clear;
              Width :=  w;
              Height := h;
              Canvas.Brush.Color := lbs[i].fon_color;
              Canvas.FillRect(0, 0, w, h);
              Transparent:=lbs[i].transp;
              TransparentColor:=lbs[i].fon_color;
             end;
           lbspic[lbs[i].index].Transparent:=lbs[i].transp;
           //lbspic[lbs[i].index].Transparent:=true;
           //нарисовать текст
           for j:=0 to lbs[i].text.Count-1 do
             begin
                k:=0;
                if lbs[i].alignment=taRightJustify then
                  k:=w-lbspic[lbs[i].index].Picture.Bitmap.Canvas.Font.GetTextWidth(lbs[i].text.Strings[j]);
                if lbs[i].alignment=taCenter then
                  k:=(w-lbspic[lbs[i].index].Picture.Bitmap.Canvas.Font.GetTextWidth(lbs[i].text.Strings[j])) div 2;
                lbspic[lbs[i].index].Canvas.TextOut(k, j*hs, lbs[i].text.Strings[j]);
             end;
            lbs[i].show:=true;
         end;
      end;
end;

procedure tform1.AddNewLabsPicture(index: integer);
begin
  setlength(lbspic, lbscoupic+1);
  lbspic[lbscoupic]:=timage.Create(panel1);
  lbspic[lbscoupic].Parent := panel1;
  lbspic[lbscoupic].AutoSize:=true;
  lbspic[lbscoupic].Visible:=true;
   //lbspic[lbscoupic].Enabled:=true;
  lbspic[lbscoupic].Top:=lbs[index].top;
  lbspic[lbscoupic].Left:=lbs[index].left;
  lbspic[lbscoupic].OnMouseDown:=@MoveStartLbs;
  lbspic[lbscoupic].OnMouseMove:=@MoveNowLbs;
  lbspic[lbscoupic].OnMouseUp:=@MoveEndLbs;
  lbspic[lbscoupic].PopupMenu:=popupmenu2;
  //lbspic[lbscoupic].Transparent:=true;
  {with lbspic[lbscoupic].Picture.Bitmap do
    begin
     Canvas.Brush.Color := clWhite;
     Transparent:=true;
     TransparentColor:=clWhite;
    end; }
  //lbspic[lbscoupic].Transparent:=true;
  //lbspic[lbscoupic].Canvas.Font:=tfont.Create;
  //lbspic[lbscoupic].Picture.Bitmap:=tbitmap.Create;
  //lbspic[lbscoupic].Picture.Bitmap.Canvas.Font:=tFont.Create;
  lbs[index].index:=lbscoupic;
  lbspic[lbscoupic].Tag:=index;
  lbspic[lbscoupic].Name:='cp'+inttostr(lbscoupic);
  inc(lbscoupic);
  //label1.Caption:=lbs[index].fnt_Name;
end;

procedure tform1.DeleteLabs(index: integer);  // удалить надпись № index
var
  i: integer;
begin
  if (index>lbscou-1) or (index<0) then exit;
  lbs[index].text.Clear;
  lbs[index].show:=false;
  ShowLabs;
end;

procedure tform1.LoadFiles; // анализ параметров запуска программы
var
  i, j: integer;
  pr, s: string;
begin
   pr:='';
   for i:=1 to ParamCount do
     begin
       if (paramstr(i) = '-root') then  // запуск типа с рут-правами
         begin
           form1.Caption:=form1.Caption+' -root';
         end;
       if (copy(paramstr(i), 1,1) = '/') then
            begin
              addpict(pr);
              pr:='';
            end;
       if (copy(paramstr(i), 1,8) = 'file:///') then
             begin
               s:= copy(paramstr(i), 8, length(paramstr(i)));
               s:=EscToUTF8(s);
               addpict(s);
               continue;
             end;
       pr:=pr+' '+paramstr(i);
     end;
     if pr<>'' then addpict(pr);
 end;

procedure tform1.AddPict(p: string);
// добавить картинку
var
  s: string;
  i: integer;
begin
  p:=trim(p);
  s := uppercase(copy(p, (length(p)-3), 4));
  if (s = '.JPG') or (s = '.BMP') or (s = '.PNG') or (s = '.ICO') or (s = 'JPEG')then
    begin
      inc(buf);
      setlength(toprint, buf);
      toprint[buf-1].pict := p;
      toprint[buf-1].rot := 0;
      toprint[buf-1].pct:=tPicture.Create;
      toprint[buf-1].comm:='';
      s:='';
      for i:=length(p) downto 0 do if p[i] <> '/' then s:=p[i]+s else break;
      toprint[buf-1].showcomm:=checkbox1.Checked;
      toprint[buf-1].comm:=s;
      toprint[buf-1].left:=0;
      toprint[buf-1].top:=0;
      toprint[buf-1].show:=false;
      toprint[buf-1].load:=false;
      toprint[buf-1].z:=0;
      toprint[buf-1].fnt_Name:=panel1.Font.Name;
      toprint[buf-1].fnt_Color:=clBlack;
      toprint[buf-1].fnt_Size:=panel1.Font.Size;
      toprint[buf-1].fnt_Style:=panel1.Font.Style;
      toprint[buf-1].fnt_Size:=12;
      toprint[buf-1].yl:=-100;
      toprint[buf-1].xl:=-100;
    end;
end;

function tform1.EscToUTF8(word: string): string; // преобразование строки из escape последовательности в UTF8
// только для кириллицы !!!
var
  i, h: integer;
 begin
  i:=1;
  s:='';
  repeat
    if (copy(word, i, 4) = '%D0%') or (copy(word, i, 4) = '%D1%') then
       begin
         h:=1024 + HexToInt(word[i+2]) * 64 + 16 * (HexToInt(word[i+4])-8) + HexToInt(word[i+5]);
         if h=1025 then result:=result+'Ё';
         if h=1105 then result:=result+'ё';
         if (h>1039) and (h<1104) then result:=result + alp[h];
         i:=i+5;
       end else result:=result+word[i];
    inc(i);
  until i>length(word);
end;

function tform1.HexToInt(ch: char): integer;
var
  i: integer;
begin
  i:=ord(ch);
  if i>64 then result:=i-55 else result:=i-48;
end;

procedure tform1.SaveSett(Key, Word: string); // Сохранить в файле конфигурации значение word c ключем key
begin
  if flagsett then
     begin
       errt:='Замена пробелов на # для устранения неоднозначности форматирования';
       word:=StringReplace(word, ' ', '#', [rfReplaceAll, rfIgnoreCase]); // заменить пробeлы на #
       errt:='Попытка прочитать файл конфигурации';
       readsett2;  // прочитать существующий файл
       errt:='Поменять (добавить) значение ключа';
       config.Values[key]:=word;  // Поменять (добавить) значение ключа
       errt:='Сохранить новые значения в файле конфигурации';
       writesett2; // записать новые значения в файл конфигурации
     end;
end;


function tform1.LoadSett(key: string):string; // получить значение ключа key
var
  s: string;
begin
  result:='';
  readsett2; // прочитать существующий файл
  s:=config.Values[key];
  result  := StringReplace(s, '#', ' ', [rfReplaceAll, rfIgnoreCase]);   // заменить # на ' '
  if result = 'default' then result:='';
end;


procedure tform1.readsett2; // прочитать существующий файл конфигурации
var
  fl: textfile;
  lin: string;
  txt: string;
begin
  txt:='';
  if confflag then
       begin
         errt:='Файл конфигурации уже прочитан';
         exit;
       end;
  if fileexists(myfolder + imuser+'/.config/vap/vapsett') then
     begin
       errt:='Попытка подключения к файлу конфигурации';
       assignfile(fl, myfolder + imuser+'/.config/vap/vapsett');
       errt:='Попытка открыть файл конфигурации';
       reset(fl);
       errt:='Чтение файла конфигурации';
       while not(eof(fl)) do
         begin
           readln(fl, lin);
           if pos('=',lin) > 0 then txt:=txt + lin + ', ';
         end;
       errt:='Попытка закрыть файл конфигурации';
       closefile(fl);
       errt:='Отбросить лишние два последних символа из прочитанной информации';
       if txt<>'' then txt:=copy(txt, 1, length(txt)-2);
     end;
  errt:='Попытка сохранить прочитанную информацию в оперативной памяти в удобном формате';
  config.CommaText:=txt;
  confflag:=true;
  errt:='Процедура чтения файла конфигурации успешно завершена';
end;


procedure tform1.WriteSett2; // записать новые значения в файл конфигурации
var
  fl: textfile;
  i: integer;
  AProcess: TProcess;
begin
  errt:='Подключение к файлу конфигурации для сохранения';
  assignfile(fl, myfolder + imuser+'/.config/vap/vapsett');
  errt:='Открытие файла конфигурации для перезаписи';
  rewrite(fl);
  errt:='Запись в файл конфигурации новых значений';
  for i:=0 to config.Count-1 do writeln(fl, config[i]);
  errt:='Попытка закрыть файл конфигурации после сохранения новых значений';
  closefile(fl);
  errt:='Запись успешно завершена! Выход из процедуры.';
  if GetEnvironmentVariable('LOGNAME') = 'root' then //разрешить запись в файл, если было из-под рута
     begin
        AProcess := TProcess.Create(nil);
        AProcess.CommandLine := 'chmod 666 ' + myfolder + imuser+'/.config/vap/vapsett';
        AProcess.Options := AProcess.Options + [poWaitOnExit];   // ждать окончания
        AProcess.Execute;
        AProcess.Free;
     end;
end;

procedure tform1.GetUserSize;
// установить произвольный размер бумаги (открыть панель приема размера)
begin
   panel5.Left:=211;
   panel5.Top:=328;
   panel5.Visible:=true;
   labelededit1.Text:='210';
   labelededit2.Text:='297';
   labelededit3.Text:='2';
 end;

procedure tform1.MoveStart(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
// нажатие на кнопку мыши
var
  i: integer;
begin
  if button=mbLeft then
    begin
      (sender as timage).Cursor:=crsizeall;
      i:=strtoint(copy((sender as timage).Name, 3, 2));
      num:=showindex+i;
      inc(curz);
      toprint[num].z:=curz;
      flagmove:=true;
      ttx:=x;
      tty:=y;
      (sender as timage).BringToFront;
      showl[i].BringToFront;
      if toprint[num].yl= -100 then
                     showl[i].Top:=(sender as timage).top+(sender as timage).Height;
       if toprint[showindex+i].xl= -100 then
                     showl[i].Left:=(sender as timage).left+((sender as timage).Width-showl[i].Width) div 2;
      difx:=showl[i].Left - (sender as timage).Left;
      dify:=showl[i].top - (sender as timage).top;
    end;
end;

procedure tform1.MoveStartLab(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
// нажатие на кнопку мыши на подписи
begin
  if button=mbLeft then
    begin
      (sender as tlabel).Cursor:=crsizeall;
      tstr:=(sender as tlabel).Name;
      num:=showindex+strtoint(copy((sender as tlabel).Name, 3, 2));
      inc(curz);
      toprint[num].z:=curz;
      flagmove2:=true;
      ttx:=x;
      tty:=y;
      (sender as tlabel).BringToFront;
    end;
end;

procedure tform1.MoveStartLbs(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
// нажатие на кнопку мыши на надписи
begin
  if button=mbLeft then
    begin
      (sender as timage).Cursor:=crsizeall;
      tstr:=(sender as timage).Name;
      flagmove3:=true;
      ttx:=x;
      tty:=y;
      (sender as timage).BringToFront;
      inc(curz);
      lbs[(sender as timage).Tag].z:=curz;
    end;
end;

procedure tform1.MoveEndLbs(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// отпускание кнопки мыши на надписи
begin
  flagmove3:=false;
  (sender as timage).Cursor:=crdefault;
  lbs[(sender as timage).Tag].top:=(sender as timage).Top;
  lbs[(sender as timage).Tag].left:=(sender as timage).Left;
end;

procedure tform1.MoveEnd(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// отпускание кнопки мыши
begin
  flagmove:=false;
  (sender as timage).Cursor:=crdefault;
end;

procedure tform1.MoveEndLab(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// отпускание кнопки мыши на подписи
begin
  flagmove2:=false;
  (sender as tlabel).Cursor:=crdefault;
end;

procedure TForm1.Button6Click(Sender: TObject);
// сохранить измение размера image
begin
  num:=showindex+strtoint(copy((sndr as timage).Name, 3, 2));
  toprint[num].width:=(sndr as timage).Width;
  toprint[num].heigth:=(sndr as timage).Height;
  toprint[num].xl:=showl[(sndr as timage).Tag].Left;
  toprint[num].yl:=showl[(sndr as timage).Tag].top;
  panel7.Visible:=false;
  Shape1.Visible:=false;
  trackbar1.Position:=0;
end;

procedure tform1.MoveNow(Sender: TObject; Shift: TShiftState; X, Y: Integer);
// движение мышкой
var
  i: integer;
begin
  if flagmove2 then
    begin
      (panel1.FindComponent(tstr) as tlabel).Top:=(sender as timage).Top+Y-tty;
      (panel1.FindComponent(tstr) as tlabel).Left:=(sender as timage).Left+X-ttx;
    end;
  if flagmove then
    begin
      i:=strtoint(copy((sender as timage).Name, 3, 2));
      num:=showindex+i;
      (sender as timage).Left:=(sender as timage).Left + (x-ttx);
      (sender as timage).Top:=(sender as timage).Top + (y-tty);
      showl[i].Left:=(sender as timage).Left + difx ;
      showl[i].top:=(sender as timage).top + dify;
      toprint[num].left:=(sender as timage).Left;
      toprint[num].top:=(sender as timage).Top;
      toprint[num].xl:=showl[i].Left;
      toprint[num].yl:=showl[i].top;
    end;
end;

procedure tform1.MoveNowLab(Sender: TObject; Shift: TShiftState; X, Y: Integer);
// движение мышкой на подписи
begin
  if flagmove2 then
    begin
      (sender as tlabel).Left:=(sender as tlabel).Left + (x-ttx);
      (sender as tlabel).Top:=(sender as tlabel).Top + (y-tty);
      num:=showindex+strtoint(copy((sender as tlabel).Name, 3, 2));
      toprint[num].xl:=(sender as tlabel).Left;
      toprint[num].yl:=(sender as tlabel).Top;
    end;
end;

procedure tform1.MoveNowLbs(Sender: TObject; Shift: TShiftState; X, Y: Integer);
// движение мышкой на надписи
begin
  if flagmove3 then
    begin
      (sender as timage).Left:=(sender as timage).Left + (x-ttx);
      (sender as timage).Top:=(sender as timage).Top + (y-tty);
    end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
var
  i: integer;
begin
  sndr:=(sender as tpopupmenu).PopupComponent;
  imindex := GetPictIndex(sndr);
  sndh:=(sndr as timage).height;
  sndw:=(sndr as timage).Width;
  i:=strtoint(copy((sndr as timage).Name, 3, 2));
  xll:=showl[i].Left;
  yll:=showl[i].top;
  Shape1.Height:=sndh;
  Shape1.Width:=sndw;
  Shape1.Top:=(sndr as timage).top;
  Shape1.Left:=(sndr as timage).left;
  Shape1.BringToFront;
end;

procedure TForm1.PopupMenu2Popup(Sender: TObject); // меню надписи
var
  i: integer;
begin
  sndr:=(sender as tpopupmenu).PopupComponent;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
// изменение размера image
var
  k: extended;
begin
  if Shape1.Visible then
    begin
       if sndr = nil then exit;
       k:=sndh/sndw;
       (sndr as timage).Height:=sndh+trackbar1.Position;
       (sndr as timage).Width:=sndw+trunc(trackbar1.Position / k);
       Shape1.Height:=(sndr as timage).Height;
       Shape1.Width:=(sndr as timage).Width;
       showl[(sndr as timage).Tag].Left:= ((sndr as timage).left+(sndr as timage).Width)+difx;
       showl[(sndr as timage).Tag].top:= ((sndr as timage).top+(sndr as timage).Height)+dify;
     end;
end;

function tform1.sign(n: integer): integer;
begin
  if n=0 then result:=0;
  if n>0 then result:=1;
  if n<0 then result:=-1;

end;

procedure tform1.RefreshScreen; // обновить изображение
begin
  if buf=0 then exit;
  for num:=0 to buf-1 do toprint[num].show:=false;
  endstep(0);
end;


procedure tform1.showlistnum;
// показать номер текущего листа предпросмотра и сколько всего листов
var
  i: integer;
begin
  i := steplist(comp);
  lists := buf div i;
  if buf mod i > 0 then inc(lists);
  curlist := (showindex div i) + 1;
  if lists > 0 then
     label5.Caption:=lngn[lng,5] + inttostr(curlist) + lngn[lng,6] + inttostr(lists)
    else
     label5.Caption:= lngn[lng,4];
end;

procedure tform1.SetPos(im: timage);
// уточнить позицию
begin
  im.Left:=im.left+((getx-im.Width) div 2);
  im.Top:=im.top+((gety-im.Height) div 2);
  toprint[num].left:=im.Left;
  toprint[num].top:=im.Top;
end;

procedure tform1.SetSize(im: timage);
// Точная подгонка размера timage под место
var
  a, b, w, h: extended;
  r: integer;
begin
  a := im.Picture.Width;
  b := im.Picture.Height;
  if a * b = 0 then exit;
  w := im.Width;
  h := im.Height;
  r := Trunc(b * w / a);
  if r < im.Height then im.Height := r else im.Width:= Trunc(a * h / b);
  if (im.Height > im.Picture.Height) and checkbox2.Checked then // не увеличивать картинку
    begin
      im.Height:= im.Picture.Height;
      im.Width:= im.Picture.Width;
    end;
  toprint[num].heigth:=im.Height;
  toprint[num].width:=im.Width;
end;

function tform1.GetmX: integer;
// получить макимальный размер Х для текущей компоновки
begin
  result := 0;
  case comp of
    1..4: result := gor - pol * 2;
    5..7: result := (gor - pol * 3) div 2;
    8,9: result := (gor - pol * 4) div 3;
    10: result := (gor - pol * 5) div 4;
  end;
end;

function tform1.GetmY: integer;
// получить макимальный размер Y для текущей компоновки
begin
  result := 0;
  case comp of
    1: result := ver - pol * 2;
    2,3,5: result := (ver - pol * 3) div 2;
    4,6,8: result := (ver - pol * 4) div 3;
    7: result := (ver - pol * 5) div 4;
    9, 10: result := (ver - pol * 6) div 5;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
// открыть файл
begin
 case lng of
      0: odl1.Title:='Открыть файл';
      1: odl1.Title:='Open file';
 end;
  if odl1.Execute then
    begin
      AddPict(odl1.FileName);
      ShowPict(showindex);
      showlistnum;
      EnableButtons;
    end;
end;


procedure TForm1.Button7Click(Sender: TObject);
// О программе
begin
     form5.Show;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  inc(pol);
  label12.Caption:='['+FloatToStr(pol/2)+']';
  RefreshScreen;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  dec(pol);
  label12.Caption:='['+FloatToStr(pol/2)+']';
  RefreshScreen;
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
var
  i: integer;
begin
  if buf>0 then
    begin
     showcapts(checkbox1.Checked);
    end;
end;

procedure tform1.ShowCapts(key: boolean);
// вкл/выкл подписи
var
  i: integer;
begin
  for i:=0 to  steplist(comp)-1 do
    begin
      if showindex+i>buf-1 then exit;
      showl[i].Parent := panel1;
      showl[i].Visible:=(toprint[showindex+i].showcomm or key);
      showl[i].Enabled:=(toprint[showindex+i].showcomm or key);
      showl[i].Caption:=toprint[showindex+i].comm;
      if toprint[showindex+i].yl= -100 then
                    showl[i].Top:=showp[i].top+showp[i].Height else
                    showl[i].Top:=toprint[showindex+i].yl;
      if toprint[showindex+i].xl= -100 then
                    showl[i].Left:=showp[i].left+(showp[i].Width-showl[i].Width) div 2 else
                    showl[i].left:=toprint[showindex+i].xl;
      showl[i].OnMouseDown:=@MoveStartLab;
      showl[i].OnMouseMove:=@MoveNowLab;
      showl[i].OnMouseUp:=@MoveEndLab;
      showl[i].Caption:=toprint[showindex+i].comm;
      showl[i].Font.Name:=toprint[showindex+i].fnt_Name;
      showl[i].Font.Color:=toprint[showindex+i].fnt_Color;
      showl[i].Font.Size:=toprint[showindex+i].fnt_Size div sclfont;
      showl[i].Font.Style:=toprint[showindex+i].fnt_Style;
    end;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
    RefreshScreen;
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
   button8.Enabled:=not checkbox3.Checked;
   button9.Enabled:=not checkbox3.Checked;
   trackbar3.Enabled:=not checkbox3.Checked;
   if checkbox3.Checked then begin tmp_pol:=pol; pol:=0; end
      else pol:=tmp_pol;
   if (comp=1) and checkbox3.Checked then FillList;
   label12.Caption:=FloatToStr(pol/2);
   RefreshScreen;
 end;

procedure tform1.FillList;
// Расчитать значение отрицательных полей для полного заполнения листа
// в первой компоновке
var
  e: extended;
  x, y: integer;
begin
     x:=showp[0].Width; y:=showp[0].Height;
     e :=  showp[0].Width / showp[0].Height;
     showp[0].Height:=ver;
     showp[0].Width:=trunc(showp[0].Height * e);
     pol := (gor - showp[0].Width) div 2;
     if pol>0 then
       begin
          showp[0].Width:=x; showp[0].Height:=y;
          e :=  showp[0].Height / showp[0].Width ;
          showp[0].Width:=gor;
          showp[0].Height:=trunc(showp[0].Width * e);
          pol := (ver - showp[0].height) div 2;
       end;
 end;


procedure TForm1.TrackBar3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
// быстрое изменение размера полей
begin
    pol:=trackbar3.Position * 2;
    label12.Caption:='['+FloatToStr(pol/2)+']';
    RefreshScreen;
end;


procedure TForm1.ComboBox1Change(Sender: TObject);
// Выбор нового формата листа
begin
   cmbx:= combobox1.ItemIndex;
   if frm <> 5 then num := frm;
   frm := combobox1.ItemIndex;
   if frm = -1 then frm := 0;
   if frm = 5 then
     begin
       getusersize;
       exit;
     end;
   endfrms;
end;


procedure tform1.endfrms;
begin
   scl:=frms[frm][2];
   gor:=frms[frm][0] * scl;
   panel1.Caption:=Cap[frm];
   if orn = 0 then begin gor:=frms[frm][0] * scl; ver:=scl*frms[frm][1]; end
              else begin gor:=frms[frm][1] * scl; ver:=scl*frms[frm][0]; end;
   panel1.Width:=gor;
   panel1.Height:=ver;
   panel1.top:=(594 - ver) div 2 + 80;
   form1.Width := 773 + (gor - 420);
   if form1.Width<700 then form1.Width:=700;
   label5.Width:=gor;
   label5.Top:= panel1.Top - 24;
end;

function tobool(i: integer): boolean;
begin
 result:=(i<>0);
end;

procedure LoadSNS(name: string);
// Загрузить сохраненную сессию
var
  fl: file of tSvPict;
  wr: tSvPict;
  i, j, l: integer;
  s: String;
  txt: tstringlist;
  shcom: boolean;
begin
 lbscou:=0;
 noshowlabs:=true;
 txt:=tstringlist.Create;
 assignfile(fl, name);
 reset(fl);
 read(fl, wr);
 i:=pos(':', wr.pict);
 cmbx:=strtoint(copy(wr.pict, 1, i-1));
 wr.pict:=copy(wr.pict, i+1, length(wr.pict));
 i:=pos(':', wr.pict);
 pol:=strtoint(copy(wr.pict, 1, i-1));
 wr.pict:=copy(wr.pict, i+1, length(wr.pict));
 i:=pos(':', wr.pict);
 tmp_pol:=strtoint(copy(wr.pict, 1, i-1));
 wr.pict:=copy(wr.pict, i+1, length(wr.pict));
 i:=pos(':', wr.pict);
 orn:=strtoint(copy(wr.pict, 1, i-1));
 wr.pict:=copy(wr.pict, i+1, length(wr.pict));
 i:=pos(':', wr.pict);
 frm:=strtoint(copy(wr.pict, 1, i-1));
 wr.pict:=copy(wr.pict, i+1, length(wr.pict));
 i:=pos(':', wr.pict);
 ver:=strtoint(copy(wr.pict, 1, i-1));
 wr.pict:=copy(wr.pict, i+1, length(wr.pict));
 i:=pos(':', wr.pict);
 gor:=strtoint(copy(wr.pict, 1, i-1));
 wr.pict:=copy(wr.pict, i+1, length(wr.pict));
 i:=pos(':', wr.pict);
 lists:=strtoint(copy(wr.pict, 1, i-1));
 wr.pict:=copy(wr.pict, i+1, length(wr.pict));
 i:=pos(':', wr.pict);
 curlist:=strtoint(copy(wr.pict, 1, i-1));
 wr.pict:=copy(wr.pict, i+1, length(wr.pict));
 i:=pos(':', wr.pict);
 scl:=strtoint(copy(wr.pict, 1, i-1));
 wr.pict:=copy(wr.pict, i+1, length(wr.pict));
 i:=pos(':', wr.pict);
 buf:=strtoint(copy(wr.pict, 1, i-1));
 wr.pict:=copy(wr.pict, i+1, length(wr.pict));
 i:=pos(':', wr.pict);
 showindex:=strtoint(copy(wr.pict, 1, i-1));
 wr.pict:=copy(wr.pict, i+1, length(wr.pict));
 i:=pos(':', wr.pict);
 getx:=strtoint(copy(wr.pict, 1, i-1));
 wr.pict:=copy(wr.pict, i+1, length(wr.pict));
 i:=pos(':', wr.pict);
 gety:=strtoint(copy(wr.pict, 1, i-1));
 setlength(toprint, buf);
 comp:=wr.rot;
 i:=0;
 shcom:=wr.showcomm;
 form1.checkbox2.Checked:=tobool(wr.yl);
 form1.CheckBox3.Checked:=tobool(wr.z);
 l:=wr.xl;
 while not(eof(fl)) do
     begin
       if l=wr.xl then read(fl, wr);
       l:=wr.xl;
       if wr.image then   // это картинка
         begin
           toprint[i].pict:=trim(wr.pict);
           toprint[i].heigth:=wr.heigth;
           toprint[i].left:=wr.left;
           toprint[i].top:=wr.top;
           toprint[i].width:=wr.width;
           toprint[i].rot:=wr.rot;
           toprint[i].load:=false;
           toprint[i].show:=wr.show;
           toprint[i].z:=wr.z;
           toprint[i].pct:=tpicture.Create;
           toprint[i].comm:=wr.comm;
           toprint[i].yl:=wr.yl;
           toprint[i].xl:=wr.xl;
           toprint[i].showcomm:=wr.showcomm;
           toprint[i].fnt_Color:=wr.fnt_Color;
           toprint[i].fnt_Name:=wr.fnt_Name;
           toprint[i].fnt_Style:=wr.fnt_Style;
           toprint[i].fnt_Size:=wr.fnt_Size;
         end else begin   // это надпись
           // l не изменится для длинных записей до конца - так можно определить длину
           txt.Text:='1';
           s:='';
           if wr.showcomm then  s:=s+wr.comm+wr.pict else
             begin // многоэтажная запись
               s:=s+wr.comm+wr.pict;
               repeat
                     read(fl, wr);
                     s:=s+wr.comm+wr.pict;
               until (wr.xl<>l) or eof(fl);
             end;
           form1.AddLbs(s);
           txt.Text:='';
           lbs[lbscou-1].list:=wr.rot;
           lbs[lbscou-1].top:=wr.top;
           lbs[lbscou-1].left:=wr.left;
           lbs[lbscou-1].z:=wr.z;
           lbs[lbscou-1].transp:=wr.transp;
           lbs[lbscou-1].fon_color:=wr.fon_color;
           lbs[lbscou-1].fnt_Name:=wr.fnt_Name;
           lbs[lbscou-1].fnt_Size:=wr.fnt_Size;
           lbs[lbscou-1].fnt_Style:=wr.fnt_Style;
           lbs[lbscou-1].fnt_Color:=wr.fnt_Color;
           lbs[lbscou-1].alignment:=wr.alignment;
           lbs[lbscou-1].show:=false;
         end;
       inc(i);
     end;
  closefile(fl);
  noshowlabs:=false;
  form1.combobox1.ItemIndex:=cmbx;
  form1.combobox1.Text:=form1.combobox1.Items[cmbx];
  form1.ComboBox1Change(form1.ComboBox1);
  form1.endstep(0);
  form1.ShowLabs;
  form1.GetCurz;
  form1.checkbox1.Checked:=shcom;
  form1.LoadCompPicture;
end;

procedure TForm1.BitBtn10Click(Sender: TObject);
// открыть сессию
begin
 if sesName='' then odl1.FileName:='new.sns' else odl1.FileName:=sesName;
 case lng of
      0: odl1.Title:='Открыть сессию';
      1: odl1.Title:='Open session';
 end;
  if ODl1.Execute then
    begin
     ClearSNS;
     LoadSNS(ODl1.FileName);
     savedialog1.FileName:=ODl1.FileName;
    end;
end;


procedure TForm1.BitBtn11Click(Sender: TObject);
begin
  if imuser<> '' then LoadSNS('/home/'+imuser+'/.config/vap/auto.sns');
end;

procedure TForm1.BitBtn12Click(Sender: TObject);
begin
  form4.show;
end;

procedure SaveSNS(name: string);
// записать сессию на диск
var
  fl: file of tSvPict;
  wr: tSvPict;
  s: string;
  i, j: integer;
  AProcess: TProcess;
begin
 if buf=0 then exit;
 assignfile(fl, name);
 rewrite(fl);
 wr.image:=true;
 wr.rot:=comp;
 wr.pict:=inttostr(cmbx)+':';
 wr.pict:=wr.pict + inttostr(pol)+':'+inttostr(tmp_pol)+':'+inttostr(orn)+':';
 wr.pict:=wr.pict + inttostr(frm)+':'+inttostr(ver)+':'+inttostr(gor)+':';
 wr.pict:=wr.pict + inttostr(lists)+':'+inttostr(curlist)+':'+inttostr(scl)+':';
 wr.pict:=wr.pict + inttostr(buf)+':'+inttostr(showindex)+':'+inttostr(getx)+':';
 wr.pict:=wr.pict + inttostr(gety)+':';
 wr.showcomm:=form1.checkbox1.Checked;
 if form1.CheckBox3.Checked then wr.z:=1 else wr.z:=0;
 if form1.CheckBox2.Checked then wr.yl:=1 else wr.yl:=0;
 write(fl, wr);
 for i := 0 to buf-1 do
     begin
       wr.show:=toprint[i].show;
       wr.pict:=toprint[i].pict;
       wr.heigth:=toprint[i].heigth;
       wr.left:=toprint[i].left;
       wr.top:=toprint[i].top;
       wr.width:=toprint[i].width;
       wr.rot:=toprint[i].rot;
       wr.z:=toprint[i].z;
       wr.comm:=toprint[i].comm;
       wr.xl:=toprint[i].xl;
       wr.yl:=toprint[i].yl;
       wr.showcomm:=toprint[i].showcomm;
       wr.fnt_Name:=toprint[i].fnt_Name;
       wr.fnt_Size:=toprint[i].fnt_Size;
       wr.fnt_Style:=toprint[i].fnt_Style;
       wr.fnt_Color:=toprint[i].fnt_Color;
       write(fl, wr);
     end;
 // надписи
 wr.image:=false;
 for i:=0 to lbscou-1 do
     begin
       // собрать текст
       s:='';
       for j:=0 to lbs[i].text.Count-1 do s:=s+lbs[i].text.Strings[j]+#1;
       s:=s+#2;
       //сохранить параметры
       wr.xl:=i;   // <- идентификатор надписи, т.е. ее номер
       wr.left:=lbs[i].left;
       wr.top:=lbs[i].top;
       wr.rot:=lbs[i].list;
       wr.show:=lbs[i].show;
       wr.z:=lbs[i].z;
       wr.transp:=lbs[i].transp;
       wr.fon_color:=lbs[i].fon_color;
       wr.fnt_Name:=lbs[i].fnt_Name;
       wr.fnt_Size:=lbs[i].fnt_Size;
       wr.fnt_Style:=lbs[i].fnt_Style;
       wr.fnt_Color:=lbs[i].fnt_Color;
       wr.alignment:=lbs[i].alignment;
       wr.showcomm:=(length(s)<511); // Надпись не будет продолжаться в следующей записи
       wr.yl:=length(s);
       case length(s) of
            0..255: begin
               wr.comm:=s;
               wr.pict:='';
               write(fl, wr);
            end;
            256..512: begin
              wr.comm:=copy(s, 1, 255);
              wr.pict:=copy(s, 256, 255);
              write(fl, wr);
            end;
            else begin
              j:=1;
              while j<length(s) do
                begin
                  wr.comm:=copy(s, j, 255);
                  wr.pict:=copy(s, j+255, 255);
                  write(fl, wr);
                  j:=j+510;
                end;
            end;
       end;
     end;
  closefile(fl);
  if imuser = '' then
    begin
      AProcess := TProcess.Create(nil);
      AProcess.CommandLine := 'chmod 666 ' + name;
      AProcess.Options := AProcess.Options + [poWaitOnExit];   // ждать окончания
      AProcess.Execute;
      AProcess.Free;
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
// завершение работы
var
  i: integer;
begin
 //автосохранение при закрытии
 if form3.CheckBox7.Checked and (imuser<>'') then SaveSNS('/home/'+imuser+'/.config/vap/auto.sns');
 // зачистка памяти


 for i:=0 to 19 do if ex[i]  then begin showp[i].Destroy;  showl[i].Destroy; end;
 for i:=0 to high(toprint) do toprint[i].pct.Destroy; //Destroy;
 for i:=0 to lbscoupic-1 do
   begin
     lbspic[i].Destroy;
   end;
// freeandnil(lbs);
// for i:=0 to high(lbs) do lbs[i].text.free;


end;



procedure TForm1.BitBtn9Click(Sender: TObject);
//Сохранить сеанс   (file select)
begin
 if sesName='' then savedialog1.FileName:='new.sns' else savedialog1.FileName:=sesName;
 case lng of
      0: savedialog1.Title:='Сохранить сессию';
      1: savedialog1.Title:='Save session';
 end;
 if not(savedialog1.Execute) then exit;
 sesName:=savedialog1.FileName;
 savesns(savedialog1.FileName);
end;


procedure TForm1.Button10Click(Sender: TObject);
begin
  frms[5][0]:=strtoint(labelededit1.Text);
  frms[5][1]:=strtoint(labelededit2.Text);
  frms[5][2]:=strtoint(labelededit3.Text);
  endfrms;
  panel5.Visible:=false;
  combobox1.ItemIndex:=-1;
end;


procedure TForm1.Button11Click(Sender: TObject);
begin
  panel5.Visible:=false;
  frm:=num;
  combobox1.ItemIndex:=num;
  endfrms;
end;

procedure TForm1.Button12Click(Sender: TObject);
// открыть окно настроек
begin
  form3.show;
end;

procedure TForm1.Button13Click(Sender: TObject);
// Выбор принтера для печати
var
  Prin: TPrinter;
  pr: tStrings;
  i: integer;
begin
  if imuser='' then
    begin;
      showmessage('Откройте окно настроек и укажите пользователя');
      exit;
    end;
  panel6.Left:=419;
  panel6.top:=48;
  prin := Printer;
  pr:=prin.Printers;
  if pr.Count=0 then
    begin
      showmessage('Принтер не найден');
      exit;
    end;
  combobox2.Items:=pr;
  combobox2.Text:=combobox2.Items[0];
  if userprinter <> '' then
    begin
       for i:=0 to combobox2.Items.Count-1 do
           if  combobox2.Items[i] = userprinter then
             begin
                combobox2.Text:=userprinter;
                combobox2.ItemIndex:=i;
                radiobutton1.Checked:=true;
                break;
             end;
    end;
  Panel6.Visible:=true;
  SetLng;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
 errt:='Начало процедуры сохранения выбора принтера';
 try
  userprinter:=combobox2.Text;
  if radiobutton2.Checked then
    begin
     userprinter:='';
     errt:='Cохранить выбор как принтер по умолчанию';
     savesett('printer', 'default');
    end;
  if radiobutton1.Checked then
    begin
     errt:='Сохранить выбор принтера';
     savesett('printer', userprinter);
    end;
  errt:='Убрать окно выбора принтера';
  panel6.Visible:=false;
  errt:='Обновить надписи';
  SetLng;
 except
    ShowMessage('Ошибка в операции: ' + errt);
 end;
end;

procedure TForm1.Button15Click(Sender: TObject);
// просто закрыть диалог выбора принтера
begin
  panel6.Visible:=false;
end;

procedure TForm1.Button16Click(Sender: TObject);
// закрыть регулятор размера image  без изменений
begin
  panel7.Visible:=false;
  (sndr as timage).Height:=sndh;
  (sndr as timage).Width:=sndw;
  showl[(sndr as timage).Tag].Left:=xll;
  showl[(sndr as timage).Tag].top:=yll;
  Shape1.Visible:=false;
  trackbar1.Position:=0;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  form6.Show;
end;




procedure TForm1.Button3Click(Sender: TObject);
// печать
var
  x: integer;
  sh: integer;
begin
  sh:= showindex;
  showindex := 0;
  CreateList;
  showpict(showindex);
  if userprinter<>'' then
    begin
      combobox2.Items:=printer.Printers;
      for x:=0 to combobox2.Items.Count-1 do
        if combobox2.Items[x]=userprinter then
          begin
               PrinterIndex:=x;
          end;
    end
    else PrinterIndex:=0;
  // выбрать принтер заданный пользователем
  printer.PrinterIndex:=PrinterIndex;
  if orn = 0 then printer.Orientation:=poPortrait else printer.Orientation:=poLandscape;
  repeat // перебор листов для их прорисовки
    case comp of
       1,2: drawlist2(0);
       3: drawlist2(1);
       4: drawlist2(2);
       5: drawlist2(3);
       6: drawlist2(5);
       7: drawlist2(7);
       8: drawlist2(8);
       9: drawlist2(14);
       10: drawlist2(19);
     end;
     showindex:=showindex+steplist(comp);
  until (showindex>buf-1);
  showmessage(repo);
  showindex:=sh;
end;

procedure tform1.drawlist2(index: integer);
// подготовка и  печать страницы, т.е.  ee рисование
var
   i, x, x1, y, y1, dphor, dpver: integer;
   z, j, k, st, w: integer;
   mrv, mrh, sm1, sm0: integer;
   kh, kv: extended;
   ImageRect: TRect;
   clist: integer; // № печатаемого листа
begin
   clist:=1+(showindex div comp);
   printer.BeginDoc;
   printer.Canvas.Clear;
   printer.Title:='pictures';
   //реальный размер заданной области печати
   if orn=0 then
    begin
      dphor:=trunc(printer.XDPI * (frms[frm][0] / 25.4)); // точек по горизонтали
      dpver:=trunc(printer.YDPI * (frms[frm][1] / 25.4)); // точек по вертикали
      sm0:=trunc((printer.PaperSize.Width-dphor)/2); // расчет сдвига к центру
      sm1:=0;
    end else begin
      dphor:=trunc(printer.XDPI * (frms[frm][1] / 25.4)); // точек по горизонтали
      dpver:=trunc(printer.YDPI * (frms[frm][0] / 25.4)); // точек по вертикали
      sm1:=trunc((printer.PaperSize.Height-dpver)/2); // расчет сдвига к центру
      sm0:=0;
    end;
   mrv:= printer.PaperSize.Height - printer.PageHeight; // непечатные поля слева
   mrh:= printer.PaperSize.Width - printer.PageWidth; // непечатные поля сверху
   kh := (dphor-mrh) / panel1.Width; // масштаб между предпросмотром и листом
   kv := (dpver-mrv) / panel1.Height; // масштаб между предпросмотром и листом

   // сортировка миниатюр по z-порядку и их прорисовка в принтере
   //"глубина" картинки, т.е. максимальный z
   z:=0;
   if showindex+index > buf-1 then st:=buf-1 else st:=showindex+index;
   for i:=showindex to st do if toprint[i].z > z then z:=toprint[i].z;
   for i:=0 to lbscou-1 do if (lbs[i].z>z) and (lbs[i].list=clist) then z:=lbs[i].z;
   // рисование
   for j:=0 to z do
     begin
     for i:=showindex to st do
       begin
            if toprint[i].z = j then
               begin
                  x :=  sm0+trunc(kh * toprint[i].Left);
                  y :=  sm1+trunc(kv * toprint[i].Top);
                  x1 := x + trunc(kh * toprint[i].Width);
                  y1 := y + trunc(kv * toprint[i].heigth);
                  ImageRect:=Rect(x, y, x1, y1);
                  printer.Canvas.StretchDraw(ImageRect, toprint[i].pct.Bitmap); // картинка
                  if toprint[i].showcomm or checkbox1.Checked then   // подписи
                     begin
                       printer.Canvas.Font.Name:=toprint[i].fnt_Name;
                       printer.Canvas.Font.Size:=toprint[i].fnt_Size;
                       printer.Canvas.Font.Style:=toprint[i].fnt_Style;
                       printer.Canvas.Font.Color:=toprint[i].fnt_Color;
                       x :=  sm0+trunc(kh * toprint[i].xl);
                       y :=  sm1+trunc(kv * toprint[i].yl);
                       printer.Canvas.TextOut(x, y, toprint[i].comm);
                     end;
                end;
       end;
     for i:=0 to lbscou-1 do // надписи
          if (lbs[i].list=clist) and (lbs[i].z=j) then
             begin
              printer.Canvas.Font.Name:=lbs[i].fnt_Name;
              printer.Canvas.Font.Size:=lbs[i].fnt_Size;
              printer.Canvas.Font.Style:=lbs[i].fnt_Style;
              printer.Canvas.Font.Color:=lbs[i].fnt_Color;
              x :=  sm0+trunc(kh * lbs[i].left);
              y :=  sm1+trunc(kv * lbs[i].top);
              y1 := printer.Canvas.Font.GetTextHeight('|');
              w:=0;
              for k:=0 to lbs[i].text.Count-1 do
                if w < printer.Canvas.Font.GetTextWidth(lbs[i].text.Strings[k]) then
                     w := printer.Canvas.Font.GetTextWidth(lbs[i].text.Strings[k]);
              for k:=0 to lbs[i].text.Count-1 do
                begin
                  x1:=0;
                  if lbs[i].alignment=taRightJustify then x1:=w-printer.Canvas.Font.GetTextWidth(lbs[i].text.Strings[k]);
                  if lbs[i].alignment=taCenter then x1:=(w-printer.Canvas.Font.GetTextWidth(lbs[i].text.Strings[k])) div 2;
                  printer.Canvas.TextOut(x+x1, y+k*y1, lbs[i].text.Strings[k]);
                end;
             end;
     end;
  printer.EndDoc;
end;


procedure tform1.OpenFolder;
// открыть папку и загрузить из нее все картинки
var
  pt: string;
  sr: tsearchrec;
begin
 case lng of
      0: sdd1.Title:='Открыть папку';
      1: sdd1.Title:='Open folder';
  end;
  if sdd1.Execute then
    begin
      pt := sdd1.FileName + '/*.*';
      label6.visible:=true;
      if findfirst(pt, faAnyFile, sr) = 0 then
         repeat
               addpict(sdd1.FileName+'/'+sr.Name);
          until findnext(sr) <> 0;
      findclose(sr);
      if buf = 0 then showmessage (lngn[lng,2])
         else begin
           label2.Caption := lngn[lng,0];
           ShowPict(showindex);
           showlistnum;
           EnableButtons;
         end;
      label6.Visible:=false;
      exit;
    end;
  showmessage (lngn[lng,3]);

end;

procedure tform1.ShowPict(index: Integer);
begin
  case comp of
    1, 2: showpic(index, 0);
    3: showpic(index, 1);
    4: showpic(index, 2);
    5: showpic(index, 3);
    6: showpic(index, 5);
    7: showpic(index, 7);
    8: showpic(index, 8);
    9: showpic(index, 14);
    10: showpic(index, 19);
  end;
end;

procedure tform1.ShowPic(index: Integer; cou: integer);
// показать картинки
var
  i: integer;
begin
  for i := 0 to cou do
    begin
      num:=i+index;
      if num >= buf then
        begin
          showp[i].Picture:=nil;
          continue;
        end;
      showp[i].Center := true;
      if not(toprint[num].load) then
                                  begin
                                    try
                                       toprint[num].pct.loadfromfile(systoUTF8(toprint[num].pict));
                                       toprint[num].load:=true;
                                    except
                                          on E: Exception do
                                             begin
                                                showmessage('Ошибка чтения файла:' + #13#10+ E.Message);
                                                toprint[num].pct := image11.Picture;
                                                toprint[num].load:=true;
                                             end;
                                    end;

                                  end;
      showp[i].Picture:=toprint[num].pct;
      if toprint[num].show then
          begin
             showp[i].Left:=toprint[num].left;
             showp[i].Top:=toprint[num].top;
             showp[i].Height:=toprint[num].heigth;
             showp[i].Width:=toprint[num].width;
             showp[i].Tag:=toprint[num].z;
          end else
          begin
             // подогнать размер
             setsize(showp[i]);
             // уточнить позицию
             setpos(showp[i]);
             toprint[num].show:=true;
             toprint[num].z:=showp[i].Tag;
             //привязать процедуры
             showp[i].OnMouseDown:=@MoveStart;
             showp[i].OnMouseMove:=@MoveNow;
             showp[i].OnMouseUp:=@MoveEnd;
             showp[i].PopupMenu := popupmenu1;
          end;
       showl[i].Visible:=false;
       if toprint[num].showcomm or checkbox1.Checked then
         // показать подпись
         begin
             showl[i].Tag:=1;
             showl[i].Font.Name:=toprint[num].fnt_Name;
             showl[i].Font.Size:=toprint[num].fnt_Size div 2;
             showl[i].Font.Style:=toprint[num].fnt_Style;
             showl[i].Font.Color:=toprint[num].fnt_Color;
             showl[i].Parent := panel1;
             showl[i].Visible:=true;
             showl[i].Enabled:=true;
             showl[i].Caption:=toprint[num].comm;
             if toprint[num].yl= -100 then
                         showl[i].Top:=showp[i].top+showp[i].Height else
                         showl[i].Top:=toprint[num].yl;
             if toprint[num].xl= -100 then
                         showl[i].Left:=showp[i].left+(showp[i].Width-showl[i].Width) div 2 else
                         showl[i].left:=toprint[num].xl;
             showl[i].OnMouseDown:=@MoveStartLab;
             showl[i].OnMouseMove:=@MoveNowLab;
             showl[i].OnMouseUp:=@MoveEndLab;
         end;
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
// листать назад
var
  i: integer;
begin
  label6.visible:=true;
  self.Repaint;
  i := 0 - steplist(comp);
  if showindex  > 0  then endstep(i);
  for i:=0 to lbscoupic-1 do lbspic[i].Destroy;
  lbscoupic:=0;
  for i:=0 to lbscou-1 do
    begin
      lbs[i].show:=false;
      lbs[i].index:=-1;
    end;
  ShowLabs;
  GetCurz; // расчитать значение curz и при необходимости поднять картинки
  label6.visible:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);
// листать вперёд
var
  i: integer;
begin
  label6.visible:=true;
  self.Repaint;
  i := steplist(comp);
  if showindex + i < buf   then endstep(i);
  for i:=0 to lbscoupic-1 do lbspic[i].Destroy;
  lbscoupic:=0;
  for i:=0 to lbscou-1 do
    begin
      lbs[i].show:=false;
      lbs[i].index:=-1;
    end;
  ShowLabs;
  GetCurz; // расчитать значение curz и при необходимости поднять картинки
  label6.visible:=false;
end;

procedure tform1.getcurz;
// расчитать значение curz и при необходимости поднять картинки
var
  i, j: integer;
begin
  curz:=0;
  //определить диапазон (глубину z-порядка)
  for i:=showindex to showindex+steplist(comp)-1 do
    begin
      if i>high(toprint) then break;
      if toprint[i].z > curz then curz:=toprint[i].z;
    end;
  for i:=0 to lbscou-1 do if (lbs[i].list=curlist) and (lbs[i].z>curz) then curz:=lbs[i].z;
  if curz=0 then exit;
  // поднять картинки
  for j:=1 to curz do
    begin
      for i:=0 to steplist(comp)-1 do if i+showindex < buf then
                  if toprint[i+showindex].z = j then showp[i].BringToFront;
      for i:=0 to lbscoupic-1 do
        if lbs[lbspic[i].Tag].z=j then lbspic[i].BringToFront;
    end;
end;

procedure tform1.endstep(index: integer);
begin
  showindex := showindex + index;
  createlist;
  showpict(showindex);
  showlistnum;
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
  openfolder;
end;

function tform1.steplist(i: integer): integer;
begin
   result := 0;
   case i of
      1,2: result := 1;
      3: result := 2;
      4: result := 3;
      5: result := 4;
      6: result := 6;
      7: result := 8;
      8: result := 9;
      9: result := 15;
      10: result := 20;
    end;
end;

Procedure tform1.CreateList;
begin
  getx := getmx;
  gety := getmy;
  case comp of
    1, 2: list1;
    3: list2;
    4: list3;
    5: list4;
    6: list6;
    7: list8;
    8: list9;
    9: list15;
    10: list20;
  end;
  EnableButtons;
end;

procedure tform1.EnableButtons;
begin
  bitbtn9.Enabled:=(buf>0);
  bitbtn2.Enabled:=(buf>0);
  bitbtn7.Enabled:=(buf>0);
  bitbtn6.Enabled:=(buf>0);
  button3.Enabled:=(buf>0);
  button1.Enabled:=(buf>0);
  button2.Enabled:=(buf>0);
  MenuItem17.Enabled:=(buf>0);
  MenuItem10.Enabled:=(buf>0);
  MenuItem20.Enabled:=(buf>0);
end;

procedure tform1.endlist(i: integer);
//завершение построения листа предпросмотра
begin
  showp[i].Visible := true;
  showp[i].Enabled := true;
  showp[i].Width := getx;
  showp[i].Height := gety;
  showp[i].Stretch := true;
  showp[i].Proportional := true;
  showp[i].Parent := panel1;
  showp[i].Tag:=i;
  showl[i].Tag:=0;

  if buf>0 then
     begin
       showp[i].OnMouseDown:=@MoveStart;
       showp[i].OnMouseMove:=@MoveNow;
       showp[i].OnMouseUp:=@MoveEnd;
       showp[i].PopupMenu := popupmenu1;
     end;

end;


procedure tform1.List1;
var
  i: integer;
begin
  for i := 1 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
      showl[i].Destroy;
    end;
  if not ex[0] then
    begin
      showp[0] := timage.Create(form1.Panel1);
      showl[0] := tlabel.Create(form1.Panel1);
      showp[0].Name := 'im0';
      showl[0].Name := 'lb0';
      ex[0] := true;
    end;
  showp[0].Top := pol;
  showp[0].Left := pol;
  endlist(0);
end;

procedure tform1.List2;
var
  i: integer;
begin
  for i := 2 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
      showl[i].Destroy;
    end;
  for i := 0 to 1 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          showl[i] := tlabel.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          s := 'lb' + inttostr(i);
          showl[i].Name := s;
          ex[i] := true;
        end;
      showp[i].Top := pol + (i * (gety + pol));
      showp[i].Left := pol;
      endlist(i);
    end;
end;

procedure tform1.List3;
var
  i: integer;
begin
  for i := 3 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
      showl[i].Destroy;
    end;
  for i := 0 to 2 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          showl[i] := tlabel.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          s := 'lb' + inttostr(i);
          showl[i].Name := s;
          ex[i] := true;
        end;
      showp[i].Top := pol + (i * (gety + pol));
      showp[i].Left := pol;
      endlist(i);
    end;
end;

procedure tform1.List4;
var
  i, j: integer;
begin
  for i := 4 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
      showl[i].Destroy;
    end;
  for i := 0 to 3 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          showl[i] := tlabel.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          s := 'lb' + inttostr(i);
          showl[i].Name := s;
          ex[i] := true;
        end;
      if i < 2 then j := 0 else j := 1;
      showp[i].Top := pol + (j * (gety + pol));
      if i mod 2 = 0 then j := 0 else j := 1;
      showp[i].Left := pol + (j * (getx + pol));
      endlist(i);
    end;
end;

procedure tform1.List6;
var
  i, j: integer;
begin
  for i := 6 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
      showl[i].Destroy;
    end;
  for i := 0 to 5 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          showl[i] := tlabel.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          s := 'lb' + inttostr(i);
          showl[i].Name := s;
          ex[i] := true;
        end;
      j := i div 2;
      showp[i].Top := pol + (j * (gety + pol));
      if i mod 2 = 0 then j := 0 else j := 1;
      showp[i].Left := pol + (j * (getx + pol));
      endlist(i);
    end;
end;

procedure tform1.List8;
var
  i, j: integer;
begin
  for i := 8 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
      showl[i].Destroy;
    end;
  for i := 0 to 7 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          showl[i] := tlabel.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          s := 'lb' + inttostr(i);
          showl[i].Name := s;
          ex[i] := true;
        end;
      j := i div 2;
      showp[i].Top := pol + (j * (gety + pol));
      if i mod 2 = 0 then j := 0 else j := 1;
      showp[i].Left := pol + (j * (getx + pol));
      endlist(i);
    end;
end;

procedure tform1.List9;
var
  i, j: integer;
begin
  for i := 9 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
      showl[i].Destroy;
    end;
  for i := 0 to 8 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          showl[i] := tlabel.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          s := 'lb' + inttostr(i);
          showl[i].Name := s;
          ex[i] := true;
        end;
      case i of
        0..2: j := 0;
        3..5: j := 1;
        6..8: j := 2;
      end;
      showp[i].Top := pol + (j * (gety + pol));
      case i of
        0, 3, 6: j := 0;
        1, 4, 7: j := 1;
        2, 5, 8: j := 2;
      end;
      showp[i].Left := pol + (j * (getx + pol));
      endlist(i);
    end;
end;

procedure tform1.List15;
var
  i, j: integer;
begin
  for i := 15 to 19 do
    if ex[i] then
     begin
       ex[i] := false;
       showp[i].Destroy;
       showl[i].Destroy;
     end;
  for i := 0 to 14 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          showl[i] := tlabel.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          s := 'lb' + inttostr(i);
          showl[i].Name := s;
          ex[i] := true;
        end;
      case i of
        0..2: j := 0;
        3..5: j := 1;
        6..8: j := 2;
        9..11: j := 3;
        12..14: j := 4;
      end;
      showp[i].Top := pol + (j * (gety + pol));
      case i of
        0, 3, 6, 9, 12: j := 0;
        1, 4, 7, 10, 13: j := 1;
        2, 5, 8, 11, 14: j := 2;
      end;
      showp[i].Left := pol + (j * (getx + pol));
      endlist(i);
    end;
end;


procedure tform1.List20;
var
  i, j: integer;
begin
  for i := 0 to 19 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          showl[i] := tlabel.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          s := 'lb' + inttostr(i);
          showl[i].Name := s;
          ex[i] := true;
        end;
      case i of
        0..3: j := 0;
        4..7: j := 1;
        8..11: j := 2;
        12..15: j := 3;
        16..19: j := 4;
      end;
      showp[i].Top := pol + (j * (gety + pol));
      case i of
        0, 4, 8, 12, 16: j := 0;
        1, 5, 9, 13, 17: j := 1;
        2, 6, 10, 14, 18: j := 2;
        3, 7, 11, 15, 19: j := 3;
      end;
      showp[i].Left := pol + (j * (getx + pol));
      endlist(i);
    end;
end;

procedure tform1.endclick(im: timage);
begin
  for num:=0 to buf-1 do
    begin
      toprint[num].show:=false;
      toprint[num].z:=0;
      toprint[num].xl:=-100;
      toprint[num].yl:=-100;
    end;
  label6.visible:=true;
  self.Repaint;
  showindex := 0;
  createlist;
  showpict(showindex);
  image8.Picture := im.Picture;
  showlistnum;
  label6.Visible:=false;
  curz:=0;
end;


procedure TForm1.Image1Click(Sender: TObject);
begin
  comp := 1;
  label2.Caption := labs[comp-1]; //lngn[lng, 0];
  endclick(sender as timage);
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (sender as timage).Top:=(sender as timage).Top+1;
  (sender as timage).left:=(sender as timage).left+1
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (sender as timage).Top:=(sender as timage).Top-1;
  (sender as timage).left:=(sender as timage).left-1
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  label2.Caption := lngn[lng, 1];
  comp := 2;
  endclick(sender as timage);
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
  label2.Caption := '1 х 2';
  comp := 3;
  endclick(sender as timage);
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
  label2.Caption := '1 х 3';
  comp := 4;
  endclick(sender as timage);
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
  label2.Caption := '2 х 2';
  comp := 5;
  endclick(sender as timage);
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
  label2.Caption := '2 х 3';
  comp := 6;
  endclick(sender as timage);
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
   label2.Caption := '2 х 4';
   comp := 7;
   endclick(sender as timage);
end;

procedure TForm1.Image9Click(Sender: TObject);
begin
   label2.Caption := '3 х 3';
   comp := 8;
   endclick(sender as timage);
end;

procedure TForm1.Image10Click(Sender: TObject);
begin
   label2.Caption := '3 х 5';
   comp := 9;
   endclick(sender as timage);
end;

procedure TForm1.Image12Click(Sender: TObject);
begin
  label2.Caption := '4 х 5';
  comp := 10;
  endclick(sender as timage);
end;

procedure TForm1.LabeledEdit1Change(Sender: TObject);
var
  a: char;
begin
  if fl then
    begin
     fl:=false;
     label9.Visible:=false;
     if length((sender as tLabelededit).Text)=0 then (sender as tLabelededit).Text:='0';
     a := (sender as tLabelededit).Text[length((sender as tLabelededit).text)];
     if not (a in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then label9.Visible:=true;
     label13.Visible:=label9.Visible;
     if label9.Visible then (sender as tLabelededit).Text:=copy((sender as tLabelededit).Text, 1, length((sender as tLabelededit).Text)-1) + '';
     fl:=true;
  end;
end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.MenuItem15Click(Sender: TObject);
begin
  form3.Show;
end;

procedure TForm1.MenuItem16Click(Sender: TObject);
begin
  Button13Click(Sender);
end;

procedure TForm1.MenuItem17Click(Sender: TObject);
begin
  Button3Click(Sender);
end;

function tform1.getpictindex(sender:  TObject): integer;
// получить номер картинки в общем списке по image, в котором ее видно
var
  s: string;
begin
  s:= (sender as timage).Name;
  result:=strtoint(copy(s, 3, 2))+showindex;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
// удалить картинку совсем
var
  i, j: integer;
begin
  i:=imindex;
  if (buf>1) then
     begin
          for j:=i to buf-2 do toprint[j] := toprint[j+1];
          dec(buf);
          setlength(toprint, buf);
     end else
         begin
           buf:=0;
           toprint[0].show:=false;
           endstep(0);
         end;
  refreshscreen;
end;

procedure TForm1.MenuItem20Click(Sender: TObject);
begin
  Button1Click(Sender);
  form1.SetFocus;
end;

procedure TForm1.MenuItem23Click(Sender: TObject);
// индивидуальная коррекция подписи
begin
  num:=showindex+strtoint(copy((sndr as timage).Name, 3, 2));
  captmod.pict:=toprint[num];
  form2.Image1.Picture:=(sndr as timage).Picture;
  form2.show;
end;

procedure TForm1.MenuItem25Click(Sender: TObject);  // коррекция надписи
begin
  labels.Name:=(sndr as timage).Name;
  labels.index:=(sndr as timage).Tag;
  form4.Show;
end;

procedure TForm1.MenuItem26Click(Sender: TObject);  // удалить надпись
begin
   DeleteLabs((sndr as timage).Tag);
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
//удалить картинку, но ee место не занимать
var
  i: integer;
begin
  i:=imindex;
  toprint[i].pict := '';
  toprint[i].pct:=nil;
  toprint[i].comm:='';
  refreshscreen;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
// открыть окошко регулятора размера
begin
   panel7.Visible:=true;
   Shape1.Visible:=true;
   difx:=showl[(sndr as timage).Tag].Left - ((sndr as timage).left+(sndr as timage).Width);
   dify:=showl[(sndr as timage).Tag].Top - ((sndr as timage).Top+(sndr as timage).Height);
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  Button7Click(Sender);
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  Button5Click(Sender);
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  openfolder;
end;

procedure TForm1.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if flagmove2 then
    begin
      (panel1.FindComponent(tstr) as tlabel).Top:=Y-tty;
      (panel1.FindComponent(tstr) as tlabel).Left:=X-ttx;
    end;
end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
  panel3.Caption:='\/';
  panel4.Caption:='';
  orn:=0;
  ComboBox1Change(ComboBox1);
  RefreshScreen;
end;

procedure TForm1.Panel3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 (sender as tpanel).Top:=(sender as tpanel).Top+1;
 (sender as tpanel).left:=(sender as tpanel).left+1
end;

procedure TForm1.Panel3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 (sender as tpanel).Top:=(sender as tpanel).Top-1;
 (sender as tpanel).left:=(sender as tpanel).left-1
end;

procedure TForm1.Panel4Click(Sender: TObject);
begin
  panel4.Caption:='\/';
  panel3.Caption:='';
  orn:=1;
  ComboBox1Change(ComboBox1);
  RefreshScreen;
end;


procedure tform1.setpg(p: string);
// установить формат бумаги
begin
  p:=uppercase(p);
  if p='*PA4' then combobox1.ItemIndex:=0;
  if p='*PA5' then combobox1.ItemIndex:=1;
  if p='*PA6' then combobox1.ItemIndex:=2;
  if p='*P10X15' then combobox1.ItemIndex:=3;
  if p='*P15X20' then combobox1.ItemIndex:=4;
  combobox1change( combobox1);
  if copy(p,1,3)='*PX' then setpg2(p);
end;

procedure tform1.setpg2(p: string);
// установить пользовательский формат бумаги из командной строки
var
  i, j: integer;
begin
  i:=pos('Y', p);
  if i=0 then exit;
  for j:=4 to i-1 do if not(p[j] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then exit;
  for j:=i+1 to length(p) do if not(p[j] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then exit;
  frms[5][0]:=strtoint(copy(p, 4, i-4));
  frms[5][1]:=strtoint(copy(p, i+1, length(p)-i));
  frms[5][2]:=trunc((300-frms[5][0])/50);
  if frms[5][2]=0 then frms[5][2]:=1;
  frm:=5;
  endfrms;
  combobox1.ItemIndex:=-1;
  combobox1.text:=copy(p, 4, i-4)+'x'+copy(p, i+1, length(p)-i);
end;

procedure tform1.setcomp(index: integer);
// установка начальной компоновки из командной строки
begin
  if (index<0) or (index>9) then
    begin
     Image1Click(image1);
     exit;
    end;
  case index of
    0: Image1Click(image1);
    1: Image2Click(image2);
    2: Image3Click(image3);
    3: Image4Click(image4);
    4: Image5Click(image5);
    5: Image6Click(image6);
    6: Image7Click(image7);
    7: Image9Click(image9);
    8: Image10Click(image10);
    9: Image12Click(image12);
  end;
end;

procedure tform1.SetLng;
var
  upr: string;
begin
  Cap[0]:=lngn[lng, 8];
  Cap[1]:=lngn[lng, 9];
  Cap[2]:=lngn[lng, 10];;
  Cap[3]:=lngn[lng, 11];
  Cap[4]:=lngn[lng, 12];
  Cap[5]:=lngn[lng, 13];
  labs[0]:=lngn[lng, 0];
  labs[1]:=lngn[lng, 1];
  combobox1.Clear;
  combobox1.Items.Add(lngn[lng, 8]);
  combobox1.Items.Add(lngn[lng, 9]);
  combobox1.Items.Add(lngn[lng, 10]);
  combobox1.Items.Add(lngn[lng, 11]);
  combobox1.Items.Add(lngn[lng, 12]);
  combobox1.Items.Add(lngn[lng, 13]);
  combobox1.Text:=combobox1.Items[frm];
  label2.Caption:=labs[comp-1];
  panel1.Caption:=Cap[frm];
  if lists > 0 then label5.Caption:=lngn[lng,5] + inttostr(curlist) + lngn[lng,6] + inttostr(lists)
     else label5.Caption:=lngn[lng, 4];
  upr := userprinter;
  case lng of
    0: begin
         if upr = '' then upr := 'по умолчанию';
         button5.Caption:='Открыть файл';
         button5.Hint:='Открыть один файл изображения'+#13+'(или добавить его к списку уже открытых)';
         bitbtn4.Hint:='Открыть один файл изображения'+#13+'(или добавить его к списку уже открытых)';
         button4.Caption:='Открыть папку';
         button4.Hint:='Выбрать папку и загрузить все картинки из нее '+#13+'(или добавить их к списку уже открытых)';
         bitbtn5.Hint:='Выбрать папку и загрузить все картинки из нее '+#13+'(или добавить их к списку уже открытых)';
         button1.Hint:='Листать выбранные картинки назад';
         bitbtn7.Hint:='Листать выбранные картинки назад';
         button2.Hint:='Листать выбранные картинки вперед';
         bitbtn6.Hint:='Листать выбранные картинки вперед';
         button3.Caption:='Печать';
         button3.Hint:='Отправить на печать все картинки в '+#13+'соответствии с выбранной компоновкой';
         bitbtn2.Hint:='Отправить на печать все картинки в '+#13+'соответствии с выбранной компоновкой';
         button12.Caption:='Настройки';
         button12.Hint:='Настройки программы';
         bitbtn1.Hint:='Настройки программы';
         button7.Caption:='О программе';
         bitbtn8.Hint:='О программе';
         label1.Caption:='Выбрано';
         GroupBox1.Caption:='Компоновка';
         Label7.Caption:='Формат листа';
         Label8.Caption:='Ориентация листа';
         CheckBox2.Caption:='Не увеличивать мелкие';
         CheckBox2.Hint:='Если снять эту галочку, то изначально мелкие картинки будут растягиваться до максимального возможного размера в соответствии с выбранной компоновкой.';
         CheckBox3.Caption:='Заполнить';
         CheckBox3.Hint:='Расчитать поля отдельно для каждой картинки для полного заполнения ее места с учетом компоновки';
         StaticText2.Hint:='Точное значение полей зависит от соотношения сторон картинки';
         StaticText2.Caption:='Поля между'+#13+'миниатюрами, mm';
         button8.Hint:='Точное значение полей зависит от соотношения сторон картинки';
         button9.Hint:='Точное значение полей зависит от соотношения сторон картинки';
         label12.Hint:='Точное значение полей зависит от соотношения сторон картинки';
         label6.Caption:='Думаю...';
         Form1.Caption:='Быстрая печать';
         labelededit1.EditLabel.Caption:='Горизонтальный размер';
         labelededit2.EditLabel.Caption:='Вертикальный размер';
         StaticText1.Caption:='Укажите размер Вашего листа в миллиметрах.'+#13+'Не рекомендуется превышать размер бумаги Вашего принтера.'
                                       +#13+'Используйте портретную (книжную) ориентацию.';
         button10.Caption:='Установить';
         button6.Caption:='Установить';
         button11.Caption:='Отклонить';
         button16.Caption:='Отклонить';
         labelededit3.EditLabel.Caption:='Масштаб предпросмотра - только на экране.';
         label9.Caption:='<--Только цифры! -->';
         label13.Caption:='<--Только цифры!';
         button13.Caption:='Принтер';
         button15.Caption:='Отменить';
         radiobutton1.Caption:='Всегда использовать этот принтер';
         radiobutton2.Caption:='Использовать принтер по умолчанию';
         label11.Caption:='Выбор принтера';
         button13.Hint:='Выбран принтер "'+upr+'"';
         bitbtn3.Hint:='Выбран принтер "'+upr+'"';
         repo:='Изображения отправлены на печать';
         label3.Caption:='Коррекция размера миниатюры';
         bitbtn9.Hint:='Сохранить текущую сессию';
         bitbtn10.Hint:='Открыть сохраненную сессию';
         bitbtn11.Hint:='Открыть автоматически сохраненную сессию';
         checkbox1.Caption:='Подписи';
         checkbox1.Hint:='Короткие подписи к картинкам';
         bitbtn12.Hint:='Вставить надпись';
         // main menu
         menuitem1.Caption:='Удалить это изображение';
         menuitem2.Caption:='Удалить, но оставить это место пустым';
         menuitem3.Caption:='Коррекция размера';
         menuitem4.Caption:='Файл';
         menuitem7.Caption:='Открыть файл';
         menuitem8.Caption:='Открыть папку';
         menuitem17.Caption:='Печать';
         menuitem10.Caption:='Сохранить сессию';
         menuitem11.Caption:='Открыть сессию';
         menuitem12.Caption:='Открыть автосохранение';
         menuitem14.Caption:='Выход';
         menuitem20.Caption:='Навигация';
         menuitem5.Caption:='Настройки';
         menuitem15.Caption:='Программа';
         menuitem16.Caption:='Принтер';
         menuitem6.Caption:='Справка';
         menuitem22.Caption:='О программе';
         menuitem23.Caption:='Подпись';
         menuitem24.Caption:='Вставить надпись';
         menuitem25.Caption:='Редактировать';
         menuitem26.Caption:='Удалить';

       end;
    1: begin
         if upr = '' then upr := 'default';
         button5.Caption:='Open file';
         button5.Hint:='Open one picture '+#13+'(or add it to the list is open)';
         bitbtn4.Hint:='Open one picture '+#13+'(or add it to the list is open)';
         button4.Caption:='Open folder';
         button4.Hint:='Select a folder and upload all the pictures of it '+#13+'(or add them to the list is open)';
         bitbtn5.Hint:='Select a folder and upload all the pictures of it '+#13+'(or add them to the list is open)';
         button1.Hint:='Flipping selected images back';
         bitbtn7.Hint:='Flipping selected images back';
         button2.Hint:='Flipping selected images forward';
         bitbtn6.Hint:='Flipping selected images forward';
         button3.Caption:='Print';
         button3.Hint:='Send to print all the pictures '+#13+'on the selected layout';
         bitbtn2.Hint:='Send to print all the pictures '+#13+'on the selected layout';
         button12.Caption:='Settings';
         button12.Hint:='Program settings';
         bitbtn1.Hint:='Program settings';
         button7.Caption:='About';
         bitbtn8.Hint:='About';
         label1.Caption:='Selected';
         GroupBox1.Caption:='Composition';
         Label7.Caption:='Page format';
         Label8.Caption:='Page orientation';
         CheckBox2.Caption:='Not increase';
         CheckBox2.Hint:='If you clear the check box, then the initially small image will be stretched to the maximum possible size according to the selected layout.';
         CheckBox3.Caption:='Fill';
         CheckBox3.Hint:='Calculate field separately for each picture to completely fill its place with the layout';
         StaticText2.Hint:='The exact value of the fields depends on the aspect ratio of pictures';
         StaticText2.Caption:='Margin between'+#13+'miniatures, mm';
         button8.Hint:='The exact value of the fields depends on the aspect ratio of pictures';
         button9.Hint:='The exact value of the fields depends on the aspect ratio of pictures';
         label12.Hint:='The exact value of the fields depends on the aspect ratio of pictures';
         label6.Caption:='I think...';
         form1.Caption:='Fast print';
         labelededit1.EditLabel.Caption:='Horizontal size';
         labelededit2.EditLabel.Caption:='Vertical size';
         StaticText1.Caption:='Enter the size of your paper in millimeters.'+#13+'Do not exceed the paper size of your printer.'
                                       +#13+'Use portrait (like a book) orientation.';
         button10.Caption:='Ок';
         button6.Caption:='Ок';
         button11.Caption:='Cancel';
         button16.Caption:='Cancel';
         labelededit3.EditLabel.Caption:='The scale of the preview - only on the screen.';
         label9.Caption:='<--Only numbers! -->';
         label13.Caption:='<--Only numbers!';
         button13.Caption:='Printers';
         button15.Caption:='Cancel';
         radiobutton1.Caption:='Always use this printer';
         radiobutton2.Caption:='Use default printer';
         label11.Caption:='Selecting a printer';
         button13.Hint:='Printer selected "'+upr+'"';
         bitbtn3.Hint:='Printer selected "'+upr+'"';
         repo:='Images sent to the printer';
         label3.Caption:='Correction of the image size';
         bitbtn9.Hint:='Save session';
         bitbtn10.Hint:='Open session';
         bitbtn11.Hint:='Open autosaved session';
         checkbox1.Caption:='Captions';
         checkbox1.Hint:='Short captions for pictures';
         bitbtn12.Hint:='Insert inscription';
         // main menu
         menuitem1.Caption:='Delete this image';
         menuitem2.Caption:='Remove, but leave this place empty';
         menuitem3.Caption:='Change the image size';
         menuitem4.Caption:='File';
         menuitem7.Caption:='Open file';
         menuitem8.Caption:='Open folder';
         menuitem17.Caption:='Print';
         menuitem10.Caption:='Save session';
         menuitem11.Caption:='Open session';
         menuitem12.Caption:='Open autosaved session';
         menuitem14.Caption:='Exit';
         menuitem20.Caption:='View';
         menuitem5.Caption:='Settings';
         menuitem15.Caption:='Program';
         menuitem16.Caption:='Printer';
         menuitem6.Caption:='Help';
         menuitem22.Caption:='About';
         menuitem23.Caption:='Caption';
         menuitem24.Caption:='Insert inscription';
         menuitem25.Caption:='Edit';
         menuitem26.Caption:='Delete';
    end;
  end;
end;

procedure tform1.setwords;
begin
   lngn[0, 0]:='1 в центре';
   lngn[1, 0]:='1 in the center';
   lngn[0, 1]:='1 сверху';
   lngn[1, 1]:='1 top';
   lngn[0, 2]:='В этой папке допустимых файлов изображений нет.';
   lngn[1, 2]:='In this folder, there is no valid image file.';
   lngn[0, 3]:='Вы отказались открыть папку.';
   lngn[1, 3]:='You refused to open the folder.';
   lngn[0, 4]:='Файлы для печати не загружены';
   lngn[1, 4]:='Print files are not loaded';
   lngn[0, 5]:='Лист ';
   lngn[1, 5]:='Page ';
   lngn[0, 6]:=' из ';
   lngn[1, 6]:=' of ';
   lngn[0, 7]:='Файлов, пригодных для печати не обнаружено';
   lngn[1, 7]:='File suitable for printing is not detected';
   lngn[0, 8]:='Лист А4 21 х 29.7';
   lngn[1, 8]:='Page А4 21 х 29.7';
   lngn[0, 9]:='Лист А5 14.8 х 21';
   lngn[1, 9]:='Page А5 14.8 х 21';
   lngn[0,10]:='Лист А6 10.5 х 14.8';
   lngn[1,10]:='Page А6 10.5 х 14.8';
   lngn[0,11]:='Фотография 10 х 15';
   lngn[1,11]:='Photo 10 х 15';
   lngn[0,12]:='Фотография 15 x 20';
   lngn[1,12]:='Photo 15 x 20';
   lngn[0,13]:='Произвольный размер';
   lngn[1,13]:='Custom size';

end;


{
function tform1.Rotor(im: tImage; g: integer): tImage; // вращение picture вправо
var
   x1, y1, x2, y2: integer;
begin
   result := tImage.Create(form1);
   case g of
     1: // 90 гр
     begin
        label1.Caption:='!!!';
        result.Width := im.Height;
        result.Height := im.Width;
        y2:=0; x2:=result.Width-1;
        for y1:=0 to im.Height-1 do
          begin
          for x1:=0 to im.Width-1 do
            begin
                 result.Canvas.Pixels[x2,y2] := im.Canvas.Pixels[x1,y1];
                 inc(y2);
            end;
            y2:=0;
            dec(x2);
          end;
        exit;
     end;
   end;
end;

 }


end.
