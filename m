From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: aranym /dev/rtc
Date: Sun, 8 Dec 2013 10:09:07 +0100
Message-ID: <CAMuHMdVye8NGoirVj1Jp7TL0SBGTLMPweq33g0G9V+zrTYMGXA@mail.gmail.com>
References: <20090427185608.GC15806@marenka.net>
	<10f740e80904271333n1ddbcf1dwf792e8fd7593e3c6@mail.gmail.com>
	<alpine.DEB.2.02.1312021200140.24207@ayla.of.borg>
	<CAOmrzkJiL=rcL0MdJpRVZGTSVayWqFJf3D+9QL_5+_m6+yQrMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAOmrzkJiL=rcL0MdJpRVZGTSVayWqFJf3D+9QL_5+_m6+yQrMg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Debian GNU/Linux m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Thu, Dec 5, 2013 at 12:53 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> On Tue, Dec 3, 2013 at 12:07 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> Going back into time...
>>
>> On Mon, 27 Apr 2009, Geert Uytterhoeven wrote:
>>>   4. CONFIG_RTC_CLASS=y, CONFIG_RTC_DRV_CMOS=[my], /dev/rtc is dynamic
>>>      While rtc-cmos can be enabled on Atari (it was derived from
>>> rtc.c), it won't work yet,
>>>      as the necessary rtc_cmos platform device is not yet created on Atari.
>>
>> I gave it a try, cfr. "[PATCH 1/2] [RFC] m68k/atari: Create rtc_cmos platform
>> device" below.
>>
>> Unfortunately it didn't work well, cfr. "[PATCH 2/2] [RFC] rtc: Disable
>> RTC_DRV_CMOS on Atari" below, while rtc-generic works fine for the RTC part,
>> and the separate nvram driver works for the NVRAM part.
>>
>> So unless someone has a good reason for using rtc_cmos (and some patches
>> to fix its issues), I'll go for [PATCH 2/2].
>
> The generic CMOS driver will have the TT_MFP_RTC interrupt available
> only on a TT - maybe that's why it won't work on ARAnyM?

Perhaps. Note that rtc-generic also doesn't have an interrupt, but it does work.
Would be nice if someone could try rtc-cmos on a real TT, of course.

> Nothing wrong with applying the second part of 1/2 (renaming the
> RTC_PORT macro to ATARI_RTC_PORT) anyway, though.

Good point, thanks! Will do.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
