unit Timer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmTimer = class(TForm)
    tmr_work: TTimer;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    btnClsoe: TButton;
    Button3: TButton;
    tmr_rest: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure tmr_workTimer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnClsoeClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmr_restTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  var
    FWork_Time, FRest_Time: Integer;
    //工作与休息状态标识符
    FWork_Flag, FRest_Flag: Integer;
    //实际工作与休息时间分 秒
    FWork_mm, FRest_mm, FWork_ss, FRest_ss: Integer;
    //界面显示的 工作与休息时间分 秒
    FWork_M, FWork_S: String;
    FRest_M, FRest_S: String;
    procedure LoadConfig;
  public
    { Public declarations }
  end;

var
  frmTimer: TfrmTimer;


implementation

uses
  uconfig, fsApplc;

{$R *.dfm}

//状态分类说明： 工作倒计时时       FWork_Flag = 1, FRest_Flag = 0
//               休息倒计时         FWork_Flag = 0, FRest_Flag = 1
//               休息前空闲状态     FWork_Flag = 0, FRest_Flag = 2
//               工作前空闲状态     FWork_Flag = 2, FRest_Flag = 1

procedure TfrmTimer.btnClsoeClick(Sender: TObject);
begin
  //frmTimer.free;
  FreeAndNil(frmTimer);
  close;
end;

procedure TfrmTimer.Button1Click(Sender: TObject);
begin
  //Appconfig.WorkTime :=  StrToInt(InputBox('设置番茄时间', '请输入工作时长', ''));
  //Appconfig.WorkTime :=  StrToInt(InputBox('设置番茄时间', '请输入休息时长', ''));
  //Work_Time :=  StrToInt(InputBox('设置番茄时间', '请输入工作时长', ''));
  //Rest_Time :=  StrToInt(InputBox('设置番茄时间', '请输入休息时长', ''));

  if ((FWork_Time > 0) and (FWork_Time <= 60)) and ((FRest_Time > 0) and (FRest_Time <= 60)) then
  begin
    tmr_work.Enabled := True;
    FWork_Flag := 1;
    FRest_Flag := 0;
    FWork_mm := FWork_Time;
    FRest_mm := FRest_Time;
    FWork_ss := 0;
    FRest_ss := 0;
  end
  else
  begin
    Showmessage('输入时间非0到60整数,退出系统！');
    Application.Terminate;
  end;

end;

procedure TfrmTimer.Button2Click(Sender: TObject);
var
  str : string;
begin
  str := 'OK/Cancel';
  if FWork_Flag = 1 then
    tmr_work.Enabled := not tmr_work.Enabled;
  if FRest_Flag = 1 then
    tmr_rest.Enabled := not tmr_rest.Enabled;
  if  (FRest_Flag = 2) then
    if InputQuery('空闲状态', '是否进入休息倒计时', str) then
    begin
      Fwork_Flag := 0;
      FRest_Flag := 1;
      tmr_rest.Enabled := True;
    end;

end;



procedure TfrmTimer.FormCreate(Sender: TObject);
begin
  Label1.Caption := '空闲状态';
  FWork_Flag := 2;
  FRest_Flag := 0;
  LoadConfig;

end;

//实现无边框窗口可拖动
procedure TfrmTimer.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssLeft in shift) then
  begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, $F012, 0);
  end;
end;

procedure TfrmTimer.LoadConfig;
begin
  FWork_Time := AppConfig.WorkTime;
  FRest_Time := AppConfig.RestTime;
end;

procedure TfrmTimer.tmr_restTimer(Sender: TObject);
begin
  FRest_ss := FRest_ss - 1;

  if FRest_ss < 0  then
  begin
    FRest_mm := FRest_mm - 1;
    FRest_ss := 59;
  end;

  if FRest_ss < 10 then
    FRest_S := '0' + IntToStr(FRest_ss)
  else
    FRest_S := IntToStr(FRest_ss);

  if FRest_mm < 10 then
    FRest_M := '0' + IntToStr(FRest_mm)
  else
    FRest_M := IntToStr(FRest_mm);

  if ((FRest_M = '00') and (FRest_S = '00')) then
  begin
    tmr_rest.Enabled := False;
    FRest_Flag := 0;
    Label1.Caption := '计时结束了';
  end
  else
    Label1.Caption := FRest_M + ' : ' + FRest_S;
    Label1.Font.Color := $FF00000;
end;

procedure TfrmTimer.tmr_workTimer(Sender: TObject);
var
  str : String;
begin

  FWork_ss := FWork_ss - 1;
  if FWork_ss < 0  then
  begin
    FWork_mm := FWork_mm - 1;
    FWork_ss := 59;
  end;

  if FWork_ss < 10 then
    FWork_S := '0' + IntToStr(FWork_ss)
  else
    FWork_S := IntToStr(FWork_ss);

  if FWork_mm < 10 then
    FWork_M := '0' + IntToStr(FWork_mm)
  else
    FWork_M := IntToStr(FWork_mm);

  if (FWork_M = '00') and (FWork_S = '00') then
  begin
    str := 'OK/Cancel';
    tmr_work.Enabled := False;
    Label1.Caption := '空闲状态';
    if InputQuery('工作倒计时结束', '是否进入休息倒计时', str) then
    begin
      Fwork_Flag := 0;
      FRest_Flag := 1;
      tmr_rest.Enabled := True;
    end
    else
    begin
      Fwork_Flag := 0;
      FRest_Flag := 2;
    end;

  end
  else
    Label1.Caption := FWork_M + ' : ' + FWork_S;
end;

end.
