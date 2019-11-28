unit uTaskBase;

interface

uses
  SysUtils, Generics.Collections;

type
  TTaskState = (tsWait, tsDoing, tsDone);

  TTimeInfo = record
    Estimated: Double;    //计划时长
    Comsumed: Double;     //已消耗
    REmained: Double;     //剩余时长
  end;

  TTask = class
    ID: Integer; //任务ID
    Caption: string;
    Content: string;
    State: TTaskState; //任务状态
    TimeInfo: TTimeInfo;
  end;

  TTaskList = class(TObjectList<TTask>);

implementation

end.
