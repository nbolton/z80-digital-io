# cpmhex: Generates a hex string from a .com file, 
# for use with DOWNLOAD.COM on CP/M (RC2014)

import binascii
import pyperclip
import argparse

parser = argparse.ArgumentParser("cpmhex")
parser.add_argument("file", help="Path to .com file")
parser.add_argument("-c", help="Copy command to clipboard", action='store_true')
parser.add_argument("-u", help="CP/M user number", type=int, default=0)
args = parser.parse_args()

path = args.file
with open(path, 'rb') as f:
    content = f.read()

hexString = binascii.hexlify(content).decode().upper()

sum = 0
for i in content:
    sum += i

lenMod = len(content) % 0x100
sumMod = sum % 0x100

lenModHex = binascii.hexlify(lenMod.to_bytes(1, 'little')).decode().upper()
sumModHex = binascii.hexlify(sumMod.to_bytes(1, 'little')).decode().upper()

filename = path.split('/')[-1].upper()

command = \
    'A:DOWNLOAD ' + filename + '\nU' + str(args.u) + \
    '\n:' + hexString + '>' + lenModHex + sumModHex
print(command)

if (args.c):
    pyperclip.copy(command)
    print('Copied to clipboard')
