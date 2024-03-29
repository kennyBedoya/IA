
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

%%---variables de control

%tamaño de imagenes ancho x alto en pixeles (784)
tam = length(as);
%numero de neuronas de la capa oculta
nco = 300;
%numero de neurona de la capa de salida
ncs = 10;
%%-intervalo para los pesos (w)
lim_min = 20; %limite inferior
lim_max = 50; %limite superior
%numero de la imagen a imprimer en la prueba (valor maximo = 60000 )
img_p = 60000;
%numero de la imagen para consultar en la salida de la red neuronal
img_consul = 60000;


%%---definiciones
f=inline('1./(1+exp(-x))');
x_a=reshape(images,[tam,60000]);

%matriz de entrada x con los unos
x= [ones(1,num_images);x_a];

%matriz de pesos w sub 1, rango entre 20 Y 50, de 300x785 
w1 = randi([lim_min,lim_max],nco,(tam+1));

%matriz de pesos w sub 2, rango entre 20 Y 50, de 300x785 
w2 = randi([lim_min,lim_max],ncs,(nco+1));

%----calculo de la propagacion
z1 = w1*x;
a1 = f(z1);

%se anaden los unos a a1
a1 = [ones(1,num_images);a1];

z2 = w2*a1;

a2 = f(z2);

%%-----prueba de mostrar una imagen
as = x_a(:,img_p);
image((reshape(as,[num_fila,num_col]))');

%img_aux = imread((reshape(as,[num_fila,num_col]))');
%gray_scale = rgb2gray(img_aux);
%imshow(gray_scale);
%--------------------

%prueba de salida
a2(:,img_consul)
labels(img_p,:)
