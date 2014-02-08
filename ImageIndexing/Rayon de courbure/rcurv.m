% Cette fonction calcul le rayon de courbure en choisissant trois points et en calculant le rayon du cercle les traversant
% Entrées:
% 	curve: courbe dont on veut calculer le rayon de courbure
% 	iscolumn: prend la valeur 0 si le vecteur curve est complexe, 1 si curve est une matrice à deux colonnes
% 	display: option d'affichage
% 	pause_time: temps de pause pour la gestion de l'affichage
% Sorties:
% 	rmat: rayon de courbure
% 	XY: coordonées du centre du cercle
function [rmat XY]=rcurv(curve,iscolumn,display,pause_time)
if nargin==1
    iscolumn=0;
    display=0;
    pause_time=0;
else if nargin==3
        pause_time='user';
    end
end
if iscolumn==1
    curve=curve(1,:)+1i*curve(2,:);
end
    
rmat=curve;
XY=curve;
for k=2:(length(curve)-1)
    %%
    x1=real(curve(k-1));
    x2=real(curve(k));
    x3=real(curve(k+1));
    
    y1=imag(curve(k-1));
    y2=imag(curve(k));
    y3=imag(curve(k+1));
    %%
    a=det([x1 y1 1;x2 y2 1;x3 y3 1]);
    d=det([x1^2+y1^2 y1 1;x2^2+y2^2 y2 1;x3^2+y3^2 y3 1]);
    e=det([x1^2+y1^2 x1 1;x2^2+y2^2 x2 1;x3^2+y3^2 x3 1]);
    f=-det([x1^2+y1^2 x1 y1;x2^2+y2^2 x2 y2;x3^2+y3^2 x3 y3]);
    %%
    r=((d^2)+(e^2))/(4*(a^2));
    r=r-f/a;
    r=sqrt(r);
    x0=d/(2*a);
    y0=e/(-2*a);
    
    XY(k)=x0+1i*y0;
    
    rmat(k)=r;
    if display==1
        t=0:0.1:2*pi+1;
        plot(curve);
        hold on;
        plot([x1,x2,x3],[y1,y2,y3],'o');
        plot(x0,y0,'ro');
        
        
        plot(r*sin(t)+x0,r*cos(t)+y0,'r');
        if (pause_time=='user' | isnan(pause_time))
            pause;
        else
            pause(pause_time);
        end
        hold off;
    end
end

rmat(1)=rmat(2);
rmat(length(curve))=rmat(length(curve)-1);
XY(1)=XY(2);
XY(length(curve))=XY(length(curve)-1);

    
