T = 1;
s =  tf('s');

num = [1];
den = [T T/16 1];

sys = tf(num, den);
%stepinfo(sys)

Kp = 1;
Ki = 0;
Kd = [1 3 5 7 9];

Gc = pid(Kp,Ki,Kd)
for i = 1:5;    
    final(i) = feedback(sys*Gc(:,:,1,i), 1)
end

figure(1)
hold all
step(final(1))
stepinfo(final(1))
step(final(2))
stepinfo(final(2))
step(final(3))
stepinfo(final(3))
step(final(4))
stepinfo(final(4))
step(final(5))
stepinfo(final(5))
title('Step Response All')
legend('sys-i1', 'sys-i3', 'sys-i5', 'sys-i7', 'sys-i9')

figure(2)
hold all
impulse(final(1))
impulse(final(2))
impulse(final(3))
impulse(final(4))
impulse(final(5))
title('Impulse Response All')
legend('sys-i1', 'sys-i3', 'sys-i5', 'sys-i7', 'sys-i9')

figure(3)
hold all
step(final(1)/s)
step(final(2)/s)
step(final(3)/s)
step(final(4)/s)
step(final(5)/s)
title('Ramp Response All')
legend('sys-i1', 'sys-i3', 'sys-i5', 'sys-i7', 'sys-i9')
xlim([0 50]) 
ylim([0 50])