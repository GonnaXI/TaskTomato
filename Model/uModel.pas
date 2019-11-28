unit uModel;

interface

uses
  Classes, Generics.Collections;

type
  TTaskState = (tsWait, tsDoing, tsDone);
  TTimeInfo = record
    Estimated: Double;    //�ƻ�ʱ��
    Comsumed: Double;     //������
    REmained: Double;     //ʣ��ʱ��
  end;

  TTask = class
    ID: Integer; //����ID
    State: TTaskState; //����״̬
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
