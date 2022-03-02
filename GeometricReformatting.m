

x = lh_sphere_verts(:,1);
y = lh_sphere_verts(:,2);
z = lh_sphere_verts(:,3);

[azimuth,elevation,r] = cart2sph(x,y,z);

% scatter(azimuth,sin(elevation),10,lh_HCPMMP1,'filled')
% 
% scatter(azimuth,elevation,10,lh_HCPMMP1,'filled')

sin_e = sin(elevation);

azimuth_range = linspace(-pi,pi,192);

sin_e_range = linspace(-1,1,192);

[Xq,Yq] = meshgrid(azimuth_range,sin_e_range);

ResampleData = griddata(azimuth,sin_e,lh_HCPMMP1,Xq,Yq,'nearest');

imagesc(azimuth_range,sin_e_range,ResampleData)

%Vq = interp2(azimuth,sin_e,lh_HCPMMP1,Xq,Yq);
