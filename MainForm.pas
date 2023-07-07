unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Math,
  System.Diagnostics, System.Threading, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, SortUnit, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series, Vcl.Samples.Spin,
  VclTee.TeeGDIPlus;

type
  TMainForm = class(TForm)
    PanelToolBar: TPanel;
    PanelGenerateSeq: TPanel;
    lLengthSeq: TLabel;
    BtnGenerateSeq: TButton;
    GBToolBarBubbleSort: TGroupBox;
    GBToolBarQuickSort: TGroupBox;
    BtnQuickSortSeq: TButton;
    lQuickSortTimeAndProgress: TLabel;
    lbSeq: TListBox;
    ChartSortProgress: TChart;
    Series1: TBarSeries;
    BtnHeapSortSeq: TButton;
    lHeapSortTimeAndProgress: TLabel;
    BtnReverseQuickSortSeq: TButton;
    BtnReverseHeapSortSeq: TButton;
    seLengthSeq: TSpinEdit;
    BtnStopSort: TButton;
    procedure seLengthSeqChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnGenerateSeqClick(Sender: TObject);
    procedure BtnQuickSortSeqClick(Sender: TObject);
    procedure BtnHeapSortSeqClick(Sender: TObject);
    procedure BtnStopSortClick(Sender: TObject);
  private
    FLengthSeq: Integer;
    FQSTimeRun: Integer;
    FProgressQSort: Double;
    FHSTimeRun: Integer;
    FProgressHSort: Double;
    SortThread: TSortThread;
    procedure SetLengthSeq(const Value: Integer);
    procedure SetQSTimeRun(const Value: Integer);
    procedure SetHSTimeRun(const Value: Integer);
    procedure SetProgressHSort(const Value: Double);
  public
    procedure UpdateView;
    property LengthSeq: Integer read FLengthSeq write SetLengthSeq;
    property QSTimeRun: Integer read FQSTimeRun write SetQSTimeRun;
    property HSTimeRun: Integer read FHSTimeRun write SetHSTimeRun;
    property ProgressPSort: Double read FProgressHSort write SetProgressHSort;
  end;
var
  frmMain: TMainForm;
  NumSeq : TArray<Double>;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FLengthSeq := 0;
  LengthSeq := 1;
  Series1.Clear;
end;

procedure TMainForm.BtnGenerateSeqClick(Sender: TObject);
begin
  NumSeq := nil;
  BtnQuickSortSeq.Enabled := True;
  BtnHeapSortSeq.Enabled := True;
  BtnReverseQuickSortSeq.Enabled := True;
  BtnReverseHeapSortSeq.Enabled := True;
  SetLength(NumSeq, LengthSeq);
  var Temp: Double;
  for var I := 0 to High(NumSeq) do
  begin
    Temp := Random*10000;
    NumSeq[I] := Temp;
  end;
  UpdateView;
end;

procedure TMainForm.UpdateView;
var
  I : Integer;
begin
  Series1.BeginUpdate;
  Series1.Clear;
  lbSeq.Items.BeginUpdate;
  lbSeq.Clear;
  for I := 0 to High(NumSeq) do
  begin
    lbSeq.Items.Add(FloatToStr(NumSeq[I]));
    Series1.Add(NumSeq[I], IntToStr(I));
  end;
  Series1.EndUpdate;
  lbSeq.Items.EndUpdate;
  ChartSortProgress.Draw;
end;

procedure TMainForm.BtnQuickSortSeqClick(Sender: TObject);
begin
  SortThread := TQuickSort.Create(NumSeq, 0, High(NumSeq), (Sender as TButton).Tag = 1);
  SortThread.Start;
end;

procedure TMainForm.BtnStopSortClick(Sender: TObject);
begin
  SortThread.Terminate;
end;

procedure TMainForm.BtnHeapSortSeqClick(Sender: TObject);
begin
  SortThread := THeapSort.Create(NumSeq, 0, High(NumSeq), (Sender as TButton).Tag = 1);
  SortThread.Start;
end;

procedure TMainForm.seLengthSeqChange(Sender: TObject);
begin
  LengthSeq := seLengthSeq.Value;
end;

procedure TMainForm.SetLengthSeq(const Value: Integer);
begin
  if FLengthSeq <> Value then
  begin
    FLengthSeq := Value;
    seLengthSeq.Value := FLengthSeq;
  end;
end;

procedure TMainForm.SetQSTimeRun(const Value: Integer);
var
  TimeRun: Integer;
begin
  if FQSTimeRun <> Value then
  begin
    FQSTimeRun := Value;
    TimeRun := FQSTimeRun;
    lQuickSortTimeAndProgress.Caption := Format('Время: %d s %d ms', [TimeRun div 1000, TimeRun mod 1000]);
  end;
end;

procedure TMainForm.SetHSTimeRun(const Value: Integer);
var
  TimeRun: Integer;
begin
  if FHSTimeRun <> Value then
  begin
    FHSTimeRun := Value;
    TimeRun := FHSTimeRun;
    lHeapSortTimeAndProgress.Caption := Format('Время: %d s %d ms', [TimeRun div 1000, TimeRun mod 1000]);
  end;
end;

procedure TMainForm.SetProgressHSort(const Value: Double);
begin
  if FProgressHSort <> Value then
  begin
    FProgressHSort := Value;
    lHeapSortTimeAndProgress.Caption := Format('Прогресс: %.1f %%', [FProgressHSort]);
    lHeapSortTimeAndProgress.Update;
  end;
end;
end.
