From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: kexec (was: Re: Kernel sections loosing attributes)
Date: Tue, 22 Oct 2013 11:39:37 +0200
Message-ID: <CAMuHMdWhNYnYbKw+qC8d0j2i5Om0BKTuBdPruQMCGRSCaE4-zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>

On Mon, Oct 21, 2013 at 9:55 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> While trimming the kernel size to try kexec on real hardware with only
> 12 MiB of RAM, I got several weird crashes and lock-ups indicating memory
> corruption somewhere (illegal instructions, BUG()s for incorrect magics in
> fresh lock objects, ...).

The good news is that with a smaller kernel (ca. 2 MiB), kexec gets further on
real hardware, up to "ABCDGH" in head.S, which is just before it calls
mmu_engage.

Once it even got further, but crashed a bit later:

Will call new kernel at 0x07402000. Bye...

ABCDGHIJK
Linux version 3.12.0-rc6-amiga-mod-00855-g7d81bf9dcdd2-dirty
(geert@ayla) (gcc version 4.6.3 (GCC) ) #28 Mon Oct 21 20:13:07 CEST
2013
Saving 222 bytes of bootinfo
console [debug0] enabled
Amiga hardware found: [A4000] VIDEO BLITTER AUDIO FLOPPY A4000_IDE
KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAULA LISA ALICE_PAL
ZORRO3
On node 0 totalpages: 3072
free_area_init_node: node 0, pgdat 0019bca4, node_mem_map 001d3000
  DMA zone: 27 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 3072 pages, LIFO batch:0
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 3045
Kernel command line: root=/dev/hda3 console=ttyS0 -b debug=ser
PID hash table entries: 64 (order: -4, 256 bytes)
Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Sorting __ex_table...
__start___ex_table = 0x00149b30, __stop___ex_table = 0x0014bde8
Memory: 10260K/12288K available (1314K kernel code, 190K rwdata, 236K
rodata, 72K init, 108K bss, 2028K reserved)
Virtual kernel memory layout:
    vector  : 0x0019b898 - 0x0019bc98   (   1 KiB)
    kmap    : 0xd0000000 - 0xf0000000   ( 512 MiB)
    vmalloc : 0x01000000 - 0xd0000000   (3312 MiB)
    lowmem  : 0x00000000 - 0x00c00000   (  12 MiB)
      .init : 0x001b7000 - 0x001c9000   (  72 KiB)
      .text : 0x00001000 - 0x00149b2c   (1315 KiB)
      .data : 0x0014bde8 - 0x001b67f0   ( 427 KiB)
      .bss  : 0x0019b7c0 - 0x001b67f0   ( 109 KiB)
NR_IRQS:32
Unable to handle kernel access at virtual address 80bfed01
Oops: 00000000
PC: [<000072b0>] cia_set_irq+0xc/0x4c
SR: 2700  SP: 00189f40  a2: 001902d8
d0: 00193e01    d1: 0000271f    d2: 001ee0c0    d3: 001c50b0
d4: 00000000    d5: 00000000    a0: 00190fa0    a1: 80bfe001
Process swapper (pid: 0, task=001902d8)
Frame format=7 eff addr=00189f94 ssw=0525 faddr=80bfed01
wb 1 stat/addr/data: 0005 001ee0c0 001c50b0
wb 2 stat/addr/data: 0025 00000000 00000000
wb 3 stat/addr/data: 0005 00189fa8 001ee0c0
push data: 001c50b0 00000000 00000000 00000000
Stack from 00189fa8:
        001ee0c0 001ba8f0 00190fa0 0000001f 00190fb8 00036804 00000016 00000005
        001ba8c0 000f34d4 001ba8b2 00190fa0 00145808 001b7ed6 4558f000 28121969
        07e36000 07a9105a 00000001 001c50b0 00000000 001b72fc
Call Trace: [<001ba8f0>] cia_init_IRQ+0x30/0x9c
 [<00036804>] handle_simple_irq+0x0/0x56
 [<001ba8c0>] cia_init_IRQ+0x0/0x9c
 [<000f34d4>] strcpy+0x0/0x18
 [<001ba8b2>] amiga_init_IRQ+0xae/0xbc
 [<00145808>] printk+0x0/0x24
 [<001b7ed6>] start_kernel+0x1be/0x2c6
 [<001b72fc>] _sinittext+0x2fc/0x988

Code: f09a 4e75 2f02 206f 0008 122f 000f 2250 <1029> 0d00 8028 0005
1140 0005 4a01 6d28 4601 c200 1141 0005 1428 0004 c202 6712
Disabling lock debugging due to kernel taint
Kernel panic - not syncing: Attempted to kill the idle task!

The crash is a bit strange, since the CIA addresses should be covered by the
same Zorro II space mapping that also covers the Custom Chip addresses,
which is needed to get the above log through the serial port in the first place.

So
  1. Something is wrong with MMU setup on the m68k side, probably stale
     ATC entries,
  2. kexec doesn't work under memory pressure, but the kernel did manage
     to allocate enough RAM and didn't complain.
     This smells like a bug (buffer corruption?) in the generic kexec code.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
