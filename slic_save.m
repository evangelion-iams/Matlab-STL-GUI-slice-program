%�w�ifunction���j�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t
function slic_save(v_number,VVV,Zp_1,kk,mode,area_mode,height,width)
Zp=double(Zp_1);   % set Z_plane position�E
kn=0;
for j=1:(v_number/3)                    
    VZ_1=VVV(1+3*(j-1),3)-Zp;
    VZ_2=VVV(2+3*(j-1),3)-Zp;
    VZ_3=VVV(3+3*(j-1),3)-Zp;
    if not(abs(VZ_1+VZ_2+VZ_3)==(abs(VZ_1)+abs(VZ_2)+abs(VZ_3)))
       kn=kn+1;
    end
end
%�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w
V_V=zeros(kn*2,2);
k=0;
for j=1:(v_number/3)                    
    VZ_1=VVV(1+3*(j-1),3)-Zp;
    VZ_2=VVV(2+3*(j-1),3)-Zp;
    VZ_3=VVV(3+3*(j-1),3)-Zp;
    if not(abs(VZ_1+VZ_2+VZ_3)==(abs(VZ_1)+abs(VZ_2)+abs(VZ_3))) % �P�_�O�_���ۥ�
       k=k+1;
       %�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w
       if (or((VZ_1==0),or((VZ_2==0),(VZ_3==0))))    % �ۥ��@���I�P�@�� �icase 2�j
           if (VZ_1==0)
               V_V(1+3*(k-1),1)=VVV(1+3*(j-1),1);
               V_V(1+3*(k-1),2)=VVV(1+3*(j-1),2);
               V_V(2+3*(k-1),1)=(-VZ_2)*(VVV(3+3*(j-1),1)-VVV(2+3*(j-1),1))/(VVV(3+3*(j-1),3)-VVV(2+3*(j-1),3))+VVV(2+3*(j-1),1); % Xp
               V_V(2+3*(k-1),2)=(-VZ_2)*(VVV(3+3*(j-1),2)-VVV(2+3*(j-1),2))/(VVV(3+3*(j-1),3)-VVV(2+3*(j-1),3))+VVV(2+3*(j-1),2); % Yp
           elseif (VZ_2==0)
               V_V(1+3*(k-1),1)=VVV(2+3*(j-1),1);
               V_V(1+3*(k-1),2)=VVV(2+3*(j-1),2);
               V_V(2+3*(k-1),1)=(-VZ_1)*(VVV(3+3*(j-1),1)-VVV(1+3*(j-1),1))/(VVV(3+3*(j-1),3)-VVV(1+3*(j-1),3))+VVV(1+3*(j-1),1); % Xp
               V_V(2+3*(k-1),2)=(-VZ_1)*(VVV(3+3*(j-1),2)-VVV(1+3*(j-1),2))/(VVV(3+3*(j-1),3)-VVV(1+3*(j-1),3))+VVV(1+3*(j-1),2); % Yp
           else %(VZ_3==0)
               V_V(1+3*(k-1),1)=VVV(3+3*(j-1),1);
               V_V(1+3*(k-1),2)=VVV(3+3*(j-1),2);
               V_V(2+3*(k-1),1)=(-VZ_1)*(VVV(2+3*(j-1),1)-VVV(1+3*(j-1),1))/(VVV(2+3*(j-1),3)-VVV(1+3*(j-1),3))+VVV(1+3*(j-1),1); % Xp
               V_V(2+3*(k-1),2)=(-VZ_1)*(VVV(2+3*(j-1),2)-VVV(1+3*(j-1),2))/(VVV(2+3*(j-1),3)-VVV(1+3*(j-1),3))+VVV(1+3*(j-1),2); % Yp
           end
           %*************************************************************�q
       else    % �ۥ����� �icase 1�j
           if (abs(-VZ_1+VZ_2+VZ_3)==(abs(VZ_1)+abs(VZ_2)+abs(VZ_3))) % V1���P��
               V_V(1+3*(k-1),1)=(-VZ_1)*(VVV(2+3*(j-1),1)-VVV(1+3*(j-1),1))/(VVV(2+3*(j-1),3)-VVV(1+3*(j-1),3))+VVV(1+3*(j-1),1); % Xp [V1��V2]
               V_V(1+3*(k-1),2)=(-VZ_1)*(VVV(2+3*(j-1),2)-VVV(1+3*(j-1),2))/(VVV(2+3*(j-1),3)-VVV(1+3*(j-1),3))+VVV(1+3*(j-1),2); % Yp
               V_V(2+3*(k-1),1)=(-VZ_1)*(VVV(3+3*(j-1),1)-VVV(1+3*(j-1),1))/(VVV(3+3*(j-1),3)-VVV(1+3*(j-1),3))+VVV(1+3*(j-1),1); % Xp [V1��V3]
               V_V(2+3*(k-1),2)=(-VZ_1)*(VVV(3+3*(j-1),2)-VVV(1+3*(j-1),2))/(VVV(3+3*(j-1),3)-VVV(1+3*(j-1),3))+VVV(1+3*(j-1),2); % Yp 
           elseif (abs(VZ_1-VZ_2+VZ_3)==(abs(VZ_1)+abs(VZ_2)+abs(VZ_3))) % V2���P��
               V_V(1+3*(k-1),1)=(-VZ_2)*(VVV(1+3*(j-1),1)-VVV(2+3*(j-1),1))/(VVV(1+3*(j-1),3)-VVV(2+3*(j-1),3))+VVV(2+3*(j-1),1); % Xp [V2��V1]
               V_V(1+3*(k-1),2)=(-VZ_2)*(VVV(1+3*(j-1),2)-VVV(2+3*(j-1),2))/(VVV(1+3*(j-1),3)-VVV(2+3*(j-1),3))+VVV(2+3*(j-1),2); % Yp
               V_V(2+3*(k-1),1)=(-VZ_2)*(VVV(3+3*(j-1),1)-VVV(2+3*(j-1),1))/(VVV(3+3*(j-1),3)-VVV(2+3*(j-1),3))+VVV(2+3*(j-1),1); % Xp [V2��V3]
               V_V(2+3*(k-1),2)=(-VZ_2)*(VVV(3+3*(j-1),2)-VVV(2+3*(j-1),2))/(VVV(3+3*(j-1),3)-VVV(2+3*(j-1),3))+VVV(2+3*(j-1),2); % Yp
           else % (abs(VZ_1+VZ_2-VZ_3)==(abs(VZ_1)+abs(VZ_2)+abs(VZ_3))) V3���P��
               V_V(1+3*(k-1),1)=(-VZ_3)*(VVV(1+3*(j-1),1)-VVV(3+3*(j-1),1))/(VVV(1+3*(j-1),3)-VVV(3+3*(j-1),3))+VVV(3+3*(j-1),1); % Xp [V3��V1]
               V_V(1+3*(k-1),2)=(-VZ_3)*(VVV(1+3*(j-1),2)-VVV(3+3*(j-1),2))/(VVV(1+3*(j-1),3)-VVV(3+3*(j-1),3))+VVV(3+3*(j-1),2); % Yp
               V_V(2+3*(k-1),1)=(-VZ_3)*(VVV(2+3*(j-1),1)-VVV(3+3*(j-1),1))/(VVV(2+3*(j-1),3)-VVV(3+3*(j-1),3))+VVV(3+3*(j-1),1); % Xp [V3��V2]
               V_V(2+3*(k-1),2)=(-VZ_3)*(VVV(2+3*(j-1),2)-VVV(3+3*(j-1),2))/(VVV(2+3*(j-1),3)-VVV(3+3*(j-1),3))+VVV(3+3*(j-1),2); % Yp
           end
       end
    end
end
V_VV=double(uint16(V_V));

if (area_mode==1)  %�m�m�m�m�i�ϫ��d��W���覡�j�n�n�n�n
    slic_1=zeros(uint16(max(VVV(:,1))+3),uint16(max(VVV(:,2))+3)); % �۰ʰ����d��
else
    slic_1=zeros(height,width); % ��ʿ�J�j�p
end
%�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w      
a=zeros(1,k-1);f_2=0;
k_dot=0;
aa=zeros(10,2);
for m=1:k
    f_1p=f_2;
    f_1=[V_VV(1+3*(m-1),1),V_VV(1+3*(m-1),2)];
    f_2=[V_VV(2+3*(m-1),1),V_VV(2+3*(m-1),2)];
    f_4=(f_2-f_1)/(norm(f_2-f_1,2));

    if m>1
        a(1,m)=norm(f_1-f_1p,2);
        if (norm(f_1-f_1p,2)>=3)

            k_dot=k_dot+1;
            aa(k_dot,:)=(5*(f_1-f_1p)/norm(f_1-f_1p,2)+f_1p);
        end
    end
    
    for n=1:((norm(f_2-f_1,2))/(norm(f_4,2)))+1   % �s�u
        slic_1(uint16((f_4(1)*n+f_1(1))+1)+2,uint16((f_4(2)*n+f_1(2))+1)+2)=1;
        slic_1(uint16((f_4(1)*n+f_1(1))+1)+1,uint16((f_4(2)*n+f_1(2))+1)+2)=1;
        slic_1(uint16((f_4(1)*n+f_1(1))+1)+2,uint16((f_4(2)*n+f_1(2))+1)+1)=1;
        slic_1(uint16((f_4(1)*n+f_1(1))+1)+2,uint16((f_4(2)*n+f_1(2))+1)+3)=1;
    end
end
%�w�i�񺡡j�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t
aa=double(uint16(aa));
if (mode==1)
    if k_dot==0
        Ifill_2 = (uint8(255*imfill(slic_1)));
    else
        for i=1:k_dot
            slic_1=logical(slic_1);
            Ifill_2 = (uint8(255*imfill(slic_1,aa(i,:),4)-255*slic_1));
        end
    end
elseif (mode==2)
    Ifill_2 = uint8(255*not(imfill(slic_1)-slic_1));
elseif (mode==3)
    slic_1=logical(slic_1);
    Ifill_2 = uint8(255*(not(uint8(255*(slic_1)))));

else
   if k_dot==0
        Ifill_2 = uint8(255*not(uint8(255*imfill(slic_1))));
    else
        for i=1:k_dot
            slic_1=logical(slic_1);
            Ifill_2 = uint8(255*not(uint8(255*imfill(slic_1,aa(i,:),4)-255*slic_1)));
        end
    end
end
%%�w�iSlicing���j=========================================================<
%XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
%�w�i�Φs�ɡ��j�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t
if area_mode==2
   Ifill_2=Ifill_2(1:height,1:width)';
elseif area_mode==1
   Ifill_2=Ifill_2';
end
imwrite(Ifill_2,[int2str(mod(kk-mod(kk,100),1000)/100),int2str(mod(kk-mod(kk,10),100)/10),num2str(mod(kk,10)),'.bmp']);

%==�imain���j=============================================================<
%XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


