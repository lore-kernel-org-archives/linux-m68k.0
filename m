From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] ata/pata_buddha: Probe via modalias instead of initcall
Date: Mon, 29 Jul 2019 10:53:07 +0200
Message-ID: <CAMuHMdXFW2mEg8jChA=JFt-u9NMGp9m+1FnoGe=+Pxme3O2ESg@mail.gmail.com>
References: <20190725102211.8526-1-max@enpas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725102211.8526-1-max@enpas.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Max Staudt <max@enpas.org>
Cc: linux-ide@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Max,

On Thu, Jul 25, 2019 at 3:25 PM Max Staudt <max@enpas.org> wrote:
> Up until now, the pata_buddha driver would only check for cards on
> initcall time. Now, the kernel will call its probe function as soon
> as a compatible card is detected.
>
> Device removal remains unimplemented. A WARN_ONCE() serves as a
> reminder.
>
> v2: Rename 'zdev' to 'z' to make the patch easy to analyse with
>     git diff --ignore-space-change
>
> Tested-by: Max Staudt <max@enpas.org>
> Signed-off-by: Max Staudt <max@enpas.org>

Thanks for your patch!

> --- a/drivers/ata/pata_buddha.c
> +++ b/drivers/ata/pata_buddha.c

> @@ -145,111 +146,162 @@ static struct ata_port_operations pata_xsurf_ops = {
>         .set_mode       = pata_buddha_set_mode,
>  };
>
> -static int __init pata_buddha_init_one(void)
> +static int pata_buddha_probe(struct zorro_dev *z,
> +                            const struct zorro_device_id *ent)
>  {

[...]

> +       switch (z->id) {
> +       case ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA:
> +       default:
> +               type = BOARD_BUDDHA;
> +               break;
> +       case ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL:
> +               type = BOARD_CATWEASEL;
> +               nr_ports++;
> +               break;
> +       case ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF:
> +               type = BOARD_XSURF;
> +               break;
> +       }

Please obtain the type from ent->driver_data instead of using a switch()
statement...

> -module_init(pata_buddha_init_one);
> +static const struct zorro_device_id pata_buddha_zorro_tbl[] = {
> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, },
> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, },
> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, },

... after storing it in zorro_device_id.driver_data here.

> +       { 0 }
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
