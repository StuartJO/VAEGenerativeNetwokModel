function [t,dir,axon_length,L] = axonTrajectory(s,node_centres,b,delta)

% From Song 2014 PNAS

% s is the starting position of the axos

% node_centres is the location of each node

%node_centres = [rand(100,1) rand(100,1)]*100;

%s = rand(1,2)*100;
%b = 2.5;
%delta = 5;

s_R = s - node_centres;

s_R_mag = sqrt( sum(s_R.^2,2) );

L = -sum(s_R./(s_R_mag).^(b+1));

dir = L / sqrt( sum(L.^2,2) );

axon_length = -delta .* log(rand(1, 'like', delta));

t = s + (dir.*axon_length);