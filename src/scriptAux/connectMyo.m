function isConnectedMyo = connectMyo()
% Funci�n para conectarse al Myo. Utiliza librer�a Myo Mex. No se realiza
% ninguna acci�n en el caso de que el dispositivo ya est�
% conectado. La estructura que contiene los datos del Myo se llama
% myoObject; esta es usada como variable global.

global myoObject

isConnectedMyo = 1; % Bandera que indica estado de conexi�n

try
    % Revisando si existe conexi�n existente
    isConnectedMyo = myoObject.myoData.isStreaming;
    
    if isnan(myoObject.myoData.rateEMG)
        terminateMyo
        isConnectedMyo = 0;
    end
catch
    % En el caso de que no haya conexi�n detectada.
    
    try
        % Nueva conexi�n
        myoObject = MyoMex();
        %         beep
        myoObject.myoData.startStreaming();
        
        % fprintf('Conexi�n con MYO exitosa!!!\n');
    catch
        % No conexi�n posible
        isConnectedMyo = 0;
    end
end
end