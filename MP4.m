%Show inputs of user
h = input('Initial height: ');
v = input('Magnitude of the velocity: ');
angle = input('Angle of projectile when fired: ');
ax = input('x-component acceleration: ');
ay = input('y-component acceleration: ');

%Showing invalid input
if ay==0
      error('Error: ay cannot be 0,There is no free-fall ') ;
end           
%Gravity constant
g = 9.81;

%Formula to get vx and vy
vy = (v)*(sind(angle));
vx = (v)*(cosd(angle));

%Formula to get t(time)
t = ((vy) + (sqrt(((vy)^2)+(2*g*h))))/(g);

%Formula for Range and Height
Range = (vx*t);
ymax = (vy)^2/(2*g);
hmax = h + ymax;

%Set t as linear space vector
tlin = linspace(0,t);

%Get x and y; this is for the ideal or without air resistance
x = ((vx*tlin)+((0.5)*(ax)*(tlin.^2)));
y = ((h)+(vy*tlin)+((ay*(tlin.^2))/(2)));

%Get xn and yn; this is for the non ideal or with air resistance 
xn = (vx*tlin);
yn = ((h)+(vy*tlin)-(((9.81)*(tlin.^2))/(2)));

%Plot the projectile motion 
plot (x,y,'r--');
hold on 
plot (xn,yn,'b--');
legend('Ideal','Non-ideal');
xlabel('Range')
ylabel('Height')
title('Projectile Motion')
grid on
