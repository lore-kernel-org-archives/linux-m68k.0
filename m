From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-2.6_2.6.39-1_amd64.changes ACCEPTED into unstable
Date: Mon, 13 Jun 2011 20:49:29 +0200
Message-ID: <BANLkTinhBpxEqRb_Xi-HCejqLPSG3wJGsw@mail.gmail.com>
References: <E1QNV5z-0006jD-Ej@franck.debian.org>
	<20110521122605.GA16345@chumley.earth.sol>
	<Pine.BSM.4.64L.1105211232060.14234@herc.mirbsd.org>
	<Pine.BSM.4.64L.1105211327140.14234@herc.mirbsd.org>
	<BANLkTimfZ4oHhT7chf=7-gHH_DVMQqHH+g@mail.gmail.com>
	<BANLkTikQSZev=QHYFR2kxsUY2xND37Dr8g@mail.gmail.com>
	<BANLkTinJJn0wvZrdQKgL-1GvVt7mT7DNyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64761 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751982Ab1FMStb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Jun 2011 14:49:31 -0400
Received: by bwz15 with SMTP id 15so3939318bwz.19
        for <linux-m68k@vger.kernel.org>; Mon, 13 Jun 2011 11:49:30 -0700 (PDT)
In-Reply-To: <BANLkTinJJn0wvZrdQKgL-1GvVt7mT7DNyQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Thorsten Glaser <tg@mirbsd.de>

On Mon, May 30, 2011 at 19:22, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> On Mon, May 30, 2011 at 19:14, Michael Schmitz
> <schmitzmic@googlemail.com> wrote:
>> remind me - what rewrite will be required?
>
> Remove your own memory allocator.
> Probably the simplest is to always reserve some ST-RAM on bootup, and=
 let
> stram_alloc()/stram_free() use that reserved pool.
>
>> I've seen your work on the chip RAM driver, will take a close look a=
t
>> adapting this for ST-RAM when I return from overseas.
>
> When will you return, just in case I come to it before that (woow, I
> feel overly optimistic now)?

Has anyone besides me tried http://lkml.org/lkml/2011/6/5/46 on top of
https://lkml.org/lkml/2011/5/21/142?

>> On Tue, May 24, 2011 at 2:22 PM, Geert Uytterhoeven
>> <geert@linux-m68k.org> wrote:
>>> On Sat, May 21, 2011 at 15:28, Thorsten Glaser <tg@mirbsd.de> wrote=
:
>>>>>main archive in a few days, then. Just saw there was a new upload.
>>>>
>>>> Hm, well. It doesn=E2=80=99t include the =E2=80=9CReserve ST-RAM e=
arly=E2=80=9D patch =E2=98=B9
>>>> but we know how to work around the problem, for now, I think.
>>>> Let=E2=80=99s just hope it=E2=80=99ll end up in 2.6.40 upstream.
>>>
>>> I'm sorry, it won't make 2.6.40, unless someone does the rewrite be=
fore Sunday
>>> (Linus flying to Japan, end-of-merge-window).

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
