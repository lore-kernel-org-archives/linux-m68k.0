From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: test_user_copy may kill ARAnyM
Date: Sun, 8 Nov 2015 14:06:15 +0100
Message-ID: <CAMuHMdVQ93ihgcxUbjptTaHdPjxXLyVAsAr-m3tWBJV0krS2vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: aranym@lists.bobek.cz

Running "insmod test_user_copy.ko" sometimes kills ARAnyM:

    Unable to handle kernel access at virtual address 0e9ba000
    Oops: 00000000
    terminate called after throwing an instance of 'm68k_exception'
    /home/geert/bin/bin/linux-atari: line 2: 30027 Aborted
    aranym-mmu -l -c /home/geert/aranym/atari_defconfig

This is not 100% reproducible. Sometimes it just kills the kernel in a bad way"

Unable to handle kernel access at virtual address 10d8e000
** 553 printk messages dropped ** Call Trace: [<00025ca2>] do_exit+0xba/0x8c8
 [<00025d8c>] do_exit+0x1a4/0x8c8
 [<0004295e>] printk+0x0/0x1c
 [<00042974>] printk+0x16/0x1c
 [<00005460>] show_registers+0x3f0/0x3f8
 [<000054ba>] die_if_kernel+0x52/0x56
 [<0004295e>] printk+0x0/0x1c
 [<00006982>] send_fault_sig+0x9e/0xe8
 [<00030001>] set_user+0x17/0x70
 [<00006a0c>] do_page_fault+0x40/0x23c
 [<0004295e>] printk+0x0/0x1c
 [<00005b90>] buserr_c+0x190/0x6d4
 [<0004295e>] printk+0x0/0x1c
 [<000028dc>] buserr+0x20/0x28
 [<00025ca2>] do_exit+0xba/0x8c8
 [<00025d8c>] do_exit+0x1a4/0x8c8
...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
