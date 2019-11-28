unit uModel;

interface

uses
  Classes, Generics.Collections;

type
  TTaskState = (tsWait, tsDoing, tsDone);
  TTimeInfo = record
    Estimated: Double;    //计划时长
    Comsumed: Double;     //已消耗
    REmained: Double;     //剩余时长
  end;

  TTask = class
    ID: Integer; //任务ID
    State: TTaskState; //任务状态
    TimeInfo: TTimeInfo;
  end;

  TTaskList = class(TObjectList<TTask>);

  TTaskControler = class
  private
    FTaskList: TTaskList;
    FCurTaskIndex: Integer;
  public
    procedure UpdateTasks;
    property CurTaskIndex: Integer read FCurTaskIndex write FCurTaskIndex;
  end;

implementation

{ TTaskControler }

procedure TTaskControler.UpdateTasks;
begin

end;

end.
