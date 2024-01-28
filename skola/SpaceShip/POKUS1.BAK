uses crt, Graph;
var
kon,out:byte;
xa,ya:Integer;{let}
ux,uy:integer;{kde}
q:char;{stlac}

procedure schreibe(x,y:integer;o:boolean);
begin{farba}
if o=true then begin setcolor(white);
line(x+1,y+8,x+1,y+9);line(x+2,y+1,x+2,y+3);line(x+2,y+6,x+2,y+9);
line(x+2,y+11,x+2,y+15);line(x+3,y+1,x+3,y+3);line(x+3,y+5,x+3,y+9);
line(x+3,y+12,x+3,y+14);line(x+4,y+2,x+4,y+2);line(x+4,y+5,x+4,y+10);
line(x+4,y+13,x+4,y+13);line(x+5,y+1,x+5,y+6);line(x+5,y+8,x+5,y+10);
line(x+5,y+12,x+5,y+13);line(x+6,y+1,x+6,y+6);line(x+6,y+9,x+6,y+12);
line(x+6,y+15,x+6,y+15);line(x+7,y+0,x+7,y+2);line(x+7,y+5,x+7,y+6);
line(x+7,y+8,x+7,y+8);line(x+7,y+10,x+7,y+12);line(x+7,y+14,x+7,y+15);
line(x+8,y+0,x+8,y+5);line(x+8,y+11,x+8,y+15);line(x+9,y+0,x+9,y+2);
line(x+9,y+5,x+9,y+6);line(x+9,y+8,x+9,y+8);line(x+9,y+10,x+9,y+12);
line(x+9,y+14,x+9,y+15);line(x+10,y+1,x+10,y+6);line(x+10,y+9,x+10,y+12);
line(x+10,y+15,x+10,y+15);line(x+11,y+1,x+11,y+6);line(x+11,y+8,x+11,y+10);
line(x+11,y+12,x+11,y+13);line(x+12,y+2,x+12,y+2);line(x+12,y+5,x+12,y+10);
line(x+12,y+13,x+12,y+13);line(x+13,y+1,x+13,y+3);line(x+13,y+5,x+13,y+9);
line(x+13,y+12,x+13,y+14);line(x+14,y+1,x+14,y+3);line(x+14,y+6,x+14,y+9);
line(x+14,y+11,x+14,y+15);line(x+15,y+8,x+15,y+9);end;
if o=false then begin setfillstyle(1,black); bar(x,y,x+15,y+15); end;
end;

begin
xa:= Detect;
InitGraph(xa,ya,' ');
xa:=340;ya:=100;kon:=0;
uy:=0;ux:=0;
repeat
repeat
schreibe(xa,ya,true);
delay(15);
schreibe(xa,ya,false);
if kon>=10 then kon:=0;
kon:=kon+1;
if kon=5 then
begin
if ux>0 then ux:=ux-1;
if ux<0 then ux:=ux+1;
if uy<0 then uy:=uy+1;
xa:=xa+ux;
ya:=ya+uy+3;
end;
if xa>630 then out:=27;
if ya>470 then out:=27;
if xa<0 then out:=27;
if ya<0 then out:=27;
until keypressed or(out=27);
if out<>27 then
begin
q:=readkey;
if q='4' then ux:=ux-3;
if q='6' then ux:=ux+3;
if q='8' then uy:=uy-1;
if q='2' then uy:=uy+1;
if q=#27 then out:=27;
end;
until out=27;
closegraph;
gotoxy(40,10);textcolor(white+blink);writeln('ende');
readln;
end.