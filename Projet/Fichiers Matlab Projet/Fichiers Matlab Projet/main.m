%Variables 
T=10;% deux fois la période du message transmis
Fe=96000; % frequence d'echantillonnage 
Fp=15000; % frequence de la porteuse
Fc=3000; % frequence de coupure du filtre passe bas
type=1; %type de démodulation choisi, soit à 4 signaux (1), soit à 8 signaux (2)

%main
% recuperation du message dans le fichier nomfic
[nomfic,Signal,t] = RecordModulation(Fe,T);

%demodulation du message
[sf]=demodulation(Signal,t,Fp,Fc,Fe,type);
soundsc(sf,Fe)
