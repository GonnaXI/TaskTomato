unit uPMSService;

interface

uses
  uTaskBase;

type
  IPMSService = interface
  ['{99CC4D78-D16C-4F21-9DA9-41F5E84144C2}']
    function GetTaskListAll(ATaskList: TTaskList): Boolean;
    procedure ModifyTask(TaskID: Integer; TaskInfo: TTask);
    procedure Loggin(UserName: string; PassWord: string);
    function Connected: Boolean;
  end;

  TDemoPMSService = class(TInterfacedObject, IPMSService)
  private
    function CreateTask(AID: Integer; ACaption: string): TTask;
  public
    function GetTaskListAll(ATaskList: TTaskList): Boolean;
    procedure ModifyTask(TaskID: Integer; TaskInfo: TTask);
    procedure Loggin(UserName: string; PassWord: string);
    function Connected: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  fsApplc;


{ TDemoPMSService }

function TDemoPMSService.Connected: Boolean;
begin

end;

constructor TDemoPMSService.Create;
begin

end;

function TDemoPMSService.CreateTask(AID: Integer; ACaption: string): TTask;
begin
  Result := TTask.Create;
  Result.ID := AID;
  Result.Caption := ACaption;
end;

destructor TDemoPMSService.Destroy;
begin

  inherited;
end;

function TDemoPMSService.GetTaskListAll(ATaskList: TTaskList): Boolean;
var
  Task: TTask;
begin
  Task := CreateTask(1001, '任务1');
  ATaskList.Add(Task);
  Task := CreateTask(2001, '任务2');
  ATaskList.Add(Task);
  Task := CreateTask(3001, '任务3');
  ATaskList.Add(Task);
  Task := CreateTask(4001, '任务4');
  ATaskList.Add(Task);
  Task := CreateTask(5001, '任务5');
  ATaskList.Add(Task);
end;

procedure TDemoPMSService.Loggin(UserName, PassWord: string);
begin

end;

procedure TDemoPMSService.ModifyTask(TaskID: Integer; TaskInfo: TTask);
begin

end;

initialization
  AppSys.RegisterService(IPMSService, TDemoPMSService.Create);

end.
