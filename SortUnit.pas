unit SortUnit;

interface

  type TSort = class
    private
    protected
    public
      procedure qSort(var A: TArray<Double>; min, max: Integer; reverse: Boolean = False);
      procedure BubbleSort(var A: System.TArray<Double>; min, max: Integer; reverse: Boolean = False);
  end;
implementation

uses MainForm;

procedure TSort.qSort(var A: TArray<Double>; min, max: Integer; reverse: Boolean = False);
var
  i, j: Integer;
  supp, tmp: Double;
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
        tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
        i:=i+1; j:=j-1;
        Form1.UpdateView;
        //Form1.ProgressQSort := 100 - (j - i) / (max - min) * 100;
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
        tmp:=A[i]; A[i]:=A[j]; A[j]:=tmp;
        i:=i+1; j:=j-1;
        Form1.UpdateView;
      end;
    Form1.ProgressQSort := i / max * 100;
    end;
  end;
if min<j then qSort(A, min, j, reverse);
if i<max then qSort(A, i, max, reverse);
end;

procedure TSort.BubbleSort(var A: System.TArray<Double>; min, max: Integer; reverse: Boolean = False);
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

end.
