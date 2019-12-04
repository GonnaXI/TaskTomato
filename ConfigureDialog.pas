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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadConfig;
    procedure SaveConfig;
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

{ TConfig }

procedure TConfig.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveConfig;
end;

procedure TConfig.FormCreate(Sender: TObject);
begin
  LoadConfig;
end;

procedure TConfig.LoadConfig;
begin
  edtWorkTime.Text := IntToStr(AppConfig.WorkTime);
  edtRestTime.Text := IntToStr(AppConfig.RestTime);
end;

procedure TConfig.SaveConfig;
begin
  AppConfig.WorkTime := StrToInt(edtWorkTime.Text);
  AppConfig.RestTime := StrToInt(edtRestTime.Text);
end;

initialization
  AppSys.RegisterProc('Configure', ShowConfig)
end.
