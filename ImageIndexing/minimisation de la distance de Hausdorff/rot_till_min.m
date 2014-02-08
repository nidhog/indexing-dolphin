% Cette fonction donne la courbe après rotation minimisant la distance de Hausdorff ainsi que l'angle correspondant
% Entrées:
% 	ref_comp_curv: courbe de reference (en complexe)
% 	rot_comp_curve: courbe à transformer (en complexe)
% Sorties:
% 	final_rot_curve: courbe transformée
% 	angle: angle de rotation

function [final_rot_curve,angle] = rot_till_min(ref_comp_curve,rot_comp_curve)
ref_curve=complex2mat(ref_comp_curve);
rot_curve=complex2mat(rot_comp_curve);
init_dist = hausdorff(ref_curve,rot_curve,1);
angle=0;
N=20;
alpha=pi/N;
for k=-N:N
    new_comp_curve=rot_comp_curve*exp(i*k*alpha);
    new_curve=complex2mat(new_comp_curve);
    new_dist=hausdorff(ref_curve,new_curve,1);
    if new_dist<init_dist
        init_dist = new_dist;
        angle=k*alpha;
    end
end

final_rot_curve = rot_comp_curve*exp(i*angle);
