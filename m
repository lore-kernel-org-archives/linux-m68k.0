From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Debian kernel v2.6.38
Date: Sat, 23 Apr 2011 21:19:23 +0200
Message-ID: <BANLkTimNekxddcHFFV1cAAyiCWsz2EY11g@mail.gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
	<Pine.BSM.4.64L.1104231809290.3979@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:41740 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755202Ab1DWTTZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 23 Apr 2011 15:19:25 -0400
Received: by bwz15 with SMTP id 15so956947bwz.19
        for <linux-m68k@vger.kernel.org>; Sat, 23 Apr 2011 12:19:23 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1104231809290.3979@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Sat, Apr 23, 2011 at 20:13, Thorsten Glaser <tg@mirbsd.de> wrote:
> Geert Uytterhoeven dixit:
>> =C2=A03. If there's anything left that you really need, please tell =
us, so
>>"we" can get it in a good shape for v2.6.40.
>
> OK. While I don=E2=80=99t strictly need it, I can think of these:
> =E2=80=A2 Reclaim chip RAM on Amiga

Nobody cares about 4 KiB of Chip RAM, especially not if you have to pis=
s off the
Debian Kernel Team to have it now instead of in a few months :-)

> =E2=80=A2 Reserve ST RAM early

Yeah, that's a valid one,
My (and probably lkml's) main issue there is that it introduces yet
another custom
allocator. Can we avoid that?

> I=E2=80=99m Bcc=E2=80=99ing the Debian Kernel person I was talking to=
, so we may
> get an agreement. I=E2=80=99ll revisit your gitweb later then, to see
> which patches you actually schedule for Linus, and try to get
> them into Debian.

As for-2.6.39 got rebased in the mean time, you have to compare
m68k-v2.6.38 with m68k-queue to see what's (not yet) upstream.

And to back up Christian: keep up the good work!

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
