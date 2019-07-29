From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] ata/pata_buddha: Probe via modalias instead of initcall
Date: Mon, 29 Jul 2019 11:05:27 +0200
Message-ID: <CAMuHMdURm-9nazOBTL8uRH8WMt7gi=QUYy0qr9kaxzczCr+ujg@mail.gmail.com>
References: <20190725180825.31508-1-max@enpas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725180825.31508-1-max@enpas.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Max Staudt <max@enpas.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jens Axboe <axboe@kernel.dk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>, linux-ide@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Max,

On Thu, Jul 25, 2019 at 8:08 PM Max Staudt <max@enpas.org> wrote:
> Up until now, the pata_buddha driver would only check for cards on
> initcall time. Now, the kernel will call its probe function as soon
> as a compatible card is detected.
>
> v3: Clean up devm_*, implement device removal.
>
> v2: Rename 'zdev' to 'z' to make the patch easy to analyse with
>     git diff --ignore-space-change
>
> Tested-by: Max Staudt <max@enpas.org>
> Signed-off-by: Max Staudt <max@enpas.org>

Sorry, I only noticed v3 after I replied to v2.
My comments are still valid, though.

> --- a/drivers/ata/pata_buddha.c
> +++ b/drivers/ata/pata_buddha.c

> +static const struct zorro_device_id pata_buddha_zorro_tbl[] = {
> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, },
> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, },
> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, },

drivers/net/ethernet/8390/zorro8390.c also matches against
ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, while only
a single zorro_driver can bind to it.  Hence you can no longer use both
IDE and Ethernet on X-Surf :-(
Before, this worked, as the IDE driver just walked the list of devices.

I think the proper solution is to create MFD devices for Zorro boards
with multiple functions, and bind against the individual MFD cells.
That would also get rid of the nr_ports loop in the IDE driver, as each
instance would have its own cell.

I played with this a long time ago, but never finished it.
It worked fine for my Ariadne Ethernet card.
Last state at
https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=zorro-mfd

Oh, seems I wrote up most of this before in
https://lore.kernel.org/lkml/CAMuHMdVe1KgQWYZ_BfBkSo3zr0c+TenLMEw3T=BLEQNoZ6ex7A@mail.gmail.com/

> +       { 0 }
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
