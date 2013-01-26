unit EasyPrint;

{ Модуль упрощенной работы с принтером }

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls, Printers;
type
  TEasyPrinter = Class(tObject)

    private
      function GetScaleX: Integer;
      function GetScaleY: Integer;
      function GetTitle: String;
      procedure SetScaleX(const AValue: Integer);
      procedure SetScaleY(const AValue: Integer);
      Procedure SetTitle(const AValue: String);
    Public
      property ScaleX: Integer read GetScaleX write SetScaleX; // масштаб печати по Х в процентах 1:1 - 100%
      property ScaleY: Integer read GetScaleY write SetScaleY; // масштаб печати по Y в процентах 1:1 - 100%
      property Title: String read GetTitle write SetTitle; // Имя задания в очереди для печати
      procedure ImagePrint(im: tImage; rc: tRect); // Напечатать im по координатам rc в канве принтера
end;
    var
    SclX, SclY: Integer;
    TitlePrint: String;


implementation



procedure ImagePrint(im: tImage; rc: tRect);
var
  Prn: TPrinter;
begin
  prn:=printer;
  prn.Title:=TitlePrint;
  prn.BeginDoc;
  prn.Canvas.StretchDraw(rc, im.Picture.Bitmap);
  prn.EndDoc;
end;

function GetScaleX: Integer;
begin
  result:=SclX;
end;

function GetScaleY: Integer;
begin
  result:=SclY;
end;

procedure SetScaleX(const AValue: Integer);
begin
  SclX:=AValue;
end;

procedure SetScaleY(const AValue: Integer);
begin
  SclY:=AValue;
end;

function GetTitle: String;
begin
  result:=TitlePrint;
end;

Procedure SetTitle(const AValue: String);
begin
  TitlePrint:=AValue;
end;

end.

