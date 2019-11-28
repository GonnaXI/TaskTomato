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
    FLoginConfig: TLoginConfig;
  protected
    procedure Initialize; override;
  public
    property LoginConfig: TLoginConfig read FLoginConfig write FLoginConfig;
  end;

var
  AppConfig: TAppConfig;

implementation

{ TAppConfig }

procedure TAppConfig.Initialize;
begin
  inherited;

end;

end.
