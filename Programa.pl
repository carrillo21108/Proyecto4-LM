%Clausula derivada de una constante
derivada(X,_,0):- number(X).
%Hecho derivada simple
derivada(X,X,1).
%Hechos derivadas de funciones trigonometricas
derivada(sin(X),X,cos(X)).
derivada(cos(X),X,-sin(X)).
derivada(tan(X),X,1/(cos(X)^2)).
derivada(arctan(X),X,1/(X^2+1)).
%Clausula derivada de funcion potencia
derivada(X^N,X,N*X^NN):- N>0,NN is N-1.
%Hecho derivada de funcion logaritmo natural
derivada(ln(X),X,1/X).
%Hecho derivada funcion exponencial
derivada(exp(N,X),X,exp(N,X)*ln(N)).
%Clausula derivada suma de funciones
derivada(U+V,X,DU+DV):- derivada(U,X,DU),derivada(V,X,DV).
%Clausula derivada resta de funciones
derivada(U-V,X,DU-DV):- derivada(U,X,DU),derivada(V,X,DV).
%Clausula derivada producto de funciones
derivada(U*V,X,U*DV):- number(U),derivada(V,X,DV).
derivada(U*V,X,V*DU):- number(V),derivada(U,X,DU).
derivada(U*V,X,U*DV+DU*V):- not(number(U)),not(number(V)),derivada(U,X,DU),derivada(V,X,DV).
%Clausula derivada division de funciones
derivada(U/V,X,((DU*V)-(U*DV))/(V)^2):- not(number(U)),not(number(V)),derivada(U,X,DU),derivada(V,X,DV).
%Clausula regla de la cadena funciones trigonometricas
derivada(sin(U),X,cos(U)*D):- derivada(U,X,D).
derivada(cos(U),X,-sin(U)*D):- derivada(U,X,D).
derivada(tan(U),X,(1/(cos(U)^2))*D):- derivada(U,X,D).
derivada(arctan(U),X,(1/(1+U^2))*D):- derivada(U,X,D).
%Clausula regla de la cadena funcion potencia
derivada(U^N,X,N*(U^NN)*D):- N>0,NN is N-1,derivada(U,X,D).
%Clausula regla de la cadena funcion logaritmo natural
derivada(ln(U), X, (1/U) * D) :- derivada(U, X, D).
%Clausula regla de la cade funcion exponencial
derivada(exp(N,U),X,exp(N,U)*ln(N)*D):- derivada(U,X,D).