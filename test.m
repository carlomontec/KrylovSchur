global A;

N = 100;
k = 4;
m = 7;

A = rand(N, N);
v1 = rand(N, 1);
[Q, H, isC] = KrylovSchur(@Ax, v1, N, k, m, 50);

[ev, es] = eig(A); 
disp(['error of eig(A) : ', num2str(norm(A * ev - ev * es))]);
es = diag(es);
[~, ix] = sort(abs(es), 'descend');
es = es(ix);

disp(H);
disp(es(1:m));
disp('error of Krylov : ');
disp(A * Q(:, 1:k+isC) - Q(:, 1:k+1+isC) * H(1:k+1+isC, 1:k+isC) );
