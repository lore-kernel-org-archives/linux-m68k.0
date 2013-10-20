From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 06/16] m68k/mac: Remove unused hardware profile tags
Date: Sun, 20 Oct 2013 14:14:25 +0200
Message-ID: <CAMuHMdXTf8WnAZgs31rN3YLB1FCf0KPDHLnCQBkP5SB1QPu8MA@mail.gmail.com>
References: <1381926693-6392-1-git-send-email-geert@linux-m68k.org>
	<1381926693-6392-7-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1381926693-6392-7-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On Wed, Oct 16, 2013 at 2:31 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

I'm gonna drop this one, to avoid reusing the old values for new tags,
and to allow them to be used by bootinfo tools.

> ---
>  arch/m68k/include/asm/bootinfo.h |   24 ------------------------
>  1 file changed, 24 deletions(-)
>
> diff --git a/arch/m68k/include/asm/bootinfo.h b/arch/m68k/include/asm/bootinfo.h
> index ef888d4af4e6..007c95759e6b 100644
> --- a/arch/m68k/include/asm/bootinfo.h
> +++ b/arch/m68k/include/asm/bootinfo.h
> @@ -149,30 +149,6 @@ static inline void save_bootinfo(const struct bi_record *bi) {}
>  #define BI_MAC_CPUID           0x800a  /* Mac CPU type (sanity check) */
>  #define BI_MAC_ROMBASE         0x800b  /* Mac system ROM base address */
>
> -    /*
> -     *  Macintosh hardware profile data - unused, see macintosh.h for
> -     *  reasonable type values
> -     */
> -
> -#define BI_MAC_VIA1BASE                0x8010  /* Mac VIA1 base address (always present) */
> -#define BI_MAC_VIA2BASE                0x8011  /* Mac VIA2 base address (type varies) */
> -#define BI_MAC_VIA2TYPE                0x8012  /* Mac VIA2 type (VIA, RBV, OSS) */
> -#define BI_MAC_ADBTYPE         0x8013  /* Mac ADB interface type */
> -#define BI_MAC_ASCBASE         0x8014  /* Mac Apple Sound Chip base address */
> -#define BI_MAC_SCSI5380                0x8015  /* Mac NCR 5380 SCSI (base address, multi) */
> -#define BI_MAC_SCSIDMA         0x8016  /* Mac SCSI DMA (base address) */
> -#define BI_MAC_SCSI5396                0x8017  /* Mac NCR 53C96 SCSI (base address, multi) */
> -#define BI_MAC_IDETYPE         0x8018  /* Mac IDE interface type */
> -#define BI_MAC_IDEBASE         0x8019  /* Mac IDE interface base address */
> -#define BI_MAC_NUBUS           0x801a  /* Mac Nubus type (none, regular, pseudo) */
> -#define BI_MAC_SLOTMASK                0x801b  /* Mac Nubus slots present */
> -#define BI_MAC_SCCTYPE         0x801c  /* Mac SCC serial type (normal, IOP) */
> -#define BI_MAC_ETHTYPE         0x801d  /* Mac builtin ethernet type (Sonic, MACE */
> -#define BI_MAC_ETHBASE         0x801e  /* Mac builtin ethernet base address */
> -#define BI_MAC_PMU             0x801f  /* Mac power management / poweroff hardware */
> -#define BI_MAC_IOP_SWIM                0x8020  /* Mac SWIM floppy IOP */
> -#define BI_MAC_IOP_ADB         0x8021  /* Mac ADB IOP */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
