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
    procedure seLengthSeqChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnGenerateSeqClick(Sender: TObject);
    procedure BtnQuickSortSeqClick(Sender: TObject);
    procedure BtnHeapSortSeqClick(Sender: TObject);
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
  NumSeq : TArray<Double>;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FLengthSeq := 0;
  LengthSeq := 1;
  BtnQuickSortSeq.Enabled := False;
  BtnHeapSortSeq.Enabled := False;
  BtnReverseQuickSortSeq.Enabled := False;
  BtnReverseHeapSortSeq.Enabled := False;
  Series1.Clear;
end;

procedure TForm1.BtnGenerateSeqClick(Sender: TObject);
begin
  NumSeq := nil;
  BtnQuickSortSeq.Enabled := True;
  BtnHeapSortSeq.Enabled := True;
  BtnReverseQuickSortSeq.Enabled := True;
  BtnReverseHeapSortSeq.Enabled := True;
  SetLength(NumSeq, LengthSeq);
  var Temp: Double;
  for var I := 0 to LengthSeq-1 do
  begin
    Temp := Random*10000;
    NumSeq[I] := Temp;
  end;
  UpdateView;
end;

procedure TForm1.UpdateView;
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

procedure TForm1.BtnQuickSortSeqClick(Sender: TObject);
begin
  SortThread := TQuickSort.Create(NumSeq, 0, High(NumSeq), (Sender as TButton).Tag = 1);
  SortThread.Start;
end;

procedure TForm1.BtnHeapSortSeqClick(Sender: TObject);
begin
  SortThread := THeapSort.Create(NumSeq, 0, High(NumSeq), (Sender as TButton).Tag = 1);
  SortThread.Start;
end;

procedure TForm1.seLengthSeqChange(Sender: TObject);
begin
  LengthSeq := seLengthSeq.Value;
end;

procedure TForm1.SetLengthSeq(const Value: Integer);
begin
  if FLengthSeq <> Value then
  begin
    FLengthSeq := Value;
    seLengthSeq.Value := FLengthSeq;
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
    lQuickSortTimeAndProgress.Caption := Format('Время: %d s %d ms', [TimeRun div 1000, TimeRun mod 1000]);
  end;
end;

procedure TForm1.SetProgressQSort(const Value: Double);
begin
  if FProgressQSort <> Value then
  begin
    FProgressQSort := Value;
    lQuickSortTimeAndProgress.Caption := Format('Прогресс: %.1f %%', [FProgressQSort]);
    lQuickSortTimeAndProgress.Update;
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
    lHeapSortTimeAndProgress.Caption := Format('Время: %d s %d ms', [TimeRun div 1000, TimeRun mod 1000]);
  end;
end;

procedure TForm1.SetProgressPSort(const Value: Double);
begin
  if FProgressPSort <> Value then
  begin
    FProgressPSort := Value;
    lHeapSortTimeAndProgress.Caption := Format('Прогресс: %.1f %%', [FProgressPSort]);
    lHeapSortTimeAndProgress.Update;
  end;
end;
end.
