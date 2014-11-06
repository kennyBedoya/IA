
%%-----------lecturas del archivo de imagenes
imagenes_a = fopen('train-images.idx3-ubyte','rb');

%numero magico
magic_number = fread(imagenes_a,1, 'int32',0,'ieee-be');

%numero de imagenes
num_images = fread(imagenes_a,1,'int32',0, 'ieee-be');

%numero de filas
num_fila = fread(imagenes_a,1,'int32',0, 'ieee-be');

%numero de columnas
num_col = fread(imagenes_a,1,'int32',0, 'ieee-be');

%imagenes
images = fread(imagenes_a,inf,'unsigned char');

%--se cierra el archivo
fclose(imagenes_a);

%%--------------lecturas del archivo de labels
labels_a = fopen('train-labels.idx1-ubyte','rb');

%numero magico
magic_num_lab = fread(labels_a,1,'int32',0, 'ieee-be');

%numero de labels
num_labels = fread(labels_a,1,'int32',0,'ieee-be');

%labels
labels = fread(labels_a,inf,'unsigned char');

%--se cierra el archivo
fclose(labels_a);

%--------------------------------------

%%--------forward-----------------------------------------
%%definiciones
f=inline('1./(1+exp(-x))');
x_a=reshape(images,[784,60000]);

%matriz de entrada x con los unos
x= [ones(1,num_images);x_a];

%matriz de pesos w sub 1, rango entre 20 Y 50, de 300x785 
w1 = randi([20,50],300,785);

%matriz de pesos w sub 2, rango entre 20 Y 50, de 300x785 
w2 = randi([20,50],10,301);

%----calculo de la propagacion
z1 = w1*x;
a1 = f(z1);

%se anaden los unos a a1
a1 = [ones(1,num_images);a1];

z2 = w2*a1;

a2 = f(z2);

%%-----prueba de mostrar una imagen
as = x_a(:,3);
image((reshape(as,[num_fila,num_col]))');
%--------------------

%prueba de salida
a2(:,1000)
labels(3,:)
