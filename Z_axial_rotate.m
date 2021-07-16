%¢w¡iZ_axial_rotate¡j¢w¢w¢w
function [VVV]=Z_axial_rotate(v_number,VVV,d_phi)
ball_VVV=zeros(v_number,3);
ball_VVV(:,1)=sqrt(VVV(:,1).^2+VVV(:,2).^2+VVV(:,3).^2);  
ball_VVV(:,2)=acos(VVV(:,3)./ball_VVV(:,1));   % theta 0~pi
for i=1:v_number  
    if (VVV(i,1)<0)
         ball_VVV(i,3)=atan(VVV(i,2)/VVV(i,1))+d_phi+pi;   
    else
         ball_VVV(i,3)=atan(VVV(i,2)/VVV(i,1))+d_phi;
    end
end
VVV(:,1)=ball_VVV(:,1).*sin(ball_VVV(:,2)).*cos(ball_VVV(:,3));
VVV(:,2)=ball_VVV(:,1).*sin(ball_VVV(:,2)).*sin(ball_VVV(:,3));
VVV(:,3)=ball_VVV(:,1).*cos(ball_VVV(:,2))+1;