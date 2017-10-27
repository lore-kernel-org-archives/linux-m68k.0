From: Kars de Jong <jongk@linux-m68k.org>
Subject: Re: [PATCH 2/4] m68k/mac: Disentangle VIA and OSS initialization
Date: Fri, 27 Oct 2017 13:02:59 +0200
Message-ID: <CACz-3rj4Pxe7yk2+hzKoHsnOuV0wENvBg1EFE_zzA-ETSO+9dQ@mail.gmail.com>
References: <cover.1509071937.git.fthain@telegraphics.com.au> <683aede4ce8ad3e5d748a0913f0255bf6665ae87.1509071937.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <683aede4ce8ad3e5d748a0913f0255bf6665ae87.1509071937.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

2017-10-27 4:45 GMT+02:00 Finn Thain <fthain@telegraphics.com.au>:
> macintosh_config->via_type is meaningless on Mac IIfx (i.e. the only
> model with OSS chip), so skip the via_type switch statement.
>
> Call oss_init() before via_init() because it is more important and
> because that is the right place to initialize the oss_present flag.
>
> On this model, bringing forward oss_init() and delaying via_init()
> is no problem because those functions are independent.
>
> The only requirement here is that oss_register_interrupts() happens
> after via_init(). That is, mac_init_IRQ() happens after config_mac().
>
> Tested-by: Stan Johnson <userm57@yahoo.com>

Was this tested on a Mac IIfx and on at least one other Mac?

> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Reviewed-by: Kars de Jong <jongk@linux-m68k.org>

(Geert, Finn: sorry about the spam. Bloody Gmail...)

Kars.
