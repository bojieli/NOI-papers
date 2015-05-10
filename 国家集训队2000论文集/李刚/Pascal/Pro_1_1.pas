Program Pro_1_1;                        	{�������㷨�����1�ĳ���}

Const
  Max           =300;				{��������}
  Inputfile     ='Input.Txt';			{�����ļ�}
  Outputfile    ='Output.Txt';			{����ļ�}
  Big           =1000000;			{�������}

Type
  Maps          =Array [1..Max] Of Integer;	{��ͼ����˵��}

Var
   Se           :Set Of Byte;			{һ����¼��δ���ʹ��ĳ��еļ���}
   Map          :Array[1..Max] Of ^maps;	{��ͼ����}
   Qiu,Pr       :Array[1..Max] Of Byte;		{���·��������}
   F            :Text;				{�ļ�����}
   Lp		:Integer;			{���·���ĳ�����}
   N,M       	:Integer;			{���������}
   Min          :Longint;			{���·���ĳ���}


 Procedure Init;				{��ʼ������}
 Var
   I,J,K,W      :Integer;
  Begin
     Assign(F,Inputfile);
     Reset(F);
        Readln(F,N,M);
        For I:=1 To N Do			{��������}
          Begin
            New(Map[I]);
            Fillchar(Map[I]^,Sizeof(Map[I]^),0);
          End;
        For I:=1 To M Do
          Begin
            Readln(F,J,K,W);
            Map[J]^[K]:=W;
          End;
     Close(F);
  End;

 Procedure Search(Dep:Byte;Al:Longint);		{Ѱ�����·��}
 Var
   I            :Byte;
   Begin
     If Al>=Min Then Exit;			{��֦����}
     If Qiu[Dep-1]=N Then			{����ȵ�ǰ��С����¼}
       Begin
         Min:=Al;
         Pr:=Qiu;
         Lp:=Dep-1;
       End
     Else
      For I:=2 To N Do				{��������û���ʹ��ĳ���}
       If (I In Se) And (Map[Qiu[Dep-1]]^[I]>0) Then
        Begin
          Exclude(Se,I);
          Qiu[Dep]:=I;
             Search(Dep+1,Al+Map[Qiu[Dep-1]]^[Qiu[Dep]]);
          Include(Se,I);
        End;
   End;

 Procedure Print;				{�������}
 Var
   I            :Integer;
  Begin
    Assign(F,Outputfile);
    Rewrite(F);
      Writeln(F,Min);
      For I:=1 To Lp Do
        Write(F,Pr[I],' ');
    Close(F);
  End;

Begin
  Init;						{��������}
  Se:=[2..N];					{����ֵ��ʼ��}
  Qiu[1]:=1;
  Min:=Big;
  Search(2,0);					{Ѱ�����·��}
  Print;					{���}
End.
