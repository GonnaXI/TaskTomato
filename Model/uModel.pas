unit uModel;

interface

uses
  Classes, SysUtils, Windows, Generics.Collections, uTaskBase, uPMSService;

type
  TLoginManager = class
    procedure Login;
  end;

  //负责管理所有Task相关的事务
  TTaskControler = class
  private
    FTaskListAll: TTaskList;
    FTaskListToday: TTaskList;
    FCurTaskIndex: Integer;
    function GetTask(Index: Integer): TTask;
  private
    FPMSService: IPMSService;
  public
    constructor Create();
    destructor Destroy; override;
  public
    procedure UpdateAllTasks;
    property CurTaskIndex: Integer read FCurTaskIndex write FCurTaskIndex;
    property Task[Index: Integer]: TTask read GetTask;
  end;

implementation

uses
  fsApplc;

{ TTaskControler }

constructor TTaskControler.Create;
begin
  FTaskListAll := TTaskList.Create;
  FTaskListToday := TTaskList.Create;
  FCurTaskIndex := -1;
  if Supports(Appsys, IPMSService, FPMSService) then
  begin
    OutputDebugString('PMSService 已创建');
  end;
end;

destructor TTaskControler.Destroy;
begin
  FPMSService := nil;
  FTaskListAll.Free;
  FTaskListToday.Free;
  inherited;
end;

function TTaskControler.GetTask(Index: Integer): TTask;
begin
  Result := FTaskListToday[Index];
end;

procedure TTaskControler.UpdateAllTasks;
begin
  FTaskListAll.Clear;
  FPMSService.GetTaskList(FTaskListAll);
end;

{ TLoginManager }

procedure TLoginManager.Login;
begin

end;

end.
