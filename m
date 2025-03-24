Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9045E38DE9
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 13:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742822534; cv=none; b=uunfPuLxRSI7MFivf0Y5XHvhuuluQC1gOjOZM7SmGKuBRf87B89JVebc0zbXftsKFf2skL9ToYRkTwIsU91GkaeWw9kWKCGNPS1XDlyFXU5lXWdFsEVqV5NZdjZglyvq/EabLxyxL/g9bTxCp4KbgYunlrxtwxZKMGz0MSU3Pf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742822534; c=relaxed/simple;
	bh=i1XKwX+9HeRav3Y+xuPOHeamNCFkO9DYG+SjERgnylM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XswyNCqVTvFowU4nTxvMTUHwkhjySSWEOAV85jzeP3fD0EvV7FSDU7UBHmE+sSwh/UancuW1RbW72vOE+2JzuzB6CQWpU9uYsE66hptf8rPxFWwidLy9GBtyLs3k2cfqKEeseQ62XXgj7XktyxT1iKWtWHYqdpbTj6oAWenw3Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-523ee30e0d4so2105260e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 06:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742822530; x=1743427330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3vM1FQGsYOgCMm5GZoL9ZjRBchcaCoOlh/TAPpEk4Y=;
        b=sRSrpws9STdSqVFrzGop9RyAkSy5uscYPxVJOzMo5JA026Minarh+u66ffGk3jR3I+
         ihJFGk/irQOkFzejXrZhVEDsRVtrh9+f6NweHI0w30znG/1WE/w9UceOxmbxP/XRUvmE
         O2B8628cNEDB9aW3TZtOWQ4QIXRllJTaE6xdPRDk8B6sFJxXSrJlhwSs91uLGybXSqqW
         mPGNorWxYmN4uL+zMTmaJ9UnhvB1Ddk+WhGo32wGM6LLQX27+Cl4p5aSGTXn/sgxCVaa
         zey6yeN5vpi59x2WM07l9Rgg6/q28QDG9P/JcmcrbKX8TW1iqSr/4+yrQyQy1gSXDCaD
         vEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtAYOPMgpVyHeq2tBjgAfIRUfy7XkrhTlkIhjWJwSsfQvWFDqGzlBzHaVpitebUfD2D0nwPKsDXWnx@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxd5alkseenv8pJnO3VEJf6bgjQsDcTiohVbO1+OZ84L11koYG+
	TsfAx5WYRrM989KkX+37CsgedVhTMtwqdpHioiQacBAoLjCvD6/HwegCgB+N
X-Gm-Gg: ASbGncvR+4FrtwzJ/WxP9p4FgPlgNgyKKq3iVfuZWGSgVKbRuzeGr1C4VG7JzFFPOPx
	Cz27JHb2tQHZR1IJ6wFW8AlRPjzO1B7zMvTxZvyw0TFI9DkPTVNDJ3u9gsYj2Ll/gEIdmYKbJfF
	rVgc6WZOxqu55lc+Q+hEQDpRDdqo/741xfiy1mJceNx28+xYnlYI/MedepZ92IYn4MvXw0lHiwR
	aiZtGBeftQGwAqcUZ2dYsA1w1O4k3pt2Pe0yo5OB2/R4RS5z5BpNefesGSUGm8qP7C7JqAmJ/n9
	YMekE6+QV/REB5YudecDAIPkqfAz3gFvLLnOmpSg03CWD2rn/sQwUTaSB5wygRprTUILu5upVMt
	w68UTmXc=
X-Google-Smtp-Source: AGHT+IEgGfxE00iHbyASjPzt2ltXHCw58uTmpqFH8VsOGmMuFfWQpVoZ5JerBdei20uXKtE4fbZ8Sw==
X-Received: by 2002:a05:6102:1612:b0:4c1:8e07:40b8 with SMTP id ada2fe7eead31-4c50d4cafc7mr8133259137.6.1742822530130;
        Mon, 24 Mar 2025 06:22:10 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c50bdb958fsm1576392137.28.2025.03.24.06.22.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:22:09 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86715793b1fso1847676241.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 06:22:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNPJSuSID0vnFk+jymBk5zrQVoedyOASRroqgvbBR+epqvtmTqp2ATh1ZwLHv6X+/b9tMb4KrcVZ+X@lists.linux-m68k.org
X-Received: by 2002:a05:6102:32c5:b0:4bb:e36f:6a30 with SMTP id
 ada2fe7eead31-4c50d5471femr6234904137.15.1742822529274; Mon, 24 Mar 2025
 06:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324121645.208368-1-p.pisati@gmail.com> <20250324121645.208368-2-p.pisati@gmail.com>
In-Reply-To: <20250324121645.208368-2-p.pisati@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Mar 2025 14:21:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW8WUyUsjG4FaT4nP82pZYVFsUpYNOg2vsPPOthf-O49A@mail.gmail.com>
X-Gm-Features: AQ5f1JossREYSfwY4h6KKaFrE0JTJJQ8uMnSZiWGXPrBjpzoTjpi3VGEJ_Yivrw
Message-ID: <CAMuHMdW8WUyUsjG4FaT4nP82pZYVFsUpYNOg2vsPPOthf-O49A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ata: pata_cswarp: Add Amiga cslab ata support
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

On Mon, 24 Mar 2025 at 13:16, Paolo Pisati <p.pisati@gmail.com> wrote:
> Driver for the on-board IDE interface on CS-Lab Warp Expansion Card
> (NOTE that idemode=native has to be set in Warp Configuration)
>
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Thanks for your patch!

> --- a/drivers/ata/Kconfig
> +++ b/drivers/ata/Kconfig
> @@ -1025,6 +1025,17 @@ config PATA_GAYLE
>
>           If unsure, say N.
>
> +config PATA_CSWARP
> +       tristate "Amiga CS Warp PATA support"
> +       depends on M68K && AMIGA

&& ZORRO?

> +       help
> +         This option enables support for the on-board IDE interface on
> +         CS-Lab Warp Expansion Card (NOTE that idemode=native has to be
> +         set in Warp Configuration)
> +
> +         If unsure, say N.
> +
> +
>  config PATA_BUDDHA
>         tristate "Buddha/Catweasel/X-Surf PATA support"
>         depends on ZORRO

> --- /dev/null
> +++ b/drivers/ata/pata_cswarp.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Amiga CS Warp PATA controller driver
> + *
> + * Copyright (c) 2024 CS-Lab s.c.
> + *             http://www.cs-lab.eu
> + *
> + * Based on pata_gayle.c, pata_buddha.c and warpATA.device:
> + *
> + *     Created 2 Jun 2024 by Andrzej Rogozynski
> + */
> +
> +#include <linux/ata.h>
> +#include <linux/blkdev.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/libata.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/zorro.h>
> +#include <scsi/scsi_cmnd.h>
> +#include <scsi/scsi_host.h>
> +
> +#include <asm/amigahw.h>
> +#include <asm/amigaints.h>
> +#include <asm/amigayle.h>
> +#include <asm/setup.h>
> +
> +#define DRV_NAME "pata_cswarp"
> +
> +#define WARP_OFFSET_ATA         0x6000
> +
> +static const struct scsi_host_template pata_cswarp_sht = {
> +       ATA_PIO_SHT(DRV_NAME),
> +};
> +
> +static unsigned int pata_cswarp_data_xfer(struct ata_queued_cmd *qc,
> +                                        unsigned char *buf,
> +                                        unsigned int buflen, int rw)

It is a pity ata_port_operations.sff_data_xfer() doesn't take a void *buf,
else the casts below can be dropped.

Until that has changed, I think it is worthwhile to do the cast only once,
by introducing a temporary variable:

    u16 *buf16 = (u16 *)buf;

> +{
> +       struct ata_device *dev = qc->dev;
> +       struct ata_port *ap = dev->link->ap;
> +       void __iomem *data_addr = ap->ioaddr.data_addr;

"volatile void __iomem *data_addr ...", so you can drop the casts below.

> +       unsigned int words = buflen >> 1;
> +
> +       /* Transfer multiple of 2 bytes */
> +       if (rw == READ)
> +               raw_insw((u16 *)data_addr, (u16 *)buf, words);
> +       else
> +               raw_outsw((u16 *)data_addr, (u16 *)buf, words);
> +
> +       /* Transfer trailing byte, if any. */
> +       if (unlikely(buflen & 0x01)) {
> +               unsigned char pad[2] = { };
> +
> +               /* Point buf to the tail of buffer */
> +               buf += buflen - 1;

buf16 += words;

> +
> +               if (rw == READ) {
> +                       raw_insw((u16 *)data_addr, (u16 *)pad, 1);

No need to loop, just use raw_inw() for a single word.

> +                       *buf = pad[0];
> +               } else {
> +                       pad[0] = *buf;
> +                       raw_outsw((u16 *)data_addr, (u16 *)pad, 1);

likewise, raw_outw().

> +               }
> +               words++;
> +       }
> +
> +       return words << 1;

This can be one more than buflen, when the latter is odd.
Why not just return buflen instead?

> +}

> +static int pata_cswarp_probe(struct zorro_dev *z,
> +                            const struct zorro_device_id *ent)
> +{
> +       static const char board_name[] = "csWarp";
> +       struct ata_host *host;
> +       struct ata_port *ap;
> +       void __iomem *cswarp_ctrl_board, *base;
> +       unsigned long board = z->resource.start;
> +
> +       dev_info(&z->dev, "%s IDE controller (board: 0x%lx)\n", board_name,
> +                board);
> +
> +       if (!devm_request_mem_region(&z->dev, board + WARP_OFFSET_ATA, 0x1800,
> +                                    DRV_NAME))
> +               return -ENXIO;
> +
> +       host = ata_host_alloc(&z->dev, 1);
> +       if (!host)
> +               return -ENXIO;
> +
> +       cswarp_ctrl_board = (void *)board;

ioremap(board + WARP_OFFSET_ATA, ...)?

> +
> +       ap = host->ports[0];
> +       base = cswarp_ctrl_board + WARP_OFFSET_ATA;
> +
> +       ap->ops = &pata_cswarp_ops;
> +
> +       ap->pio_mask = ATA_PIO4;
> +       ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY |
> +               ATA_FLAG_PIO_POLLING;
> +
> +       ap->ioaddr.data_addr            = base;
> +       ap->ioaddr.error_addr           = base + 1 * 4;
> +       ap->ioaddr.feature_addr         = base + 1 * 4;
> +       ap->ioaddr.nsect_addr           = base + 2 * 4;
> +       ap->ioaddr.lbal_addr            = base + 3 * 4;
> +       ap->ioaddr.lbam_addr            = base + 4 * 4;
> +       ap->ioaddr.lbah_addr            = base + 5 * 4;
> +       ap->ioaddr.device_addr          = base + 6 * 4;
> +       ap->ioaddr.status_addr          = base + 7 * 4;
> +       ap->ioaddr.command_addr         = base + 7 * 4;
> +
> +       ap->ioaddr.altstatus_addr       = base + (0x1000 | (6UL << 2));
> +       ap->ioaddr.ctl_addr             = base + (0x1000 | (6UL << 2));
> +
> +       ata_port_desc(ap, "  cmd 0x%lx ctl 0x%lx", (unsigned long)base,
> +                     (unsigned long)ap->ioaddr.ctl_addr);

These two printed addresses are virtual addresses.
However, due to the use of a cast instead of ioremap(), they are identical.
Still, I think it is better to print board + WARP_OFFSET_ATA and
board + WARP_OFFSET_ATA + 0x1000 | (6UL << 2) instead.

> +
> +       return ata_host_activate(host, 0, NULL,
> +                         IRQF_SHARED, &pata_cswarp_sht);
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
