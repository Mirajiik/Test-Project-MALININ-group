unit SortUnit;

interface



  type TSort = class
    private
    protected
    public
      procedure qSort(var A: TArray<Double>; min, max: Integer);
      procedure BubbleSort(var A: TArray<Double>; min, max: Integer);
  end;
implementation

uses MainForm;

procedure TSort.qSort(var A: TArray<Double>; min, max: Integer);
var
  i, j: Integer;
  supp, tmp: Double;
begin
supp:=A[max-((max-min) div 2)];
i:=min; j:=max;
while i<j do
  begin
    while A[i]<supp do
    begin
      i:=i+1;
      Form1.ProgressSort := 100 - (j - i) / (max - min) * 100;
    end;
    while A[j]>supp do
    begin
      j:=j-1;
      Form1.ProgressSort := 100 - (j - i) / (max - min) * 100;
    end;
    if i<=j then
      begin
        tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
        i:=i+1; j:=j-1;
        Form1.UpdateView;
        Form1.ProgressSort := 100 - (j - i) / (max - min) * 100;
      end;
  end;
if min<j then qSort(A, min, j);
if i<max then qSort(A, i, max);
end;

procedure TSort.BubbleSort(var A: System.TArray<Double>; min, max: Integer);
var i, j: Integer;
  tmp: Double;
begin
for i:= min to max-1 do
begin
   for j := min to max - 1 - (i - min) do
   begin
     if A[j] > A[j+1] then
       begin
         tmp := A[j]; A[j] := A[j+1]; A[j+1] := tmp;
         Form1.UpdateView;
       end;
   end;
   Form1.ProgressSort := (i - min) / (max - min) * 100;
  end;
end;

end.
