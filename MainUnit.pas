unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzTabs, ExtCtrls, RzButton, ImgList, uModel,
  dxGDIPlusClasses, Grids, ComCtrls;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    btnSetting: TRzToolButton;
    btnUser: TRzToolButton;
    btnStart: TRzToolButton;
    pgcTask: TPageControl;
    tsTodayTask: TTabSheet;
    tsAllTask: TTabSheet;
    strngrdTodayTask: TStringGrid;
    strngrdAllTask: TStringGrid;
    procedure btnUserClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnSettingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure strngrdAllTaskClick(Sender: TObject);
    procedure strngrdAllTaskDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strngrdTodayTaskDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);

  private
    FTaskControl: TTaskControler;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FCheck,FNoCheck: tbitmap;

implementation

uses
  fsApplc, uConfig, timer, ConfigureDialog;

{$R *.dfm}

procedure TForm1.btnSettingClick(Sender: TObject);
begin
  Appsys.CallProc('Configure');
end;

procedure TForm1.btnStartClick(Sender: TObject);
begin
  if frmTimer = nil then
    frmTimer := TfrmTimer.Create(nil);
  frmTimer.show;
end;

procedure TForm1.btnUserClick(Sender: TObject);
begin
  Appsys.CallProc('Login');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  bmp: TBitmap;
begin
  strngrdTodayTask.Cells[0, 0] := 'ID';
  strngrdTodayTask.Cells[1, 0] := '����';
  strngrdTodayTask.Cells[2, 0] := '״̬';
  strngrdTodayTask.Cells[3, 0] := '�ƻ�';
  strngrdTodayTask.Cells[4, 0] := '������';
  strngrdTodayTask.Cells[5, 0] := 'ʣ��';

  strngrdAllTask.Cells[0,0] := '�Ƿ�ѡ��';
  strngrdAllTask.Cells[1,0] := 'ID';
  strngrdAllTask.Cells[2,0] := '����';
  strngrdAllTask.Cells[3,0] := '״̬';
  strngrdAllTask.Cells[4,0] := '�ƻ�';
  strngrdAllTask.Cells[5,0] := '������';
  strngrdAllTask.Cells[6,0] := 'ʣ��';

  FCheck:= TBitmap.Create;
  FNoCheck:= TBitmap.Create;
  bmp:= TBitmap.Create;
  try
    bmp.handle := LoadBitmap(0, PChar(OBM_CHECKBOXES));
    With FNoCheck do
    Begin
      Width := bmp.Width div 4;
      Height := bmp.Height div 3;
      Canvas.CopyRect(Canvas.Cliprect, bmp.Canvas, Canvas.Cliprect);
    End;
    With FCheck do
    Begin
      Width := bmp.Width div 4;
      Height := bmp.Height div 3;
      Canvas.copyrect(Canvas.Cliprect, bmp.Canvas, Rect(Width, 0, 2*Width, Height));
    End;
  finally
    bmp.free
  end;

end;


procedure TForm1.strngrdAllTaskClick(Sender: TObject);
begin
  if (strngrdAllTask.Col = 0) and(strngrdAllTask.Row <> 0) then
  begin
    if strngrdAllTask.Cells[strngrdAllTask.Col, strngrdAllTask.Row] = 'yes' then
       strngrdAllTask.Cells[strngrdAllTask.Col, strngrdAllTask.Row] := 'no'
    else
      strngrdAllTask.Cells[strngrdAllTask.Col, strngrdAllTask.Row] := 'yes';
  end;

end;


procedure TForm1.strngrdAllTaskDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  str: String;
  R: TRect;
begin
  if (ACol = 0) and (ARow <> 0) then
  begin
    if not (gdFixed in State) then
      with TStringGrid(Sender).Canvas do
      begin
        Brush.Color := clWindow;
        FillRect(Rect);
        if strngrdAllTask.Cells[ACol, ARow] = 'yes' then
          Draw((Rect.Right + Rect.Left - FCheck.Width) div 2,
            (Rect.Bottom + Rect.Top - Fcheck.Height) div 2, FCheck)
        else
          Draw((Rect.Right + Rect.Left - FCheck.Width) div 2,
            (Rect.Bottom + Rect.Top - Fcheck.Height) div 2, FNoCheck);
      end;
  end;

  if (ARow = 0) and (ACol <> 0)then
  begin
    with strngrdAllTask do
    begin
      Canvas.FillRect(Rect);
      Str := Cells[ACol,ARow];
      R := Rect;
      DrawText(Canvas.Handle, PChar(Str), Length(Str), R,
        DT_CENTER or DT_SINGLELINE or DT_VCENTER); //���־���
    end;

  end;

end;


procedure TForm1.strngrdTodayTaskDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  str: String;
  R: TRect;
begin
  if (ARow = 0) and (ACol <> 0) then
  begin
    with strngrdTodayTask do
    begin
      Canvas.FillRect(Rect);
      Str := Cells[ACol,ARow];
      R := Rect;
      DrawText(Canvas.Handle, PChar(Str), Length(Str), R,
        DT_CENTER or DT_SINGLELINE or DT_VCENTER); //���־���
    end;

  end;
end;

end.
