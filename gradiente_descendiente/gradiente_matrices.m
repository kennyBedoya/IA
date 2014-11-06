%inicio del ciclo
iter=0;
%maximo numero de iteraciones
max_iter=1500;
%valores iniciales de theta cero y theta uno
teta0=0;
teta1=0.5;
%valor de alpha
alpha=0.01;
%valores entregados (tablas)
x=load('ex2x.dat');
y=load('ex2y.dat');
%arreglo para guardar puntos de los errores calculados
j=[];

%ventana donde se grafican los puntos iniciales del training set
figure
hold on
plot(x,y,'go')

%se calcula la longitud de los datos
m=length(x);

%matriz de control de 50x1, de unos
v_unos=ones(m, 1);

%matriz X, de 50x2, con los valores de X0 y X1
x_a = [v_unos, x];

%matriz con los valores de theta cero y theta uno
thetas_a = [teta0; teta1];


%se inicializan las variables de control para las sumatorias
sum1=0;
sum2=0;
sum_j=0;
thetas_prima=0;

%ciclo principal
while iter < max_iter
    
    %calculo de la matriz theta prima
    thetas_prima=(x_a')*((x_a*thetas_a)-y);
    
    %calculo de los nuevos thetas
    thetas_a= thetas_a - ((alpha/m)*thetas_prima);
    
    %calculo de la funcion de costo
    j_e=(1/2*m)*((((x_a*thetas_a)-y)')*((x_a*thetas_a)-y));
    
    %arreglo para depositar todos los valores de error
    j= [j,j_e];
    
    %incremento del iterador
    iter=iter+1;
end

%se muestra el resultado de theta 0 y theta 1
disp('theta cero')
thetas_a(1)
disp('theta uno')
thetas_a(2)

%grafica la recta con los tetas optimos en la ventana donde se encuentran
%los puntos (valores de la tabla)
var=[2:8];
plot(var, thetas_a(1) + thetas_a(2)*var)

%ventana en donde se grafica la funcion de costo
figure
hold on
plot(j,'r')