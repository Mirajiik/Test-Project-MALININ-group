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
    LabelQSTimeAndProgress: TLabel;
    LBSeq1: TListBox;
    ChartSortProgress: TChart;
    Series1: TBarSeries;
    BtnBubbleSortSeq: TButton;
    LabelBSTimeAndProgress: TLabel;
    procedure EditLengthSeqChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnGenerateSeqClick(Sender: TObject);
    procedure BtnQuickSortSeqClick(Sender: TObject);
    procedure BtnBubbleSortSeqClick(Sender: TObject);
  private
    FLengthSeq: Integer;
    FQSTimeRun: Integer;
    FProgressQSort: Double;
    FBSTimeRun: Integer;
    FProgressBSort: Double;
    procedure SetLengthSeq(const Value: Integer);
    procedure SetQSTimeRun(const Value: Integer);
    procedure SetProgressQSort(const Value: Double);
    procedure SetBSTimeRun(const Value: Integer);
    procedure SetProgressBSort(const Value: Double);
  public
    procedure UpdateView;
    property LengthSeq: Integer read FLengthSeq write SetLengthSeq;
    property QSTimeRun: Integer read FQSTimeRun write SetQSTimeRun;
    property ProgressQSort: Double read FProgressQSort write SetProgressQSort;
    property BSTimeRun: Integer read FBSTimeRun write SetBSTimeRun;
    property ProgressBSort: Double read FProgressBSort write SetProgressBSort;
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
  BtnBubbleSortSeq.Enabled := False;
  Series1.Clear;
end;

procedure TForm1.BtnGenerateSeqClick(Sender: TObject);
begin
  NumSeq1 := nil;
  BtnQuickSortSeq.Enabled := True;
  BtnBubbleSortSeq.Enabled := True;
  SetLength(NumSeq1, LengthSeq);
  var Temp: Double;
  for var I := 0 to LengthSeq-1 do
  begin
    Temp := Random*10000;
    NumSeq1[I] := Temp;
  end;
  UpdateView;
end;

procedure TForm1.UpdateView;
var
  I : Integer;
begin
  Series1.BeginUpdate;
  Series1.Clear;
  LBSeq1.Items.BeginUpdate;
  LBSeq1.Clear;
  for I := 0 to LengthSeq-1 do
  begin
    LBSeq1.Items.Add(FloatToStr(NumSeq1[I]));
    Series1.Add(NumSeq1[I], IntToStr(I));
  end;
  Series1.EndUpdate;
  LBSeq1.Items.EndUpdate;
  ChartSortProgress.Draw;
end;

procedure TForm1.BtnQuickSortSeqClick(Sender: TObject);
var
  Stopwatch: TStopwatch;
begin
  Stopwatch := TStopwatch.Create;
  Stopwatch.Start;
  Sort.qSort(NumSeq1, 0, High(NumSeq1));
  Stopwatch.Stop;
  QSTimeRun := Stopwatch.ElapsedMilliseconds;
end;

procedure TForm1.BtnBubbleSortSeqClick(Sender: TObject);
var
  Stopwatch: TStopwatch;
begin
  Stopwatch := TStopwatch.Create;
  Stopwatch.Start;
  Sort.BubbleSort(NumSeq1, 0, High(NumSeq1));
  Stopwatch.Stop;
  BSTimeRun := Stopwatch.ElapsedMilliseconds;
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

procedure TForm1.SetQSTimeRun(const Value: Integer);
begin
  if FQSTimeRun <> Value then
  begin
    FQSTimeRun := Value;
    LabelQSTimeAndProgress.Caption := '�����: ' + IntToStr(FQSTimeRun) + 'ms';
  end;
end;

procedure TForm1.SetProgressQSort(const Value: Double);
begin
  if FProgressQSort <> Value then
  begin
    FProgressQSort := Value;
    LabelQSTimeAndProgress.Caption := '��������: ' +
      FloatToStr(SimpleRoundTo(FProgressQSort, -1)) + '%';
    LabelQSTimeAndProgress.Update;
  end;
end;

procedure TForm1.SetBSTimeRun(const Value: Integer);
begin
  if FBSTimeRun <> Value then
  begin
    FBSTimeRun := Value;
    LabelBSTimeAndProgress.Caption := '�����: ' + IntToStr(FBSTimeRun) + 'ms';
  end;
end;

procedure TForm1.SetProgressBSort(const Value: Double);
begin
  if FProgressBSort <> Value then
  begin
    FProgressBSort := Value;
    LabelBSTimeAndProgress.Caption := '��������: ' +
      FloatToStr(SimpleRoundTo(FProgressBSort, -1)) + '%';
    LabelBSTimeAndProgress.Update;
  end;
end;
end.
