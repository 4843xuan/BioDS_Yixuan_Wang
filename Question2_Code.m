clear all
close all
clc
rk4(0,1000,1,10,0,0,100,600,150,10)
function R = rk4(a,b,E0,S0,ES0,P0,k1,k2,k3,N)
fE=@(ES,E,S)(k2*ES+k3*ES-k1*E*S);
fS=@(ES,E,S)(k2*ES-k1*E*S);
fES=@(ES,E,S)(k1*E*S-k2*ES-k3*ES);
fP=@(ES)(k3*ES);
h=(b-a)/N;
E=zeros(1,N+1);
S=zeros(1,N+1);
ES=zeros(1,N+1);
P=zeros(1,N+1);
%T=a:h:b;
E(1)=E0;
S(1)=S0;
ES(1)=ES0;
P(1)=P0;
for j=1:N
fE1=feval(fE,ES(j),E(j),S(j))
fS1=feval(fS,ES(j),E(j),S(j))
fES1=feval(fES,ES(j),E(j),S(j))
fP1=feval(fP,ES(j))

fE2=feval(fE,ES(j)+h/2*fES1,E(j)+h/2*fE1,S(j)+h/2*fS1);
fS2=feval(fS,ES(j)+h/2*fES1,E(j)+h/2*fE1,S(j)+h/2*fS1);
fES2=feval(fES,ES(j)+h/2*fES1,E(j)+h/2*fE1,S(j)+h/2*fS1);
fP2=feval(fP,ES(j)+h/2*fES1);

fE3=feval(fE,ES(j)+h/2*fES2,E(j)+h/2*fE2,S(j)+h/2*fS2);
fS3=feval(fS,ES(j)+h/2*fES2,E(j)+h/2*fE2,S(j)+h/2*fS2);
fES3=feval(fES,ES(j)+h/2*fES2,E(j)+h/2*fE2,S(j)+h/2*fS2);
fP3=feval(fP,ES(j)+h/2*fES2);

fE4=feval(fE,ES(j)+h*fES3,E(j)+h*fE3,S(j)+h*fS3);
fS4=feval(fS,ES(j)+h*fES3,E(j)+h*fE3,S(j)+h*fS3);
fES4=feval(fES,ES(j)+h*fES3,E(j)+h*fE3,S(j)+h*fS3);
fP4=feval(fP,ES(j)+h*fES3);


E(j+1)=E(j)+h*(fE1+2*fE2+2*fE3+fE4)/6;
S(j+1)=S(j)+h*(fS1+2*fS2+2*fS3+fS4)/6;
ES(j+1)=ES(j)+h*(fES1+2*fES2+2*fES3+fES4)/6;
P(j+1)=P(j)+h*(fP1+2*fP2+2*fP3+fP4)/6;

R=[ E' S' ES' P'];
end
end

