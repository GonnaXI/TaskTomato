unit LogingDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TdlgLogin = class(TForm)
    lbUserName: TLabel;
    lbPassword: TLabel;
    ckSavePassword: TCheckBox;
    ckAutoLogin: TCheckBox;
    edtUserName: TEdit;
    edtPassword: TEdit;
    btnLogin: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtUserNameKeyPress(Sender: TObject; var Key: Char);
  private
    procedure LoadConfig;
    procedure SaveConfig;
  public
    { Public declarations }
  end;

var
  dlgLogin: TdlgLogin;

implementation

uses
  uConfig, fsApplc;

{$R *.dfm}

{ TdlgLogin }

procedure TdlgLogin.edtUserNameKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in [#8, '0'..'9', 'a'..'z' ]) then
  begin
    Key := #0;
    //ShowMessage('只能输入字母和数字的组合');
    MessageBox(0, '请输入字母和数字的组合', '提示', MB_OK);
  end;
end;

procedure TdlgLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveConfig;
end;

procedure TdlgLogin.FormCreate(Sender: TObject);
begin
  LoadConfig;
end;

procedure TdlgLogin.LoadConfig;
begin
  edtUserName.Text := AppConfig.LoginConfig.UserName;
  ckSavePassword.Checked := AppConfig.LoginConfig.SavePassword;
  if ckSavePassword.Checked then
    edtPassword.Text := AppConfig.LoginConfig.PassWord;
  ckAutoLogin.Checked := AppConfig.LoginConfig.AutoLogin;
end;

procedure TdlgLogin.SaveConfig;
begin
  AppConfig.LoginConfig.UserName := edtUserName.Text;
  AppConfig.LoginConfig.SavePassword := ckSavePassword.Checked;
  if ckSavePassword.Checked then
    AppConfig.LoginConfig.PassWord := edtPassword.Text;
  AppConfig.LoginConfig.AutoLogin := ckAutoLogin.Checked;
end;

procedure ShowLoginDlg;
begin
  with TdlgLogin.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

initialization
  AppSys.RegisterProc('Login', ShowLoginDlg)

end.
