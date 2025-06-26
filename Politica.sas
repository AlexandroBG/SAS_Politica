/* Data input */
DATA Trabajo3.Politica;
INPUT NivelImpuestos $ X1-X9;
LABEL X1='1(izquierda)' X2='2' X3='3' X4='4' X5='5' X6='6' X7='7' X8='8' X9='9(derecha)';
CARDS;
9 145 64 111 89 107 23 14 13 12
8 21 12 22 26 22 7 9 8 4
7 37 28 54 41 30 10 9 8 7
6 23 13 40 53 48 20 8 5 8
5 15 14 16 24 35 13 7 5 10
4 58 25 93 80 243 85 56 39 43
3 12 5 9 16 45 23 13 8 7
2 25 8 17 23 56 28 27 14 24
1 12 4 5 7 28 19 16 17 23
;

/* Correspondence analysis */
PROC CORRESP DATA=Trabajo3.Politica OUTC=GRAFICA ALL chi2p;
    VAR X1-X9;
    ID NivelImpuestos;
    ods output CellChiSq=Trabajo3.PoliticaChiSq
               RowProfiles=Trabajo3.PoliticaRow
               ColProfiles=Trabajo3.PoliticaCol
               InertiaChart=Trabajo3.Inertia;
RUN;

/* Column profiles plot */
proc sgplot data=Trabajo3.PoliticaCol;
    series x=Label y=_1_izquierda_/ LINEATTRS=(THICKNESS=3 COLOR=red) legendlabel="Izquierda";
    series x=Label y=_2 / LINEATTRS=(THICKNESS=3 COLOR=orange);
    series x=Label y=_3 / LINEATTRS=(THICKNESS=3 COLOR=yellow);
    series x=Label y=_4 / LINEATTRS=(THICKNESS=3 COLOR=green);
    series x=Label y=_5 / LINEATTRS=(THICKNESS=3 COLOR=cyan);
    series x=Label y=_6 / LINEATTRS=(THICKNESS=3 COLOR=blue);
    series x=Label y=_7 / LINEATTRS=(THICKNESS=3 COLOR=purple);
    series x=Label y=_8 / LINEATTRS=(THICKNESS=3 COLOR=brown);
    series x=Label y=_9_derecha_ / LINEATTRS=(THICKNESS=3 COLOR=black) legendlabel="Derecha";
    yaxis label="Ideología política";
    xaxis label="Nivel de Aportación de Impuestos";
    title "Perfiles columna";
    legend;
run;

/* Transpose and row profiles plot */
proc transpose data=Trabajo3.PoliticaRow out=Trabajo3.PerfilFilaT;
    id Label;
run;

proc sgplot data=Trabajo3.PerfilFilaT;
    series x=_NAME_ y=_9 / LINEATTRS=(THICKNESS=3 COLOR=red) legendlabel="Nivel 9";
    series x=_NAME_ y=_8 / LINEATTRS=(THICKNESS=3 COLOR=orange);
    series x=_NAME_ y=_7 / LINEATTRS=(THICKNESS=3 COLOR=yellow);
    series x=_NAME_ y=_6 / LINEATTRS=(THICKNESS=3 COLOR=green);
    series x=_NAME_ y=_5 / LINEATTRS=(THICKNESS=3 COLOR=cyan);
    series x=_NAME_ y=_4 / LINEATTRS=(THICKNESS=3 COLOR=blue);
    series x=_NAME_ y=_3 / LINEATTRS=(THICKNESS=3 COLOR=purple);
    series x=_NAME_ y=_2 / LINEATTRS=(THICKNESS=3 COLOR=brown);
    series x=_NAME_ y=_1 / LINEATTRS=(THICKNESS=3 COLOR=black) legendlabel="Nivel 1";
    yaxis label="Nivel de Aportación de Impuestos";
    xaxis label="Ideología Política";
    title "Perfiles fila";
    legend;
run;

/* Heat map preparation and visualization */
data Trabajo3.Politica1;
    set Trabajo3.Politica;
run;

data Trabajo3.Politica2(keep=filas col ff);
    set Trabajo3.Politica1;
    array X{9} X1-X9;
    do i = 1 to 9;
        filas = NivelImpuestos;
        col = put(i, 1.);
        ff = X{i};
        output;
    end;
run;

/* Create heat map */
proc sgplot data=Trabajo3.Politica2;
    heatmap x=filas y=col / freq=ff colormodel=TwoColorRamp;
    xaxis label="Nivel de Impuestos" type=discrete;
    yaxis label="Ideología Política (1=Izquierda, 9=Derecha)" type=discrete;
    title "Mapa de calor: Relación entre Nivel de Impuestos e Ideología Política";
run;













data Trabajo3.Aportaciones2;
    set Trabajo3.Politica;
    if Label = 'Sum' then delete;
run;

data Trabajo3.Aportaciones3 (keep=filas col ff);
    array vector{9} _1_izquierda _2 _3 _4 _5 _6 _7 _8 _9_derecha;
    set Trabajo3.Aportaciones2;
    a = 0;
    do aux = '1', '2', '3', '4', '5', '6', '7', '8', '9';
        a = a + 1;
        filas = Label;
        col = aux;
        ff = vector{a};
        output;
    end;
run;

proc sgplot data=Trabajo3.Aportaciones3;
    heatmap x=filas y=col / colorresponse=ff colormodel=TwoColorRamp;
run;







