function [T,s] = FonctionTP4(A,mu0,phi0,D,Fe)

Te=1/Fe;
T=0:Te:D-Te;
s=A*sin(2*pi*mu0*T+phi0);