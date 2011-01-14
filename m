From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: build warnings
Date: Fri, 14 Jan 2011 13:17:46 +0100
Message-ID: <AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:42705 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752160Ab1ANMRr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 14 Jan 2011 07:17:47 -0500
Received: by fxm20 with SMTP id 20so2690100fxm.19
        for <linux-m68k@vger.kernel.org>; Fri, 14 Jan 2011 04:17:46 -0800 (PST)
In-Reply-To: <alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Fri, Jan 14, 2011 at 10:25, Thorsten Glaser <tg@mirbsd.de> wrote:
> Dixi quod=E2=80=A6
>
>> -1~experimental.1) plus for-linus and m68k-queue of yesterday. I als=
o
>> discovered @Stephen that staging drivers are built again. In case yo=
u
>> are interested in the progress: preliminary deb source package is at
>> https://www.freewrt.org/~tg/debs68k/tmp/linux-2.6/
>
> Ouch, just had a peek at the atari kernel which was built overnight
> (it=E2=80=99s working on bvme now) and got this:
>
> Running Aranym on X11: :0.0
> ARAnyM 0.9.10


> [ =C2=A0 =C2=A00.000000] Linux version 2.6.37-0+m68k.1-atari (Debian =
2.6.37-1~experimental.1+m68k.1) (tg@mirbsd.de) (gcc version 4.4.5 (Debi=
an 4.4.5-10) ) #1 Fri Jan 14 06:21:53 UTC 2011

> [ =C2=A0 =C2=A03.120000] scsi: waiting for bus probes to complete ...
> [ =C2=A0 =C2=A03.390000] Unable to handle kernel NULL pointer derefer=
ence at virtual address =C2=A0 (null)

Interesting, 2.6.37 with the m68k patches runs fine on ARAnyM for me...

There may be issues on real hardware though, as there's still a
half-finished patch
for SCSI from Michael pending.

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
