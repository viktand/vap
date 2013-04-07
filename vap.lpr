{$DEFINE UNIX}
{$DEFINE UseCThreads}

program vap;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  // this includes the LCL widgetset
  Forms, Interfaces, start, printer4lazarus,
  Opt, ask, about;

{$R *.res}

begin
  Application.Title:='view_and_print';
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
