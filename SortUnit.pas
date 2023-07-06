unit SortUnit;

interface

  type TSort = class
    private
      procedure SiftDown(var A: System.TArray<Double>; i, j: Integer; reverse: Boolean);
      procedure Swap<T>(var A, B: T);
    protected
    public
      procedure qSort(var A: TArray<Double>; min, max: Integer; reverse: Boolean);
      //procedure BubbleSort(var A: System.TArray<Double>; min, max: Integer; reverse: Boolean);
      procedure PyramidSort(var A: System.TArray<Double>; min, max: Integer; reverse: Boolean);
  end;
implementation

uses MainForm;

procedure TSort.Swap<T>(var A, B: T);
var
  Temp: T;
begin
  Temp := A;
  A := B;
  B := Temp;
  Form1.UpdateView;
end;


procedure TSort.qSort(var A: TArray<Double>; min, max: Integer; reverse: Boolean);
var
  i, j: Integer;
  supp: Double;
begin
supp:=A[max-((max-min) div 2)];
i:=min; j:=max;
while i<j do
  begin
    if reverse then
    begin
      while A[i]>supp do
    begin
      i:=i+1;
    end;
    while A[j]<supp do
    begin
      j:=j-1;
    end;
    if i<=j then
      begin
        Swap(A[i], A[j]);
        i:=i+1; j:=j-1;
      end;
    Form1.ProgressQSort := min / max * 100;
    end
    else
    begin
      while A[i]<supp = not reverse do
    begin
      i:=i+1;
    end;
    while A[j]>supp = not reverse do
    begin
      j:=j-1;
    end;
    if i<=j then
    begin
      Swap(A[i], A[j]);
      i:=i+1; j:=j-1;
    end;
    Form1.ProgressQSort := i / max * 100;
    end;
  end;
if min<j then qSort(A, min, j, reverse);
if i<max then qSort(A, i, max, reverse);
end;

{
procedure TSort.BubbleSort(var A: System.TArray<Double>; min, max: Integer; reverse: Boolean);
var i, j: Integer;
  tmp: Double;
begin
Form1.ProgressBSort := 0;
for i:= min to max-1 do
begin
   for j := min to max - 1 - (i - min) do
   begin
     if A[j] > A[j+1] = not reverse then
       begin
         tmp := A[j]; A[j] := A[j+1]; A[j+1] := tmp;
         Form1.UpdateView;
       end;
   end;
   Form1.ProgressBSort := (i - min) / (max - min) * 100;
  end;
end;
}

procedure TSort.PyramidSort(var A: System.TArray<Double>; min, max: Integer;
  reverse: Boolean);
var
  i: Integer;
begin
  Form1.ProgressPSort := 0;
  for I := max div 2 downto min do
  begin
    SiftDown(A, i, Length(A), reverse);
  end;
  for I := max downto min + 1 do
  begin
    Swap(A[i], A[0]);
    SiftDown(A, 0, i, reverse);
    Form1.ProgressPSort := (max - i) / (max - min) * 100;
  end;
end;


procedure TSort.SiftDown(var A: System.TArray<Double>; i, j: Integer;
  reverse: Boolean);
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
    else if A[i * 2 + 1] > A[i * 2 + 2] = not reverse then
    begin
      maxChild := i * 2 + 1;
    end
    else
    begin
      maxChild := i * 2 + 2;
    end;
    if A[i] < A[maxChild] = not reverse then
    begin
      Swap(A[i], A[maxChild]);
      i := maxChild;
    end
    else
      done := True;
  end;
end;
end.
