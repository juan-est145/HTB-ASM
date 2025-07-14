from pwn import context, shellcraft, asm

context(os="linux", arch="amd64", log_level="error")

call = shellcraft.cat("/flag.txt")

print(asm(call).hex())