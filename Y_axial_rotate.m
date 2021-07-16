%¢w¡iY_axial_rotate¡j¢w¢w¢w
function [VVV]=Y_axial_rotate(v_number,VVV,d_theta)
cyl_VVV=zeros(v_number,2);
cyl_VVV(:,1)=sqrt(VVV(:,1).^2+VVV(:,3).^2);
for i=1:v_number
    if (and(VVV(i,1)==0,VVV(i,3)==0))
        cyl_VVV(i,2)=0;
    elseif (VVV(i,3)>=0)
        cyl_VVV(i,2)=asin(VVV(i,1)/cyl_VVV(i,1))-d_theta;
    else
        cyl_VVV(i,2)=pi-asin(VVV(i,1)/cyl_VVV(i,1))-d_theta;
    end
end
VVV(:,3)=cyl_VVV(:,1).*cos(cyl_VVV(:,2));
VVV(:,1)=cyl_VVV(:,1).*sin(cyl_VVV(:,2));