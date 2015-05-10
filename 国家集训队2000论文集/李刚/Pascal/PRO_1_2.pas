Program Pro_1_2;				  {�á���̬�滮���ķ��������1}

Const
  Max           =300;				  {���ĳ�����}
  Inputfile     ='Input.Txt';			  {�����ļ���}
  Outputfile    ='Output.Txt';			  {����ļ���}
  Big           =1000000;			  {�������}

Type
  Maps          =Array[1..Max] Of Integer;   	  {��ͼ����˵��}

Var
   Se           :Set Of Byte;			  {δ���ʹ��ĳ��м���}
   Map          :Array[1..Max] Of ^maps;	  {��ͼ����}
   Dis          :Array[1..Max] Of Longint;	  {ĳ���е��յ���е���̾���}
   Fr           :Array[1..Max] Of Byte;		  {��̬�滮�ı�ʶ����}
   Bo           :Array[1..Max] Of Boolean;	  {���ʹ����б�ʶ}
   N,M          :Integer;			  {��������}
   F            :Text; 				  {�ļ�����}

 Procedure Init;				  {��ʼ������}
 Var
   I,J,K,W      :Integer;
  Begin
     Assign(F,Inputfile);			  {��������}
     Reset(F);
        Readln(F,N,M);
         For I:=1 To N Do
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

 Procedure Main;				    {��̬�滮���ƹ���}
   Var
     I,J,Who    :Integer;
     Min        :Longint;			    {��ǰ��Сֵ}

    Begin
       Dis[N]:=0;			  	    {��ʼ����̬�滮����}
       Who:=N;
       Fillchar(Fr,Sizeof(Fr),0);
       Fillchar(Bo,Sizeof(Bo),True);
       Bo[N]:=False;
       While Who<>1 Do
        Begin
          For I:=1 To N Do			     {���á�״̬ת�Ʒ��̡����ƽ��}
           If Map[I]^[Who]>0 Then
            If (Fr[I]=0) Or (Dis[I]>Dis[Who]+Map[I]^[Who]) Then
              Begin
                Dis[I]:=Dis[Who]+Map[I]^[Who];
                Fr[I]:=Who;
              End;
           Min:=Big;
           For I:=1 To N Do
            If Bo[I] And (Fr[I]>0) And (Dis[I]<Min) Then
             Begin
                Who:=I;
                Min:=Dis[I];
             End;
           Bo[Who]:=False;
        End;
    End;

  Procedure Print;				     {������}
  Var
   I            :Integer;
   Begin
     Assign(F,Outputfile);
     Rewrite(F);
       Writeln(F,Dis[1]);
       I:=1;
       While I<>N Do
       Begin
          Write(F,I,' ');
          I:=Fr[I];
       End;
       Writeln(F,N);
    Close(F);
   End;

Begin
    Init;		{����}
    Main;		{���}
    Print;		{���}
End.
