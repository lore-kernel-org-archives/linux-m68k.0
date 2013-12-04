From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: aranym /dev/rtc
Date: Thu, 5 Dec 2013 12:53:50 +1300
Message-ID: <CAOmrzkJiL=rcL0MdJpRVZGTSVayWqFJf3D+9QL_5+_m6+yQrMg@mail.gmail.com>
References: <20090427185608.GC15806@marenka.net>
	<10f740e80904271333n1ddbcf1dwf792e8fd7593e3c6@mail.gmail.com>
	<alpine.DEB.2.02.1312021200140.24207@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1312021200140.24207@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Debian GNU/Linux m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Geert,


On Tue, Dec 3, 2013 at 12:07 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Going back into time...
>
> On Mon, 27 Apr 2009, Geert Uytterhoeven wrote:
>>   4. CONFIG_RTC_CLASS=y, CONFIG_RTC_DRV_CMOS=[my], /dev/rtc is dynamic
>>      While rtc-cmos can be enabled on Atari (it was derived from
>> rtc.c), it won't work yet,
>>      as the necessary rtc_cmos platform device is not yet created on Atari.
>
> I gave it a try, cfr. "[PATCH 1/2] [RFC] m68k/atari: Create rtc_cmos platform
> device" below.
>
> Unfortunately it didn't work well, cfr. "[PATCH 2/2] [RFC] rtc: Disable
> RTC_DRV_CMOS on Atari" below, while rtc-generic works fine for the RTC part,
> and the separate nvram driver works for the NVRAM part.
>
> So unless someone has a good reason for using rtc_cmos (and some patches
> to fix its issues), I'll go for [PATCH 2/2].

The generic CMOS driver will have the TT_MFP_RTC interrupt available
only on a TT - maybe that's why it won't work on ARAnyM?

Nothing wrong with applying the second part of 1/2 (renaming the
RTC_PORT macro to ATARI_RTC_PORT) anyway, though.

Cheers,

  Michael


> Thanks for your feedback!
>
> From 454783a49347468b5ddf5a01e00aa5b1b66d2480 Mon Sep 17 00:00:00 2001
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Date: Mon, 2 Dec 2013 11:08:13 +0100
> Subject: [PATCH 1/2] [RFC] m68k/atari: Create rtc_cmos platform device
>
> Create an "rtc_cmos" platform device, so rtc-cmos can be used on Atari.
> Its IRQ is available on systems with a TT_MFP only.
>
> This requires renaming RTC_PORT(), as rtc-cmos uses the presence of this
> macro to enable support for the second NVRAM bank, which Atari doesn't
> have ("Unable to handle kernel access at virtual address 00ff8965").
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/atari/config.c            |   26 ++++++++++++++++++++++++++
>  arch/m68k/include/asm/mc146818rtc.h |   10 +++++-----
>  2 files changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
> index 01a62161b08a..59704b127146 100644
> --- a/arch/m68k/atari/config.c
> +++ b/arch/m68k/atari/config.c
> @@ -660,6 +660,26 @@ static void atari_get_hardware_list(struct seq_file *m)
>         ATARIHW_ANNOUNCE(DSP56K, "DSP56001 processor");
>  }
>
> +static struct resource rtc_resources[] = {
> +       [0] = {
> +               .start  = TT_RTC_BAS,
> +               .end    = TT_RTC_BAS + 2 * 2 - 1,
> +               .flags  = IORESOURCE_IO,
> +       },
> +       [1] = {
> +               .start  = IRQ_TT_MFP_RTC,
> +               .end    = IRQ_TT_MFP_RTC,
> +               .flags  = IORESOURCE_IRQ,
> +       }
> +};
> +
> +static struct platform_device rtc_device = {
> +       .name           = "rtc_cmos",
> +       .id             = -1,
> +       .resource       = rtc_resources,
> +       .num_resources  = 1                     /* Default to no IRQ */
> +};
> +
>  /*
>   * MSch: initial platform device support for Atari,
>   * required for EtherNAT/EtherNEC/NetUSBee drivers
> @@ -865,6 +885,12 @@ int __init atari_platform_init(void)
>         if (!MACH_IS_ATARI)
>                 return -ENODEV;
>
> +       if (ATARIHW_PRESENT(TT_MFP)) {
> +               /* Enable IRQ resource */
> +               rtc_device.num_resources = 2;
> +       }
> +       platform_device_register(&rtc_device);
> +
>  #ifdef CONFIG_ATARI_ETHERNAT
>         {
>                 unsigned char *enatc_virt;
> diff --git a/arch/m68k/include/asm/mc146818rtc.h b/arch/m68k/include/asm/mc146818rtc.h
> index 9f70a01f73dc..05b43bf5cdf3 100644
> --- a/arch/m68k/include/asm/mc146818rtc.h
> +++ b/arch/m68k/include/asm/mc146818rtc.h
> @@ -10,16 +10,16 @@
>
>  #include <asm/atarihw.h>
>
> -#define RTC_PORT(x)    (TT_RTC_BAS + 2*(x))
> +#define ATARI_RTC_PORT(x)      (TT_RTC_BAS + 2*(x))
>  #define RTC_ALWAYS_BCD 0
>
>  #define CMOS_READ(addr) ({ \
> -atari_outb_p((addr),RTC_PORT(0)); \
> -atari_inb_p(RTC_PORT(1)); \
> +atari_outb_p((addr), ATARI_RTC_PORT(0)); \
> +atari_inb_p(ATARI_RTC_PORT(1)); \
>  })
>  #define CMOS_WRITE(val, addr) ({ \
> -atari_outb_p((addr),RTC_PORT(0)); \
> -atari_outb_p((val),RTC_PORT(1)); \
> +atari_outb_p((addr), ATARI_RTC_PORT(0)); \
> +atari_outb_p((val), ATARI_RTC_PORT(1)); \
>  })
>  #endif /* CONFIG_ATARI */
>
> --
> 1.7.9.5
>
> From 6c81cebe1f9bcf5fecae689235e86b42c9f8e28c Mon Sep 17 00:00:00 2001
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Date: Mon, 2 Dec 2013 11:12:23 +0100
> Subject: [PATCH 2/2] [RFC] rtc: Disable RTC_DRV_CMOS on Atari
>
> On ARAnyM (emulating an Atari Falcon, which doesn't have an RTC IRQ),
> rtc-cmos doesn't work well:
>   - The date is of by 32 years (2045 instead of 2013):
>
>     rtc_cmos rtc_cmos: setting system clock to 2045-12-02 10:56:17 UTC (2395824977)
>   - The hwclock utility doesn't work:
>
>     hwclock: ioctl() to /dev/rtc to turn on update interrupts failed unexpectedly, errno=5: Input/output error.
>
> rtc-generic works fine for the RTC part, and nvram works for the NVRAM part,
> though.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/rtc/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 007730222116..f1d7e974a700 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -626,7 +626,7 @@ comment "Platform RTC drivers"
>
>  config RTC_DRV_CMOS
>         tristate "PC-style 'CMOS'"
> -       depends on X86 || ARM || M32R || ATARI || PPC || MIPS || SPARC64
> +       depends on X86 || ARM || M32R || PPC || MIPS || SPARC64
>         default y if X86
>         help
>           Say "yes" here to get direct support for the real time clock
> --
> 1.7.9.5
>
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                             -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
