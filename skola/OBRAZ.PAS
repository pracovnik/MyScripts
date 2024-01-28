uses crt,graph;
var aut:integer;
        auto:byte;

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
    endg:boolean;
 PROCEDURE BEGAN;
 VAR G1,G2:INTEGER;
 BEGIN
 aut:=1;
 DELA:=30;
 X1:=230;
 Y1:=GETMAXY-79;
 Y2:=40;
 X2:=270;
 G1:=9;G2:=2;
 INITGRAPH(G1,G2,'');
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
 END;

begin
auto:=2;
startup1;
end.