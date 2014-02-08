%
% Cette fonction génère les breakpoints correspondant à une longueur d'alphabet donnée, ainsi que l'alphabet associé
%

function [breakpoints,alphabet] = breakpoint_gen(alphabet_size)

breakpoints=norminv((1:alphabet_size-1)/(alphabet_size),0,1);
alphabet=cell(1,alphabet_size);

for i=1:alphabet_size
    alphabet(i)={char(96+i)};
end
    
