%%%%%%%%% Fonction pour éliminer les cycles qui ont des sommets en commun
%%%%%%%%% en les transformant en un seul cycle.

function [cycleFort]=cycles(cycleFort,n)
cycleFort;
[a,b]=size(cycleFort);
verif=zeros(1,n)
for i=1:a
    for j=1:n
       
        verif(j)=verif(j)+cycleFort(i,j);
    end
end
verif;
cpt1=0;
for i=1:n
    if verif(i)>=2
        cpt1=cpt1+1;
    end
end
cpt1;
if cpt1~=0
if a>1
kk=0; i=1; j=2;
while kk==0
 
    cycleFort;
     mm=0; nn=0;
    [a,b]=size(cycleFort);
    while i<a || nn==0
        j=i+1;
        a
       while j<=a && mm==0
           resultat=zeros(1,n);
           if i~=j
               for k=1:n
                   k
                   i
                   j
                   a
                  resultat(k)=resultat(k)+cycleFort(i,k)+cycleFort(j,k);
               end
           end
           resultat
           cpt=0;
           for k=1:n
               if resultat(k)==2
                   cpt=cpt+1;
               end
           end
           if cpt~=0
               for k=1:n
                   if resultat(k)==2
                       resultat(k)=1;
                   end
               end
               nn=1; mm=1;
             
               cycleFort(i,:)=[];
               cycleFort(j-1,:)=[];
               disp('voilà')
               cycleFort=[cycleFort;resultat]
                
               [a,b]=size(cycleFort);
               resultat1=zeros(1,n);
                 for k=1:a
                   for l=1:n
                     resultat1(l)=resultat1(l)+cycleFort(k,l);
                   end
                 end
                 
                 cpt1=0;
                 for k=1:n
                     if resultat1(k)>=2
                         cpt1=cpt1+1;
                     end
                 end
              
                 if cpt1==0
                     kk=1;
                 end
           else
               
              j=j+1;
              disp('hello')
              j
           end
       end
       i=i+1;
       disp('iciiiiii')
      end
    [a,b]=size(cycleFort);
    

  
end
end
end
cycleFort;
end