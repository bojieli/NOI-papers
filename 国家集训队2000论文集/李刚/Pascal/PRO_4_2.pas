Program Pro_4_2;					{��4�������㷨}

Const
 Map:Array['A'..'G','A'..'G'] Of Byte=			{ÿ����ũ��֮��ľ���}	
     ((0,56,43,71,35,41,36),
      (56,0,54,58,36,79,31),
      (43,54,0,30,20,31,58),
      (71,58,30,0,38,59,75),
      (35,36,20,38,0,44,67),
      (41,79,31,59,44,0,72),
      (36,31,58,75,67,72,0));

 Inputfile        ='Input.Txt';				{�����ļ���}
 Outputfile       ='Output.Txt';			{����ļ���}


Var
  F               :Text;				{�ļ�����}
  N               :Integer;				{�������Ŀ}
  Min             :Word;				{��̾���}
  Wu              :Array[0..12,1..2] Of Char;		{��¼���������}
  Dis             :Array[0..12,0..12] Of Integer;	{��¼ÿ�������������Ȩֵ}
  Qiu,Pr          :Array[0..14] Of Byte;		{�����еļ�¼����}
  Se              :Set Of Byte;				{δ��ɵ�����ļ���}

 Procedure Init;					{��ʼ������}
 Var
   I              :Integer;
   Ch             :Char;
  Begin
    Assign(F,Inputfile);
    Reset(F);
       Readln(F,N);					{��������}
       For I:=1 To N Do
       Readln(F,Wu[I,1],Ch,Wu[I,2]);
    Close(F);
  End;

 Procedure Prepare;					{׼������}
  Var
    I,J            :Integer;
    Begin
      Wu[0,1]:='A';Wu[0,2]:='A';			{���ÿ�������������Ȩֵ}
      For I:=0 To N Do			
        For J:=0 To N Do
          Dis[I,J]:=Map[Wu[I,2],Wu[J,1]];
    End;

 Procedure Search(Dep:Byte;Al:Word);			{�������ŵ�·��}
 Var
    I              :Byte;
   Begin
     If Al>=Min Then Exit;
     If Dep=N+1 Then
       Begin
           If Dis[Qiu[N],0]+Al<Min Then
            Begin
             Min:=Dis[Qiu[N],0]+Al;			{�������,��¼֮}
             Pr:=Qiu;
           End;
       End
     Else
      For I:=1 To N Do					{����ÿ��δ���ʵ�ũ��}
        If I In Se Then
          Begin
            Qiu[Dep]:=I;
            Exclude(Se,I);
             Search(Dep+1,Al+Dis[Qiu[Dep-1],I]);
            Include(Se,I);
          End;
   End;

  Procedure Print;					{������}
  Var
      I            :Byte;
   Begin
    For I:=1 To N Do
     Inc(Min,Map[Wu[I,1],Wu[I,2]]);
    Assign(F,Outputfile);
    Rewrite(F);
       Writeln(F,Min);
       Write(F,'A ');
       For I:=1 To N Do
         Begin
            If Wu[Pr[I-1],2]<>Wu[Pr[I],1] Then Write(F,Wu[Pr[I],1],' ');
            Write(F,Wu[Pr[I],2],' ');
         End;
       If 'A'<>Wu[Pr[N],2] Then Write(F,'A');
    Close(F);
   End;

Begin
 Init;         		{��ʼ��}
 Prepare;		{׼��}
 Se:=[1..12];		{��ʼ����������Ӧ��ֵ}
 Qiu[0]:=0;
 Min:=60000;
 Search(1,0);		{����}
 Print;			{���}
End.
