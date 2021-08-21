function [values, colind, rowptr] = matrix_to_csr(A)
    n = size(A);
    rowptr = zeros(1, n(1) + 1);
    nz = 0;
    %aflarea numarului de valori nenule din matrice
    for i = 1:n(1)

        for j = 1:n(1)

            if A(i, j) ~= 0
                nz++;
            endif

        endfor

    endfor

    values = zeros(1, nz);
    colind = zeros(1, nz);
    nz = 1;
    irowptr = 1;
    %completarea celor 3 vectori
    for i = 1:n(1)
        rowptr(irowptr) = nz;
        irowptr++;

        for j = 1:n(1)

            if A(i, j) ~= 0
                values(nz) = A(i, j);
                colind(nz) = j;
                nz++;
            endif

        endfor

    endfor

    rowptr(irowptr) = nz;
endfunction
