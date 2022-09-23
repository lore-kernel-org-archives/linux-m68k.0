Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7967EECAAD8
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Sep 2022 13:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbiIWNIB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Sep 2022 09:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbiIWNHk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Sep 2022 09:07:40 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B172613B018
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 06:07:32 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id w4so9009491qvp.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 06:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ZNyXMIvKvz26rH9+eBnc8eA2/7RfdXl9+K1RY2dFtLE=;
        b=BwfG4UhOuHQUmjqK9w53713v1X8xZi8lT6adnUwzNjfQgKMppsop94wCI5JCFoX1Lb
         cnisIDIJ0e6TL3FWhB3lKw/aGI54aYCs/KDEhvpKkO/t8JW7N/Ru1lIIfLSvNBd9Eufj
         cOsfCSHPUaXIB1ydZakiagYqwo4st4FvJ7aK8Po34LmX+MAgqIsOQrlQOJz5zY8iPz6s
         2Co5wi+OVsWjgtP0ULccCyl5pcowwDaQSifWHJ5H7uPe/DpGBixaB/CvecF/ebFy3efA
         Y4NK9VKo0pIae9qBcJ6DaIV38t+g02E05Z5i3PWxTr5hms5kHgKYHa24Q+P/94FTpOC0
         CPAg==
X-Gm-Message-State: ACrzQf0Rl7tnY6Xp5vM8vAYC4vj8m4LMG3EmyUYSnEpu19VAgYalRHAM
        racXmSDSF/15Mofqcf5g9A6owcKczUPx+A==
X-Google-Smtp-Source: AMsMyM5eKuRj3RUb3hvMyNKys2QUXmrigag3TkVRq9Ja9ViNOC0az+RT3MGNj7kNv9b9TSFA5hdk+g==
X-Received: by 2002:a05:6214:c22:b0:4ac:abb0:2e73 with SMTP id a2-20020a0562140c2200b004acabb02e73mr6767826qvd.41.1663938451653;
        Fri, 23 Sep 2022 06:07:31 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id q11-20020a05620a0d8b00b006bb2cd2f6d1sm5701021qkl.127.2022.09.23.06.07.31
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 06:07:31 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 135so5274813ybl.9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 06:07:31 -0700 (PDT)
X-Received: by 2002:a05:6902:45:b0:6ae:ce15:a08d with SMTP id
 m5-20020a056902004500b006aece15a08dmr8740635ybh.380.1663938451159; Fri, 23
 Sep 2022 06:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220923124642.3942806-1-Jason@zx2c4.com>
In-Reply-To: <20220923124642.3942806-1-Jason@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Sep 2022 15:07:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-KyOXg_nEa=gur-X5vjBimOM+zZ-g-xqYhAV-wBOfSA@mail.gmail.com>
Message-ID: <CAMuHMdU-KyOXg_nEa=gur-X5vjBimOM+zZ-g-xqYhAV-wBOfSA@mail.gmail.com>
Subject: Re: [PATCH kexec-tools] m68k: pass rng seed via BI_VIRT_RNG_SEED
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org,
        Simon Horman <horms@verge.net.au>,
        Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jason,

On Fri, Sep 23, 2022 at 2:47 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> In order to pass fresh entropy to kexec'd kernels, use BI_VIRT_RNG_SEED
> for passing a seed, with the same semantics that kexec-tools currently
> uses for i386's setup_data.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Thanks for your patch!

> --- a/kexec/arch/m68k/bootinfo.c
> +++ b/kexec/arch/m68k/bootinfo.c
> @@ -135,40 +135,45 @@ void bootinfo_print(void)
>                 size = bi->size;
>                 switch (tag) {
>                 case BI_MACHTYPE:
>                         printf("BI_MACHTYPE: 0x%08x\n", bi->machtype);
>                         break;
>
>                 case BI_MEMCHUNK:
>                         printf("BI_MEMCHUNK: 0x%08x bytes at 0x%08x\n",
>                                bi->mem_info.size, bi->mem_info.addr);
>                         break;
>
>                 case BI_RAMDISK:
>                         printf("BI_RAMDISK: 0x%08x bytes at 0x%08x\n",
>                                bi->mem_info.size, bi->mem_info.addr);
>                         break;

Hmm, lots of context.

>
>                 case BI_COMMAND_LINE:
>                         printf("BI_COMMAND_LINE: %s\n", bi->string);
>                         break;
>
> +               case BI_VIRT_RNG_SEED:

This won't work as expected: BI_VIRT_* tags are only valid if the
machine type is MACH_VIRT.

Worse, this will trigger for other platform-specific tags using the same value:

    arch/m68k/include/uapi/asm/bootinfo-amiga.h:#define
BI_AMIGA_CHIPSET    0x8006  /* native chipset present (__be32) */
    arch/m68k/include/uapi/asm/bootinfo-mac.h:#define BI_MAC_SCCBASE
             0x8006  /* Mac SCC base address */
    arch/m68k/include/uapi/asm/bootinfo-virt.h:#define
BI_VIRT_RNG_SEED     0x8006

> +                       /* These are secret, so never print them to the console */
> +                       printf("BI_VIRT_RNG_SEED: 0x%08x bytes\n", be16_to_cpu(bi->bytes.len));
> +                       break;
> +
>                 default:
>                         printf("BI tag 0x%04x size %u\n", tag, size);
>                         break;
>                 }
>                 bi = bi_next(bi, size);
>         }
>  }

>  }
>
> +void bootinfo_add_rng_seed(void)
> +{
> +       struct bi_rec *bi;
> +       enum { RNG_SEED_LEN = 32 };
> +
> +       /* Remove existing rng seed records */
> +       bi_remove(BI_VIRT_RNG_SEED);
> +
> +       /* Add new rng seed record */
> +       bi = bi_add(BI_VIRT_RNG_SEED, sizeof(bi->bytes) + RNG_SEED_LEN);

Likewise, this will destroy existing BI_AMIGA_CHIPSET and BI_MAC_SCCBASE
tags, breaking Amiga and Mac.

> +       if (getrandom(bi->bytes.data, RNG_SEED_LEN, GRND_NONBLOCK) != RNG_SEED_LEN) {
> +               bi_remove(BI_VIRT_RNG_SEED);
> +               return;
> +       }
> +       bi->bytes.len = cpu_to_be16(RNG_SEED_LEN);
> +}
> +
>

As random seeds can now be generic, I think it makes sense to introduce
a machine-independent BI_RND_SEED.
In hindsight, we should have done this from the beginning...

> --- a/kexec/arch/m68k/bootinfo.h
> +++ b/kexec/arch/m68k/bootinfo.h
> @@ -1,43 +1,49 @@
>  #include <asm/bootinfo.h>
> +#include <asm/bootinfo-virt.h>
>
>  #define DEFAULT_BOOTINFO_FILE  "/proc/bootinfo"
>  #define MAX_BOOTINFO_SIZE      1536
>
>
>      /*
>       *  Convenience overlay of several struct bi_record variants
>       */
>
>  struct bi_rec {
>         __be16 tag;
>         __be16 size;
>         union {
>                 __be32 data[0];
>                 /* shorthands for the types we use */
>                 __be32 machtype;
>                 struct {
>                         __be32 addr;
>                         __be32 size;
>                 } mem_info;
>                 char string[0];
> +               struct {
> +                       __be16 len;
> +                       u8 data[0];
> +               } bytes;

I'd rather call this rng_seed, to avoid confusion between "data"
and "bytes",

>         };
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
