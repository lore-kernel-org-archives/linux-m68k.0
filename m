From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [rtc-linux] [PATCH/RFC 15/16] rtc: Add an RTC driver for the
	Ricoh RP5C01
Date: Sun, 19 Apr 2009 20:41:21 +0200
Message-ID: <10f740e80904191141i599af898wd47535cabd8c9184@mail.gmail.com>
References: <1240080744-14995-1-git-send-email-geert@linux-m68k.org>
	 <1240080744-14995-9-git-send-email-geert@linux-m68k.org>
	 <1240080744-14995-10-git-send-email-geert@linux-m68k.org>
	 <1240080744-14995-11-git-send-email-geert@linux-m68k.org>
	 <1240080744-14995-12-git-send-email-geert@linux-m68k.org>
	 <1240080744-14995-13-git-send-email-geert@linux-m68k.org>
	 <1240080744-14995-14-git-send-email-geert@linux-m68k.org>
	 <1240080744-14995-15-git-send-email-geert@linux-m68k.org>
	 <1240080744-14995-16-git-send-email-geert@linux-m68k.org>
	 <20090418235529.47e481e9@i1501.lan.towertech.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.24]:43638 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751831AbZDSSlY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Apr 2009 14:41:24 -0400
In-Reply-To: <20090418235529.47e481e9@i1501.lan.towertech.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alessandro Zummo <alessandro.zummo@towertech.it>
Cc: rtc-linux@googlegroups.com, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Alessandro,

On Sat, Apr 18, 2009 at 23:55, Alessandro Zummo
<alessandro.zummo@towertech.it> wrote:
> On Sat, 18 Apr 2009 20:52:23 +0200 Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
>
> =C2=A0Hi Geert, thanks for your contributions. Comments below.
>
> =C2=A0Missing patch description.

git-am is happy with the one-line summary in the subject:-line, and
there's not much more to say.

>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: rtc-linux@googlegroups.com
>> ---
>> =C2=A0drivers/rtc/Kconfig =C2=A0 =C2=A0 =C2=A0| =C2=A0 10 ++
>> =C2=A0drivers/rtc/Makefile =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
>> =C2=A0drivers/rtc/rtc-rp5c01.c | =C2=A0239 +++++++++++++++++++++++++=
+++++++++++++++++++++
>> =C2=A03 files changed, 250 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 drivers/rtc/rtc-rp5c01.c
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index a0f6297..150fe43 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -535,6 +535,16 @@ config RTC_DRV_MSM6242
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 This driver can also be built as a modul=
e. If so, the module
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 will be called rtc-msm6242.
>>
>> +config RTC_DRV_RP5C01
>> + =C2=A0 =C2=A0 tristate "Ricoh RP5C01"
>> + =C2=A0 =C2=A0 help
>> + =C2=A0 =C2=A0 =C2=A0 If you say yes here you get support for the R=
icoh RP5C01
>> + =C2=A0 =C2=A0 =C2=A0 timekeeping chip. It is used in some Amiga mo=
dels (e.g. A3000
>> + =C2=A0 =C2=A0 =C2=A0 and A4000).
>> +
>> + =C2=A0 =C2=A0 =C2=A0 This driver can also be built as a module. If=
 so, the module
>> + =C2=A0 =C2=A0 =C2=A0 will be called rtc-rp5c01.
>> +
>> =C2=A0comment "on-CPU RTC drivers"
>>
>> =C2=A0config RTC_DRV_OMAP
>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>> index c70418b..6176a8a 100644
>> --- a/drivers/rtc/Makefile
>> +++ b/drivers/rtc/Makefile
>> @@ -77,4 +77,5 @@ obj-$(CONFIG_RTC_DRV_WM8350) =C2=A0 =C2=A0 =C2=A0 =
=C2=A0+=3D rtc-wm8350.o
>> =C2=A0obj-$(CONFIG_RTC_DRV_X1205) =C2=A0+=3D rtc-x1205.o
>> =C2=A0obj-$(CONFIG_RTC_DRV_PCF50633) =C2=A0 =C2=A0 =C2=A0 +=3D rtc-p=
cf50633.o
>> =C2=A0obj-$(CONFIG_RTC_DRV_MSM6242) =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D =
rtc-msm6242.o
>> +obj-$(CONFIG_RTC_DRV_RP5C01) +=3D rtc-rp5c01.o
>> =C2=A0obj-$(CONFIG_RTC_DRV_PS3) =C2=A0 =C2=A0+=3D rtc-ps3.o
>
> =C2=A0alphabetic order please

Will do.

>> +static const struct rtc_class_ops rp5c01_rtc_ops =3D {
>> + =C2=A0 =C2=A0 .read_time =C2=A0 =C2=A0 =C2=A0=3D rp5c01_read_time,
>> + =C2=A0 =C2=A0 .set_time =C2=A0 =C2=A0 =C2=A0 =3D rp5c01_set_time,
>> + =C2=A0 =C2=A0 .set_mmss =C2=A0 =C2=A0 =C2=A0 =3D rp5c01_set_mmss,
>> +};
>
> =C2=A0please implement either set_time or set_mmss, not both.
> =C2=A0I don't know the chip but I suspect set_time is the one you nee=
d.

OK, I will remove .set_mmss. Got to confused by looking into how
everything is used...
BTW, the only remaining users of rtc_set_mmss() seem to be
arch/sparc/kernel/time_{32,64}.c?

>> +MODULE_AUTHOR("Geert Uytterhoeven");
>
> =C2=A0it would be fine to have your email here.

Will do.

OK, if I take the result (for both rtc-rp5c01 and rtc-msm6242) through
the m68k tree?
Thanks!

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
