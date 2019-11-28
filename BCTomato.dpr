program BCTomato;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  uModel in 'Model\uModel.pas',
  uConfig in 'Model\uConfig.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
