From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Sat, 28 Jan 2012 21:49:59 +0100
Message-ID: <CAMuHMdUiykMQ5RLat=fOakQ155oboCOcwKYyDeaAE2baBN7gKA@mail.gmail.com>
References: <4F1C577D.3040908@sigon.net>
	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>
	<CAOmrzkJO8hiMJhN5eanXpjjGnaLYrCDAbekX2=FY394+Vt1UHw@mail.gmail.com>
	<loom.20120127T184202-114@post.gmane.org>
	<4F245963.9070605@gmail.com>
	<Pine.BSM.4.64L.1201282041180.31292@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:57966 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752545Ab2A1UuA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Jan 2012 15:50:00 -0500
Received: by werb13 with SMTP id b13so2378336wer.19
        for <linux-m68k@vger.kernel.org>; Sat, 28 Jan 2012 12:49:59 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1201282041180.31292@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, linux-m68k@vger.kernel.org

On Sat, Jan 28, 2012 at 21:43, Thorsten Glaser <tg@mirbsd.de> wrote:
> open("/dev/rtc", O_RDONLY|O_LARGEFILE) =C2=A0=3D -1 ENOENT (No such f=
ile or directory)
> SYS_333(0x8000520d, 0x20000, 0, 0x8000520d, 0) =3D -1072368512
> SYS_333(0x2d, 0xc00182e0, 0x80000724, 0, 0) =3D -1072368512
> SYS_333(0, 0xc00182e0, 0x800007d7, 0, 0) =3D -1072368512
> SYS_333(0x2, 0x8000520d, 0, 0, 0) =C2=A0 =C2=A0 =C2=A0 =3D -107236851=
2
> SYS_333(0x2, 0, 0, 0x8000668e, 0) =C2=A0 =C2=A0 =C2=A0 =3D -107236851=
2
> open("/dev/rtc0", O_RDONLY|O_LARGEFILE) =3D 3
>
> (What=E2=80=99s SYS_333, and why does strace not know it?)

#define __NR_get_thread_area    333

Thread Local Storage.

-ESTRACE_TOO_OLD?
-ESTRACE_NEVER_UPDATED?

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
