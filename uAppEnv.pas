unit uAppEnv;

interface

uses
  SysUtils, Windows, uConfig;

procedure InitiApp;

procedure FinitApp;

implementation

const
  AppConfigName: string = 'App.config';


procedure InitiApp;
var
  Path: string;
begin
  if AppConfig = nil then
  begin
    Path := ParamStr(0) + AppConfigName;
    AppConfig := TAppConfig.Create(Path);
  end;
end;

procedure FinitApp;
begin
  AppConfig.SaveConfig;
  FreeAndNil(AppConfig);
end;


end.
