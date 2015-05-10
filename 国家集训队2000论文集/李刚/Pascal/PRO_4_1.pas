Program Pro_4_1;				       {��4�Ķ�̬�滮�㷨}
Const
 Map:Array['A'..'G','A'..'G'] Of Byte=		       {ÿ����ũ��֮��ľ���}
    ((0,56,43,71,35,41,36),
     (56,0,54,58,36,79,31),
     (43,54,0,30,20,31,58),
     (71,58,30,0,38,59,75),
     (35,36,20,38,0,44,67),
     (41,79,31,59,44,0,72),
     (36,31,58,75,67,72,0));

 Inputfile           ='Input.Txt';			{�����ļ���}
 Outputfile          ='Output.Txt';			{����ļ���}

Type
  Kus                =Array[0..4095] Of Word;		{Ȩֵ��������˵��}
  Dirs               =Array[0..4095] Of Byte;		{�����������˵��}
  Ses                =Set Of 1..12;			{��������}

Var
  F                 :Text;				{�ļ�����}
  N                 :Integer;				{������Ŀ}
  Wu                :Array[0..12,1..2] Of Char;		{��¼���������}
  Dis               :Array[0..12,0..12] Of Integer;	{ÿ������������ӷ���}
  Ku                :Array[1..12] Of ^kus;		{��̬�滮�м�¼Ȩֵ������}
  Dir               :Array[1..12] Of ^dirs;		{��̬�滮�ı������}

 Procedure Init;					{��ʼ������}
 Var
   I                :Integer;
   Ch               :Char;
  Begin
    Assign(F,Inputfile);
    Reset(F);
       Readln(F,N);
       For I:=1 To N Do					{��������}
          Readln(F,Wu[I,1],Ch,Wu[I,2]);
    Close(F);
  End;

 Procedure Prepare;					{׼������}
  Var
    I,J             :Integer;
    Begin
      Wu[0,1]:='A';Wu[0,2]:='A';			{���ÿ������������ӷ���}
      For I:=0 To N Do
        For J:=0 To N Do
          Dis[I,J]:=Map[Wu[I,2],Wu[J,1]];
    End;

 Procedure Main;					{��̬�滮����}
 Var
   Last,I,K,What    :Word;
   S                :Ses;

     Function Num(S:Ses):Word;				{������ת��Ϊ�����ĺ���}
      Var
        X           :Word Absolute S;
        Begin
           Num:=X Div 2;
        End;

     Procedure Did(Dep,From:Byte;S:Ses);		{Ϊ��̬�滮�м�¼Ȩֵ�����鸳ֵ}     
       Var
        I           :Byte;
       Begin
         If Dep>K Then
           Begin
             For I:=1 To N Do
              If (I In S) And (Ku[I]^[Num(S-[I])]+Dis[What,I]<Ku[What]^[Num(S)]) Then
                Begin      				{�����С���ı�����Ȩֵ���ʾ����}
                  Ku[What]^[Num(S)]:=Ku[I]^[Num(S-[I])]+Dis[What,I];
                  Dir[What]^[Num(S)]:=I;
                End;
           End
         Else
           For I:=From+1 To N Do
             If I<>What Then
                Did(Dep+1,I,S+[I]);
       End;

  Begin
    For I:=1 To N Do					{��ʼ����̬�滮��¼����}
      Begin
        New(Ku[I]);
        New(Dir[I]);
        Fillchar(Ku[I]^,Sizeof(Ku[I]^),$ff);
      End;
    For I:=1 To N Do
        Ku[I]^[0]:=Dis[I,0];

    For K:=1 To N-1 Do					{Ϊ��̬�滮���鸳ֵ}
       For What:=1 To N Do
         Did(1,0,[]);

    S:=[1..N];
    K:=60000;
    For I:=1 To N Do
      If Dis[0,I]+Ku[I]^[Num(S-[I])]<K Then
        Begin
          K:=Dis[0,I]+Ku[I]^[Num(S-[I])];
          What:=I;
        End;
    For I:=1 To N Do
      Inc(K,Map[Wu[I,1],Wu[I,2]]);

   Assign(F,Outputfile);			       {������}
   Rewrite(F);
     Writeln(F,K);
     Write(F,'A ');
     Last:=0;
     For I:=1 To N Do
       Begin
         If Wu[Last,2]<>Wu[What,1] Then Write(F,Wu[What,1],' ');
            Write(F,Wu[What,2],' ');
         Exclude(S,What);
         Last:=What;
         What:=Dir[What]^[Num(S)];
       End;
      If 'A'<>Wu[Last,2] Then Write(F,'A');
   Close(F);
  End;


Begin
 Init;		{��ʼ��}
 Prepare;	{׼��}
 Main;		{����}
End.
