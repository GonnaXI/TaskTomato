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
  end;

  TDemoPMSService = class(TInterfacedObject, IPMSService)
  public
    function GetTaskListAll(ATaskList: TTaskList): Boolean;
    procedure ModifyTask(TaskID: Integer; TaskInfo: TTask);
    procedure Loggin(UserName: string; PassWord: string);
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  fsApplc;


{ TDemoPMSService }

constructor TDemoPMSService.Create;
begin

end;

destructor TDemoPMSService.Destroy;
begin

  inherited;
end;

function TDemoPMSService.GetTaskListAll(ATaskList: TTaskList): Boolean;
begin
  Result := False;


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
