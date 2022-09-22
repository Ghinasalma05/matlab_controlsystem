T = 1;
s =  tf('s');

num = [1];
den = [T T/16 1];

sys = tf(num, den);
stepinfo(sys)

Kp = 1;
Ki = [1 3 5 7 9];

sys_c = tf([Kp, Ki], [1, 0]);

final = feedback(sys*sys_c, 1);
stepinfo(final)

figure(1)
step(final/s)

figure(2)
impulse(final)

figure(3)
step(final/s*s)

figure(4)
hold on
step(sys)
step(final)
hold off