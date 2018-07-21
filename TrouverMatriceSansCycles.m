%%%%%%%%% A représente la matrice de surclassement
%%%%%%%%% tab : la matrice contenant les cycles
%%%%%%%%% n : le nombre d'actions
%% cette fonction donne la matrice finale sur laquelle travailler
%% la matrice finale ne contient aucun cycle
%%%%% CONSTRUCTION D'UN STABLE %%%%%%%%%%

function [MatriceFinale]=TrouverMatriceSansCycles(A,tab,n)
[a,b]=size(tab);
if a~=0
for i=1:a
    cpt=0; vect=[];
    
    for j=1:n
     if tab(i,j)==1
        cpt=cpt+1;
         vect(cpt)=j;
     end
    end
    vect;
    [c,v]=size(vect);
    ligne=zeros(1,n);
    colonne=zeros(n,1);
    for j=1:v
       for k=1:n
           ligne(k)=ligne(k)+A(vect(j),k);
           colonne(k,1)=colonne(k,1)+A(k,vect(j));
       end
    end
    ligne;
    colonne;
    vect;
    
    for k=1:v
        A(:,vect(k))=colonne;
        %A(vect(k),:)=ligne;
    end
    for i=1:v
        for j=1:v
            A(vect(i),vect(j))=0;
        end
    end
  
%     colonne=[colonne;0];
%     A=[A;ligne];
%     A=[A,colonne];
%     A(:,vect)=[];
%     A(vect,:)=[];
%     [n,n]=size(A);
    
    
end
A;
else
    A;
end

for i=1:a
    vect=[];
   resultat=zeros(1,n);
   cpt=1;
    for j=1:n
        if tab(i,j)==1
            vect(cpt)=j;
            cpt=cpt+1;
        end
    end
    vect;
    [c,v]=size(vect);
    for j=1:v
        for k=1:n
        resultat(k)=resultat(k)+A(vect(j),k);
        end
    end
    resultat;
    for j=1:v
        A(vect(j),:)=resultat;
    end
end




[c,v]=size(A);
for i=1:c
    A(i,i)=0;
    for j=1:v
        if A(i,j)>1
            A(i,j)=1;
        end
    end
end
MatriceFinale=A;
end