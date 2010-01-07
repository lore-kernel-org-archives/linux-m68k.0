From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] pmac-zilog: add platform driver
Date: Thu, 7 Jan 2010 22:05:32 +0100
Message-ID: <10f740e81001071305u551c3912td7a5b5eaaa00a146@mail.gmail.com>
References: <alpine.OSX.2.00.0911171657290.371@silk.local>
	 <10f740e81001020443h78c615d2l206b99c386600108@mail.gmail.com>
	 <alpine.OSX.2.00.1001030255060.414@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.26]:11943 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752794Ab0AGVFf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 7 Jan 2010 16:05:35 -0500
Received: by ey-out-2122.google.com with SMTP id 22so1048532eye.19
        for <linux-m68k@vger.kernel.org>; Thu, 07 Jan 2010 13:05:33 -0800 (PST)
In-Reply-To: <alpine.OSX.2.00.1001030255060.414@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org

On Sat, Jan 2, 2010 at 17:39, Finn Thain <fthain@telegraphics.com.au> w=
rote:
> On Sat, 2 Jan 2010, Geert Uytterhoeven wrote:
>> On Tue, Nov 17, 2009 at 10:04, Finn Thain <fthain@telegraphics.com.a=
u>
>> wrote:
>> > Add platform driver to the pmac-zilog driver for mac 68k, putting =
the
>> > powermac-specific bits inside #ifdef CONFIG_PPC_PMAC.
>>
>> > --- linux-2.6.31.orig/drivers/serial/pmac_zilog.c =C2=A0 =C2=A0 =C2=
=A0 2009-11-17 17:07:28.000000000 +1100
>> > +++ linux-2.6.31/drivers/serial/pmac_zilog.c =C2=A0 =C2=A02009-11-=
17 17:07:38.000000000 +1100
>>
>> > @@ -1427,6 +1439,8 @@ static struct uart_ops pmz_pops =3D {
>> > =C2=A0#endif
>> > =C2=A0};
>> >
>> > +#ifdef CONFIG_PPC_PMAC
>> > +
>> > =C2=A0/*
>> > =C2=A0* Setup one port structure after probing, HW is down at this=
 point,
>> > =C2=A0* Unlike sunzilog, we don't need to pre-init the spinlock as=
 we don't
>> > @@ -1823,6 +1837,88 @@ next:
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> > =C2=A0}
>> >
>> > +#else
>> > +
>> > +extern struct platform_device scc_a_pdev, scc_b_pdev;
>>
>> scripts/checkpatch.pl doesn't like this extern, and it's right.
>> Can't this be found using standard platform device/driver matching?
>
> The console initcall and arch initcall order didn't permit me to easi=
ly
> gather the bootinfo data and populate the platform device resources e=
arly
> enough. (On powermacs there is the open firmware device tree, but of
> course, we don't have one.)
>
> I would like to further adopt the driver model in order to ditch the
> macintosh_config global, and I'd also like to have proper nubus devic=
e
> matching. But I think that the serial console device is a bit excepti=
onal
> so I'm not too fussed about these two globals.

OK

> Anyway, I don't know of a better way to do the serial console but I'm=
 open
> to suggestions.
>
>> BTW, there are a few other minor checkpatch issues with some of the
>> other patches in the series, too.
>
> I ran checkpatch on all those patches before I submitted them. I igno=
red
> some of the complaints about whitespace where I felt that checkpatch =
got
> it wrong (space character following tab character, IIRC).
>
> checkpatch found lots of mistakes that I did fix, but it can't determ=
ine
> the most human readable style in all cases, especially where consiste=
ncy
> with the surrounding code is actually more conducive to readability t=
han
> strict but sporadic conformance to simple rules would be.

Sure. I thought I saw a few other, but I'll fix them up myself.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
