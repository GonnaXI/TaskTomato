unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzTabs, ExtCtrls, RzButton, ImgList, uModel,
  dxGDIPlusClasses;

type
  TForm1 = class(TForm)
    tbTask: TRzTabControl;
    ImageList1: TImageList;
    btnSetting: TRzToolButton;
    btnUser: TRzToolButton;
    btnStart: TRzToolButton;
    procedure btnUserClick(Sender: TObject);
  private
    FTaskControl: TTaskControler;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  fsApplc, uConfig;

{$R *.dfm}

procedure TForm1.btnUserClick(Sender: TObject);
begin
  Appsys.CallProc('Login');
end;

end.
