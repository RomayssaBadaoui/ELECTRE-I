function [sol]=ordre_ELECTRE_I(n,m,mat,nbr)
result=zeros(1,n);
for i=1:n
    for j=1:n
        result(i)=result(i)+mat(j,i);
    end
end
result
cpt=0;
vect=[];
t=0;
while cpt~=n
    mini=min(result);
    for i=1:n
        if result(i)==mini
            t=t+1;
            vect(1,t)=i;
            result(i)=+inf;
            cpt=cpt+1;
        end
    end
    
end
vect;
sol=vect(1:nbr)

end