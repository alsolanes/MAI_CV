% SVMDEMO_LINEAR

Np = 100 ;
Nn = 100 ;
C  = .1 ;

[X, y] = gendata(Np, Nn) ;

cla ;
model = svmdemo(X, y, 'linear', C) ;
