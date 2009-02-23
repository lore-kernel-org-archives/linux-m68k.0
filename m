From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [rtc-linux] [PATCH/RFC 0/5] Generic RTC class driver
Date: Mon, 23 Feb 2009 13:34:49 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0902231319170.22762__9347.42367030612$1235392607$gmane$org@vixen.sonytel.be>
References: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com> <20090220170454.04382e9e@i1501.lan.towertech.it>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20090220170454.04382e9e@i1501.lan.towertech.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alessandro Zummo <alessandro.zummo@towertech.it>
Cc: rtc-linux@googlegroups.com, Richard Zidlicky <rz@linux-m68k.org>, linux-parisc@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, David@ozlabs.org, Kyle McMartin <kyle@mcmartin.ca>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Woodhouse <dwmw2@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Fri, 20 Feb 2009, Alessandro Zummo wrote:
> On Fri, 20 Feb 2009 16:46:44 +0100
> Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:
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
>=20
>  Hello,
>=20
>    my opinion on this kind of stuff is that I want to avoid the layer=
ing
>  of implementations under the rtc subsystem. I'd rather prefer that e=
ach
>  rtc device had its own driver.=20
> =20
>   I've made error in the past, by accepting such kind of drivers, and
>  would like to avoid that it happens again.

So you want us to kill the ppc_md.[gs]et_rtc_time() [ppc], mach_hwclk()=
 [m68k],
mach_gettod() [m68knommu] (and probably a few other) abstractions, and =
move all
RTC code out of arch/ into seperate drivers under drivers/rtc/ instead?

What about ppc_md.get_boot_time() [ppc]?
Please note that the functions above may also be used for very early cl=
ock
setting (e.g. time_init()) and in read_persistent_clock().
How should we handle these?

Even on x86 there seems to be way too much RTC logic in arch/x86/kernel=
/rtc.c
(e.g. mach_get_cmos_time()), which is duplicated in drivers/rtc/rtc-cmo=
s.c
through the inline function __get_rtc_time() in include/asm-generic/rtc=
=2Eh
(clever, hardware-specific stuff in asm-generic ;-)

>   Regarding the user space, the assumption that a device has
>  a fixed major:minor number should be dropped as well.

I know. But it's a userland-visible change, so I wanted to explicit poi=
nt to
it.

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
