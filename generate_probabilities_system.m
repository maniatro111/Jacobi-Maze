function [A, b] = generate_probabilities_system(rows)
    %calculez numarul de linii/coloane din matrice
    numarprob = rows * (rows + 1) / 2;
    A = zeros(numarprob);
    b = zeros(numarprob, 1);
    %completez vectorul b cu 1 pe pozitiile necesare
    for i = numarprob:-1:(rows - 1) * rows / 2 + 1
        b(i) = 1;
    endfor
    %initializez primele 3 linii din matrice, deoarece rows>2
    A(1, 1) = 4;
    A(2, 2) = 5;
    A(3, 3) = 5;
    A(1, 2:3) = -1;
    A(2, 1) = -1;
    A(2, 3:5) = -1;
    A(3, 1:2) = -1;
    A(3, 5:6) = -1;
    %relatie pentru a completa restul valorilor, 
    %in afara de valorile de pe ultima linie 
    for i = 3:rows - 1

        for j = (i - 1) * i / 2 + 1:i * (i + 1) / 2
          %pozitia primului element de pe linia precedenta
            linsus = (i - 2) * (i - 1) / 2 + 1;
          %pozitia primului element de pe urmatoarea linie
            linjos = i * (i + 1) / 2 + 1;
          %daca elementul este primul pe o linie rows
            if j == (i - 1) * i / 2 + 1
                A(j, j) = 5;
                A(j, linsus) = -1;
                A(j, j + 1) = -1;
                A(j, linjos) = -1;
                A(j, linjos + 1) = -1;
                A(linsus, j) = -1;
                A(j + 1, j) = -1;
                A(linjos, j) = -1;
                A(linjos + 1, j) = -1;
            else
          %daca elementul este ultimul de pe o linie rows
                if j == (i + 1) * i / 2
                    A(j, j) = 5;
                    A(j, j - 1) = -1;
                    A(j, linsus + i - 2) = -1;
                    A(j, linjos + i) = -1;
                    A(j, linjos + i - 1) = -1;
                    A(linjos + i, j) = -1;
                    A(linjos + i - 1, j) = -1;
                else
                    A(j, j) = 6;
                    A(j, j - 1) = -1;
                    A(j, j + 1) = -1;
                    poz = j - ((i - 1) * i / 2 + 1);
                    A(j, linsus + poz - 1) = -1;
                    A(j, linsus + poz) = -1;
                    A(j, linjos + poz) = -1;
                    A(j, linjos + poz + 1) = -1;
                    A(linjos + poz, j) = -1;
                    A(linjos + poz + 1, j) = -1;
                endif

            endif

        endfor

  endfor
    %completarea ultimei linii
    for i = (rows - 1) * rows / 2 + 1:rows * (rows + 1) / 2

      linsus = (rows - 2) * (rows - 1) / 2 + 1;
      %daca elementul este primul element de pe ultima linie row
      if i == (rows - 1) * rows / 2 + 1
        A(i, i) = 4;
        A(i, i + 1) = -1;
        A(i, linsus) = -1;
      else 
      %daca elementul este ultimul element de pe ultima linie row
        if i == (rows + 1) * rows / 2
          A(i, i) = 4;
          A(i, i - 1) = -1;
          A(i, linsus + rows - 2) = -1;
        else
          poz = i - ((rows-1) * rows / 2 + 1);
          A(i, i) = 5;
          A(i, i+1) = -1;
          A(i, i-1) = -1;
          A(i, linsus + poz - 1) = -1;
          A(i, linsus + poz) = -1;
        endif
      
      endif

    endfor

endfunction
