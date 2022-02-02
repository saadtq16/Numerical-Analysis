%function [finalVal] = NumInt(P,V)
P = [336 294.4 266.4 260.8 2260.5 249.6 193.6 165.6];
V = [0.5 2 3 4 6 8 10 11];

firstP = [P(1) P(2)];
firstV = [V(1) V(2)];
a = trapezium(firstV,firstP);
fprintf('Trapezium (1) = %.4f\n',a);

secondP = [P(2) P(3) P(4)];
secondV = [V(2) V(3) V(4)];
b = Simp1(secondV,secondP);
fprintf('Simpson 1/3 = %.4f\n',b);

thirdP = [P(4) P(5) P(6) P(7)];
thirdV = [V(4) V(5) V(6) V(7)];
c = Simp3(thirdV,thirdP);
fprintf('Simpson 3/8 = %.4f\n',c);


fourthP = [P(7) P(8)];
fourthV = [V(7) V(8)];
d = trapezium(fourthV,fourthP);
fprintf('Trapezium (2) = %.4f\n',d);

finalVal = a + b + c + d;
fprintf('\nW = %.4f KNm\n',finalVal);

    function [val] = trapezium(x,y)
        if length(x) && length(y) > 2
            val = 0
        else
            h = x(2) - x(1);
            val = (h/2) * (y(1) + y(2));
        end
    end

    function [val] = Simp1(x,y)
        if length(x) && length(y) > 3
            val = 0
        else
            h = x(2) - x(1);
            val = (h/3) * (y(1) + (4 * y(2)) + y(3));
        end
    end

    function [value] = Simp3(x,y)
        if length(x) && length(y) > 4
            value = 0
        else
            h = x(2) - x(1);
            value = ((3*h)/8) * (y(1) + (3 * y(2)) + (3 * y(3)) + y(4));
        end
    end
