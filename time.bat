@echo off
color 0a
set k01=����������
set k02=����������
set k03=����������
set k04=����������
set k05=����������
set k11=����������
set k12=����������
set k13=����������
set k14=����������
set k15=����������
set k21=����������
set k22=����������
set k23=����������
set k24=����������
set k25=����������
set k31=����������
set k32=����������
set k33=����������
set k34=����������
set k35=����������
set k41=����������
set k42=����������
set k43=����������
set k44=����������
set k45=����������
set k51=����������
set k52=����������
set k53=����������
set k54=����������
set k55=����������
set k61=����������
set k62=����������
set k63=����������
set k64=����������
set k65=����������
set k71=����������
set k72=����������
set k73=����������
set k74=����������
set k75=����������
set k81=����������
set k82=����������
set k83=����������
set k84=����������
set k85=����������
set k91=����������
set k92=����������
set k93=����������
set k94=����������
set k95=����������
:start
echo TIME:
set p1=%time:~0,8%
set p1=%p1:~7%
set p2=%time:~0,7%
set p2=%p2:~6%
set p3=%time:~0,5%
set p3=%p3:~4%
set p4=%time:~0,4%
set p4=%p4:~3%
set p5=%time:~0,2%
set p5=%p5:~1%
set p6=%time:~0,1%
set p6=%p6:~0%
set p11=k%p1%1
set p12=k%p1%2
set p13=k%p1%3
set p14=k%p1%4
set p15=k%p1%5
set p21=k%p2%1
set p22=k%p2%2
set p23=k%p2%3
set p24=k%p2%4
set p25=k%p2%5
set p31=k%p3%1
set p32=k%p3%2
set p33=k%p3%3
set p34=k%p3%4
set p35=k%p3%5
set p41=k%p4%1
set p42=k%p4%2
set p43=k%p4%3
set p44=k%p4%4
set p45=k%p4%5
set p51=k%p5%1
set p52=k%p5%2
set p53=k%p5%3
set p54=k%p5%4
set p55=k%p5%5
set p61=k%p6%1
set p62=k%p6%2
set p63=k%p6%3
set p64=k%p6%4
set p65=k%p6%5
echo @echo off>clocktemp.bat
echo echo %%%p61%%%%%%p51%%%������%%%p41%%%%%%p31%%%������%%%p21%%%%%%p11%%%>>clocktemp.bat
echo echo %%%p62%%%%%%p52%%%������%%%p42%%%%%%p32%%%������%%%p22%%%%%%p12%%%>>clocktemp.bat
echo echo %%%p63%%%%%%p53%%%������%%%p43%%%%%%p33%%%������%%%p23%%%%%%p13%%%>>clocktemp.bat
echo echo %%%p64%%%%%%p54%%%������%%%p44%%%%%%p34%%%������%%%p24%%%%%%p14%%%>>clocktemp.bat
echo echo %%%p65%%%%%%p55%%%������%%%p45%%%%%%p35%%%������%%%p25%%%%%%p15%%%>>clocktemp.bat
call clocktemp.bat
del clocktemp.bat
set s1=%time:~0,8%
set s1=%s1:~7%
:next
set s2=%time:~0,8%
set s2=%s2:~7%
set /a s2=s2-s1
if %s2%==0 goto next
cls
goto start 