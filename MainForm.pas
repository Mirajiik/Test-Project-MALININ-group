unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Math,
  System.Diagnostics, System.Threading, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, SortUnit, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series;

type
  TForm1 = class(TForm)
    PanelToolBar: TPanel;
    PanelGenerateSeq: TPanel;
    EditLengthSeq: TEdit;
    LabelLengthSeq: TLabel;
    BtnGenerateSeq: TButton;
    GBToolBarBubbleSort: TGroupBox;
    GBToolBarQuickSort: TGroupBox;
    BtnQuickSortSeq: TButton;
    LabelTimeAndProgress: TLabel;
    LBSeq1: TListBox;
    procedure EditLengthSeqChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnGenerateSeqClick(Sender: TObject);
    procedure BtnQuickSortSeqClick(Sender: TObject);
  private
    FLengthSeq: Integer;
    FTimeRun: String;
    FProgressSort: Double;
    procedure SetLengthSeq(const Value: Integer);
    procedure SetTimeRun(const Value: String);
    procedure SetProgressSort(const Value: Double);
  public
    procedure UpdateView;
    property LengthSeq: Integer read FLengthSeq write SetLengthSeq;
    property TimeRun: String read FTimeRun write SetTimeRun;
    property ProgressSort: Double read FProgressSort write SetProgressSort;
  end;
var
  Form1: TForm1;
  NumSeq1 : TArray<Double>;
  TempList: TStrings;
  Sort: TSort;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FLengthSeq := -1;
  LengthSeq := 0;
  BtnQuickSortSeq.Enabled := False;
end;

procedure TForm1.BtnGenerateSeqClick(Sender: TObject);
begin
  NumSeq1 := nil;
  BtnQuickSortSeq.Enabled := True;
  SetLength(NumSeq1, LengthSeq);
  var Temp: Double;
  for var I := 0 to LengthSeq-1 do
  begin
    Temp := Random*10000;
    NumSeq1[I] := Temp;
    //ShowMessage(FloatToStr(Temp));
  end;
  UpdateView;
end;

procedure TForm1.UpdateView;
var
  I : Integer;
begin
  LBSeq1.Items.BeginUpdate;
  LBSeq1.Clear;
  for I := 0 to LengthSeq-1 do
  begin
    LBSeq1.Items.Add(FloatToStr(NumSeq1[I]));
  end;
  LBSeq1.Items.EndUpdate;
end;

procedure TForm1.BtnQuickSortSeqClick(Sender: TObject);
var
  Stopwatch: TStopwatch;
begin
  Stopwatch := TStopwatch.Create;
  Stopwatch.Start;
  Sort.qSort(NumSeq1, 0, High(NumSeq1));
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

procedure TForm1.SetProgressSort(const Value: Double);
begin
  if FProgressSort <> Value then
  begin
    FProgressSort := Value;
    LabelTimeAndProgress.Caption := 'Прогресс: ' + FloatToStr(SimpleRoundTo(FProgressSort, -1)) + '%';
    LabelTimeAndProgress.Update;
  end;
end;
end.
