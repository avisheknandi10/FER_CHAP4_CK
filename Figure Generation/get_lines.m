% get lines
function T = get_lines(pts)

        L = length(pts);
        T = zeros(nchoosek(L,2),4);
        m = 1;
        for i = 1:L
            for j = i+1:L
                
                T(m,:) = [pts(i,:),pts(j,:)];
                m = m + 1;
                
            end
        end
end
                    