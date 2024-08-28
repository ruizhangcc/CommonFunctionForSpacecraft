%��SVD�ֽ����Cholesky�ֽ�Ч�����ã�����
%Original written by �Ԇ���
%2017.1.9 ��� editon 1.0

n=6;%ϵͳ��ά��
I=eye(n);%��λ��
N=2*n;%�ݻ�����
kesi=sqrt(n)*[I -I];%kesi=sqrt(m/2)*[1]_i
Rr=1e-10*I;%��������
Re=1e-15*I;%��������


wk_1=[-1;-1;-1;-1;-1;-1];
Pk_1=3*I;
eps=1e-15;
x1=wk_1(1);x2=wk_1(2);x3=wk_1(3);
x4=wk_1(4);x5=wk_1(5);x6=wk_1(6);
f1=x1+x2^2*x4*x6/4+0.75;
f2=x2+0.405*exp(1+x1*x2)-1.405;
f3=x3-x4*x6/2+1.5;
f4=x4-0.605*exp(1-x3^2)-0.395;
f5=x5-x2*x6/2+1.5;
f6=x6-x1*x5;
F=[f1;f2;f3;f4;f5;f6];
normF=norm(F,inf);
num=0;
tic;
while(num<100)
    t=wk_1;
    [Uk_1,Sk_1,~]=svd(Pk_1); %1.�˴�����SVD�ֽ�
    for i=1:N %2.����Cubature��
        Wk_1(:,i)=Uk_1*sqrt(Sk_1)*kesi(:,i)+wk_1;
        Wkk_1=Wk_1;
    end
    wkk_1=1/N*sum(Wkk_1,2); %3.����Ԥ��״̬
    temp=zeros(n);
    for i=1:N %4.����Ԥ������Э�������
        temp=temp+Wkk_1(:,i)*Wkk_1(:,i)';
    end
    Pkk_1=1/N*temp-wkk_1*wkk_1'+Rr; 
    %����Ϊʱ�����
    %����Ϊ�۲����
    [Ukk_1,Skk_1,~]=svd(Pkk_1); %����SVD�ֽ�
    for i=1:N 
        Wkk_1(:,i)=Ukk_1*sqrt(Sk_1)*kesi(:,i)+wkk_1; %����Cubature��
        x1=Wkk_1(1,i);x2=Wkk_1(2,i);x3=Wkk_1(3,i);
        x4=Wkk_1(4,i);x5=Wkk_1(5,i);x6=Wkk_1(6,i);
        f1=x1+x2^2*x4*x6/4+0.75;
        f2=x2+0.405*exp(1+x1*x2)-1.405;
        f3=x3-x4*x6/2+1.5;
        f4=x4-0.605*exp(1-x3^2)-0.395;
        f5=x5-x2*x6/2+1.5;
        f6=x6-x1*x5;
        Dkk_1(:,i)=[f1;f2;f3;f4;f5;f6]; %����������Cubature��
    end
    dkk_1=1/N*sum(Dkk_1,2); %����Ԥ��۲�ֵ
    temp1=zeros(n);
    temp2=zeros(n);
    for i=1:N
        temp1=temp1+Dkk_1(:,i)*Dkk_1(:,i)';
        temp2=temp2+Wkk_1(:,i)*Dkk_1(:,i)';
    end
    Pdd=1/N*temp1-dkk_1*dkk_1'+Re; %����Э�������ĸ���
    Pwd=1/N*temp2-wkk_1*dkk_1'; %������Э��������
    K=Pwd/Pdd; %ע��˴�������Kalman����
    wk_1=wkk_1-K*dkk_1; %��������״̬
    Pk_1=Pkk_1-K*Pdd*K'; %������Ӧ���Э����
    num=num+1;
    x1=wk_1(1);x2=wk_1(2);x3=wk_1(3);
    x4=wk_1(4);x5=wk_1(5);x6=wk_1(6);
    f1=x1+x2^2*x4*x6/4+0.75;
    f2=x2+0.405*exp(1+x1*x2)-1.405;
    f3=x3-x4*x6/2+1.5;
    f4=x4-0.605*exp(1-x3^2)-0.395;
    f5=x5-x2*x6/2+1.5;
    f6=x6-x1*x5;
    F=[f1;f2;f3;f4;f5;f6]; %����ֵ
    normF=norm(F,inf);
    normX=norm(t-wk_1,inf);
    if(normF<eps||normX<eps) %����������ֵ��X����ֵ����������ж��Ƿ���ֹ
        break
    end
%    if(normF<eps)
%        break
%    end
end
toc;
wk_1
    
    
    
    
    
    
    
    