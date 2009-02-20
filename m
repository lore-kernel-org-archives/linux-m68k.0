From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: [PATCH/RFC 0/5] Generic RTC class driver
Date: Fri, 20 Feb 2009 16:46:44 +0100
Message-ID: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven__3942.55265496231$1235144967$gmane$org@sonycom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: rtc-linux@googlegroups.com, Kyle McMartin <kyle@mcmartin.ca>, David Woodhouse <dwmw2@infradead.org>, Richard Zidlicky <rz@linux-m68k.org>, linux-parisc@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org


I've been looking into problems with auto-loading the RTC driver on PPC=
 (more
specifically on PS3):
  - The recent "rtc-ppc" RTC class driver is not autoloaded by udev bec=
ause
    it's an old style platform driver that contains its own platform de=
vice.
  - The alternative old "genrtc" driver is autoloaded on non-udev syste=
ms only
    because it contains the module alias char-major-10-135. However, it=
's not
    a new-style RTC class driver.

=46ortunately there already exists a generic RTC class driver: "rtc-par=
isc".
Despite it's name, it's platform-independent, as it's build on top of t=
he RTC
abstraction used by "genrtc".

This patch series
  - adds a missing module alias to rtc-parisc,
  - renames rtc-parisc to rtc-generic,
  - converts the architectures that currently have CONFIG_GEN_RTC enabl=
ed in
    their defconfig (m68k, parisc, powerpc) to rtc-generic,
  - removes the obsolete rtc-ppc driver,
  - removes the old genrtc driver.
 =20
Note that genrtc may be used on other archictectures as well: at least =
alpha
has the required infrastructure ([gs]et_rtc_time()). The Kconfig rules =
allow
genrtc to be enabled on several others (cris, h8300, mn10300, um, x86, =
xtensa).

=46urthermore genrtc and rtc-generic are not 100% userspace compatible:
  - /dev/rtc provided by genrtc uses a misc character device (10:135),
  - /dev/rtc provided by rtc-generic uses a dynamic character device.
 =20
So perhaps we don't want to kill gen-rtc yet?

Any comments are welcomed!

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
