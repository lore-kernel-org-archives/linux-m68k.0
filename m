From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 0/2] m68k RTC fixes
Date: Tue, 3 May 2016 15:40:34 +0200
Message-ID: <20160503134034.GK2335__29021.3960143321$1462282873$gmane$org@piout.net>
References: <1462178783-29294-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462178783-29294-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, a.zummo@towertech.it, rtc-linux@googlegroups.com, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On 02/05/2016 at 10:46:21 +0200, Geert Uytterhoeven wrote :
> 	Hi Arnd, Alexandre,
>=20
> "[PATCH v3 02/16] rtc: cmos: move mc146818rtc code out of
> asm-generic/rtc.h" of Arnd's series "[PATCH v3 00/16] genrtc removal"
> caused two new build failures on m68k:
>=20
> bvme6000_defconfig:
>=20
>     In file included from arch/m68k/bvme6000/rtc.c:19:
>     include/linux/mc146818rtc.h: In function =E2=80=98mc146818_is_upd=
ating=E2=80=99:
>     include/linux/mc146818rtc.h:138: error: implicit declaration of f=
unction =E2=80=98CMOS_READ=E2=80=99
>     include/linux/mc146818rtc.h: In function =E2=80=98mc146818_get_ti=
me=E2=80=99:
>     include/linux/mc146818rtc.h:189: error: =E2=80=98RTC_ALWAYS_BCD=E2=
=80=99 undeclared (first use in this function)
>     include/linux/mc146818rtc.h:189: error: (Each undeclared identifi=
er is reported only once
>     include/linux/mc146818rtc.h:189: error: for each function it appe=
ars in.)
>     include/linux/mc146818rtc.h: In function =E2=80=98mc146818_set_ti=
me=E2=80=99:
>     include/linux/mc146818rtc.h:279: error: =E2=80=98RTC_ALWAYS_BCD=E2=
=80=99 undeclared (first use in this function)
>     include/linux/mc146818rtc.h:290: error: implicit declaration of f=
unction =E2=80=98CMOS_WRITE=E2=80=99
>=20
>=20
> mvme16x_defconfig:
>=20
>     In file included from arch/m68k/mvme16x/rtc.c:18:
>     include/linux/mc146818rtc.h: In function =E2=80=98mc146818_is_upd=
ating=E2=80=99:
>     include/linux/mc146818rtc.h:138: error: implicit declaration of f=
unction =E2=80=98CMOS_READ=E2=80=99
>     include/linux/mc146818rtc.h: In function =E2=80=98mc146818_get_ti=
me=E2=80=99:
>     include/linux/mc146818rtc.h:189: error: =E2=80=98RTC_ALWAYS_BCD=E2=
=80=99 undeclared (first use in this function)
>     include/linux/mc146818rtc.h:189: error: (Each undeclared identifi=
er is reported only once
>     include/linux/mc146818rtc.h:189: error: for each function it appe=
ars in.)
>     include/linux/mc146818rtc.h: In function =E2=80=98mc146818_set_ti=
me=E2=80=99:
>     include/linux/mc146818rtc.h:279: error: =E2=80=98RTC_ALWAYS_BCD=E2=
=80=99 undeclared (first use in this function)
>     include/linux/mc146818rtc.h:290: error: implicit declaration of f=
unction =E2=80=98CMOS_WRITE=E2=80=99
>=20
> These do not show up with a multi-platform config including Atari
> support, as arch/m68k/include/asm/mc146818rtc.h provides a definition=
 of
> CMOS_READ() if CONFIG_ATARI=3Dy.
>=20
> Fortunately the fixes are simple: replace <linux/mc146818rtc.h> by
> <linux/rtc.h>.  This is safe to apply to current upstream, too.
>=20
> Queue strategy:
>   1. These are queued together with Arnd's series,
>   1. I queue them for v4.7 myself, but then the RTC tree must be merg=
est
>      after the m68k tree,
>   2. I queue them for v4.6.
>=20
> As I currently don't have any m68k patches queued for v4.7, perhaps i=
t's
> easiest if these are included with Arnd's series?
>=20

I suggest you take them for 4.7 anyway. I don't think I am confident
enough to merge Arnd's series for 4.7. Also, I doubt I'll get many acks
from some architecture maintainers.

So, my plan is to apply it on top of 4.7-rc1 and let it sit in
linux-next for a while.

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
