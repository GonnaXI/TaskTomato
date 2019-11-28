unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzTabs, ExtCtrls, RzButton, ImgList, uModel;

type
  TForm1 = class(TForm)
    RzTabControl1: TRzTabControl;
    Image1: TImage;
    ImageList1: TImageList;
    RzToolButton1: TRzToolButton;
  private
    FTaskControl: TTaskControler;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
