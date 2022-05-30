 %Newton: se ingresa el valor inicial (x0), la tolerancia del error (Tol) y el màximo nùmero de iteraciones (niter) 
% Elegir entre 0 y 1 para el tipo de error, siendo 0 el error absoluto y 1
% el error relativo
function [n,xn,fm,dfm,E] = Newton()
    syms x
f = input("Ingrese la funcion f:");
x0 = input("Ingrese x0:");
Tol = input("Ingrese la toleracia:"); 
niter = input ("Ingrese el numero maximo de iteraciones:");
Terr = input ("Ingrese el tipo de error que quiere hallar, siendo 0 error absoluto y 1 error relativo: ");

        %f=sin(2*x)-(x/(3))^3+0.1;
        df=diff(f);
        c=0;
        fm(c+1) = eval(subs(f,x0));
        fe=fm(c+1);
        dfm = eval(subs(df,x0));
        dfe=dfm;
        E(c+1)=Tol+1;
        error=E(c+1);
        xn(c+1)=x0;
        N(c+1)=c;
        while error>Tol && fe~=0 && dfe~=0 && c<niter
            xn(c+2)=x0-fe/dfe;
            fm(c+2)=eval(subs(f,xn(c+2)));
            fe=fm(c+2);
            dfm=eval(subs(df,xn(c+2)));
            dfe=dfm;
            if Terr==0
                E(c+2)=abs(xn(c+2)-x0);
            else
                E(c+2)=abs(xn(c+2)-x0)/x0;
            end
            error=E(c+2);
            x0=xn(c+2);
            N(c+2)=(c+1);
            c=c+1;
               
        end
        if fe==0
           n=x0;
           fprintf('%f es raiz de f(x) \n',x0)
           disp('          N          Xn          Fx          Error')
           D = [N' xn' fm' E'];
           disp(D)
   

        elseif error<Tol
           n=x0;
           fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f \n',x0,Tol)
           disp('          N          Xn          Fx          Error')
           D = [N' xn' fm' E'];
           disp(D)

        elseif dfe==0
           n=x0;
           fprintf('%f es una posible raiz múltiple de f(x) \n',x0)
           disp('          N          Xn          Fx          Error')
           D = [N' xn' fm' E'];
           disp(D)
          
        else 
           n=x0;
           fprintf('Fracasó en %f iteraciones \n',niter)
           disp('          N          Xn          Fx          Error')
           D = [N' xn' fm' E'];
           disp(D)
            
        end
        
end