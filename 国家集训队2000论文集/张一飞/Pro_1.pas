{���ϵ�������⣬�����㷨1-1��1-2��1-3}

const
  MaxN          =17;{Ϊ�˱���߾��ȼ��㣬N���ܴﵽ�����ֵ}

type
  TSet          =set of 1..MaxN;

var
  Total         :Comp;{��}
  F             :array[0..MaxN] of Comp;{��������}
  N             :Integer;
  Time          :Longint;

procedure Count1(Step,First:Integer;Can:TSet);
  {
  Step��ʾ��ǰȷ����Step����д��ĸ
  First��ʾ��ǰ��д��ĸ����ȡ������Сֵ
  Can��һ�����ϣ������е�Ԫ���ǻ�����ʹ�õĴ�д��ĸ
  }
  var
    i           :Integer;
  begin
    if Step=N then begin{ȷ�����һ����ĸ}
      for i:=First to N do if i in Can then Total:=Total+1; {TotalΪͳ�ƵĽ��}
      Exit
    end;
    for i:=First to N do{ö�ٵ�ǰ�Ĵ�д��ĸ}
      if i in Can then begin{i����ʹ��}
        Count1(Step+1,i+1,Can-[i]);{����ں�}
        Count1(Step+1,1,Can-[i]){��С�ں�}
      end
  end;

procedure Main1;{�㷨1-1}
  begin
    Time:=-MemL[$40:$6C];
    Total:=0;
    Count1(1,1,[1..n]);
    Inc(Time,MemL[$40:$6C])
  end;

procedure Count2(Step,First:Integer;Can:TSet);
  {
  Step��ʾ��ǰȷ����Step����д��ĸ
  First��ʾ��ǰ��д��ĸ����ȡ������Сֵ
  Can��һ�����ϣ������е�Ԫ���ǻ�����ʹ�õĴ�д��ĸ
  }
  var
    i           :Integer;
  begin
    if Step=N then begin{ȷ�����һ����ĸ}
      for i:=First to N do if i in Can then Total:=Total+1; {TotalΪͳ�ƵĽ��}
      Exit
    end;
    for i:=First to N do{ö�ٵ�ǰ�Ĵ�д��ĸ}
      if i in Can then begin{i����ʹ��}
        Count2(Step+1,i+1,Can-[i]);{����ں�}
        if F[N-Step]=-1 then begin
          F[N-Step]:=Total;
          Count2(Step+1,1,Can-[i]);{��С�ں�}
          F[N-Step]:=Total-F[N-Step]
        end else Total:=Total+F[N-Step]
      end
  end;

procedure Main2;{�㷨1-2}
  begin
    Time:=-MemL[$40:$6C];
    Total:=0;
    FillChar(F,Sizeof(F),$FF);
    Count2(1,1,[1..n]);
    Inc(Time,MemL[$40:$6C])
  end;

procedure Main3;{�㷨1-3}
  var
    i,j           :Integer;
    x             :Comp;
  begin
    Time:=-MemL[$40:$6C];
    FillChar(F,Sizeof(F),0);
    F[0]:=1;
    for i:=1 to n do begin
      F[i]:=0;
      x:=1;
      for j:=1 to i do begin
        x:=x*(i-j+1)/j;
        F[i]:=F[i]+x*F[i-j]
      end
    end;
    Total:=F[n];
    Inc(Time,MemL[$40:$6C])
  end;

begin
  Write('Input N (1<=N<=',MaxN,'): ');Readln(N);

  Main1;
  Writeln('Algorithm 1 : ');
  Writeln('Total = ',Total:0:0,' Time = ',Time);

  Main2;
  Writeln('Algorithm 2 : ');
  Writeln('Total = ',Total:0:0,' Time = ',Time);

  Main3;
  Writeln('Algorithm 3 : ');
  Writeln('Total = ',Total:0:0,' Time = ',Time)

end.
