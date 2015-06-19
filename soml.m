function [ new_w,delta,l ] = soml( t,tp,tn,w )
m = size(w,2);
learningRate = 1;
lambda = 10^-5;
alpha = learningRate * lambda;
l=loss(t,tp,tn,diag(w));
delta=-1;
if(l>0)
    difft = tp - tn;
    
    delta_vector = t.*difft;
    delta=norm(delta_vector,2);
    v=w - learningRate * (delta_vector);
    
    
    new_w=zeros(size(w));
    for i=1:m
        v_m=v(1,i);
        if(v_m>=0)
            new_w(1,i) = max(0,v_m - alpha);
        else
            new_w(1,i) = min(0,v_m +alpha);
        end
    end
else
    new_w =w;
end
%disp(new_w);
end

