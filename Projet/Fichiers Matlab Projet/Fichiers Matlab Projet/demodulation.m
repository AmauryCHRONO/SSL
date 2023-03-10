function [sf]=demodulation(se,te,Fp,Fc,Fe,type)
%
% Démodulation synchrone du signal se.
% Inputs
% se  : signal d'entrée modulé
% Fe : frequence d'echantillonnage de se
% Fc : frequence de coupure a -3dB du filtre passe-bas
% Fp : frequence de modulation
%type : type de démodulation choisi, soit à 4 signaux (1), soit à 8 signeaux (2)
% Outputs : signal démodulé et filtré


switch type
  
    case 1
    
        % Démodulation du signal
        s=se.*cos(2*pi*Fp*te);
        
    case 2
        
        % Démodulation du signal
        s=se.^2;
        
end

% Filtrage du signal démodulé
[sf]=PasseBas(s,Fe,Fc);

% Transformée de Fourier respectivement du signal modulé, du sinal démodulé
% et du signal démodulé et filtré
[Se,fe]=TransFourier(se,te);
[S,f]=TransFourier(s,te);
[Sf,ff]=TransFourier(sf,te);

% Affichage
figure(1);subplot(321);plot(te,se);title('Signal reçu modulé');xlabel('Temps (en s)');ylabel('Amplitude du signal (en dB)');
          subplot(322);plot(fe,abs(Se));title('Spectre du signal reçu modulé');xlabel('Fréquence (en Hz)');ylabel('Amplitude du signal (en V)');
          subplot(323);plot(te,s);title('Signal reçu démodulé');xlabel('Temps (en s)');ylabel('Amplitude du signal (en dB)');
          subplot(324);plot(f,abs(S));title('Spectre du signal reçu démodulé');xlabel('Fréquence (en Hz)');ylabel('Amplitude du signal (en V)');
          subplot(325);plot(te,sf);title('Signal reçu démodulé et filtré');xlabel('Temps (en s)');ylabel('Amplitude du signal (en dB)');
          subplot(326);plot(ff,abs(Sf));title('Spectre du signal reçu démodulé et filtré');xlabel('Fréquence (en Hz)');ylabel('Amplitude du signal (en V)');



