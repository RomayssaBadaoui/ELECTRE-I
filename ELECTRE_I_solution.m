function [solution]=ELECTRE_I_solution (n,m,A,p,c,d)
[n,m]=size(A); % n : nombre d'actions, m : nombre de critères

%Calcul des amplitudes
 for i=1:m
     for j=1:n
         for k=1:n
             if k~=j
                 amp(j,k)=A(j,i)-A(k,i);
             else
                 amp(j,k)=-inf;
             end
         end
     end  
     max=amp(1,1);
     for h=1:n
         for j=1:n
             if amp(h,j)> max
                 max=amp(h,j);
             end
         end
     end
     amplitude(i)=max;
 end
 amplitude;
%Affichage de la matrice 
mat=[A; p; amplitude];

%Matrice de concordance et de discordance

for i=1:n %pour se déplacer dans les lignes (actions) (se fixer à une action précise)
    for k=1:n %pour pouvoir se déplacer dans les lignes et comparer avec l'action fixée par i
for j=1:m %pour se déplacer dans les colonnes (les critères)
    if i==k %comparer l'action fixée par rapport à toutes les autres
        concord(k,j)=-inf;
    else
        if A(i,j)> A(k,j)
            concord(k,j)=1;
        else
            if A(i,j)==A(k,j)
            concord(k,j)=2; 
            else
                concord(k,j)=0;
            end
        end
    end
end
    end
    concord; %la matrice de concordance de l'action fixée par rapport aux autres (ex : a1 / ai i=1:nbe d'actions)
    
  
    
    for k=1:n
        
        if k>i
           
     b=1;
J=concord(k,:);
cptC=0; cptD=0;
t=1; Dis=[];
for l=1:m
 if J(l)==1 
     cptC=cptC+p(l);
 else if J(l)==2
         cptC=cptC+p(l);
         cptD=cptD+p(l);
     else
         cptD=cptD+p(l);
     Dis(t)=l; t=t+1;
     end
 end
 IC=cptC/100;
 ID=cptD/100;
end
matconcord(i,k)=IC;
matconcord(k,i)=ID;
Dis;





if size(Dis)==0
    ID=0;
else 
 [a,b]=size(Dis);
    max=A(k,Dis(1))-A(i,Dis(1));
    
    for l=1:b
        if max <= A(k,Dis(l))-A(i,Dis(l))
            max= A(k,Dis(l))-A(i,Dis(l));
            ampl=Dis(l);
        end
        
    end
    
    ID=max/amplitude(ampl);
end
matdiscord(i,k)=ID;
        end
        if k<i
            
         b=1;
J=concord(k,:);
 cptD=0;
t=1; Dis2=[];
for l=1:m
 if J(l)==0
    
     Dis2(t)=l; t=t+1;
 end

end
Dis2;





if size(Dis2)==0
    ID=0;
else 
 [a,b]=size(Dis2);
    max=A(k,Dis2(1))-A(i,Dis2(1));
    ampl=Dis2(1);
    for l=1:b
      
        if max < A(k,Dis2(l))-A(i,Dis2(l))
            max= A(k,Dis2(l))-A(i,Dis2(l));
            ampl=Dis2(l);
        end
        
    end
    
    ID=max/amplitude(ampl);
end
ID;
matdiscord(i,k)=ID;
        else 
           matconcord(i,i)=-inf;
           matdiscord(i,i)=-inf;
        end





    end


end

 matconcord;
 matdiscord;
 
 for i=1:n
     for j=1:n
         if i==j
             solution(i,j)=-inf;
         else if matconcord(i,j)< c
                 solution(i,j)=0;
             else
                 if matdiscord(i,j) <= d
                     solution(i,j)=1;
                 end
             end
         end
                 
     end
 end
 solution;
 for i=1:n
     solution(i,i)=0;
 end
 solution
 cycle=TrouverCircuits(solution,n);
 cyclefinal=cycles(cycle,n);
 Mat=TrouverMatriceSansCycles(solution,cyclefinal,n);
 solution=Mat;
 t=1;
 for i=1:n
     cpt=0; 
     for j=1:n
        if i~=j
            cpt=cpt+solution(j,i);
        end
     end
     
     
     if cpt==0
         noyau(t)=i;
         t=t+1;
     end
 end
 noyau;
 [a,b]=size(noyau);
 if b==0
     disp('le noyau est vide')
 end
 
 
 
end