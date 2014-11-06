%inicio del ciclo
iter=0
%maximo numero de iteraciones
max_iter=1500
%valores iniciales de theta cero y theta uno
teta0=0
teta1=0.5
%valor de alpha
alpha=0.01
%valores entregados (tablas)
x=load('ex2x.dat')
y=load('ex2y.dat')
%arreglo para guardar puntos de los errores calculados
j=[]

%ventana donde se grafican los puntos iniciales del training set
figure
hold on
plot(x,y,'go')

%se calcula la longitud de los datos
m=length(x)

%ciclo principal
while iter < max_iter
    %calcula las sumatorias internas
    for i=1:m
        %sumatoria de theta cero
        sum=(( teta0+(teta1* x(i))) - y(i))+sum
        %sumatoria de theta 1
        sum2=((( teta0+(teta1* x(i))) - y(i))* x(i))+ sum2
        %sumatoria de la funcion de error
        sum_j=((( teta0+(teta1* x(i))) - y(i) )* (( teta0+(teta1* x(i))) - y(i) )) + sum_j
    end
    
    %nuevo theta cero
    teta0_n =teta0 - (alpha * sum / m)
    %nuevo thera uno
    teta1_n =teta1 - (alpha * sum2 / m)
    %funcion de error
    jtemp=sum_j / (2* m )
    %arreglo para depositar todos los valores de error
    j= [j,jtemp]
    
    %se reasignan los nuevos valores de theta cero y theta uno
    teta0 = teta0_n
    teta1 = teta1_n
    
    %incremento del iterador
    iter=iter+1
    %se reinician los valores de la variable temporal para calcular
    %sumatorias
    sum=0
    sum2=0
    sum_j=0
end

%impresion de theta cero y theta uno
disp(teta0)
disp(teta1)

%grafica la recta con los tetas optimos en la ventana donde se encuentran
%los puntos (valores de la tabla)
var=[2:8]
plot(var, teta0 + teta1*var)

%ventana en donde se grafica la funcion de costo
figure
hold on
plot(j,'r')