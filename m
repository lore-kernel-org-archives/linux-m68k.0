From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Zero Divide in Kernel 3.12-rc4
Date: Mon, 21 Oct 2013 10:40:49 +0200
Message-ID: <CAMuHMdVfvDAuqpTFFq5qQK2Prio55i2bmcne-eu_VQt5xFY-LQ@mail.gmail.com>
References: <dbbdc369c25c9eea7abc4ca331128de3@muaddib.hro.localnet>
	<f8389c591d50fe216b546e70d464c1f9@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:41835 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752823Ab3JUIku (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Oct 2013 04:40:50 -0400
Received: by mail-pd0-f170.google.com with SMTP id v10so1990237pde.29
        for <linux-m68k@vger.kernel.org>; Mon, 21 Oct 2013 01:40:49 -0700 (PDT)
In-Reply-To: <f8389c591d50fe216b546e70d464c1f9@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2013.bluespice.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, tuomas.vainikka@kopteri.net

On Mon, Oct 21, 2013 at 9:34 AM, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
> this looks like it might be related to the ESP driver - scsi_finish_command
> called from the swapper process during apt-get dist-upgrade does seem
> plausible.
>
> Some of the Amiga SCSI drivers did fiddle with the chip interrupt enable on
> SCSI interrupt entry, but I'd have thought the ESP core is reasonably
> thread-safe these days.
>
> To pinpoint where in sd_completed_bytes this happens, I'd need the sd_mod
> module and the module symbol map.

                /* be careful ... don't want any overflows */
                u64 factor = scmd->device->sector_size / 512;
                do_div(start_lba, factor);
                do_div(end_lba, factor);

scmd->device->sector_size should be 512, so factor should be 1.

Let's try a bit harder with a fresher mind and a cup of coffee and
a mini-twix:

>> [77568.320000] PC: [<0484c33a>] sd_completed_bytes+0x90/0xe8 [sd_mod]
>> [77568.330000] SR: 2000  SP: 00277e58  a2: 0027e2e4
>> [77568.340000] d0: 00000000    d1: 007735a0    d2: 00000000    d3: 00000001
>> [77568.350000] d4: 00000000    d5: 007735a8    a0: 024dd000    a1: 024a0ea0

>> [77569.190000] Code: 4a80 6704 4c42 0001 2c01 2207 4c42 1406 <2c00> 2e01
>> 2004 2204 6704 4c42 0001 2801 2205 4c42 1404 2800 2a01 202e fff8 222e

"4c42" is a division. It's the second one of the four divisions:

   0: 4a80           tstl %d0

d0 is zero, so the first division is skipped.

   2: 6704           beqs 0x8
   4: 4c42 0001       divull %d2,%d1,%d0
   8: 2c01           movel %d1,%d6
   a: 2207           movel %d7,%d1
   c: 4c42 1406       divul %d2,%d6,%d1

It's dividing by d2, which is zero. So scmd->device->sector_size must be
smaller than 512 (probably zero).

  10: 2c00           movel %d0,%d6
  12: 2e01           movel %d1,%d7
  14: 2004           movel %d4,%d0
  16: 2204           movel %d4,%d1
  18: 6704           beqs 0x1e
  1a: 4c42 0001       divull %d2,%d1,%d0
  1e: 2801           movel %d1,%d4
  20: 2205           movel %d5,%d1
  22: 4c42 1404       divul %d2,%d4,%d1
  26: 2800           movel %d0,%d4
  28: 2a01           movel %d1,%d5
  2a: 202e fff8       movel %fp@(-8),%d0

The posted binary has slightly different code (different addresses, and the
division is "4c40"):

00168404 <sd_completed_bytes>:
  168404:       4e56 fff8       linkw %fp,#-8
  168408:       48e7 3f1c       moveml %d2-%d7/%a3-%a5,%sp@-
  16840c:       266e 0008       moveal %fp@(8),%a3
  168410:       206b 0054       moveal %a3@(84),%a0
  168414:       2828 0032       movel %a0@(50),%d4
  168418:       2a28 0036       movel %a0@(54),%d5
  16841c:       2c2b 0040       movel %a3@(64),%d6
  168420:       2e2b 0044       movel %a3@(68),%d7
  168424:       7001            moveq #1,%d0
  168426:       b0a8 0022       cmpl %a0@(34),%d0
  16842a:       6600 00b2       bnew 1684de <sd_completed_bytes+0xda>
  16842e:       486e fff8       pea %fp@(-8)
  168432:       4878 0060       pea 60 <PAGE_TABLE_SIZE+0x20>
  168436:       2f2b 0058       movel %a3@(88),%sp@-
  16843a:       4eb9 0015 4e86  jsr 154e86 <scsi_get_sense_info_fld>
  168440:       4fef 000c       lea %sp@(12),%sp
  168444:       4a80            tstl %d0
  168446:       6700 0096       beqw 1684de <sd_completed_bytes+0xda>
  16844a:       2053            moveal %a3@,%a0
  16844c:       2028 0054       movel %a0@(84),%d0
  168450:       b0ab 0040       cmpl %a3@(64),%d0
  168454:       6400 0088       bccw 1684de <sd_completed_bytes+0xda>
  168458:       2206            movel %d6,%d1
  16845a:       7409            moveq #9,%d2
  16845c:       e4a9            lsrl %d2,%d1
  16845e:       2601            movel %d1,%d3
  168460:       4202            clrb %d2
  168462:       d685            addl %d5,%d3
  168464:       d584            addxl %d4,%d2
  168466:       0c80 0000 01ff  cmpil #511,%d0
  16846c:       6212            bhis 168480 <sd_completed_bytes+0x7c>
  16846e:       da85            addl %d5,%d5
  168470:       d984            addxl %d4,%d4
  168472:       2002            movel %d2,%d0
  168474:       2203            movel %d3,%d1
  168476:       d281            addl %d1,%d1
  168478:       d180            addxl %d0,%d0
  16847a:       2840            moveal %d0,%a4
  16847c:       2a41            moveal %d1,%a5
  16847e:       602a            bras 1684aa <sd_completed_bytes+0xa6>
  168480:       7209            moveq #9,%d1
  168482:       e2a8            lsrl %d1,%d0
  168484:       2204            movel %d4,%d1
  168486:       2045            moveal %d5,%a0
  168488:       6704            beqs 16848e <sd_completed_bytes+0x8a>
  16848a:       4c40 1004       divull %d0,%d4,%d1
  16848e:       2a08            movel %a0,%d5
  168490:       4c40 5404       divul %d0,%d4,%d5
  168494:       2801            movel %d1,%d4
  168496:       2202            movel %d2,%d1
  168498:       2043            moveal %d3,%a0
  16849a:       6704            beqs 1684a0 <sd_completed_bytes+0x9c>
  16849c:       4c40 1002       divull %d0,%d2,%d1
  1684a0:       2608            movel %a0,%d3
  1684a2:       4c40 3402       divul %d0,%d2,%d3
  1684a6:       2841            moveal %d1,%a4
  1684a8:       2a43            moveal %d3,%a5
  1684aa:       202e fff8       movel %fp@(-8),%d0
  1684ae:       222e fffc       movel %fp@(-4),%d1
  1684b2:       2400            movel %d0,%d2
  1684b4:       2601            movel %d1,%d3
  1684b6:       9685            subl %d5,%d3
  1684b8:       9584            subxl %d4,%d2
  1684ba:       6522            bcss 1684de <sd_completed_bytes+0xda>
  1684bc:       240c            movel %a4,%d2
  1684be:       260d            movel %a5,%d3
  1684c0:       9681            subl %d1,%d3
  1684c2:       9580            subxl %d0,%d2
  1684c4:       6318            blss 1684de <sd_completed_bytes+0xda>
  1684c6:       9285            subl %d5,%d1
  1684c8:       9184            subxl %d4,%d0
  1684ca:       2053            moveal %a3@,%a0
  1684cc:       9c87            subl %d7,%d6
  1684ce:       2028 0054       movel %a0@(84),%d0
  1684d2:       4c01 0800       mulsl %d1,%d0
  1684d6:       bc80            cmpl %d0,%d6
  1684d8:       6406            bccs 1684e0 <sd_completed_bytes+0xdc>
  1684da:       2006            movel %d6,%d0
  1684dc:       6002            bras 1684e0 <sd_completed_bytes+0xdc>
  1684de:       4280            clrl %d0
  1684e0:       4cee 38fc ffd4  moveml %fp@(-44),%d2-%d7/%a3-%a5
  1684e6:       4e5e            unlk %fp
  1684e8:       4e75            rts

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
