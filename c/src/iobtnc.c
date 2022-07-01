/**
 * Using Turbo Pascal 3.01A (CP/M-80, Z80).
 * RC2014 with the Digital IO module.
 * Depends: https://github.com/z88dk/z88dk
 */

#include <stdio.h>

int main(void) {
   printf("IO Button LED in C\n");
   printf("Light LED when button pressed\n");
   printf("Press q to break\n");

   char in;   
   do {
      // light LED when button pressed
      outp(0, inp(0));

      for (int i = 0; i < 200; i++) {}
      in = getk();

   } while (in != 'q');

   return 0;
}
