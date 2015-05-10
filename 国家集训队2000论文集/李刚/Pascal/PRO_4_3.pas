Program Pro_4_3;				    {��4�Ľ���������㷨}
Const
 Map:Array['A'..'G','A'..'G'] Of Byte=		    {ÿ����ũ���ľ���}
      ((0,56,43,71,35,41,36),
       (56,0,54,58,36,79,31),
       (43,54,0,30,20,31,58),
       (71,58,30,0,38,59,75),
       (35,36,20,38,0,44,67),
       (41,79,31,59,44,0,72),
       (36,31,58,75,67,72,0));

 Inputfile         ='Input.Txt';		    {�����ļ���}
 Outputfile        ='Output.Txt';		    {����ļ���}

Type
  Kus              =Array[0..4095] Of Word;	    {��¼��������}
  Ses              =Set Of 1..12;		    {��������}

Var
  F                :Text;			    {�ļ�����}
  N                :Integer;			    {�������Ŀ}
  Min		   :Word;			    {���·���ĳ���}
  Big,I            :Word;		   	    {Ӧ�ñ���}
  Wu               :Array[0..12,1..2] Of Char;	    {��¼���������}
  Dis              :Array[0..12,0..12] Of Integer;  {��¼ÿ�������������Ȩֵ}
  Ku               :Array[1..12] Of ^kus;	    {��¼����Ȩֵ������}
  Qiu              :Array[1..13] Of Byte;	    {�����м�¼·��������}
  Se               :Ses;

 Procedure Init;				    {��ʼ������}
 Var
   I               :Integer;
   Ch              :Char;
  Begin
    Assign(F,Inputfile);
    Reset(F);
       Readln(F,N);
       For I:=1 To N Do				    {��������}
       Readln(F,Wu[I,1],Ch,Wu[I,2]);
    Close(F);
  End;

 Procedure Prepare;				   {׼������}
  Var
    I,J             :Integer;
    Begin
      Wu[0,1]:='A';Wu[0,2]:='A';		   {���ÿ�������������Ȩֵ}
      For I:=0 To N Do
        For J:=0 To N Do
          Dis[I,J]:=Map[Wu[I,2],Wu[J,1]];

         For I:=1 To N Do			   {��ʼ����¼����}
           Begin
             New(Ku[I]);
             Fillchar(Ku[I]^,Sizeof(Ku[I]^),$ff);
           End;
         Big:=Ku[1]^[1];
    End;

  Function Num(S:Ses):Word;			    {������ת��Ϊ�����ĺ���}
    Var
         X         :Word Absolute S;
      Begin  
         Num:=X Div 2;
      End;

  Procedure Search(Dep:Byte;Al:Word);		     {��������}
     Var
        I             :Byte;
        D             :Word;
    Begin
      If Al>=Min Then Exit;
      If Ku[Qiu[Dep-1]]^[Num(Se)]<Big Then
        Begin					     {����Ѿ������˹���,��ֱ�Ӷ�ֵ}
          If Al+Ku[Qiu[Dep-1]]^[Num(Se)]<Min Then
             Min:=Al+Ku[Qiu[Dep-1]]^[Num(Se)];
        End
      Else
        If Dep>N Then
            Begin				     {�߽�ʱֱ�Ӽ���}
               Ku[Qiu[Dep-1]]^[Num(Se)]:=Dis[Qiu[Dep-1],0];
               If Al+Ku[Qiu[Dep-1]]^[Num(Se)]<Min Then
                    Min:=Al+Ku[Qiu[Dep-1]]^[Num(Se)];
            End
       Else
          Begin
            D:=Big;				     {����ÿ��λ���ʵ�}
            For I:=1 To N Do
             If I In Se Then
               Begin
                 Exclude(Se,I);
                 Qiu[Dep]:=I;
                 Search(Dep+1,Al+Dis[Qiu[Dep-1],Qiu[Dep]]);
                 If Ku[I]^[Num(Se)]+Dis[Qiu[Dep-1],Qiu[Dep]]<D Then
                 D:=Ku[I]^[Num(Se)]+Dis[Qiu[Dep-1],Qiu[Dep]];  {��¼�������}
                 Include(Se,I);
               End;
            Ku[Qiu[Dep-1]]^[Num(Se)]:=D;
          End;
    End;

  Procedure Print;				      {������}
  Var
    I,J,Last          :Integer;
    D                 :Word;
   Begin
     Se:=[1..N];
     J:=1;
     While  Dis[0,J]+Ku[J]^[Num(Se-[J])]<>Min Do
       Inc(J);
    D:=Min;
     For I:=1 To N Do
       Inc(D,Map[Wu[I,1],Wu[I,2]]);
     Assign(F,Outputfile);
     Rewrite(F);
        Writeln(F,D);
        Write(F,'A ');
        Dec(Min,Dis[0,J]);
        Last:=0;

       For I:=1 To N Do
         Begin
            If Wu[J,1]<>Wu[Last,2] Then
               Write(F,Wu[J,1],' ');
            Write(F,Wu[J,2],' ');
            If I<>N Then
              Begin
                Last:=J;
                Exclude(Se,J);
                J:=1;
                While (Not (J In Se)) Or (Ku[J]^[Num(Se-[J])]+Dis[Last,J]<>Min) Do
                       Inc(J);
                Dec(Min,Dis[Last,J]);
              End;
          End;
        If Wu[J,2]<>'A' Then Write(F,'A');
     Close(F);
   End;

Begin
 Init;		{����}
 Prepare;	{׼��}
 Se:=[1..N];	{��ʼ��������Ӧ�õĸ���ֵ}
 Min:=Big;
  For I:=1 To N Do
    Begin
      Se:=[1..N]-[I];
      Qiu[1]:=I;
      Search(2,Dis[0,I]);	{����}
    End;
  Print;        {���}
End.

