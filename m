From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/defconfig: Update defconfigs for v4.13-rc1
Date: Mon, 21 Aug 2017 11:38:59 +0200
Message-ID: <CAMuHMdXdGymGrTG5Wj0XzWKn4A6w7tq3JsjFEVWRdV0JH4HaTg@mail.gmail.com>
References: <1500291758-19380-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1500291758-19380-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

On Mon, Jul 17, 2017 at 1:42 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> --- a/arch/m68k/configs/amiga_defconfig
> +++ b/arch/m68k/configs/amiga_defconfig

> @@ -647,4 +650,5 @@ CONFIG_CRYPTO_USER_API_RNG=m
>  CONFIG_CRYPTO_USER_API_AEAD=m
>  # CONFIG_CRYPTO_HW is not set
>  CONFIG_CRC32_SELFTEST=m
> +CONFIG_CRC4=m

This addition is bogus (for all defconfigs). Removing.

>  CONFIG_XZ_DEC_TEST=m

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
