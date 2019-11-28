unit uConfig;

interface

uses
  fsconfig;

type
  TLoginConfig = class(TXmlSubConfig)
  private
    FPassWord: string;
    FUserName: string;
    FAutoLogin: Boolean;
  published
    property UserName: string read FUserName write FUserName;
    property PassWorD: string read FPassWord write FPassWord;
    property AutoLogin: Boolean read FAutoLogin write FAutoLogin;
  end;

  TAppConfig = class(TXmlConfig)
  private
    FUserConfig: TLoginConfig;
  protected
    procedure Initialized; override;
  public
    property UserConfig: TLoginConfig read FUserConfig write FUserConfig;
  end;

implementation

{ TAppConfig }

procedure TAppConfig.Initialized;
begin
  inherited;

end;

end.
