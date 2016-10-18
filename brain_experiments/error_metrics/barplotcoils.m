
% Orthogonal to M1 Gyry
a=[Simple1 Detail1 DetailPlus1];

% Parallel to M1 Gyry
b=[Simple2 Detail2 DetailPlus2];

figure
hold on
bar(1,a(1),'r')
bar(2, a(2),'g')
bar(3, a(3),'b')
axis([0 4 0 0.1])
legend('BSM-811','BSM-819','BSM-879')
bar(5,b(1),'r')
bar(6, b(2),'g')
bar(7, b(3),'b')
axis([0 8 0 0.1])

