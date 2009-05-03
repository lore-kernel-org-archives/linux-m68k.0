From: Geert Uytterhoeven <geert.uytterhoeven@gmail.com>
Subject: Re: m68k 2.6.26-1 vs 2.4.30 comparison
Date: Sun, 3 May 2009 13:08:06 +0200
Message-ID: <10f740e80905030408p38f87e09ueabc45ef98d4a88f@mail.gmail.com>
References: <20090503072811.GB3179@luminet.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.24]:32494 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751789AbZECLIJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 3 May 2009 07:08:09 -0400
Received: by ey-out-2122.google.com with SMTP id 9so812945eyd.37
        for <linux-m68k@vger.kernel.org>; Sun, 03 May 2009 04:08:06 -0700 (PDT)
In-Reply-To: <20090503072811.GB3179@luminet.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: lancetag@luminet.net
Cc: linux-m68k@vger.kernel.org

On Sun, May 3, 2009 at 09:28, Lance Tagliapietra <lancetag@luminet.net>=
 wrote:
> b). My custom 2.4.30 kernel size is about 750K uncompressed. With set=
ting the options to
> remove support for hardware that I don't have and features that I don=
't need, I still
> came up with a kernel of 2.7M. =C2=A0The goal is to have the smallest=
 footprint kernel possible.

Yeah, minimum kernel size has increased :-(

> c). The 2.6.26 kernel seems to want to keep more memory free and hit =
the swap much more
> than the 2.4.30 kernel according to vmstat. =C2=A0Under 2.4.30 I see =
the free memory go as low
> as about 200K, and it will remain at that level as long as is necessa=
ry. =C2=A0Under 2.6.26,
> the free memory stays at about 800K, and if it drops below that, it w=
ill come back to that
> level relatively quickly.

As memory consumption is general. I didn't do exact measurements, but
2.6 consumes ca. 1.5 MiB
more on my A4000 (with 12 MiB of fast RAM). Booting and running Debian
is slow, while I used to
have more daemons installed, in a time the machine was actually used
as a mailserver for 70 people,
some of which read their email by logging in and running pine...

> d). The real time clock came up on the worng month, going from 2.4.30=
 to 2.6.26 (or 28),
> March vs April, in this case.

That's an interesting one...

In 2.4.30, you have both a2000_gettod() (for boot time setting), which =
does:

    *monp  =3D tod_2000.month1      * 10 + tod_2000.month2;

and amiga_hwclk() (for /dev/rtc), which does:

    t->tm_mon  =3D tod_2000.month1      * 10 + tod_2000.month2 - 1;

In 2.6.29, you only have a2000_hwclk(), which does

    t->tm_mon  =3D tod_2000.month1      * 10 + tod_2000.month2 - 1;

The data returned by a2000_gettod() is converted to seconds using mktim=
e(),
which assumes months are in the range 1..12.

amiga_hwclk() and a2000_hwclk() both use struct rtc_time. This should
be similar to
struct tm in <time.h>, where the months are in the range 0..11.
Both rtc_proc_output()/gen_rtc_proc_output() (2.4.30) and
rtc_proc_show() (2.6.29) do
print tm.tm_mon + 1 to make them be in the range 1..12.

So at first sight, I don't see where the bug is...

What does `hwlock -ur` say, on both 2.4.30 and 2.6.29?

> Questions:
>
> e). Is there an option which tells the kernel the minimum amount of f=
ree RAM to maintain
> as I describe in (c) above? =C2=A0RAM is relatively precious in my m6=
8k environment, and having
> 500k being held in reserve seems a bit much?

Probably one of those swappiness parameters under /sys. Don't ask me
which one...

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
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
