unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Math,
  System.Diagnostics, System.Threading, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, SortUnit, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series, Vcl.Samples.Spin,
  VclTee.TeeGDIPlus;

type
  TForm1 = class(TForm)
    PanelToolBar: TPanel;
    PanelGenerateSeq: TPanel;
    LabelLengthSeq: TLabel;
    BtnGenerateSeq: TButton;
    GBToolBarBubbleSort: TGroupBox;
    GBToolBarQuickSort: TGroupBox;
    BtnQuickSortSeq: TButton;
    LabelQSTimeAndProgress: TLabel;
    LBSeq1: TListBox;
    ChartSortProgress: TChart;
    Series1: TBarSeries;
    BtnPyramidSortSeq: TButton;
    LabelBSTimeAndProgress: TLabel;
    BtnReverseQuickSortSeq: TButton;
    BtnReversePyramidSortSeq: TButton;
    EditLengthSeq: TSpinEdit;
    procedure EditLengthSeqChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnGenerateSeqClick(Sender: TObject);
    procedure BtnQuickSortSeqClick(Sender: TObject);
    procedure BtnPyramidSortSeqClick(Sender: TObject);
  private
    FLengthSeq: Integer;
    FQSTimeRun: Integer;
    FProgressQSort: Double;
    FPSTimeRun: Integer;
    FProgressPSort: Double;
    SortThread: TSortThread;
    procedure SetLengthSeq(const Value: Integer);
    procedure SetQSTimeRun(const Value: Integer);
    procedure SetProgressQSort(const Value: Double);
    procedure SetPSTimeRun(const Value: Integer);
    procedure SetProgressPSort(const Value: Double);
  public
    procedure UpdateView;
    property LengthSeq: Integer read FLengthSeq write SetLengthSeq;
    property QSTimeRun: Integer read FQSTimeRun write SetQSTimeRun;
    property ProgressQSort: Double read FProgressQSort write SetProgressQSort;
    property PSTimeRun: Integer read FPSTimeRun write SetPSTimeRun;
    property ProgressPSort: Double read FProgressPSort write SetProgressPSort;
  end;
var
  Form1: TForm1;
  NumSeq1 : TArray<Double>;
  TempList: TStrings;
  //Sort: TSort;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FLengthSeq := 0;
  LengthSeq := 1;
  BtnQuickSortSeq.Enabled := False;
  BtnPyramidSortSeq.Enabled := False;
  BtnReverseQuickSortSeq.Enabled := False;
  BtnReversePyramidSortSeq.Enabled := False;
  Series1.Clear;
end;

procedure TForm1.BtnGenerateSeqClick(Sender: TObject);
begin
  NumSeq1 := nil;
  BtnQuickSortSeq.Enabled := True;
  BtnPyramidSortSeq.Enabled := True;
  BtnReverseQuickSortSeq.Enabled := True;
  BtnReversePyramidSortSeq.Enabled := True;
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
begin
  SortThread := TQuickSort.Create(NumSeq1, 0, High(NumSeq1), (Sender as TButton).Tag = 1);
  SortThread.Start;
end;

procedure TForm1.BtnPyramidSortSeqClick(Sender: TObject);
begin
  SortThread := THeapSort.Create(NumSeq1, 0, High(NumSeq1), (Sender as TButton).Tag = 1);
  SortThread.Start;
end;

procedure TForm1.EditLengthSeqChange(Sender: TObject);
begin
  LengthSeq := EditLengthSeq.Value;
end;

procedure TForm1.SetLengthSeq(const Value: Integer);
begin
  if FLengthSeq <> Value then
  begin
    FLengthSeq := Value;
    EditLengthSeq.Value := FLengthSeq;
  end;
end;

procedure TForm1.SetQSTimeRun(const Value: Integer);
var
  TimeRun: Integer;
begin
  if FQSTimeRun <> Value then
  begin
    FQSTimeRun := Value;
    TimeRun := FQSTimeRun;
    LabelQSTimeAndProgress.Caption := Format('Время: %d s %d ms', [TimeRun div 1000, TimeRun mod 1000]);
  end;
end;

procedure TForm1.SetProgressQSort(const Value: Double);
begin
  if FProgressQSort <> Value then
  begin
    FProgressQSort := Value;
    LabelQSTimeAndProgress.Caption := Format('Прогресс: %.1f %%', [FProgressQSort]);
    LabelQSTimeAndProgress.Update;
  end;
end;

procedure TForm1.SetPSTimeRun(const Value: Integer);
var
  TimeRun: Integer;
begin
  if FPSTimeRun <> Value then
  begin
    FPSTimeRun := Value;
    TimeRun := FPSTimeRun;
    LabelBSTimeAndProgress.Caption := Format('Время: %d s %d ms', [TimeRun div 1000, TimeRun mod 1000]);
  end;
end;

procedure TForm1.SetProgressPSort(const Value: Double);
begin
  if FProgressPSort <> Value then
  begin
    FProgressPSort := Value;
    LabelBSTimeAndProgress.Caption := Format('Прогресс: %.1f %%', [FProgressPSort]);
    LabelBSTimeAndProgress.Update;
  end;
end;
end.
