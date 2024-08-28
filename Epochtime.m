%TLE要素时间计算程序
%适用年份范围：1957年-2056年
fprintf('请输入时间点：t = ');
ts = input('','s');

Years = ts(1:2);
Days = ts(3:5);
Times = ts(6:end);

Year2d = str2double(Years);
if Year2d < 57 %判断年份范围
    Year4ds = strcat('20',ts(1:2));
else
    Year4ds = strcat('19',ts(1:2));
end
Year4d = str2double(Year4ds);
fprintf('Year = %d\n',Year4d);

Date = str2double(Days);%判断一年中的第几天是几月几日
if mod(Year4d,4) == 0 %闰年判断，1957-2056年适用
    month = [31 29 31 30 31 30 31 31 30 31 30 31];
else
    month = [31 28 31 30 31 30 31 31 30 31 30 31];
end
i = 1;
dif = Date - month(i);
Month = i;
Day = dif + month(i);
while dif>0
    i=i+1;
    Month = i;
    dif = dif - month(i);
    Day = dif + month(i);
end
Month
Day

Time = str2double(Times);
Secondsum = Time * 86400;
Hour = fix(Secondsum/3600);
Secondsummin = mod(Secondsum,3600);
Minute = fix(Secondsummin/60);
Second = mod(Secondsummin,60);
Hour
Minute
Second
% fprintf('Time = %d\n',Time);