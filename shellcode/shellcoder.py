import sys
from pwn import context, ELF

context(os="linux", arch="amd64", log_level="error")

file = ELF(sys.argv[1])
shellcode = file.section(".text")
print(shellcode.hex())

print(f"{len(shellcode)} bytes - Found NULL byte") if [i for i in shellcode if i == 0] else print(f"{len(shellcode)} bytes - No NULL bytes")