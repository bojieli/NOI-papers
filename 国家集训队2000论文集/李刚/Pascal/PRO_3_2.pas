Program Pro_3_2;				      {��3�������ⷨ}
Const
  Inputfile	='input.Txt';			      {�����ļ���}
  Outputfile	='output.Txt';			      {����ļ���}
  Max		=100;				      {�������Ŀ}
  Big		=10000;				      {�������ֵ}

Var
  F		:Text;				       {�ļ�����}
  Po		:Array[1..Max,1..2] Of Integer;	       {��¼�����������}
  Qiu,Pr	:Array[1..Max] Of Byte;		       {��¼�������̵�����}
  Lpr		:Integer;			       {��ӡ����ĳ���}
  N		:Integer;			       {�����Ŀ}
  Min		:Real;				       {���·���ĳ���}
	
 Procedure Init;				       {��ʼ������}
 Var
   I		:Integer;
   Begin
     Assign(F,Inputfile);
     Reset(F);					        {��������}
       Readln(F,N);
        For I:=1 To N Do
         Readln(F,Po[I,1],Po[I,2]);
     Close(F);
   End;

 Function Len(P1,P2:Integer):Real;		        {������֮�����ĺ���}
   Begin
     Len:=Sqrt(Sqr(Po[P1,1]-Po[P2,1])+Sqr(Po[P1,2]-Po[P2,2]));
   End;

 Procedure Search(Dep,Fr,Last:Byte;Al:Real);		{�������·��}
   Var
     I,P:Byte;
     Rs:Real;
       Procedure Did;					{����2��·���ĳ��ȼ��뵱ǰ�ĳ���}
       Var
        K:Byte;
         Begin
            K:=Fr+1;
            Rs:=0;
            P:=Last;
            While K<>I Do
              Begin
                Rs:=Rs+Len(P,K);
                P:=K;
                Inc(K);
              End;
           Rs:=Rs+Len(Fr,I);
         End;
    Begin
       If Al>=Min Then Exit;
       If Fr=N Then
         Begin
            If Al+Len(Last,N)<Min Then			{������ţ���¼}
             Begin
               Min:=Al+Len(Last,N);
               Pr:=Qiu;
               Lpr:=Dep-1;
             End;
         End
       Else
        For I:=Fr+1 To N Do				{����ÿһ����}
          Begin
            Qiu[Dep]:=I;
            Did;
            Search(Dep+1,I,P,Al+Rs);
          End
    End;


 Procedure Print;					{�������}
  Var
   I			:Byte;	
   Se			:Set Of Byte;			{��¼δ����ĵ�}
   Begin
      Assign(F,Outputfile);
      Rewrite(F);
        Writeln(F,Min:0:2);
        Se:=[1..N];
        For I:=1 To Lpr Do
          Begin
             Write(F,Pr[I],' ');
             Se:=Se-[Pr[I]];
          End;
        Se:=Se+[1,N];
        Writeln(F);
        For I:=1 To N Do
          If I In Se Then
             Write(F,I,' ');
     Close(F);
   End;
Begin
  Init;			{��������}
  Min:=Big;		{��Сֵ��ʼ��}
  Search(1,1,1,0);	{�������·��}
  Print;		{������}
End.
