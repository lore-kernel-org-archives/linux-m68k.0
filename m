From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/1] 68000 code integration
Date: Fri, 4 May 2012 12:58:55 +0200
Message-ID: <CAMuHMdWKkPwCa5rG55=ktG5kpr6Waf23DY17pQ7zNhYrwtDa1A@mail.gmail.com>
References: <1335818553-14402-1-git-send-email-ljalvs@gmail.com>
	<4FA37D01.2000107@snapgear.com>
	<CAGj5WxA=uO0Pkbn5UM4Tu3oGFO9JAXA7mEiwNQ3cuiOHM2b+hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:60870 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754928Ab2EDK6z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 4 May 2012 06:58:55 -0400
Received: by obbtb18 with SMTP id tb18so3826265obb.19
        for <linux-m68k@vger.kernel.org>; Fri, 04 May 2012 03:58:55 -0700 (PDT)
In-Reply-To: <CAGj5WxA=uO0Pkbn5UM4Tu3oGFO9JAXA7mEiwNQ3cuiOHM2b+hg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, gerg@uclinux.org

On Fri, May 4, 2012 at 11:48 AM, Luis Alves <ljalvs@gmail.com> wrote:
> Also, the existing trap exception code doesn't work with 68000 cpu's
> since they don't provide the vector in the stack.

arch/m68k/kernel/entry_mm.S (yes, _mm, as Amiga platform code is based
on the m68k "mm" framework) from
http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3Dsh=
ortlog;h=3Drefs/heads/uamiga-untested
should have trap support for 68000.
Never tested on real hardware, though.

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
