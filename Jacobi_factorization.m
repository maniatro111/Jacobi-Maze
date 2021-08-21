function [G_J, c_J] = Jacobi_factorization(A, b)
    [n n] = size(A);
    D = L = U = zeros(n, n);
  %construirea matricei D
    for i = 1:n
        D(i, i) = A(i, i);
    endfor
  %construirea matricei U
    for i = 1:n

        for j = i + 1:n
            U(i, j) = -A(i, j);
        endfor

    endfor
  %construirea matricei L
    for i = 1:n

        for j = 1:i - 1
            L(i, j) = -A(i, j);
        endfor

    endfor

    N = D;
    P = L + U;
    N1 = inv(N);
    G_J = N1 * P;
    c_J = N1 * b;
endfunction
