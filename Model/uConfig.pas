unit uConfig;

interface

uses
  fsConfig, NativeXml;

type
  TLoginConfig = class(TXmlSubConfig)
  private
    FPassWord: string;
    FUserName: string;
    FAutoLogin: Boolean;
    FSavePassword: Boolean;
  private
    function Encript(Src: string): string;
    function Decode(Src: string): string;
  protected
    procedure LoadFromXmlNode(ANode: TXmlNode); override;
    procedure SaveToXmlNode(ANode: TXmlNode); override;
  public
    property PassWord: string read FPassWord write FPassWord;
  published
    property UserName: string read FUserName write FUserName;
    property AutoLogin: Boolean read FAutoLogin write FAutoLogin;
    property SavePassword: Boolean read FSavePassword write FSavePassword;
  end;

  TAppConfig = class(TXmlConfig)
  private
    FLoginConfig: TLoginConfig;
    FWorkTIme: Integer;
    FRestTime: Integer;
  protected
    procedure Initialize; override;
  public
    property LoginConfig: TLoginConfig read FLoginConfig write FLoginConfig;
  published
    property WorkTime: Integer read FWorkTime write FWorkTime;   //seconds
    property RestTime: Integer read FRestTime write FRestTime;
  end;

var
  AppConfig: TAppConfig;

implementation

{ TAppConfig }

procedure TAppConfig.Initialize;
begin
  inherited;
  AddSubConfig('Login', TLoginConfig, FLoginConfig);
  FWorkTIme := 2;
  FRestTime := 1;

end;

{ TLoginConfig }

function TLoginConfig.Decode(Src: string): string;
begin

end;

function TLoginConfig.Encript(Src: string): string;
begin

end;

procedure TLoginConfig.LoadFromXmlNode(ANode: TXmlNode);
var
  Attr: TsdAttribute;
begin
  inherited;
  Attr := ANode.AttributeByName['Password'];
  if Attr <> nil then
    FPassWord := Decode(Attr.ValueUnicode);
end;

procedure TLoginConfig.SaveToXmlNode(ANode: TXmlNode);
var
  EncriptStr: string;
  Attr: TsdAttribute;
begin
  inherited;
  EncriptStr := Encript(FPassWord);  //
  Attr := ANode.AttributeByName['Password'];
  if Attr = nil then
  begin
    ANode.AttributeAdd('Password', EncriptStr);
  end
  else
    Attr.ValueUnicode := EncriptStr;
end;

end.
