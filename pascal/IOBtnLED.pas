(*
  Light LED when button pressed.
  Using Turbo Pascal 3.01A (CP/M-80, Z80).
  RC2014 with the Digital IO module.
*)

program IOBtnLED;
{$U+}
  var i: integer;

begin
  writeln('IO Button LED');
  writeln('Light LED when button pressed');
  writeln('Press Ctrl+C to break');

  while true do
  begin
    i := port[0];
    port[0] := i;
    delay(50);
  end;
end.
