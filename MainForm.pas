unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Diagnostics,
   Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    PanelToolBar: TPanel;
    PanelGenerateSeq: TPanel;
    EditLengthSeq: TEdit;
    LabelLengthSeq: TLabel;
    BtnGenerateSeq: TButton;
    GBToolBarBubbleSort: TGroupBox;
    GBToolBarQuickSort: TGroupBox;
    BtnQuickSortBothSeq: TButton;
    LabelTimeAndProgress: TLabel;
    LBSeq1: TListBox;
    procedure EditLengthSeqChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnGenerateSeqClick(Sender: TObject);
    procedure BtnQuickSortBothSeqClick(Sender: TObject);
  private
    FLengthSeq: Integer;
    FTimeRun: String;
    procedure SetLengthSeq(const Value: Integer);
    procedure SetTimeRun(const Value: String);
    procedure qSort(var A: TArray<Double>; min, max: Integer);
    procedure UpdateListBoxs;
  public
    property LengthSeq: Integer read FLengthSeq write SetLengthSeq;
    property TimeRun: String read FTimeRun write SetTimeRun;
  end;

var
  Form1: TForm1;
  NumSeq1 : TArray<Double>;
  //NumSeq2 : TArray<Double>;
  TempList: TStrings;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FLengthSeq := -1;
  LengthSeq := 0;
end;

procedure TForm1.BtnGenerateSeqClick(Sender: TObject);
begin
  NumSeq1 := nil;
  //NumSeq2 := nil;
  SetLength(NumSeq1, LengthSeq);
  //SetLength(NumSeq2, LengthSeq);
  var Temp: Double;
  for var I := 0 to LengthSeq-1 do
  begin
    Temp := Random*10000;
    NumSeq1[I] := Temp;
    //NumSeq2[I] := Temp;
    //ShowMessage(FloatToStr(Temp));
  end;
  UpdateListBoxs;
end;

procedure TForm1.UpdateListBoxs;
var
  I : Integer;
begin
  LBSeq1.Clear;
  //LBSeq2.Clear;
  for I := 0 to LengthSeq-1 do
  begin
    LBSeq1.Items.Add(FloatToStr(NumSeq1[I]));
    //Seq2.Items.Add(FloatToStr(NumSeq2[I]));
  end;
end;

procedure TForm1.qSort(var A: TArray<Double>; min, max: Integer);
var
  i, j: Integer;
  supp, tmp: Double;
begin
supp:=A[max-((max-min) div 2)];
i:=min; j:=max;
while i<j do
  begin
    while A[i]<supp do i:=i+1;
    while A[j]>supp do j:=j-1;
    if i<=j then
      begin
        tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
        UpdateListBoxs;
        i:=i+1; j:=j-1;
      end;
  end;
if min<j then qSort(A, min, j);
if i<max then qSort(A, i, max);
end;

procedure TForm1.BtnQuickSortBothSeqClick(Sender: TObject);
var
  Stopwatch: TStopwatch;
begin
  Stopwatch := TStopwatch.Create;
  Stopwatch.Start;
  qSort(NumSeq1, 0, High(NumSeq1));
  Stopwatch.Stop;
  TimeRun := Stopwatch.ElapsedMilliseconds.ToString;
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

procedure TForm1.SetTimeRun(const Value: string);
begin
  if FTimeRun <> Value then
  begin
    FTimeRun := Value;
    LabelTimeAndProgress.Caption := 'Время: ' + FTimeRun + 'ms';
  end;
end;
end.
