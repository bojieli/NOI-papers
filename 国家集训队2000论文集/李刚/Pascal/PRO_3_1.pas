Program Pro_3_1;				{��3�Ķ�̬�滮�ⷨ}
Const
  Inputfile	='input.Txt';			{�����ļ���}
  Outputfile	='output.Txt';			{����ļ���}
  Max		=100;				{�������Ŀ}
  Big		=10000;				{�������ֵ}

Var
  F		:Text;				{�ļ�����}
  Po		:Array[1..Max,1..2] Of Integer; {��¼ÿ�������������}
  Dis		:Array[1..Max,1..Max] Of Real;	{��¼��̬�滮��״̬��Ȩֵ}
  N		:Integer;			{�������}

 Procedure Init;				{��ʼ������}
 Var
   I		:Integer;
   Begin
     Assign(F,Inputfile);			{��������}
     Reset(F);
       Readln(F,N);
        For I:=1 To N Do
         Readln(F,Po[I,1],Po[I,2]);
     Close(F);
   End;

 Function Len(P1,P2:Integer):Real;		{��������֮��ľ���}
   Begin
     Len:=Sqrt(Sqr(Po[P1,1]-Po[P2,1])+Sqr(Po[P1,2]-Po[P2,2]));
   End;

 Procedure Main;				{��̬�滮����}
  Var
    I,J,K	:Integer;
    Now		:Real;				{��ǰ��Сֵ}
   Begin
      Dis[N,N]:=0;				{��ʼ����̬�滮����}
      For I:=N-1 Downto 1 Do
        Begin
          Dis[I,N]:=Len(I,I+1)+Dis[I+1,N];
          Dis[N,I]:=Dis[I,N];
        End;

      For I:=N-2 Downto 1 Do			{������Сֵ}
        For J:=N-1 Downto I+1 Do
        Begin
          If I+1<J Then Now:=Dis[I+1,J]+Len(I,I+1)
           Else
             Begin
               Now:=Big;
               For K:=J+1 To N Do
                If Dis[K,J]+Len(I,K)<Now Then
                  Now:=Dis[K,J]+Len(I,K);
             End;
          For K:=J+1 To N Do
            If Dis[I,K]+Len(J,K)<Now Then
                Now:=Dis[I,K]+Len(J,K);
          Dis[I,J]:=Now;
          Dis[J,I]:=Now;
        End;
   End;

 Procedure Print;					{�������}
   Var
      X1,X2,I,D		:Integer;			
      Now		:Real;				{��ǰ��Сֵ}
      P			:Array[1..2] Of Integer;	{��ӡ����ĳ���}
      Pr		:Array[1..2,1..Max] Of Byte;	{��ӡ����}
      Ok		:Boolean;

        Procedure Change;				{������������ֵ}
        Var
          G		:Integer;
          Begin
             D:=3-D;
             G:=X1;X1:=X2;X2:=G;
          End;

    Begin
       Assign(F,Outputfile);
       Rewrite(F);					{�������}
       Now:=Big;
        For I:=2 To N Do				{����̵�·��ֵ}
           If Dis[1,I]+Len(1,I)<Now Then
             Begin
               Now:=Dis[1,I]+Len(1,I);
               X2:=I;
             End;
        X1:=1;
        Writeln(F,Now:0:2);			
        P[1]:=1;P[2]:=1;				{��ӡ�����ʼ��}
        Pr[1,1]:=X1;Pr[2,1]:=X2;
        D:=1;
        While (X1<>N) And (X2<>N) Do
           Begin
             Ok:=True;					{���ݶ�̬�滮���ƹ������ӡ����}
              If X1+1<X2 Then
                Begin
                  If Dis[X1+1,X2]+Len(X1,X1+1)=Dis[X1,X2] Then
                      Begin
                         Inc(X1);
                         Inc(P[D]);
                         Pr[D,P[D]]:=X1;
                         Ok:=False;
                      End;
                End
               Else
                Begin
                  I:=X2+1;
                  While (I<=N) And ( Dis[I,X2]+Len(X1,I)<>Dis[X1,X2]) Do
                         Inc(I);
                  If I<=N Then
                    Begin
                       Ok:=False;
                       X1:=I;
                       Inc(P[D]);
                       Pr[D,P[D]]:=X1;
                       Change;
                    End;
                End;
             If Ok Then
              Begin
                 I:=X2+1;
                 While Dis[X1,I]+Len(I,X2)<>Dis[X1,X2] Do
                       Inc(I);
                 X2:=I;
                 Inc(P[3-D]);
                 Pr[3-D,P[3-D]]:=X2;
              End;
           End;
        While Pr[D,P[D]]<>N Do
          Begin
             Inc(P[D]);
             Pr[D,P[D]]:=Pr[D,P[D]-1]+1;
          End;

       For I:=1 To P[1] Do		{�����ӡ����}
            Write(F,Pr[1,I],' ');
       Writeln(F);
       For I:=1 To P[2] Do
            Write(F,Pr[2,I],' ');
       Close(F);
    End;

Begin
  Init;	    {��ʼ��}
  Main;	    {��̬�滮�������·��}
  Print;    {������}
End.
