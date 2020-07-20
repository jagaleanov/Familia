/*Hechos*/
padre_de('lina','pablo').
padre_de('gustavo','pablo').
padre_de('julian','diana').
padre_de('consuelo','diana').
padre_de('juan','pedro').
padre_de('juan','carlos').
padre_de('maria','pedro').
padre_de('maria','carlos').
padre_de('chucho','debora').
padre_de('chucho','natalia').
padre_de('ana','debora').
padre_de('ana','natalia').
padre_de('pablo','enrique').
padre_de('diana','enrique').
padre_de('carlos','marcela').
padre_de('carlos','pepe').
padre_de('debora','marcela').
padre_de('debora','pepe').
padre_de('natalia','angelica').
padre_de('alberto','angelica').
padre_de('enrique','david').
padre_de('enrique','rafael').
padre_de('marcela','david').
padre_de('marcela','rafael').
padre_de('pepe','luisa').
padre_de('pepa','luisa').

/*Reglas*/
hijo_de(A,B) :- padre_de(B,A).

hermano_de(A,B) :- padre_de(C,A), padre_de(C,B), A \== B.

abuelo_de(A,B) :- padre_de(A,C), padre_de(C,B).

nieto_de(A,B) :- abuelo_de(B,A).

bisabuelo_de(A,B) :- abuelo_de(A,C), padre_de(C,B).

bisnieto_de(A,B) :- bisabuelo_de(B,A).

tio_de(A,B) :- padre_de(C,B), hermano_de(C,A).

sobrino_de(A,B) :- tio_de(B,A).

primo_de(A,B) :- padre_de(C,A), hermano_de(C,D), padre_de(D,B).

casado_con(A,B) :- padre_de(A,C), padre_de(B,C), A \== B.

cunado_de(A,B) :- hermano_de(A,C), casado_con(C,B), !.
cunado_de(A,B) :- hermano_de(B,C), casado_con(C,A).

suegro_de(A,B) :- padre_de(A,C), casado_con(C,B).

hierno_de(A,B) :- suegro_de(B,A).

es_feliz(A) :- casado_con(A,B), A \== B.

familiar_de(A,B) :- padre_de(A,B), !.
familiar_de(A,B) :- abuelo_de(A,B), !.
familiar_de(A,B) :- nieto_de(A,B), !.
familiar_de(A,B) :- hermano_de(A,B), !.
familiar_de(A,B) :- tio_de(A,B), !.
familiar_de(A,B) :- sobrino_de(A,B), !.
familiar_de(A,B) :- primo_de(A,B), !.
familiar_de(A,B) :- bisabuelo_de(A,B), !.
familiar_de(A,B) :- bisnieto_de(A,B), !.
familiar_de(A,B) :- casado_con(A,B), !.
familiar_de(A,B) :- suegro_de(A,B), !.
familiar_de(A,B) :- hierno_de(A,B), !.

