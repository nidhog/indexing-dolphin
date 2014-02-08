% Cette fonction calcul la moyenne effective sur les segments
function meanM=realMean(recM,origM)
N=length(origM);
M=length(recM);
if M>N
    recM=recM(1:N);
end
meanM=origM;
stepMat=findStep(recM);
for i=1:length(stepMat)-1
   
        meanM(stepMat(i):stepMat(i+1))=mean(origM(stepMat(i):stepMat(i+1)));
 
end
meanM(stepMat(i+1):length(meanM))=mean(meanM(stepMat(i+1):length(meanM)));

    
