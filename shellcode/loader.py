from pwn import context, run_shellcode, unhex
import sys

context(os="linux", arch="amd64", log_level="error")

run_shellcode(unhex(sys.argv[1])).interactive()
