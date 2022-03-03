

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

ResampledParc = griddata(azimuth,sin_e,lh_rand200,Xq,Yq,'nearest');
ax1 = subplot(1,3,1);
imagesc(azimuth_range,sin_e_range,ResampledParc)

for i = 0:100
   lh_rand200_cmap(i+1,:) = HCPMMP1_cmap(mode(lh_HCPMMP1((lh_rand200 == i)))+1,:); 
end
colormap(ax1,lh_rand200_cmap)
%Vq = interp2(azimuth,sin_e,lh_HCPMMP1,Xq,Yq);

vert_data_parc = zeros(length(lh_rand200),1);

for i = 0:100
vert_data_parc(lh_rand200==i) = mean(lh_gene_pcs(lh_rand200==i,1));
end
ax2 = subplot(1,3,2);
ResampledData{1} = griddata(azimuth,sin_e,vert_data_parc,Xq,Yq,'nearest');
imagesc(azimuth_range,sin_e_range,ResampledData{1})
colormap(ax2,magma)
for i = 0:100
vert_data_parc(lh_rand200==i) = mean(lh_func_grad1(lh_rand200==i,1));
end
ax3 = subplot(1,3,3);
ResampledData{2} = griddata(azimuth,sin_e,vert_data_parc,Xq,Yq,'nearest');
imagesc(azimuth_range,sin_e_range,ResampledData{2})
colormap(ax3,viridisplus)