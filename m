From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 04/16] m68k: remove trailing space in messages
Date: Sun, 7 Mar 2010 13:41:15 +0100
Message-ID: <10f740e81003070441w64ba9c56ve17c343d6310ead9@mail.gmail.com>
References: <201002061844.45212.elendil@planet.nl>
	 <1265478443-31072-4-git-send-email-elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:45251 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753645Ab0CGMlR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 7 Mar 2010 07:41:17 -0500
In-Reply-To: <1265478443-31072-4-git-send-email-elendil@planet.nl>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Frans Pop <elendil@planet.nl>
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

On Sat, Feb 6, 2010 at 18:47, Frans Pop <elendil@planet.nl> wrote:
> Signed-off-by: Frans Pop <elendil@planet.nl>
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: Roman Zippel <zippel@linux-m68k.org>

Thx, applied.

> ---
> =C2=A0arch/m68k/kernel/traps.c | =C2=A0 =C2=A02 +-
> =C2=A0arch/m68k/mac/config.c =C2=A0 | =C2=A0 10 +++++-----
> =C2=A0arch/m68k/q40/config.c =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A03 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
> index aacd6d1..e533f32 100644
> --- a/arch/m68k/kernel/traps.c
> +++ b/arch/m68k/kernel/traps.c
> @@ -455,7 +455,7 @@ static inline void access_error040(struct frame *=
fp)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (do_page_fa=
ult(&fp->ptregs, addr, errorcode)) {
> =C2=A0#ifdef DEBUG
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 printk("do_page_fault() !=3D0 \n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 printk("do_page_fault() !=3D0\n");
> =C2=A0#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (user_mode(&fp->ptregs)){
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* delay writebacks after sig=
nal delivery */
> diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
> index 0356da9..1c16b1b 100644
> --- a/arch/m68k/mac/config.c
> +++ b/arch/m68k/mac/config.c
> @@ -148,7 +148,7 @@ static void mac_cache_card_flush(int writeback)
> =C2=A0void __init config_mac(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!MACH_IS_MAC)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "E=
RROR: no Mac, but config_mac() called!! \n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "E=
RROR: no Mac, but config_mac() called!!\n");
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mach_sched_init =3D mac_sched_init;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mach_init_IRQ =3D mac_init_IRQ;
> @@ -867,7 +867,7 @@ static void __init mac_identify(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0iop_preinit();
>
> - =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO "Detected Macintosh model: %d=
 \n", model);
> + =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO "Detected Macintosh model: %d=
\n", model);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Report booter data:
> @@ -878,12 +878,12 @@ static void __init mac_identify(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mac_bi_data.vi=
deoaddr, mac_bi_data.videorow,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mac_bi_data.vi=
deodepth, mac_bi_data.dimensions & 0xFFFF,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mac_bi_data.di=
mensions >> 16);
> - =C2=A0 =C2=A0 =C2=A0 printk(KERN_DEBUG " Videological 0x%lx phys. 0=
x%lx, SCC at 0x%lx \n",
> + =C2=A0 =C2=A0 =C2=A0 printk(KERN_DEBUG " Videological 0x%lx phys. 0=
x%lx, SCC at 0x%lx\n",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mac_bi_data.vi=
deological, mac_orig_videoaddr,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mac_bi_data.sc=
cbase);
> - =C2=A0 =C2=A0 =C2=A0 printk(KERN_DEBUG " Boottime: 0x%lx GMTBias: 0=
x%lx \n",
> + =C2=A0 =C2=A0 =C2=A0 printk(KERN_DEBUG " Boottime: 0x%lx GMTBias: 0=
x%lx\n",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mac_bi_data.bo=
ottime, mac_bi_data.gmtbias);
> - =C2=A0 =C2=A0 =C2=A0 printk(KERN_DEBUG " Machine ID: %ld CPUid: 0x%=
lx memory size: 0x%lx \n",
> + =C2=A0 =C2=A0 =C2=A0 printk(KERN_DEBUG " Machine ID: %ld CPUid: 0x%=
lx memory size: 0x%lx\n",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mac_bi_data.id=
, mac_bi_data.cpuid, mac_bi_data.memsize);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0iop_init();
> diff --git a/arch/m68k/q40/config.c b/arch/m68k/q40/config.c
> index 31ab3f0..ad10fec 100644
> --- a/arch/m68k/q40/config.c
> +++ b/arch/m68k/q40/config.c
> @@ -126,7 +126,7 @@ static void q40_reset(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 halted =3D 1;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk("\n\n*****************************=
**************\n"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "Called q40_reset =
: press the RESET button!! \n"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "Called q40_reset =
: press the RESET button!!\n"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"*************=
******************************\n");
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Q40_LED_ON();
> =C2=A0 =C2=A0 =C2=A0 =C2=A0while (1)

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
