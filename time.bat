@echo off
color 0a
set k01=¡¡¡ö¡ö¡ö¡¡
set k02=¡¡¡ö¡¡¡ö¡¡
set k03=¡¡¡ö¡¡¡ö¡¡
set k04=¡¡¡ö¡¡¡ö¡¡
set k05=¡¡¡ö¡ö¡ö¡¡
set k11=¡¡¡ö¡ö¡¡¡¡
set k12=¡¡¡¡¡ö¡¡¡¡
set k13=¡¡¡¡¡ö¡¡¡¡
set k14=¡¡¡¡¡ö¡¡¡¡
set k15=¡¡¡ö¡ö¡ö¡¡
set k21=¡¡¡ö¡ö¡ö¡¡
set k22=¡¡¡¡¡¡¡ö¡¡
set k23=¡¡¡ö¡ö¡ö¡¡
set k24=¡¡¡ö¡¡¡¡¡¡
set k25=¡¡¡ö¡ö¡ö¡¡
set k31=¡¡¡ö¡ö¡ö¡¡
set k32=¡¡¡¡¡¡¡ö¡¡
set k33=¡¡¡ö¡ö¡ö¡¡
set k34=¡¡¡¡¡¡¡ö¡¡
set k35=¡¡¡ö¡ö¡ö¡¡
set k41=¡¡¡ö¡¡¡ö¡¡
set k42=¡¡¡ö¡¡¡ö¡¡
set k43=¡¡¡ö¡ö¡ö¡¡
set k44=¡¡¡¡¡¡¡ö¡¡
set k45=¡¡¡¡¡¡¡ö¡¡
set k51=¡¡¡ö¡ö¡ö¡¡
set k52=¡¡¡ö¡¡¡¡¡¡
set k53=¡¡¡ö¡ö¡ö¡¡
set k54=¡¡¡¡¡¡¡ö¡¡
set k55=¡¡¡ö¡ö¡ö¡¡
set k61=¡¡¡ö¡ö¡ö¡¡
set k62=¡¡¡ö¡¡¡¡¡¡
set k63=¡¡¡ö¡ö¡ö¡¡
set k64=¡¡¡ö¡¡¡ö¡¡
set k65=¡¡¡ö¡ö¡ö¡¡
set k71=¡¡¡ö¡ö¡ö¡¡
set k72=¡¡¡¡¡¡¡ö¡¡
set k73=¡¡¡¡¡¡¡ö¡¡
set k74=¡¡¡¡¡¡¡ö¡¡
set k75=¡¡¡¡¡¡¡ö¡¡
set k81=¡¡¡ö¡ö¡ö¡¡
set k82=¡¡¡ö¡¡¡ö¡¡
set k83=¡¡¡ö¡ö¡ö¡¡
set k84=¡¡¡ö¡¡¡ö¡¡
set k85=¡¡¡ö¡ö¡ö¡¡
set k91=¡¡¡ö¡ö¡ö¡¡
set k92=¡¡¡ö¡¡¡ö¡¡
set k93=¡¡¡ö¡ö¡ö¡¡
set k94=¡¡¡¡¡¡¡ö¡¡
set k95=¡¡¡ö¡ö¡ö¡¡
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
echo echo %%%p61%%%%%%p51%%%¡¡¡¡¡¡%%%p41%%%%%%p31%%%¡¡¡¡¡¡%%%p21%%%%%%p11%%%>>clocktemp.bat
echo echo %%%p62%%%%%%p52%%%¡¡¡ö¡¡%%%p42%%%%%%p32%%%¡¡¡ö¡¡%%%p22%%%%%%p12%%%>>clocktemp.bat
echo echo %%%p63%%%%%%p53%%%¡¡¡¡¡¡%%%p43%%%%%%p33%%%¡¡¡¡¡¡%%%p23%%%%%%p13%%%>>clocktemp.bat
echo echo %%%p64%%%%%%p54%%%¡¡¡ö¡¡%%%p44%%%%%%p34%%%¡¡¡ö¡¡%%%p24%%%%%%p14%%%>>clocktemp.bat
echo echo %%%p65%%%%%%p55%%%¡¡¡¡¡¡%%%p45%%%%%%p35%%%¡¡¡¡¡¡%%%p25%%%%%%p15%%%>>clocktemp.bat
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