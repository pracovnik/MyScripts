USES CRT,DOS,GRAPH;
const   sg:array[1..3]of string=('pokracovat','ulozit','koniec');
        sa:array[1..7]of string=('  dragster  ','  tank     ','  taxi      ','  formula   ','  dozer     ','  zeriav    '
                                ,'  exit      ');
        so:array[1..4]of string=('  lahka    ','  stredna  ','  tazka    ','  exit     ');
        m:array[1..6]of string=('  START      ','  LOAD       ','  HIGHSCORE  ','  HELP       ','  CREDITS    ',
                                   '  EXIT       ');
var aut,i,w,a,auto,obti:integer;
    x:char;
   endo,endi,enda,endg:boolean;
   LOSA:STRING;
   hig:string;
{-------------------------------------------------------------------------------------}
PROCEDURE SAVE;
VAR FS:TEXT;
    SS:ARRAY[1..14]OF STRING;
begin
 ASSIGN(FS,LOSA+'SETS.TXT');
 RESET(FS);
 FOR I:=1 TO 10 DO READLN(FS,SS[I]);
 CLOSE(FS);
 ASSIGN(FS,LOSA+'SETS.TXT');
 REWRITE(FS);
 FOR I:=1 TO 10 DO WRITELN(FS,SS[I]);
 WRITELN(FS,AUTO);
 WRITELN(FS,OBTI);
 WRITELN(FS,AUT);
 WRITELN(FS,'  ');
 CLOSE(FS);
END;

procedure menu;
var m,xx,yy:integer;
     endm:boolean;
   j:char;
begin;
M:=1;
xx:=500;
yy:=100;
repeat
endm:=false;
setfillstyle(solidfill,green);
bar(xx-2,yy,xx+83,yy+40);
setfillstyle(solidfill,yellow);
for i:=1 to 3 do if m=i then bar(xx-2,yy-2+(i*10),xx+82,yy+8+(i*10));
setfillstyle(solidfill,white);
for i:=1 to 3 do outtextxy(xx+2,yy+(10*i),sg[i]);
j:=readkey;
if (j=#72 )and(m=1 )then m:=4;
if (j=#72 )and(m>1 )then m:=m-1;
if (j=#80 )and(m=3)then  m:=0;
if (j=#80 )and(m<3)then  m:=m+1;
if (j=#27 )then begin endg:=true;endm:=true;endo:=true;enda:=true;end;
if (j=#13 )then case m of
1:endm:=true;
2:save;
3:begin endg:=true;endm:=true;endo:=true;enda:=true;end;
end;
until endm=true;
setfillstyle(solidfill,green);
bar(xx-2,yy,xx+83,yy+40);
end;

procedure autoon(x1,y1:integer);
begin;
case auto of
1: begin
   setfillstyle(solidfill,black);bar(x1+13,y1+5,x1+14,y1+9);
   bar(x1+26,y1+5,x1+27,y1+9);setfillstyle(solidfill,yellow);
   bar(x1+15,y1+6,x1+15,y1+8);bar(x1+25,y1+6,x1+25,y1+8);
   setfillstyle(solidfill,lightgray);bar(x1+17,y1+5,x1+23,y1+29);
   setfillstyle(solidfill,black);bar(x1+2,y1+42,x1+10,y1+55);
   bar(x1+30,y1+42,x1+38,y1+55);setfillstyle(solidfill,white);
   bar(x1+17,y1+32,x1+23,y1+41);setfillstyle(solidfill,blue);
   bar(x1+12,y1+31,x1+28,y1+33);bar(x1+12,y1+32,x1+16,y1+41);
   bar(x1+24,y1+32,x1+28,y1+41);bar(x1+12,y1+42,x1+28,y1+56);
   setfillstyle(solidfill,red);bar(x1+2,y1+30,x1+38,y1+30);
   setcolor(black);line(x1+16,y1+20,x1+2,y1+29);
   line(x1+24,y1+20,x1+38,y1+29);line(x1+16,y1+20,x1+12,y1+29);
   line(x1+24,y1+20,x1+28,y1+29);
end;
2:begin{tank}
  setfillstyle(solidfill,black);bar(x1+3,y1+5,x1+5,y1+55);
  bar(x1+37,y1+5,x1+35,y1+55);setfillstyle(solidfill,green);
  bar(x1+6,y1+54,x1+34,y1+58);bar(x1+6,y1+29,x1+10,y1+53);
  bar(x1+30,y1+29,x1+34,y1+53);setfillstyle(solidfill,green);
  bar(x1+6,y1+3,x1+18,y1+28);bar(x1+23,y1+3,x1+34,y1+28);
  setfillstyle(solidfill,brown);bar(x1+11,y1+29,x1+29,y1+53);
  setfillstyle(solidfill,black);bar(x1+19,y1+2,x1+22,y1+28);
  setfillstyle(solidfill,black);bar(x1+17,y1+1,x1+24,y1+1);
end;

3:begin{polic.auto}
  setfillstyle(solidfill,black);bar(x1+1,y1+6,x1+3,y1+15);
  bar(x1+37,y1+6,x1+39,y1+14);bar(x1+1,y1+46,x1+3,y1+55);
  bar(x1+37,y1+46,x1+39,y1+55);setfillstyle(solidfill,yellow);
  bar(x1+4,y1+3 ,x1+36,y1+15);bar(x1+4,y1+49,x1+36,y1+59);
  bar(x1+4,y1+16,x1+4,y1+48);bar(x1+36,y1+16,x1+36,y1+48);
  setfillstyle(solidfill,lightCyan);bar(x1+5,y1+16,x1+35,y1+17);
  bar(x1+5,y1+47,x1+35,y1+48);setfillstyle(solidfill,yellow);
  bar(x1+5,y1+18,x1+35,y1+18);bar(x1+5,y1+19,x1+17,y1+19);
  bar(x1+27,y1+19,x1+35,y1+19);bar(x1+5,y1+20,x1+35,y1+46);
  setfillstyle(solidfill,red);bar(x1+18,y1+19,x1+20,y1+19);
  setfillstyle(solidfill,black);bar(x1+21,y1+19,x1+23,y1+19);
  setfillstyle(solidfill,red);bar(x1+24,y1+19,x1+26,y1+19);
  setfillstyle(solidfill,yellow);bar(x1+11,y1+2,x1+15,y1+2);
  bar(x1+26,y1+2,x1+30,y1+2);setfillstyle(solidfill,yellow);
  bar(x1+31,y1+2,x1+35,y1+2);bar(x1+10,y1+2,x1+5,y1+2);
  setfillstyle(solidfill,white);bar(x1+16,y1+2,x1+25,y1+2);
  setfillstyle(solidfill,black);bar(x1+36,y1+2,x1+36,y1+2);
  bar(x1+4,y1+2,x1+4,y1+2);
end;
4:begin{formula}
  setfillstyle(solidfill,blue);bar(x1+6,y1+2,x1+34,y1+6);
  setfillstyle(solidfill,black);bar(x1+6,y1+8,x1+10,y1+17);
  bar(x1+5,y1+39,x1+9,y1+48);bar(x1+30,y1+8,x1+34,y1+17);
  bar(x1+31,y1+39,x1+35,y1+48);setfillstyle(solidfill,darkgray);
  bar(x1+12,y1+7,x1+28,y1+37);setfillstyle(solidfill,blue);
  bar(x1+6,y1+18,x1+11,y1+37);bar(x1+29,y1+18,x1+34,y1+37);
  setfillstyle(solidfill,black);bar(x1+11,y1+38,x1+29,y1+47);
  setfillstyle(solidfill,red);bar(x1+10,y1+48,x1+30,y1+49);
  setfillstyle(solidfill,blue);bar(x1+11,y1+50,x1+29,y1+50);
  setfillstyle(solidfill,blue);bar(x1+11,y1+12,x1+11,y1+13);
  bar(x1+29,y1+12,x1+29,y1+13);setfillstyle(solidfill,blue);
  bar(x1+10,y1+42,x1+10,y1+44);bar(x1+30,y1+43,x1+30,y1+44);
  setfillstyle(1,lightgray);bar(x1+17,y1+20,x1+23,y1+30);
end;
5:begin{dozer}
  setfillstyle(1,black);bar(x1+6,y1+1,x1+7,y1+2);
  bar(x1+16,y1+1,x1+17,y1+2);bar(x1+23,y1+1,x1+24,y1+2);
  bar(x1+33,y1+1,x1+34,y1+2);bar(x1+15,y1+14,x1+25,y1+15);
  bar(x1+5,y1+3,x1+5,y1+13);bar(x1+35,y1+3,x1+36,y1+13);
  bar(x1+6,y1+13,x1+35,y1+13);setfillstyle(2,darkgray);
  bar(x1+3,y1+21,x1+12,y1+50);setfillstyle(2,darkgray);
  bar(x1+28,y1+21,x1+37,y1+50);setfillstyle(solidfill,yellow);
  bar(x1+13,y1+16,x1+27,y1+16);bar(x1+13,y1+15,x1+13,y1+54);
  bar(x1+27,y1+15,x1+27,y1+54);bar(x1+14,y1+24,x1+17,y1+49);
  bar(x1+18,y1+24,x1+22,y1+27);bar(x1+23,y1+24,x1+26,y1+49);
  bar(x1+18,y1+46,x1+22,y1+49);bar(x1+14,y1+50,x1+26,y1+54);
  bar(x1+16,y1+19,x1+17,y1+23);bar(x1+23,y1+19,x1+24,y1+23);
  bar(x1+14,y1+15,x1+15,y1+23);bar(x1+25,y1+15,x1+26,y1+23);
  setfillstyle(solidfill,cyan);bar(x1+16,y1+17,x1+24,y1+18);
  bar(x1+18,y1+19,x1+22,y1+23);setfillstyle(solidfill,brown);
  bar(x1+6,y1+3,x1+34,y1+12);setfillstyle(solidfill,brown);
  bar(x1+17,y1+27,x1+23,y1+49);
end;
6:begin{zeriav}
  setfillstyle(solidfill,darkgray);bar(x1+5,y1+7,x1+20,y1+7);
  bar(x1+26,y1+7,x1+35,y1+7);setfillstyle(solidfill,blue);
  bar(x1+8,y1+8,x1+20,y1+9);bar(x1+26,y1+8,x1+32,y1+9);
  setfillstyle(solidfill,lightgray);bar(x1+7,y1+10,x1+20,y1+19);
  bar(x1+26,y1+10,x1+33,y1+19);setfillstyle(solidfill,darkgray);
  bar(x1+5,y1+8,x1+6,y1+19);bar(x1+35,y1+8,x1+34,y1+52);
  bar(x1+5,y1+20,x1+20,y1+52);bar(x1+26,y1+20,x1+35,y1+39);
  setfillstyle(solidfill,brown);bar(x1+6,y1+40,x1+8,y1+53);
  bar(x1+32,y1+40,x1+34,y1+53);bar(x1+9,y1+40,x1+14,y1+53);
  bar(x1+26,y1+40,x1+31,y1+53);setfillstyle(solidfill,blue);
  bar(x1+15,y1+43,x1+20,y1+52);setfillstyle(solidfill,brown);
  bar(x1+15,y1+40,x1+20,y1+43);bar(x1+20,y1+52,x1+26,y1+53);
  bar(x1+15,y1+53,x1+20,y1+53);setfillstyle(solidfill,black);
  bar(x1+3,y1+9 ,x1+4,y1+15);bar(x1+3,y1+34,x1+4,y1+40);
  bar(x1+3,y1+44,x1+4,y1+50);bar(x1+36,y1+9,x1+37,y1+15);
  bar(x1+36,y1+34,x1+37,y1+40);bar(x1+36,y1+44,x1+37,y1+50);
  setfillstyle(solidfill,black);bar(x1+21,y1+1,x1+25,y1+51);
  setfillstyle(SlashFill,red);bar(x1+21,y1+1,x1+25,y1+51);
end;
end;
end;

PROCEDURE STARTUP1;
VAR DELA:BYTE;
    X1,Y1:INTEGER;
    Y2,X2:INTEGER;
 PROCEDURE BEGAN;
 VAR G1,G2:INTEGER;
 BEGIN
 aut:=1;
 endg:=false;
 DELA:=30;
 X1:=230;
 Y1:=GETMAXY-79;
 Y2:=40;
 X2:=270;
 G1:=9;G2:=2;
 INITGRAPH(G1,G2,losa);
 SETFILLSTYLE(SOLIDFILL,GREEN);
 BAR(0,0,228,GETMAXY);
 BAR(432,0,GETMAXX,GETMAXY);
 SETFILLSTYLE(SOLIDFILL,LIGHTBLUE);
 BAR(230,0,430,GETMAXY);
 SETCOLOR(WHITE);
 LINE(229,0,229,GETMAXY);
 LINE(431,0,431,GETMAXY);
 END;
 PROCEDURE AUTOOFF;
 BEGIN
 SETFILLSTYLE(SOLIDFILL,LIGHTBLUE);
 BAR(X1,Y1,X1+40,Y1+60);
 END;
 PROCEDURE PREKAZKAON;
 BEGIN
 SETFILLSTYLE(SOLIDFILL,BLACK);BAR(X2,Y2,X2+40,Y2-40);
 END;
 PROCEDURE PREKAZKAOFF;
 BEGIN
 SETFILLSTYLE(SOLIDFILL,LIGHTBLUE);BAR(X2,Y2,X2+40,Y2-40);
 END;
 PROCEDURE POHYB;
 VAR X:CHAR;
 BEGIN
 IF endg=false THEN
 BEGIN
    X:=READKEY;
 IF X=#72 THEN IF DELA>10    THEN DELA:=DELA-1;
 IF X=#80 THEN IF DELA<40    THEN DELA:=DELA+1;
 IF X=#77 THEN IF X1+60<=430 THEN X1:=X1+20;
 IF X=#75 THEN IF X1-20>=230 THEN X1:=X1-20;
 IF X=#27 THEN menu;
 IF (X='A')OR(X='a') THEN REPEAT X:=READKEY;UNTIL(X='A')OR(X='a');
 END;
 END;

 PROCEDURE KED;
 BEGIN
 Y2:=Y2+10;
 IF (Y2=Y1) THEN IF(X2+40<=X1)OR(X1+40<=X2)THEN aut:=aut+1;
 IF (Y2=Y1) THEN BEGIN
                      IF(X2=X1) THEN endg:=true;
                      IF(X2+20=X1)OR(X2-20=X1)THEN endg:=true;
                      END;
 IF (Y2=GETMAXY)OR(Y2-1=GETMAXY)THEN
    BEGIN
    Y2:=40;
    X2:=230+(RANDOM(5)*40);
    END;
 END;
 BEGIN
 BEGAN;
 REPEAT
      REPEAT
            AUTOON(x1,y1);
            PREKAZKAOFF;
            KED;
            PREKAZKAON;
            CASE X2 OF
            230:DELAY(DELA-5);
            270:DELAY(DELA-5);
            310:DELAY(DELA);
            350:DELAY(DELA+5);
            390:DELAY(DELA+5);
            END;
            AUTOOFF;
      UNTIL(KEYPRESSED)OR(endg=true);
      POHYB;
 UNTIL endg=true;
 CLOSEGRAPH;
 enda:=true;
 endo:=true;
 x:='0';
 END;
{------------------------------------------------------}
 PROCEDURE STARTUP2;
 VAR DELA:BYTE;
     X1,Y1:INTEGER;
     Y2,X2:INTEGER;
 PROCEDURE BEGAN;
 VAR G1,G2:INTEGER;
 BEGIN
 aut:=1; endg:=FALSE;
 DELA:=20; X1:=230;
 Y1:=getmaxy-79; Y2:=40;
 X2:=270; G1:=9;G2:=2;
 INITGRAPH(G1,G2,losa);
 SETFILLSTYLE(SOLIDFILL,GREEN);
 BAR(0,0,228,GETMAXY);
 BAR(392,0,GETMAXX,GETMAXY);
 SETFILLSTYLE(SOLIDFILL,LIGHTBLUE);
 BAR(230,0,390,GETMAXY);
 SETCOLOR(WHITE);
 LINE(229,0,229,GETMAXY);
 LINE(391,0,391,GETMAXY);
 END;
 PROCEDURE AUTOOFF;
 BEGIN
 SETFILLSTYLE(SOLIDFILL,LIGHTBLUE);BAR(X1,Y1,X1+40,Y1+60);
 END;
 PROCEDURE PREKAZKAON;
 BEGIN
 SETFILLSTYLE(SOLIDFILL,BLACK);BAR(X2,Y2,X2+40,Y2-40);
 END;
 PROCEDURE PREKAZKAOFF;
 BEGIN
 SETFILLSTYLE(SOLIDFILL,LIGHTBLUE);BAR(X2,Y2,X2+40,Y2-40);
 END;
 PROCEDURE POHYB;
 VAR X:CHAR;
 BEGIN
 IF endg=FALSE THEN
 BEGIN
    X:=READKEY;
 IF X=#72 THEN IF DELA>10 THEN DELA:=DELA-1;
 IF X=#80 THEN IF DELA<40 THEN DELA:=DELA+1;
 IF X=#77 THEN IF X1+60<=390 THEN X1:=X1+20;
 IF X=#75 THEN IF X1-20>=230 THEN X1:=X1-20;
 IF X=#27 THEN menu;
 IF (X='A')OR(X='a') THEN REPEAT X:=READKEY;UNTIL(X='A')OR(X='a');
 END;
 END;

 PROCEDURE KED;
 BEGIN
 Y2:=Y2+10;
 IF (Y2=Y1) THEN IF(X2+40<=X1)OR(X1+40<=X2)THEN aut:=aut+1;
 IF (Y2=Y1) THEN IF(X2=X1)OR(X2+20=X1)OR(X2-20=X1)THEN endg:=TRUE;
 IF (Y2=GETMAXY)OR(Y2-1=GETMAXY)THEN
    BEGIN
    Y2:=40;
    X2:=230+(RANDOM(4)*40);
    END;
 END;
 BEGIN
 BEGAN;
 REPEAT
       REPEAT
             AUTOON(x1,y1);
             PREKAZKAOFF;
             KED;
             PREKAZKAON;
             CASE X2 OF
             230:DELAY(DELA-5);
             270:DELAY(DELA-5);
             310:DELAY(DELA+5);
             350:DELAY(DELA+5);
             END;
             AUTOOFF;
       UNTIL(KEYPRESSED)OR(endg=TRUE);
       POHYB;
 UNTIL endg=TRUE;
 CLOSEGRAPH;
 x:='0';enda:=true;endo:=true;
 END;

PROCEDURE STARTUP3;
 VAR DELA:BYTE;
     X1,Y1:INTEGER;
     Y2,X2:INTEGER;
 PROCEDURE BEGAN;
 VAR G1,G2:INTEGER;
 BEGIN
 aut:=1;endg:=FALSE;
 DELA:=15;X1:=230;Y1:=getmaxy-79;Y2:=40;X2:=270;G1:=9;G2:=2;
 INITGRAPH(G1,G2,' ');
 SETFILLSTYLE(SOLIDFILL,GREEN);
 BAR(0,0,228,GETMAXY);
 BAR(312,0,GETMAXX,GETMAXY);
 SETFILLSTYLE(SOLIDFILL,LIGHTBLUE);
 BAR(230,0,310,GETMAXY);
 SETCOLOR(WHITE);
 LINE(229,0,229,GETMAXY);
 LINE(311,0,311,GETMAXY);
 END;
 PROCEDURE AUTOOFF;
 BEGIN
 SETFILLSTYLE(SOLIDFILL,LIGHTBLUE);BAR(X1,Y1,X1+40,Y1+60);
 END;
 PROCEDURE PREKAZKAON;
 BEGIN
 SETFILLSTYLE(SOLIDFILL,BLACK);BAR(X2,Y2,X2+40,Y2-40);
 END;
 PROCEDURE PREKAZKAOFF;
 BEGIN
 SETFILLSTYLE(SOLIDFILL,LIGHTBLUE);BAR(X2,Y2,X2+40,Y2-40);
 END;
 PROCEDURE POHYB;
 VAR X:CHAR;
 BEGIN
 IF endg=FALSE THEN
 BEGIN
    X:=READKEY;
 IF X=#72 THEN IF DELA>5 THEN DELA:=DELA-1;
 IF X=#80 THEN IF DELA<20 THEN DELA:=DELA+1;
 IF X=#77 THEN IF X1+60<=310 THEN X1:=X1+20;
 IF X=#75 THEN IF X1-20>=230 THEN X1:=X1-20;
 IF X=#27 THEN menu;
 IF (X='A')OR(X='a') THEN REPEAT X:=READKEY;UNTIL(X='A')OR(X='a');
 END;
 END;
 PROCEDURE KED;
 BEGIN
 Y2:=Y2+10;
 IF (Y2=Y1) THEN IF(X2+40<=X1)OR(X1+40<=X2)THEN aut:=aut+1;
 IF (Y2=Y1) THEN IF(X2=X1)OR(X2+20=X1)OR(X2-20=X1)THEN endg:=TRUE;
 IF (Y2=GETMAXY)OR(Y2-1=GETMAXY)THEN
    BEGIN
    Y2:=40;
    X2:=230+(RANDOM(2)*40);
    END;
 END;
 BEGIN
 BEGAN;
 REPEAT
       REPEAT
            AUTOON(x1,y1);
            PREKAZKAOFF;
            KED;
            PREKAZKAON;
            CASE X2 OF
            230:DELAY(DELA-5);
            270:DELAY(DELA+5);
            END;
            AUTOOFF;
      UNTIL(KEYPRESSED)OR(endg=TRUE);
      POHYB;
 UNTIL endg=TRUE;
 CLOSEGRAPH;
 x:='0';enda:=true;endo:=true;
 END;
{-------------------------------------------------------------------------------------}
PROCEDURE HIGHSCORE;
 VAR F1:TEXT;
     ST:ARRAY[1..10]OF STRING;
     LOS:STRING;
     I:BYTE;
     X:CHAR;
 BEGIN
 TEXTBACKGROUND(BLUE);
 CLRSCR;
 LOS:=LOSA+'SETS.TXT';
 ASSIGN(F1,LOS);
 RESET(F1);
 FOR I:=1 TO 10 DO READLN(F1,ST[I]);
 CLOSE(F1);
 TEXTCOLOR(YELLOW);
 GOTOXY(10,5);WRITELN('Hrac:');
 GOTOXY(18,5);WRITELN('Presiel:');
 GOTOXY(28,5);WRITELN('Auto:');
 TEXTCOLOR(GREEN);
 FOR I:=1 TO 10 DO BEGIN
 GOTOXY(10,5+I);WRITELN(ST[I]);
 END;
 TEXTCOLOR(RED+BLINK);
 GOTOXY(10,23);
 WRITELN('STLACTE ENTER NA VRATENIE SPAT');
 REPEAT X:=READKEY;UNTIL X=#13;
 TEXTBACKGROUND(0);CLRSCR;
 END;
 {-------------------------------------------------------------------------------------}
 PROCEDURE CREDITS;
 CONST B=5;
 CONST C=10;
 VAR X:CHAR;
 BEGIN
 TEXTBACKGROUND(BLUE);
 CLRSCR;
 TEXTCOLOR(YELLOW);
 GOTOXY(B,2);WRITELN('PROGRAMATOR(autor):');
 GOTOXY(C,3);WRITELN('Ivo Kramarik');
 TEXTCOLOR(GREEN);
 GOTOXY(B,5);WRITELN('KONTAKT');
 GOTOXY(C,6);WRITELN('aivo@inmail.sk');
 TEXTCOLOR(CYAN);
 GOTOXY(B,10);WRITELN('DOBA VYROBY:');
 GOTOXY(C,11);WRITELN('300 hodin');
 TEXTCOLOR(LIGHTGRAY);
 GOTOXY(B+40,20);WRITELN('KOLKO JE HODIN?');
 GOTOXY(C+40,21);WRITELN('MENEJ AKO 24 HODIN!');
 TEXTCOLOR(WHITE);
 GOTOXY(B,20);WRITELN('PRECO BOL TENTO PROGRAM VYTVORENY?');
 GOTOXY(C,21);WRITELN('ABY AUTOR DOKAZAL ZE VIE COSI VIAC');
 TEXTCOLOR(RED+BLINK);
 GOTOXY(10,23);
 WRITELN('STLACTE ENTER NA VRATENIE SPAT');
 REPEAT X:=READKEY; UNTIL X=#13;
 TEXTBACKGROUND(0); CLRSCR;
 END;
{-------------------------------------------------------------------------------------}
 PROCEDURE LOAD;
 VAR F:TEXT;
     LO:ARRAY[1..4]OF STRING[5];
     CH:integer;
     los:string;
 BEGIN
 los:=losa+'sets.txt';
 ASSIGN(F,los);
 RESET(F);
 FOR I:=1 TO 15 DO begin
 if i=11 then begin READLN(F,LO[1]);end;
 if i=12 then begin READLN(F,LO[2]);end;
 if i=13 then begin READLN(F,LO[3]);end;
 readln(f,lo[4]);
 end;
 VAL(LO[1],AUTO,CH);
 VAL(LO[2],obti,CH);
 VAL(LO[3],aut,CH);
 CLOSE(F);
 CASE OBTI OF
 1:STARTUP1;
 2:STARTUP2;
 3:STARTUP3;
 END;
 END;
 {-------------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------------}
 PROCEDURE HELP;
 CONST D=10;
 CONST F=45;
 VAR X:CHAR;
     I:BYTE;
     S:STRING;
     KEYPRESSED:BOOLEAN;
 BEGIN
 TEXTBACKGROUND(BLUE);CLRSCR;
 TEXTCOLOR(YELLOW);
 GOTOXY(5,5); WRITE('OVLADANIE AUTA;');
 GOTOXY(D,6); WRITE('TLACIDLO ',CHR(24),' -POHYB RYCHLEJSIE');
 GOTOXY(D,7); WRITE('TLACIDLO ',CHR(25),' -POHYB POMALSIE');
 GOTOXY(D,8); WRITE('TLACIDLO ',CHR(27),' -POHYB DO LAVA');
 GOTOXY(D,9); WRITE('TLACIDLO ',CHR(26),' -POHYB DO PRAVA');
 GOTOXY(D,10);WRITE('TLACIDLO A -PAUZA KYM SA NESTLACI ZASE');
 GOTOXY(40,5); WRITE('OSTATNE TLACIDLA:');
 GOTOXY(F,6);  WRITE('TLACIDLO ESC   -OPUSTENIE HRY');
 GOTOXY(F,7);  WRITE('TLACIDLO ENTER -POTVRDENIE');
 TEXTCOLOR(RED+BLINK);
 S:='STLACTE ENTER NA VRATENIE SPAT';
 GOTOXY(10,23);
 WRITELN(S);
 REPEAT X:=READKEY; UNTIL X=#13;
 TEXTBACKGROUND(0); CLRSCR;
 END;
 PROCEDURE GIF;
 var g1,g2:integer;
 begin
 g1:=9; g2:=2; INITGRAPH(G1,G2,losa); closegraph;
 end;
 {-------------------------------------------------------------------------------------}
 begin
 {LOSA:='A:\';}
 LOSA:='g:\2001-~@P\ivo\';
 gif;
 W:=1;
 A:=1;
 Obti:=1;
  repeat
  endi:=false;
  textcolor(YELLOW);
  textbackground(blue);
  clrscr;
  for i:=1 to 6 do begin gotoxy(20,10+i);write(m[i]);end;
  for i:=1 to 6 do begin
   if i=w then begin textcolor(blue);textbackground(yellow);gotoxy(20,10+i);
                     write(m[i]);textcolor(yellow);textbackground(blue);end;
   if i<>w then begin gotoxy(20,i+10);write(m[i]);end;
  end;
 x:=readkey;
 if (x=#72) and(w=1)then w:=7;
 if (x=#72) and(w>1)then w:=w-1;
 if (x=#80) and(w=6)then w:=0;
 if (x=#80) and(w<6)then w:=w+1;
 if (x=#27) then endi:=true;
 if (x=#13)and(endi=false) then case w of
 1:if endi=false then
                      repeat
                      textcolor(yellow);textbackground(blue);clrscr;
                      endo:=false;
                      for i:=1 to 4 do begin gotoxy(20,10+i);write(so[i]);end;
                      for i:=1 to 4 do begin if i=obti then begin textcolor(blue);textbackground(yellow);gotoxy(20,10+i);
                                                                 write(so[obti]);textcolor(yellow);textbackground(blue);end;
                                             if i<>obti then begin gotoxy(20,10+i);write(so[i]);end;
                                       end;
                      x:=readkey;
                      if (x=#72)and(obti=1)then obti:=5;
                      if (x=#72)and(obti>1)then obti:=obti-1;
                      if (x=#80)and(obti=4)then obti:=0;
                      if (x=#80)and(obti<4)then obti:=obti+1;
                      if (x=#27)           then endo:=true;
                      if (x=#13)and(obti=4)then endo:=true;
                      if (x=#13)and(obti<4)and (endo=false)then
                           repeat
                           textcolor(yellow);textbackground(blue);clrscr;
                           enda:=false;
                           for i:=1 to 7 do begin gotoxy(20,10+i);write(sa[i]);end;
                           for i:=1 to 7 do begin if i=a  then begin textcolor(BLUE);textbackground(YELLOW);
                                                  gotoxy(20,10+i);write(sa[i]);textcolor(YELLOW);textbackground(BLUE);end;
                                                  if i<>a  then begin GOTOXY(20,10+I);WRITE(SA[I]);END;
                                                  end;
                           x:=readkey;
                           if (x=#72)and(a=1)then a:=8;
                           if (x=#72)and(a>1)then a:=a-1;
                           if (x=#80)and(a=7)then a:=0;
                           if (x=#80)and(a<7)then a:=a+1;
                           if (x=#27)then enda:=true;
                           if (x=#13)and(a=7)then enda:=true;
                           if (x=#13)and(a<7) and (enda=false)then begin
                                                       auto:=a;
                                                       case obti of
                                                       1:startup1;
                                                       2:startup2;
                                                       3:startup3;
                                                       end;
                                                       end;
                           until (enda=true)or(endi=true);
        until (endo=true )or( endi=true);
 2:if endi=false then load;
 3:if endi=false then highscore;
 4:if endi=false then help;
 5:if endi=false then credits;
 6:if endi=false then endi:=true;
 end;
until endi=true;
end.
