From: Luis Alves <ljalvs@gmail.com>
Subject: Re: [PATCH 1/1] 68000 code integration
Date: Fri, 4 May 2012 12:53:42 +0100
Message-ID: <CAGj5WxD8tziXOxtCOfsV8Ket=0D=rNg4HQT5Jco2dQ4n2_KRiQ@mail.gmail.com>
References: <1335818553-14402-1-git-send-email-ljalvs@gmail.com>
	<4FA37D01.2000107@snapgear.com>
	<CAGj5WxA=uO0Pkbn5UM4Tu3oGFO9JAXA7mEiwNQ3cuiOHM2b+hg@mail.gmail.com>
	<CAMuHMdWKkPwCa5rG55=ktG5kpr6Waf23DY17pQ7zNhYrwtDa1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:56491 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755824Ab2EDLxn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 4 May 2012 07:53:43 -0400
Received: by yhmm54 with SMTP id m54so2650250yhm.19
        for <linux-m68k@vger.kernel.org>; Fri, 04 May 2012 04:53:43 -0700 (PDT)
In-Reply-To: <CAMuHMdWKkPwCa5rG55=ktG5kpr6Waf23DY17pQ7zNhYrwtDa1A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, gerg@uclinux.org

Hi Geert,

Thanks for that info, I didn't know about that Amiga port.
I've looked into that implementation and it's similar to what I've done=
=2E
But as far as I can tell the code is also incomplete (the trap_c
function doesn't distinguish who caused the trap because
pt_regs->format and pt_regs->vector are pointing to some random
values).

Is the Amiga development active? I can see that the last commit was
about 1 year ago.

Thanks and regards,
Luis Alves


On Fri, May 4, 2012 at 11:58 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, May 4, 2012 at 11:48 AM, Luis Alves <ljalvs@gmail.com> wrote:
>> Also, the existing trap exception code doesn't work with 68000 cpu's
>> since they don't provide the vector in the stack.
>
> arch/m68k/kernel/entry_mm.S (yes, _mm, as Amiga platform code is base=
d
> on the m68k "mm" framework) from
> http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3D=
shortlog;h=3Drefs/heads/uamiga-untested
> should have trap support for 68000.
> Never tested on real hardware, though.
>
> Gr{oetje,eeting}s,
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 =A0=A0 -- =
Linus Torvalds
