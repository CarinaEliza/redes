datos=csvread('datos.txt',0,1);
size(datos)
datos=datos';
size(datos)
valores_entradas=datos(1,:);
contenido_datos=datos(2:31,:);
entradas_rangos=minmax(contenido_datos);
net=newff(entradas_rangos,[10 1],{'tansig','logsig'},'trainlm');
training_in = contenido_datos(:,1:2:length(contenido_datos));
testset.P = contenido_datos(:,2:2:length(contenido_datos));
training_target = valores_entradas(1:2:length(valores_entradas));
testset.T = valores_entradas(2:2:length(valores_entradas));
net.trainParam.show=1;
net=train(net,training_in,training_target,[],[],testset);
porc_err_ent = 100*(1-funcion(net,training_in,training_target))
porc_err_valida = 100*(1-funcion(net,testset.P,testset.T))
porc_err_todo = 100*(1-funcion(net,contenido_datos,valores_entradas))