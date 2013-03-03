{$DEFINE UNIX}
{$DEFINE UseCThreads}

program vap;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, start, printer4lazarus, runtimetypeinfocontrols, turbopoweripro, ab,
  Opt;

{$R *.res}

begin
  Application.Title:='view_and_print';
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.

