From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Kernel sections loosing attributes
Date: Mon, 21 Oct 2013 21:55:43 +0200
Message-ID: <CAMuHMdXsYFw6NR1BRfAEW8GYoQqUFsH5N-oSB7TxHYn8jRGCZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>

While trimming the kernel size to try kexec on real hardware with only
12 MiB of RAM, I got several weird crashes and lock-ups indicating memory
corruption somewhere (illegal instructions, BUG()s for incorrect magics in
fresh lock objects, ...).

As I also got complaints about overlapping sections from strip, I switched
from the good old gcc 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)
and binutils 2.18.0.20080103 to gcc 4.6.3 and binutils 2.22, but apart
from fixing the overlapping sections, it still didn't work.

After lots of serial debugging, I ended up bisecting the configs, and it
turned out that CONFIG_XZ_DEC was the difference between a working
and non-working kernel.
However, just disabling CONFIG_XZ_DEC on one of my defconfigs
still gave a working kernel. So there must be a deeper issue.

It seems like non-working kernel have lost the CONTENTS, LOAD,
READONLY, and DATA attributes of the __modver section:

vmlinux.ok5:     file format elf32-m68k

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         0014986c  00001000  00001000  00001000  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 __ex_table    000022b8  0014a870  0014a870  0014a870  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  2 .rodata       0003a900  0014d000  0014d000  0014d000  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 __param       000002f0  00187900  00187900  00187900  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  4 __modver      00000410  00187bf0  00187bf0  00187bf0  2**1
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  5 .data         000137c0  00188000  00188000  00188000  2**4
                  CONTENTS, ALLOC, LOAD, DATA
  6 .bss          0001b040  0019b7c0  0019b7c0  0019b7c0  2**4
                  ALLOC
  7 .init.text    0000db5e  001b7000  001b7000  0019d000  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  8 .init.data    00003004  001c4b60  001c4b60  001aab60  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  9 .m68k_fixup   00000908  001c7b64  001c7b64  001adb64  2**0
                  CONTENTS, ALLOC, LOAD, DATA
 10 .notes        00000024  001c846c  001c846c  001ae46c  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
 11 .init_end     00000b70  001c8490  001c8490  001ae490  2**0
                  ALLOC
 12 .comment      00000011  00000000  00000000  001ae490  2**0
                  CONTENTS, READONLY


vmlinux.crash5:     file format elf32-m68k

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00147824  00001000  00001000  00001000  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 __ex_table    000022b8  00148830  00148830  00148830  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  2 .rodata       0003a770  0014b000  0014b000  0014b000  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 __param       000002f0  00185770  00185770  00185770  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  4 __modver      000005a0  00185a60  00185a60  00185a60  2**0
                  ALLOC
  5 .data         000137a0  00186000  00186000  00186000  2**4
                  CONTENTS, ALLOC, LOAD, DATA
  6 .bss          0001b040  001997a0  001997a0  001997a0  2**4
                  ALLOC
  7 .init.text    0000db5e  001b5000  001b5000  0019b000  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  8 .init.data    00003004  001c2b60  001c2b60  001a8b60  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  9 .m68k_fixup   00000908  001c5b64  001c5b64  001abb64  2**0
                  CONTENTS, ALLOC, LOAD, DATA
 10 .notes        00000024  001c646c  001c646c  001ac46c  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
 11 .init_end     00000b70  001c6490  001c6490  001ac490  2**0
                  ALLOC
 12 .comment      00000011  00000000  00000000  001ac490  2**0
                  CONTENTS, READONLY

Does anyone have a clue? Who controls the presence of these
attributes?

Thanks in advance!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
