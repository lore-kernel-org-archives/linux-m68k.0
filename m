From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/defconfig: Update defconfigs for v4.1-rc1
Date: Mon, 1 Jun 2015 10:33:54 +0200
Message-ID: <CAMuHMdVVZmmk=BMZewRBood-jP3aUa_UAsrU_Cj7fO4yZMLkJw@mail.gmail.com>
References: <1430126426-19372-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1430126426-19372-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

On Mon, Apr 27, 2015 at 11:20 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Updates for later releases may be squashed into this one later.
> ---
>  arch/m68k/configs/amiga_defconfig    | 9 +++++++--
>  arch/m68k/configs/apollo_defconfig   | 9 +++++++--
>  arch/m68k/configs/atari_defconfig    | 9 +++++++--
>  arch/m68k/configs/bvme6000_defconfig | 9 +++++++--
>  arch/m68k/configs/hp300_defconfig    | 9 +++++++--
>  arch/m68k/configs/mac_defconfig      | 9 +++++++--
>  arch/m68k/configs/multi_defconfig    | 9 +++++++--
>  arch/m68k/configs/mvme147_defconfig  | 9 +++++++--
>  arch/m68k/configs/mvme16x_defconfig  | 9 +++++++--
>  arch/m68k/configs/q40_defconfig      | 9 +++++++--
>  arch/m68k/configs/sun3_defconfig     | 9 +++++++--
>  arch/m68k/configs/sun3x_defconfig    | 9 +++++++--
>  12 files changed, 84 insertions(+), 24 deletions(-)
>
> diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
> index ed1643b4c67893b6..2d4e8be0e9a3f826 100644
> --- a/arch/m68k/configs/amiga_defconfig
> +++ b/arch/m68k/configs/amiga_defconfig

> @@ -576,5 +580,6 @@ CONFIG_CRYPTO_DRBG_CTR=y
>  CONFIG_CRYPTO_USER_API_HASH=m
>  CONFIG_CRYPTO_USER_API_SKCIPHER=m
>  CONFIG_CRYPTO_USER_API_RNG=m
> +CONFIG_CRYPTO_USER_API_AEAD=m
>  # CONFIG_CRYPTO_HW is not set
>  CONFIG_XZ_DEC_TEST=m

As CONFIG_CRYPTO_USER_API_AEAD has been removed again in v4.1-rc6,
I'll drop it from all defconfigs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
