From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [rtc-linux] Re: [PATCH/RFC 0/5] Generic RTC class driver
Date: Wed, 4 Mar 2009 13:51:32 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0903041350540.4953@vixen.sonytel.be>
References: <20090224231154.60ba18d6@i1501.lan.towertech.it> <1235514727.18632.93.camel@macbook.infradead.org> <alpine.LRH.2.00.0902251059110.4063@vixen.sonytel.be> <20090225111836.621412c1@i1501.lan.towertech.it> <20090227185514.GA1071@linux-m68k.org>
 <alpine.LRH.2.00.0903021051040.25117@vixen.sonytel.be> <20090302110310.35af50ea@i1501.lan.towertech.it> <alpine.LRH.2.00.0903021116450.25117@vixen.sonytel.be> <20090302120950.0d35e06c@i1501.lan.towertech.it> <alpine.LRH.2.00.0903031121280.31985@vixen.sonytel.be>
 <20090303190609.GB6907@linux-sh.org> <alpine.LRH.2.00.0903040920240.2416@vixen.sonytel.be> <20090304134705.7d9bbe5c@i1501.lan.towertech.it>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vervifontaine.sonytel.be ([80.88.33.193]:48110 "EHLO
	vervifontaine.sonycom.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750950AbZCDMvg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 4 Mar 2009 07:51:36 -0500
In-Reply-To: <20090304134705.7d9bbe5c@i1501.lan.towertech.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alessandro Zummo <alessandro.zummo@towertech.it>
Cc: rtc-linux@googlegroups.com, Paul Mundt <lethal@linux-sh.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Richard Zidlicky <rz@linux-m68k.org>, linux-parisc@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, Kyle McMartin <kyle@mcmartin.ca>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, David Woodhouse <dwmw2@infradead.org>

On Wed, 4 Mar 2009, Alessandro Zummo wrote:
> On Wed, 4 Mar 2009 09:26:29 +0100 (CET)
> Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:
>=20
> > Thanks Paul, I wasn't aware of that thread!
> >=20
> > Yes, this is almost the same. The only part I don't agree with is t=
he move of
> > the creation of the platform device from arch-specific code to rtc-=
firmware.c,
> > as this makes autoloading the driver more difficult.
>=20
>  and it's also against a proper implementation of the device/driver m=
odel.
>=20
> > Seems like everybody but the RTC maintainer has an interest in havi=
ng an RTC
> > class driver on top of [gs]et_rtc_time()... ;-)
>=20
>  That's because everyone is lazy :)=20
>=20
>  Seriously, if you want to handle it in the way we wrote
>  in the previous emails, it's ok for me.

OK, I will do so. Thanks!

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
