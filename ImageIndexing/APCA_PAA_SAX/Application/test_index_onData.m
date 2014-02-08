% Test on Data
N=length(Data(1,:));
M=length(Data(:,1));

%Q=..;
Q_APCA=APCA_rep(Q);
Q_segln=[0 Q_APCA(1,:)];
Q_mean=Q_APCA(2,:);

m=length(Q_APCA);
Data_meanApp=zeros(M,m);
for k=1:M
    for i=1:m
        Data_meanApp(k,i)=mean((Data(k,Q_segln(i)+1:Q_segln(i+1))));
    
    end
end

Data_dist2Q=zeros(M,1);
for k=1:M
    for i=1:m
        Data_dist2Q(k)=Data_dist2Q(k)+((Q_segln(i+1)-Q_segln(i))*((Data_meanApp(k,i)-Q_mean(i)).^2));
    end
    Data_dist2Q(k)=sqrt(Data_dist2Q(k));
end