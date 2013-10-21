From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Kernel sections loosing attributes
Date: Mon, 21 Oct 2013 23:09:40 +0200
Message-ID: <CAMuHMdVw7ROEj6kosV3wiZZxTkXewg2yqRv8hm_tn0im4RFmVA@mail.gmail.com>
References: <CAMuHMdXsYFw6NR1BRfAEW8GYoQqUFsH5N-oSB7TxHYn8jRGCZg@mail.gmail.com>
	<877gd6e4q4.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <877gd6e4q4.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

On Mon, Oct 21, 2013 at 10:41 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> What do you get from readelf -Sl?

$ readelf -Sl vmlinux.ok
There are 17 section headers, starting at offset 0x1ae524:

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00      0   0  0
  [ 1] .text             PROGBITS        00001000 001000 14986c 00  AX  0   0  4
  [ 2] __ex_table        PROGBITS        0014a870 14a870 0022b8 00   A  0   0  4
  [ 3] .rodata           PROGBITS        0014d000 14d000 03a900 00   A  0   0 16
  [ 4] __param           PROGBITS        00187900 187900 0002f0 00   A  0   0  4
  [ 5] __modver          PROGBITS        00187bf0 187bf0 000410 00   A  0   0  2
  [ 6] .data             PROGBITS        00188000 188000 0137c0 00  WA  0   0 16
  [ 7] .bss              NOBITS          0019b7c0 19b7c0 01b040 00  WA  0   0 16
  [ 8] .init.text        PROGBITS        001b7000 19d000 00db5e 00  AX  0   0  4
  [ 9] .init.data        PROGBITS        001c4b60 1aab60 003004 00  WA  0   0  4
  [10] .m68k_fixup       PROGBITS        001c7b64 1adb64 000908 00  WA  0   0  1
  [11] .notes            NOTE            001c846c 1ae46c 000024 00  AX  0   0  4
  [12] .init_end         NOBITS          001c8490 1ae490 000b70 00  WA  0   0  1
  [13] .comment          PROGBITS        00000000 1ae490 000011 01  MS  0   0  1
  [14] .shstrtab         STRTAB          00000000 1ae4a1 000080 00      0   0  1
  [15] .symtab           SYMTAB          00000000 1ae7cc 02cad0 10
16 5834  4
  [16] .strtab           STRTAB          00000000 1db29c 02debb 00      0   0  1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings)
  I (info), L (link order), G (group), T (TLS), E (exclude), x (unknown)
  O (extra OS processing required) o (OS specific), p (processor specific)

Elf file type is EXEC (Executable file)
Entry point 0x2000
There are 2 program headers, starting at offset 52

Program Headers:
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  LOAD           0x000000 0x00000000 0x00000000 0x19b7c0 0x1b6800 RWE 0x2000
  LOAD           0x19d000 0x001b7000 0x001b7000 0x11490 0x12000 RWE 0x2000

 Section to Segment mapping:
  Segment Sections...
   00     .text __ex_table .rodata __param __modver .data .bss
   01     .init.text .init.data .m68k_fixup .notes .init_end
$ readelf -Sl vmlinux.crash
There are 17 section headers, starting at offset 0x1ac524:

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00      0   0  0
  [ 1] .text             PROGBITS        00001000 001000 147824 00  AX  0   0  4
  [ 2] __ex_table        PROGBITS        00148830 148830 0022b8 00   A  0   0  4
  [ 3] .rodata           PROGBITS        0014b000 14b000 03a770 00   A  0   0 16
  [ 4] __param           PROGBITS        00185770 185770 0002f0 00   A  0   0  4
  [ 5] __modver          NOBITS          00185a60 185a60 0005a0 00  WA  0   0  1
  [ 6] .data             PROGBITS        00186000 186000 0137a0 00  WA  0   0 16
  [ 7] .bss              NOBITS          001997a0 1997a0 01b040 00  WA  0   0 16
  [ 8] .init.text        PROGBITS        001b5000 19b000 00db5e 00  AX  0   0  4
  [ 9] .init.data        PROGBITS        001c2b60 1a8b60 003004 00  WA  0   0  4
  [10] .m68k_fixup       PROGBITS        001c5b64 1abb64 000908 00  WA  0   0  1
  [11] .notes            NOTE            001c646c 1ac46c 000024 00  AX  0   0  4
  [12] .init_end         NOBITS          001c6490 1ac490 000b70 00  WA  0   0  1
  [13] .comment          PROGBITS        00000000 1ac490 000011 01  MS  0   0  1
  [14] .shstrtab         STRTAB          00000000 1ac4a1 000080 00      0   0  1
  [15] .symtab           SYMTAB          00000000 1ac7cc 02c9a0 10
16 5823  4
  [16] .strtab           STRTAB          00000000 1d916c 02dda6 00      0   0  1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings)
  I (info), L (link order), G (group), T (TLS), E (exclude), x (unknown)
  O (extra OS processing required) o (OS specific), p (processor specific)

Elf file type is EXEC (Executable file)
Entry point 0x2000
There are 2 program headers, starting at offset 52

Program Headers:
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  LOAD           0x000000 0x00000000 0x00000000 0x1997a0 0x1b47e0 RWE 0x2000
  LOAD           0x19b000 0x001b5000 0x001b5000 0x11490 0x12000 RWE 0x2000

 Section to Segment mapping:
  Segment Sections...
   00     .text __ex_table .rodata __param __modver .data .bss
   01     .init.text .init.data .m68k_fixup .notes .init_end
$

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
