% Transforme un vecteur complexe en une matrice dont la première colonne contient les réels et la deuxième les complexes
function M=complex2mat(Mc)
M=[real(Mc) imag(Mc)];
