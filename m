From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/2] m68k RTC fixes
Date: Mon,  2 May 2016 10:46:21 +0200
Message-ID: <1462178783-29294-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: a.zummo@towertech.it, rtc-linux@googlegroups.com, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Arnd, Alexandre,

"[PATCH v3 02/16] rtc: cmos: move mc146818rtc code out of
asm-generic/rtc.h" of Arnd's series "[PATCH v3 00/16] genrtc removal"
caused two new build failures on m68k:

bvme6000_defconfig:

    In file included from arch/m68k/bvme6000/rtc.c:19:
    include/linux/mc146818rtc.h: In function =E2=80=98mc146818_is_updat=
ing=E2=80=99:
    include/linux/mc146818rtc.h:138: error: implicit declaration of fun=
ction =E2=80=98CMOS_READ=E2=80=99
    include/linux/mc146818rtc.h: In function =E2=80=98mc146818_get_time=
=E2=80=99:
    include/linux/mc146818rtc.h:189: error: =E2=80=98RTC_ALWAYS_BCD=E2=80=
=99 undeclared (first use in this function)
    include/linux/mc146818rtc.h:189: error: (Each undeclared identifier=
 is reported only once
    include/linux/mc146818rtc.h:189: error: for each function it appear=
s in.)
    include/linux/mc146818rtc.h: In function =E2=80=98mc146818_set_time=
=E2=80=99:
    include/linux/mc146818rtc.h:279: error: =E2=80=98RTC_ALWAYS_BCD=E2=80=
=99 undeclared (first use in this function)
    include/linux/mc146818rtc.h:290: error: implicit declaration of fun=
ction =E2=80=98CMOS_WRITE=E2=80=99


mvme16x_defconfig:

    In file included from arch/m68k/mvme16x/rtc.c:18:
    include/linux/mc146818rtc.h: In function =E2=80=98mc146818_is_updat=
ing=E2=80=99:
    include/linux/mc146818rtc.h:138: error: implicit declaration of fun=
ction =E2=80=98CMOS_READ=E2=80=99
    include/linux/mc146818rtc.h: In function =E2=80=98mc146818_get_time=
=E2=80=99:
    include/linux/mc146818rtc.h:189: error: =E2=80=98RTC_ALWAYS_BCD=E2=80=
=99 undeclared (first use in this function)
    include/linux/mc146818rtc.h:189: error: (Each undeclared identifier=
 is reported only once
    include/linux/mc146818rtc.h:189: error: for each function it appear=
s in.)
    include/linux/mc146818rtc.h: In function =E2=80=98mc146818_set_time=
=E2=80=99:
    include/linux/mc146818rtc.h:279: error: =E2=80=98RTC_ALWAYS_BCD=E2=80=
=99 undeclared (first use in this function)
    include/linux/mc146818rtc.h:290: error: implicit declaration of fun=
ction =E2=80=98CMOS_WRITE=E2=80=99

These do not show up with a multi-platform config including Atari
support, as arch/m68k/include/asm/mc146818rtc.h provides a definition o=
f
CMOS_READ() if CONFIG_ATARI=3Dy.

=46ortunately the fixes are simple: replace <linux/mc146818rtc.h> by
<linux/rtc.h>.  This is safe to apply to current upstream, too.

Queue strategy:
  1. These are queued together with Arnd's series,
  1. I queue them for v4.7 myself, but then the RTC tree must be merges=
t
     after the m68k tree,
  2. I queue them for v4.6.

As I currently don't have any m68k patches queued for v4.7, perhaps it'=
s
easiest if these are included with Arnd's series?

Thanks!

Geert Uytterhoeven (2):
  m68k/bvme6000: Include generic <linux/rtc.h>
  m68k/mvme16x: Include generic <linux/rtc.h>

 arch/m68k/bvme6000/rtc.c | 2 +-
 arch/m68k/mvme16x/rtc.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--=20
1.9.1

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
