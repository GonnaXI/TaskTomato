unit uTaskBase;

interface

uses
  SysUtils, Generics.Collections;

type
  TTaskState = (tsWait, tsDoing, tsDone);

  TTimeInfo = record
    Estimated: Double;    //�ƻ�ʱ��
    Comsumed: Double;     //������
    REmained: Double;     //ʣ��ʱ��
  end;

  TTask = class
    ID: Integer; //����ID
    Caption: string;
    Content: string;
    State: TTaskState; //����״̬
    TimeInfo: TTimeInfo;
  end;

  TTaskList = class(TObjectList<TTask>);

implementation

end.
