(*
  Using inline assembler/machine code,
  light LED when button pressed.
  Using Turbo Pascal 3.01A (CP/M-80, Z80).
  RC2014 with the Digital IO module.
*)

program IOBtnASM;
{$U+}
  var i: Byte;

procedure OutPort(Port: Byte; Value: Byte);
begin
  (* Credit: https://groups.google.com/g/rc2014-z80/c/vO9DLwYiMy8 *)
  inline (
    $3A/Port/       {      ld a,Port     }
    $4F/            {      ld c,a        }
    $3A/Value/      {      ld a,(Value)  }
    $ED/$79         {      out (c),a     }
  );
end;

procedure InPort(Port: Byte; var Value: Byte);
begin
  (*
    Credit to Raffzahn: https://tinyurl.com/raffzahn-rocks
    "Looking at the manual, it seems that var parameters might be
    pointers to be loaded first."
  *)
  inline (
    $3A/Port/       {      ld a,Port     }
    $4F/            {      ld c,a        }
    $ED/$78/        {      in a,(c)      }
    $2A/Value/      {      ld hl,(Value) }
    $77             {      ld (hl),a     }
  );
end;

begin
  writeln('IO Button ASM/MC');
  writeln(
    'Using inline assembler/machine code, ' +
    'light LED when button pressed');
  writeln('Press Ctrl+C to break');

  while true do
  begin
    InPort(0, i);
    OutPort(0, i);
    delay(50);
  end;
end.
