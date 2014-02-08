
N=length(Data(1,:));
M=length(Data(:,1));
Nsymbol=5;

%Q=..;
Q_SAX=SAX_rep(Q,100,10,Nsymbol);

m=length(Q_SAX);
Data_saxApp=zeros(M,m);
for k=1:M
   Data_saxApp(k,:)=SAX_rep(Data(k,:),100,10,Nsymbol);
end

Data_MINDIST=zeros(M,1);
for k=1:M
    Data_MINDIST(k)=sax_MINDIST(Q_SAX,Data_saxApp(k,:),Nsymbol,10);
end

