unit SortUnit;

interface

uses System.Classes, Generics.Collections, System.Diagnostics;

  type
  TSortThread = class(TThread)
  private
    FArray: TArray<Double>;
    FMin, FMax: Integer;
    FReverse: Boolean;
    FStopWatch : TStopWatch;
    procedure Swap<T>(var A, B: T);
  public
    constructor Create(Values: TArray<Double>; Min, Max: Integer; Reverse: Boolean);
    procedure Execute; override;
    procedure Sort; virtual; abstract;
  end;
  TQuickSort = class(TSortThread)
    procedure Sort; override;
  end;
  THeapSort = class(TSortThread)
    procedure Sort; override;
  end;

implementation

uses MainForm;

constructor TSortThread.Create(Values: TArray<Double>; Min, Max: Integer; Reverse: Boolean);
begin
  FArray := Values;
  FMin := Min;
  FMax := Max;
  FReverse := Reverse;
  FStopWatch := TStopWatch.Create;
  inherited Create(True);
end;

procedure TSortThread.Swap<T>(var A, B: T);
var
  Temp: T;
begin
  Temp := A;
  A := B;
  B := Temp;
  Sleep(5);
  Synchronize(frmMain.UpdateView);
end;

procedure TSortThread.Execute;
begin
  FStopWatch.Start;
  Sort;
  FStopWatch.Stop;
end;

{ TQuickSort }
procedure TQuickSort.Sort;
  procedure UpdateTime;
  begin
    Synchronize(procedure begin
      frmMain.QSTimeRun := FStopWatch.ElapsedMilliseconds;
    end);
  end;
  procedure QuickSort(const min, max: Integer);
  var
    i, j: Integer;
    supp: Double;
  begin
    supp:=FArray[max - ((max - min) div 2)];
    i:=min; j:=max;
    while i<j do
      begin
        if FReverse then
        begin
          while FArray[i]>supp do
          begin
            Inc(i);
            UpdateTime;
          end;
          while FArray[j]<supp do
          begin
            Dec(j);
            UpdateTime;
          end;
          if i<=j then
          begin
            Swap(FArray[i], FArray[j]);
            Inc(i); Dec(j);
          end;
        end
        else
        begin
          while FArray[i]<supp do
          begin
            Inc(i);
            UpdateTime;
          end;
          while FArray[j]>supp do
          begin
            Dec(j);
            UpdateTime;
          end;
          if i<=j then
          begin
            Swap(FArray[i], FArray[j]);
            Inc(i); Dec(j);
          end;
        end;
      end;
    if min<j then QuickSort(min, j);
    if i<max then QuickSort(i, max);
  end;
begin
  QuickSort(FMin, FMax);
  UpdateTime;
end;

{ THeapSort }
procedure THeapSort.Sort;
  procedure SiftDown(i, j: Integer);
  var
    done: Boolean;
    maxChild: Integer;
  begin
    done := False;
    while (i * 2 + 1 < j) and not done do
    begin
      if i * 2 + 1 = j - 1 then
      begin
        maxChild := i * 2 + 1
      end
      else if FArray[i * 2 + 1] > FArray[i * 2 + 2] = not FReverse then
      begin
        maxChild := i * 2 + 1;
      end
      else
      begin
        maxChild := i * 2 + 2;
      end;
      if FArray[i] < FArray[maxChild] = not FReverse then
      begin
        Swap(FArray[i], FArray[maxChild]);
        i := maxChild;
      end
      else
        done := True;
    end;
  end;
var
  i: Integer;
begin
  frmMain.ProgressPSort := 0;
  for I := FMax div 2 downto FMin do
  begin
    SiftDown(i, Length(FArray));
  end;
  for I := FMax downto FMin + 1 do
  begin
    Swap(FArray[i], FArray[0]);
    SiftDown(0, i);
    frmMain.ProgressPSort := (FMax - i) / (FMax - FMin) * 100;
  end;
  frmMain.HSTimeRun := FStopWatch.ElapsedMilliseconds;
end;

end.
