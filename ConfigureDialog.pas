unit ConfigureDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TConfig = class(TForm)
    lblWorkTime: TLabel;
    lblRestTime: TLabel;
    edtWorkTime: TEdit;
    edtRestTime: TEdit;
    btnConfirm: TButton;
    btnCancel: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Config: TConfig;

implementation
uses
  uConfig, fsApplc;

{$R *.dfm}

procedure ShowConfig;
begin
  with TConfig.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

initialization
  AppSys.RegisterProc('Configure', ShowConfig)
end.
