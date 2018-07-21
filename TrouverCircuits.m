%%%%%%% Fonction qui permet de trouver les cycles, de supprimer les cycles 
%%%%%%% qui se répètent dans la matrice et de supprimer les cycles
%%%%%%% imbriqués



function cycleFort=TrouverCircuits(SurFort,n)

SurFort;

 tabfinFort=[];

for i=1:n 
   for j=1:n  
        tab=zeros(1,n);
       
         if SurFort(i,j)==1
                   k=1; cpt=1; tab(i)=cpt; 
                   bool=false; bool1=false;
          while bool==false && k<=n 
             if SurFort(j,k)==1
                  if tab(j)~=0
                      bool=true; 
                     
                          if tab(j)==1 
                          bool1=true;
                          end
                  else
                      cpt=cpt+1;
                      tab(j)=cpt; j=k; k=1;
                  end
              else
                  k=k+1;
              end
              
                  
          end
          if bool1==true 
              tabfinFort=[tabfinFort;tab];
          end
         end
   end
end
tabfinFort;


[a,b]=size(tabfinFort);
for i=1:a
    for j=1:b
        if tabfinFort(i,j)>1
            tabfinFort(i,j)=1;
        end
    end
end
tabfinFort;
tabfinalFort=tabfinFort;

   %%% les répétitions dans la matrice de circuits
   tableau=[];
  [a,b]=size(tabfinalFort);
  if a~=0
  tableau=tabfinalFort(1,:);
  result=[];
  for i=1:a
      for j=i+1:a
          if i~=j
               result=tabfinalFort(i,:)==tabfinalFort(j,:);
              cpt=0;
              for h=1:n
                  if result(h)==1
                      cpt=cpt+1;
                  end
              end
               if cpt==n
                  mm=1;
              else
                  mm=0;
              end
              if mm==0
                  cpt2=0; [c,v]=size(tableau); 
                  for k=1:c
                       result=tabfinalFort(j,:)==tableau(k,:);
                      cpt=0;
                      for h=1:n
                          if result(h)==1
                              cpt=cpt+1;
                          end
                      end
                      if cpt~=n
                          cpt2=cpt2+1;
                      end
                      end
                  if cpt2==c
                      tableau=[tableau;tabfinalFort(j,:)];
                  end
              end
          end
      end
      
  end
  
  end
  tableau;
 
  %%%%%%%%%%%%%%% Supprimer les cycles "imbriqués"

vect=[];
   cycleFort=[];
   [a,b]=size(tableau);
   if a~=0
   for i=1:a
       for j=1:a
           if i~=j
               cpt=0;
               for k=1:n
                   if tableau(j,k)==1
                       cpt=cpt+1;
                       vect(cpt)=k;
                   end
               end
               vect;
               [c,v]=size(vect);
               cpt=0;
               for k=1:v
                   if tableau(i,vect(k))==1
                       cpt=cpt+1;
                   end
               end
               if cpt==v
                   tableau(j,:)=zeros(1,n);
               end
           end
       end
   end
   
   for i=1:a
       cpt=0;
       for k=1:n
           if tableau(i,k)==0
               cpt=cpt+1;
           end
       end
       if cpt~=n
           cycleFort=[cycleFort;tableau(i,:)];
       end
   end
   cycleFort;


   else
     %  disp('Pas de cycles dans le graphe de surclassement');

   end

end