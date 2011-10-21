From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: print memory layout info in boot log
Date: Fri, 21 Oct 2011 16:56:19 +0200
Message-ID: <CAMuHMdWYBDd+rVe4FF7TYhNcyr_na09u8csVvw7L19Ry9Y2GWA@mail.gmail.com>
References: <1319180852-11105-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:44012 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751135Ab1JUO4T convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Oct 2011 10:56:19 -0400
Received: by iaek3 with SMTP id k3so4823227iae.19
        for <linux-m68k@vger.kernel.org>; Fri, 21 Oct 2011 07:56:19 -0700 (PDT)
In-Reply-To: <1319180852-11105-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Oct 21, 2011 at 09:07,  <gerg@snapgear.com> wrote:
> Output a table of the kernel memory regions at boot time.
> This is taken directly from the ARM architecture code that does this.
> The table looks like this:

arch/m68k/mm/init_mm.c: In function =E2=80=98print_memmap=E2=80=99:
arch/m68k/mm/init_mm.c:108: error: =E2=80=98_sbss=E2=80=99 undeclared (=
first use in
this function)
arch/m68k/mm/init_mm.c:108: error: (Each undeclared identifier is
reported only once
arch/m68k/mm/init_mm.c:108: error: for each function it appears in.)
arch/m68k/mm/init_mm.c:108: error: =E2=80=98_ebss=E2=80=99 undeclared (=
first use in
this function)

> + =C2=A0 =C2=A0 =C2=A0 printk(KERN_NOTICE "Virtual kernel memory layo=
ut:\n"

pr_notice

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " =C2=A0 =C2=A0vec=
tor =C2=A0: 0x%08lx - 0x%08lx =C2=A0 (%4ld kB)\n"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " =C2=A0 =C2=A0kma=
p =C2=A0 =C2=A0: 0x%08lx - 0x%08lx =C2=A0 (%4ld MB)\n"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " =C2=A0 =C2=A0vma=
lloc : 0x%08lx - 0x%08lx =C2=A0 (%4ld MB)\n"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " =C2=A0 =C2=A0low=
mem =C2=A0: 0x%08lx - 0x%08lx =C2=A0 (%4ld MB)\n"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " =C2=A0 =C2=A0 =C2=
=A0.init : 0x%p" " - 0x%p" " =C2=A0 (%4d kB)\n"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " =C2=A0 =C2=A0 =C2=
=A0.text : 0x%p" " - 0x%p" " =C2=A0 (%4d kB)\n"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " =C2=A0 =C2=A0 =C2=
=A0.data : 0x%p" " - 0x%p" " =C2=A0 (%4d kB)\n"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " =C2=A0 =C2=A0 =C2=
=A0.bss =C2=A0: 0x%p" " - 0x%p" " =C2=A0 (%4d kB)\n",

KiB, MiB?

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
