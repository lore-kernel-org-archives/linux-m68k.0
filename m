From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: gcc 4.1.2 miscompiling 64-bit mask operations
Date: Sun, 7 Apr 2013 10:18:23 +0200
Message-ID: <CAMuHMdXzCTe6KLcLqu7=38V5yZCF=Z=9b7OzLeqC+jVdFiiYnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:49969 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161584Ab3DGISY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 7 Apr 2013 04:18:24 -0400
Received: by mail-ie0-f171.google.com with SMTP id e14so5825133iej.30
        for <linux-m68k@vger.kernel.org>; Sun, 07 Apr 2013 01:18:23 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

Recently I noticed this odd assembler warning when compiling using my
good old cross
toolchain based on gcc version 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21):

  CC      fs/ext4/extents_status.o
{standard input}: Assembler messages:
{standard input}:666: Warning: expression out of range: defaulting to 0

The offending line is:

        bfins %d1,-8(%fp){#4:#60}       | tmp63, newes.es_pblk,,

where the "#60" is invalid, as bitfield widths are limited to 32 bits.

This was generated from the 64-bit mask operation in the following C code:

static inline void ext4_es_store_pblock(struct extent_status *es,
                                        ext4_fsblk_t pb)
{
        ext4_fsblk_t block; /* unsigned long long */

        block = (pb & ~EXTENT_STATUS_FLAGS) |
                (es->es_pblk & EXTENT_STATUS_FLAGS);
        es->es_pblk = block;
}

Using gcc 4.6.3, the bug is not present, as it avoids emitting bfins
instructions.

JFYI, gcc 4.6.3 generates bigger code than 4.1.2:

-Linux version 3.9.0-rc5-atari-00740-gbb55db0-dirty (geert@ayla) (gcc version 4.
1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)) #1048 Sat Apr 6 13:37:34 CEST 2013
+Linux version 3.9.0-rc5-atari-00741-gcfb7cca-dirty (geert@ayla) (gcc version 4.
6.3 (GCC) ) #1050 Sat Apr 6 21:15:54 CEST 2013

-Memory: 268464k/268464k available (2728k kernel code, 5152k data, 144k init)
+Memory: 268348k/268348k available (2864k kernel code, 5144k data, 132k init)
 Virtual kernel memory layout:
-    vector  : 0x0036ce8c - 0x0036d28c   (   1 KiB)
+    vector  : 0x0038ce2c - 0x0038d22c   (   1 KiB)
     kmap    : 0xd0000000 - 0xf0000000   ( 512 MiB)
     vmalloc : 0x11800000 - 0xd0000000   (3048 MiB)
     lowmem  : 0x00000000 - 0x11000000   ( 272 MiB)
-      .init : 0x00393000 - 0x003b7000   ( 144 KiB)
-      .text : 0x00001000 - 0x002aa9d4   (2727 KiB)
-      .data : 0x002ad7a8 - 0x00392148   ( 915 KiB)
-      .bss  : 0x0036cc60 - 0x00392148   ( 150 KiB)
+      .init : 0x003b3000 - 0x003d4000   ( 132 KiB)
+      .text : 0x00001000 - 0x002cc08e   (2861 KiB)
+      .data : 0x002ceef8 - 0x003b20e8   ( 909 KiB)
+      .bss  : 0x0038cc00 - 0x003b20e8   ( 150 KiB)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
