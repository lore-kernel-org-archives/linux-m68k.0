From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: BUG: scheduling while atomic: cron/715/0x10cac0c0
Date: Tue, 24 May 2016 10:44:34 +0200
Message-ID: <CAMuHMdWp_dnJSNvWzge=pteeg64DjLxgBCG7j-1Ua1Eyk3FNog__38756.6337864429$1464079494$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Somewhere during this merge window, I started sometimes seeing the below during
shutdown of my Debian/m68k system running under ARAnyM:

BUG: scheduling while atomic: cron/715/0x10cac0c0
Modules linked in:
CPU: 0 PID: 715 Comm: cron Not tainted 4.6.0-atari-09955-g55db2ee398e5862f #338
Stack from 10cac074:
        10cac074 0037ad52 0003d9b4 0036636e 00cd0814 000002cb 10cac0c0 10cac0c0
        002f45ba 00cd05c0 00000000 00000082 00491068 00000000 00000000 002f42a8
        000412c2 00000000 00000000 10cac0e0 002f47a4 00000000 7fffffff 10cac180
        003b5490 00cd05ec 10cac1f0 10cac118 002f63a8 00000000 10cac174 10cac180
        001ab966 008a6400 10cac130 0000021a 003bbba0 0000021a 0000021a 00000002
        efa44d50 10cac128 002f4806 7fffffff 00000082 002f4c8a 002f4c9c 7fffffff
Call Trace: [<0003d9b4>] __schedule_bug+0x40/0x54
 [<002f45ba>] __schedule+0x312/0x388
 [<002f42a8>] __schedule+0x0/0x388
 [<000412c2>] prepare_to_wait+0x0/0x52
 [<002f47a4>] schedule+0x64/0x82
 [<002f63a8>] schedule_timeout+0xda/0x104
 [<001ab966>] __radix_tree_lookup+0x5a/0xa4
 [<002f4806>] io_schedule_timeout+0x36/0x4a
 [<002f4c8a>] bit_wait_io+0x0/0x40
 [<002f4c9c>] bit_wait_io+0x12/0x40
 [<002f493c>] __wait_on_bit+0x46/0x76
 [<0006a252>] wait_on_page_bit_killable+0x64/0x6c
 [<002f4c8a>] bit_wait_io+0x0/0x40
 [<000413e2>] wake_bit_function+0x0/0x4e
 [<0006a3a0>] __lock_page_or_retry+0xde/0x124
 [<0021a000>] scsi_scan_host+0xd6/0x196
 [<00098a82>] lookup_swap_cache+0x1e/0x48
 [<0008ba3e>] handle_mm_fault+0x626/0x7de
 [<0008f1de>] find_vma+0x0/0x66
 [<002f5c8a>] down_read+0x0/0xe
 [<0006a201>] wait_on_page_bit_killable+0x13/0x6c
 [<0008f1f4>] find_vma+0x16/0x66
 [<00006c50>] do_page_fault+0xe6/0x23a
 [<0000c350>] res_func+0x930/0x141a
 [<00005cc4>] buserr_c+0x190/0x6d4
 [<0000c350>] res_func+0x930/0x141a
 [<000028f8>] buserr+0x20/0x28
 [<0000c350>] res_func+0x930/0x141a
 [<000028f8>] buserr+0x20/0x28
 [<0000c350>] res_func+0x930/0x141a
 [<000028f8>] buserr+0x20/0x28
 [<0000c350>] res_func+0x930/0x141a
 [<000028f8>] buserr+0x20/0x28
 [<0000c350>] res_func+0x930/0x141a
 [<000028f8>] buserr+0x20/0x28

Note that my tree does contain some local patches, so you cannot try the
exact same commit ID.

Unfortunately this isn't reproducible at will, so I cannot bisect it.
I saw it first after merging in commit 07be1337b9e8bfcd.

Anyone with a clue? Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
