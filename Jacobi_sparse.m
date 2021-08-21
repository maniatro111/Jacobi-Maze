function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
    [n aux] = size(c);
    x0 = zeros(1, n);
    %calcularea primei iteratii a lui x
    x = csr_multiplication(G_values, G_colind, G_rowptr, x0) + c;

    while norm(x - x0) >= tol
        x0 = x;
        x = csr_multiplication(G_values, G_colind, G_rowptr, x) + c;
    endwhile

endfunction
