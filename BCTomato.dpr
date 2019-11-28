program BCTomato;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  uModel in 'Model\uModel.pas',
  uConfig in 'Model\uConfig.pas',
  uAppEnv in 'uAppEnv.pas',
  uPMSService in 'PMSService\uPMSService.pas',
  uTaskBase in 'Base\uTaskBase.pas',
  TomatoTimer in 'TomatoTimer.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  InitiApp;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
