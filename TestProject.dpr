program TestProject;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form1},
  SortUnit in 'SortUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, frmMain);
  Application.Run;
end.
