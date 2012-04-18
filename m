From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: _ebss == _edata if MMU
Date: Wed, 18 Apr 2012 09:55:34 +0200
Message-ID: <CAMuHMdXefcfjetrLAtnsqONRT1WefEFU3Ztv0=2itP+sjGJDrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:39261 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751062Ab2DRHzf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 18 Apr 2012 03:55:35 -0400
Received: by iagz16 with SMTP id z16so10091239iag.19
        for <linux-m68k@vger.kernel.org>; Wed, 18 Apr 2012 00:55:34 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

On ARAnyM:

Virtual kernel memory layout:
    vector  : 0x002f4d10 - 0x002f5110   (   1 KiB)
    kmap    : 0xd0000000 - 0xf0000000   ( 512 MiB)
    vmalloc : 0x11800000 - 0xd0000000   (3048 MiB)
    lowmem  : 0x00000000 - 0x11000000   ( 272 MiB)
      .init : 0x00319000 - 0x0033c000   ( 140 KiB)
      .text : 0x00001000 - 0x002487b8   (2334 KiB)
      .data : 0x0024b540 - 0x00318a40   ( 822 KiB)
      .bss  : 0x002f4ae0 - 0x00318a40   ( 144 KiB)

End of data and end of bss are identical, as arch/m68k/kernel/vmlinux-s=
td.lds
says bss is a subset of data:

  _sdata =3D .;                   /* Start of data section */

  RODATA

  RW_DATA_SECTION(16, PAGE_SIZE, THREAD_SIZE)

  _sbss =3D .;
  BSS_SECTION(0, 0, 0)
  _ebss =3D .;

  _edata =3D .;                   /* End of data section */

On !MMU, bss is not embedded in data.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
