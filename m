From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/mac: Enable PDMA support for PowerBook 190
Date: Mon, 29 Jan 2018 09:51:07 +0100
Message-ID: <CAMuHMdUiiPNV=CcxMJ3ZDjF0EV=voh_azEozWiGXni-CUbwEwg@mail.gmail.com>
References: <20180127235140.D559728CE0@kvm5.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20180127235140.D559728CE0@kvm5.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Finn,

On Sun, Jan 28, 2018 at 12:51 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Stan's tests showed that PDMA improves sequential read performance by
> a factor of 5 on a PowerBook 190. Last time I tried this on a
> PowerBook 520 it didn't work, so let's not enable it there until
> it can be tested with the present mac_scsi driver.
>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Thanks for your patch!

Anyone with a PB520 who can check if it works now with scsi_type =
MAC_SCSI_OLD?

> ---
>  arch/m68k/mac/config.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
> index 16cd5cea5207..95d548d8cc8a 100644
> --- a/arch/m68k/mac/config.c
> +++ b/arch/m68k/mac/config.c
> @@ -713,7 +713,7 @@ static struct mac_model mac_data_table[] = {
>                 .name           = "PowerBook 190",
>                 .adb_type       = MAC_ADB_PB2,
>                 .via_type       = MAC_VIA_QUADRA,
> -               .scsi_type      = MAC_SCSI_LATE,
> +               .scsi_type      = MAC_SCSI_OLD,
>                 .ide_type       = MAC_IDE_BABOON,
>                 .scc_type       = MAC_SCC_QUADRA,
>                 .nubus_type     = MAC_NUBUS,
> @@ -1077,9 +1077,7 @@ int __init mac_platform_init(void)
>                         mac_scsi_old_rsrc, ARRAY_SIZE(mac_scsi_old_rsrc));
>                 break;
>         case MAC_SCSI_LATE:
> -               /* PDMA logic in 68040 PowerBooks is somehow different to
> -                * '030 models. It's probably more like Quadras (see mac_esp).
> -                */
> +               /* XXX PDMA support for PowerBook 500 series needs testing */
>                 platform_device_register_simple("mac_scsi", 0,
>                         mac_scsi_late_rsrc, ARRAY_SIZE(mac_scsi_late_rsrc));
>                 break;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
