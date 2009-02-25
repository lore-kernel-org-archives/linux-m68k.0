From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [rtc-linux] [PATCH/RFC 0/5] Generic RTC class driver
Date: Wed, 25 Feb 2009 11:00:13 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0902251059110.4063__31144.6600514047$1235556150$gmane$org@vixen.sonytel.be>
References: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com> <20090220170454.04382e9e@i1501.lan.towertech.it> <alpine.LRH.2.00.0902231319170.22762@vixen.sonytel.be> <1235511327.18632.73.camel@macbook.infradead.org>
 <20090224231154.60ba18d6@i1501.lan.towertech.it> <1235514727.18632.93.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1235514727.18632.93.camel@macbook.infradead.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>
Cc: Alessandro Zummo <alessandro.zummo@towertech.it>, rtc-linux@googlegroups.com, Richard Zidlicky <rz@linux-m68k.org>, linux-parisc@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, David@ozlabs.org, Kyle McMartin <kyle@mcmartin.ca>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Wed, 25 Feb 2009, David Woodhouse wrote:
> On Tue, 2009-02-24 at 23:11 +0100, Alessandro Zummo wrote:
> > On Wed, 25 Feb 2009 06:35:27 +0900
> > David Woodhouse <dwmw2@infradead.org> wrote:
> >=20
> > > > So you want us to kill the ppc_md.[gs]et_rtc_time() [ppc], mach=
_hwclk() [m68k],
> > > > mach_gettod() [m68knommu] (and probably a few other) abstractio=
ns, and move all
> > > > RTC code out of arch/ into seperate drivers under drivers/rtc/ =
instead?
> > >=20
> > > That's the ideal... although did we get NTP sync working again ye=
t?
> >=20
> >  not yet. we're close but I've been very busy :(
>=20
> I know the feeling.
>=20
> Once that's working, we can convert individual PPC platforms over,
> removing the routines from the ppc_md and creating a generic RTC driv=
er
> instead. PA Electra is already like that -- because it wasn't a
> regression there to have broken NTP sync. But the others need to wait=
=2E

I didn't know NTP was broken with RTC class drivers?

So we should actually keep on using genrtc instead of rtc-ppc/rtc-gener=
ic for
now? ;-)

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
