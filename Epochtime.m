%TLEҪ��ʱ��������
%������ݷ�Χ��1957��-2056��
fprintf('������ʱ��㣺t = ');
ts = input('','s');

Years = ts(1:2);
Days = ts(3:5);
Times = ts(6:end);

Year2d = str2double(Years);
if Year2d < 57 %�ж���ݷ�Χ
    Year4ds = strcat('20',ts(1:2));
else
    Year4ds = strcat('19',ts(1:2));
end
Year4d = str2double(Year4ds);
fprintf('Year = %d\n',Year4d);

Date = str2double(Days);%�ж�һ���еĵڼ����Ǽ��¼���
if mod(Year4d,4) == 0 %�����жϣ�1957-2056������
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