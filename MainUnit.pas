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
    FCheckImg: TBitmap;
    FNoCheckImg: TBitmap;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

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
  frmTimer.Show;
end;

procedure TForm1.btnUserClick(Sender: TObject);
begin
  Appsys.CallProc('Login');
end;

procedure TForm1.FormCreate(Sender: TObject);
const
  SID = 'ID';
  SCaption = '标题';
  SState = '状态';
  SEstimated = '计划';
  SComsumed = '已消耗';
  SRemained = '剩余';
  SCheckState = '是否选中';
var
  bmp: TBitmap;
begin
  strngrdTodayTask.Cells[0, 0] := SID;
  strngrdTodayTask.Cells[1, 0] := SCaption;
  strngrdTodayTask.Cells[2, 0] := SState;
  strngrdTodayTask.Cells[3, 0] := SEstimated;
  strngrdTodayTask.Cells[4, 0] := SComsumed;
  strngrdTodayTask.Cells[5, 0] := SRemained;

  strngrdAllTask.Cells[0,0] := SCheckState;
  strngrdAllTask.Cells[1,0] := SID;
  strngrdAllTask.Cells[2,0] := SCaption;
  strngrdAllTask.Cells[3,0] := SState;
  strngrdAllTask.Cells[4,0] := SEstimated;
  strngrdAllTask.Cells[5,0] := SComsumed;
  strngrdAllTask.Cells[6,0] := SRemained;

  FCheckImg:= TBitmap.Create;
  FNoCheckImg:= TBitmap.Create;
  bmp:= TBitmap.Create;
  try
    bmp.handle := LoadBitmap(0, PChar(OBM_CHECKBOXES));
    With FNoCheckImg do
    Begin
      Width := bmp.Width div 4;
      Height := bmp.Height div 3;
      Canvas.CopyRect(Canvas.ClipRect, bmp.Canvas, Canvas.ClipRect);
    End;
    With FCheckImg do
    Begin
      Width := bmp.Width div 4;
      Height := bmp.Height div 3;
      Canvas.CopyRect(Canvas.ClipRect, bmp.Canvas, Rect(Width, 0, 2 * Width, Height));
    End;
  finally
    bmp.free
  end;
end;


procedure TForm1.strngrdAllTaskClick(Sender: TObject);
begin
  if (strngrdAllTask.Col = 0) and (strngrdAllTask.Row <> 0) then
  begin
    if strngrdAllTask.Cells[0, strngrdAllTask.Row] = 'yes' then
       strngrdAllTask.Cells[0, strngrdAllTask.Row] := 'no'
    else
      strngrdAllTask.Cells[0, strngrdAllTask.Row] := 'yes';
  end;

end;


procedure TForm1.strngrdAllTaskDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Str: String;
  R: TRect;
  X, Y: Integer;
begin
  if (ACol = 0) and (ARow <> 0) then
  begin
    if not (gdFixed in State) then
      with TStringGrid(Sender).Canvas do
      begin
        Brush.Color := clWindow;
        FillRect(Rect);
        X := (Rect.Right + Rect.Left - FCheckImg.Width) div 2;
        Y := (Rect.Bottom + Rect.Top - FCheckImg.Height) div 2;
        if strngrdAllTask.Cells[ACol, ARow] = 'yes' then
          Draw(X, Y, FCheckImg)
        else
          Draw(X, Y, FNoCheckImg);
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
        DT_CENTER or DT_SINGLELINE or DT_VCENTER); //文字居中
    end;

  end;

end;


procedure TForm1.strngrdTodayTaskDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Str: String;
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
        DT_CENTER or DT_SINGLELINE or DT_VCENTER); //文字居中
    end;

  end;
end;

end.
