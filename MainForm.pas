unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    PanelToolBar: TPanel;
    PanelGenerateSeq: TPanel;
    EditLengthSeq: TEdit;
    LabelLengthSeq: TLabel;
    BtnGenerateSeq: TButton;
  private
    FLengthSeq: Integer;
    procedure SetLengthSeq(const Value: Integer);
  public
    property LengthSeq: Integer read FLengthSeq write SetLengthSeq;
  end;

var
  Form1: TForm1;
  NumSeq1 : array of Double;
  NumSeq2 : array of Double;

implementation

{$R *.dfm}

procedure TForm1.SetLengthSeq(const Value: Integer);
begin
  if FLengthSeq <> Value then
  begin
    FLengthSeq := Value;
    EditLengthSeq.Text := IntToStr(FLengthSeq);
  end;
end;

end.
