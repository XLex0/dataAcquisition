function isConnectedMyo = connectFakeMyo()
% Funci�n para conectarse al Fake Myo.
global myoObject
myoObject = FakeMyoMex();
isConnectedMyo = myoObject.myoData.isStreaming;
end