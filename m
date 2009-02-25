From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH/RFC 0/5] Generic RTC class driver
Date: Wed, 25 Feb 2009 10:54:54 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0902251054371.4063__7091.62304779074$1235555794$gmane$org@vixen.sonytel.be>
References: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com> <49A4406F.2010407@gmx.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <49A4406F.2010407@gmx.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Cc: Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, Kyle McMartin <kyle@mcmartin.ca>, David Woodhouse <dwmw2@infradead.org>, Richard Zidlicky <rz@linux-m68k.org>, linux-parisc@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, dann frazier <dannf@dannf.org>

On Tue, 24 Feb 2009, Helge Deller wrote:
> Geert Uytterhoeven wrote:
> > I've been looking into problems with auto-loading the RTC driver on=
 PPC (more
> > specifically on PS3):
> >   - The recent "rtc-ppc" RTC class driver is not autoloaded by udev=
 because
> >     it's an old style platform driver that contains its own platfor=
m device.
> >   - The alternative old "genrtc" driver is autoloaded on non-udev s=
ystems only
> >     because it contains the module alias char-major-10-135. However=
, it's not
> >     a new-style RTC class driver.
> >=20
> > Fortunately there already exists a generic RTC class driver: "rtc-p=
arisc".
> > Despite it's name, it's platform-independent, as it's build on top =
of the RTC
> > abstraction used by "genrtc".
> >=20
> > This patch series
> >   - adds a missing module alias to rtc-parisc,
> >   - renames rtc-parisc to rtc-generic,
> >   - converts the architectures that currently have CONFIG_GEN_RTC e=
nabled in
> >     their defconfig (m68k, parisc, powerpc) to rtc-generic,
> >   - removes the obsolete rtc-ppc driver,
> >   - removes the old genrtc driver.
> >  =20
> > Note that genrtc may be used on other archictectures as well: at le=
ast alpha
> > has the required infrastructure ([gs]et_rtc_time()). The Kconfig ru=
les allow
> > genrtc to be enabled on several others (cris, h8300, mn10300, um, x=
86, xtensa).
> >=20
> > Furthermore genrtc and rtc-generic are not 100% userspace compatibl=
e:
> >   - /dev/rtc provided by genrtc uses a misc character device (10:13=
5),
> >   - /dev/rtc provided by rtc-generic uses a dynamic character devic=
e.
> >  =20
> > So perhaps we don't want to kill gen-rtc yet?
> >=20
> > Any comments are welcomed!
>=20
> Hi Geert,
> FYI, I didn't followed any discussions or changes around the RTC driv=
ers for parisc,
> but Dann Frazier did some work on the parisc RTC driver as well.
> His patches were merged (not upstream yet!) in Kyle's "rtc-parisc" br=
anch at:
> http://git.kernel.org/?p=3Dlinux/kernel/git/kyle/parisc-2.6.git;a=3Ds=
hortlog;h=3Drtc-parisc
>=20
> Not sure if they conflict (or are in sync) with your patches...

Thanks, they provide some nice cleanups.

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village =C2=B7 Da Vincilaan 7-D1 =C2=B7 B-1935 Zaventem =C2=
=B7 Belgium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =C2=B7 RPR Brussels
=46ortis =C2=B7 BIC GEBABEBB =C2=B7 IBAN BE41293037680010
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
