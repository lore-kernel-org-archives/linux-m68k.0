From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC 0/16] m68k: Device model patches
Date: Tue, 5 May 2009 09:36:45 +0200
Message-ID: <10f740e80905050036o49b536betc40125c2944eb7ec@mail.gmail.com>
References: <1240080744-14995-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f224.google.com ([209.85.219.224]:61453 "EHLO
	mail-ew0-f224.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751807AbZEEHgr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 May 2009 03:36:47 -0400
In-Reply-To: <1240080744-14995-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 18, 2009 at 20:52, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> This set of patches brings Amiga hardware support better in line with=
 to the
> Linux device model:
> =C2=A0- Add module alias support for Zorro drivers (not all drivers c=
an
> =C2=A0 =C2=A0benefit from this yet though, as some still use zorro_fi=
nd_device()
> =C2=A0 =C2=A0instead of struct zorro_driver),
> =C2=A0- Convert the various builtin Amiga hardware to the platform dr=
iver
> =C2=A0 =C2=A0framework.
>
> [01] platform: Make platform resources input parameters const
> [02] m68k: amiga - Zorro bus modalias support
> [03] m68k: amiga - Zorro host bridge platform device conversion
> [04] m68k: amiga - Frame buffer platform device conversion
> [05] m68k: amiga - Sound platform device conversion
> [06] m68k: amiga - Floppy platform device conversion
> [07] m68k: amiga - A3000 SCSI platform device conversion
> [08] m68k: amiga - A4000T SCSI platform device conversion
> [09] m68k: amiga - Amiga Gayle IDE platform device conversion
> [10] m68k: amiga - Keyboard platform device conversion
> [11] m68k: amiga - Mouse platform device conversion
> [12] m68k: amiga - Serial port platform device conversion
> [13] m68k: amiga - Parallel port platform device conversion
> [14] rtc: Add an RTC driver for the Oki MSM6242
> [15] rtc: Add an RTC driver for the Ricoh RP5C01
> [16] m68k: amiga - RTC platform device conversion
>
> Due to lack of hardware (only Amiga 4000 here), I couldn't test all d=
rivers.
> Especially the SCSI drivers could use some testing feedback.
> The changes to most other drivers are fairly trivial.

I'm a bit reluctant to apply the A3000 SCSI platform device conversion =
without
having received any feedback, and I would like to apply the whole serie=
s ASAP.
Did anyone try on A3000/A3000T? Similar changes are needed to convert t=
he
A2091 and GVP II SCSI drivers to the zorro_driver model, so if we have
more users
of those, I can do that conversion first, so it can receive some testin=
g.

Thx!

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
