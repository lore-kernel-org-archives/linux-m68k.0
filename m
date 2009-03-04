From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [rtc-linux] Re: [PATCH/RFC 0/5] Generic RTC class driver
Date: Wed, 4 Mar 2009 09:26:29 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0903040920240.2416@vixen.sonytel.be>
References: <20090224231154.60ba18d6@i1501.lan.towertech.it> <1235514727.18632.93.camel@macbook.infradead.org> <alpine.LRH.2.00.0902251059110.4063@vixen.sonytel.be> <20090225111836.621412c1@i1501.lan.towertech.it> <20090227185514.GA1071@linux-m68k.org>
 <alpine.LRH.2.00.0903021051040.25117@vixen.sonytel.be> <20090302110310.35af50ea@i1501.lan.towertech.it> <alpine.LRH.2.00.0903021116450.25117@vixen.sonytel.be> <20090302120950.0d35e06c@i1501.lan.towertech.it> <alpine.LRH.2.00.0903031121280.31985@vixen.sonytel.be>
 <20090303190609.GB6907@linux-sh.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vervifontaine.sonytel.be ([80.88.33.193]:43166 "EHLO
	vervifontaine.sonycom.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751829AbZCDI0d (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 4 Mar 2009 03:26:33 -0500
In-Reply-To: <20090303190609.GB6907@linux-sh.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Mundt <lethal@linux-sh.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Alessandro Zummo <alessandro.zummo@towertech.it>, Richard Zidlicky <rz@linux-m68k.org>, rtc-linux@googlegroups.com, linux-parisc@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, Kyle McMartin <kyle@mcmartin.ca>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, David Woodhouse <dwmw2@infradead.org>

On Wed, 4 Mar 2009, Paul Mundt wrote:
> On Tue, Mar 03, 2009 at 11:41:23AM +0100, Geert Uytterhoeven wrote:
> > So would you accept a patch series that:
> >   1. Adds the missing module aliases to rtc-parisc (which is a bugf=
ix),
> >   2. Moves the platform device creation out of rtc-ppc and into arc=
h-specific
> >      code (which is also a bugfix),
> >   3. Consolidates rtc-parisc and rtc-ppc into rtc-generic (which is=
 a cleanup),
> >   4. Makes rtc-generic dependent on PARISC, PPC, and M68K (the exis=
ting
> >      [sg]et_rtc_time() users):
> >        a. without introducing ARCH_HAS_GENERIC_RTC,
> >        b. with a big fat warning in the Kconfig comment not relaxin=
g the
> >           dependencies, as it's supposed to go away.
> >   4. Converts the PS3 RTC support into a separate driver, called rt=
c-ps3
> >      (as a bonus ;-)
> >=20
> > ? If yes, I'll cook it up.
> >=20
> > Other RTC platform support can be converted into separate drivers l=
ater.
> >=20
> Did you miss the rtc-firmware thread?
>=20
> http://groups.google.com/group/rtc-linux/browse_thread/thread/53e8d98=
966048f66/1d730cb4aa2f85f0?lnk=3Dgst&q=3Drtc-firmware#1d730cb4aa2f85f0
> http://groups.google.com/group/rtc-linux/browse_thread/thread/b3d1011=
5c7e147f2/cb9c1530d9c3a433?lnk=3Dgst&q=3Drtc-firmware#cb9c1530d9c3a433

Thanks Paul, I wasn't aware of that thread!

Yes, this is almost the same. The only part I don't agree with is the m=
ove of
the creation of the platform device from arch-specific code to rtc-firm=
ware.c,
as this makes autoloading the driver more difficult.

Seems like everybody but the RTC maintainer has an interest in having a=
n RTC
class driver on top of [gs]et_rtc_time()... ;-)

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village =B7 Da Vincilaan 7-D1 =B7 B-1935 Zaventem =B7 Bel=
gium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =B7 RPR Brussels
=46ortis =B7 BIC GEBABEBB =B7 IBAN BE41293037680010
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
