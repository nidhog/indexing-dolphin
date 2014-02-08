
Data2=zeros(100,100);
for k=1:100

    for i=1:100
    U=rand();
        if U<0.1
            Data2(k,i)=Data2(k,i)+rand*10;
        else if U<0.15
            Data2(k,i)=Data2(k,i)+rand();
            end
        end
    end
end