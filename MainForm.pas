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
    PanelLBs: TPanel;
    LBSeq1: TListBox;
    LBSeq2: TListBox;
    procedure EditLengthSeqChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnGenerateSeqClick(Sender: TObject);
  private
    FLengthSeq: Integer;
    procedure SetLengthSeq(const Value: Integer);
    procedure UpdateListBoxs;
  public
    property LengthSeq: Integer read FLengthSeq write SetLengthSeq;
  end;

var
  Form1: TForm1;
  NumSeq1 : array of Double;
  NumSeq2 : array of Double;
  TempList: TStrings;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FLengthSeq := -1;
  LengthSeq := 0;
  TempList := TStringList.Create;
end;

procedure TForm1.BtnGenerateSeqClick(Sender: TObject);
begin
  NumSeq1 := nil;
  NumSeq2 := nil;
  SetLength(NumSeq1, LengthSeq);
  SetLength(NumSeq2, LengthSeq);
  var Temp: Double;
  for var I := 0 to LengthSeq-1 do
  begin
    Temp := Random*10000;
    NumSeq1[I] := Temp;
    NumSeq2[I] := Temp;
    ShowMessage(FloatToStr(Temp));
  end;
  UpdateListBoxs;
end;

procedure TForm1.UpdateListBoxs;
begin
  LBSeq1.Clear;
  LBSeq2.Clear;
  //TempList.Assign(NumSeq1);
  //LBSeq1.Items.Assign(NumSeq1);
  //Seq2.Items.Assign(Items);
end;

procedure TForm1.EditLengthSeqChange(Sender: TObject);
begin
  LengthSeq := StrToInt(EditLengthSeq.Text);
end;

procedure TForm1.SetLengthSeq(const Value: Integer);
begin
  if FLengthSeq <> Value then
  begin
    FLengthSeq := Value;
    EditLengthSeq.Text := IntToStr(FLengthSeq);
  end;
end;

end.
