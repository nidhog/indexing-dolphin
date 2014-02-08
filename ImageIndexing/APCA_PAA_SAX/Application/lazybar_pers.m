
Data3=zeros(100,100);
for k=1:100

    for i=1:100
    U=rand();
        if U>0.5
            Data3(k,i)=Data3(k,i)+round(rand*10);
        end
    end
end