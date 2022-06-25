Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78326C43334
	for <linux-m68k@archiver.kernel.org>; Sat, 25 Jun 2022 16:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbiFYQeR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 25 Jun 2022 12:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiFYQeQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 25 Jun 2022 12:34:16 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E05B13F86
        for <linux-m68k@lists.linux-m68k.org>; Sat, 25 Jun 2022 09:34:15 -0700 (PDT)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MQeI4-1oGkMV48ko-00NfXh; Sat, 25 Jun 2022 18:34:06 +0200
Message-ID: <9df7a700-0744-3a9f-f925-48de994ba70e@vivier.eu>
Date:   Sat, 25 Jun 2022 18:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH qemu] m68k: virt: pass RNG seed via bootinfo block
Content-Language: fr
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        qemu-devel@nongnu.org
References: <20220625154402.146403-1-Jason@zx2c4.com>
From:   Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220625154402.146403-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YIv92L2MCDvBBy/5RjyEOv9rA4g42f5/+KcxdAQWewrc5hvbudk
 Bsw243qtyzFSXGev8ID/DBLHs5JcNPva9FqiT1nOpQP8GLDfirdZatdoTAqxdOuZazI/gmm
 yUlIRv4JJXKyAQPYfV4o1papjCHunP8ri498RPFQSW5A9YPvs+6n1cobRvY95SNt2X3LBQF
 /NqKZLez8eCmGMMAMKZ1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6B2OjsC5hYQ=:7BPasNpqrM8lD1K9WAiHwo
 lvF4+GPsvJnPQPeOvWNUe/4NwAaJvVeWMZFVCmSQn7kR6c/JgZ3udOL5KrvjHXWJ/Fxbfa14z
 ekqWZLYLIsLQvbtcWsAplxS+TGuwI3qtQX/lxzVbNBK/dZRtYfJZRhg/c+OvU7vThdN9rx6cw
 3PQsIFybsnB+n/r68I9jsJfqXJw9gZrWNbOwI2Gnf7O9VR833IlMygWxuk/m5V3ZI73imIyMQ
 O/vI6g7v1n2fcJ5DGrsJ64fR7bNhGN5lvZEk8X61OTMsEHjd/zFJ1kMNYI/pZ/xYTSMFmzw64
 Z+tAtCE4XX6mwan6UVQY706ZRA2fCsi+pCiKDs+kO6TUOtUaviW7V1DS9AFlHsLOnzdROtpKY
 7HulEwWgh0ukauPlbRdNEBkL5VEJsumkpXBGuS6QlKLsoZMnkRxvkYQFqNUMOrCA8HNDM3Kn1
 Nx/f6pQxEDWiXKRzIY40hsf6pWimVaWNdU+T8RIAb9EWslh2yjaJtZ1pQwqh/U3svpM20GeSn
 rVW+lPPbUZIjzpUJUdq3DG5knRqbcow/Mip0z6tydUTdjSH2GAaYQ1hmsQ9/fCF2tPDOHrWic
 1QJnZgiB8gfIgm0frX5XMs8T0V21hpzM+mQGQ98wCnTwR5VNJYoWC551UpQiv+wj4YGUu/7DK
 EYYuLLADs6eXW06FOktXwYCe/2fvcN+pyz6MNcb0dqVMFyx5rJMwsq45B+bGUHWGruhM6ppuq
 TFLfzQ7V+yCM6KRamQM/SdXEOvC061rzYLP21g==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Le 25/06/2022 à 17:44, Jason A. Donenfeld a écrit :
> This commit wires up bootinfo's RNG seed attribute so that Linux VMs can
> have their RNG seeded from the earliest possible time in boot, just like
> the "rng-seed" device tree property on those platforms. The link
> contains the corresponding Linux patch.
> 
> Link: https://lore.kernel.org/lkml/20220625153841.143928-1-Jason@zx2c4.com/
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> This requires this trivial cleanup commit first:
>      https://lore.kernel.org/qemu-devel/20220625152318.120849-1-Jason@zx2c4.com/

For patchew, the syntax is:

Based-on: <20220625152318.120849-1-Jason@zx2c4.com>

> 
>   hw/m68k/bootinfo.h                               | 16 ++++++++++++++++
>   hw/m68k/virt.c                                   |  7 +++++++
>   .../standard-headers/asm-m68k/bootinfo-virt.h    |  1 +
>   3 files changed, 24 insertions(+)
> 
> diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
> index ff4e155a3c..2f31c13b6e 100644
> --- a/hw/m68k/bootinfo.h
> +++ b/hw/m68k/bootinfo.h
> @@ -56,4 +56,20 @@
>           stb_phys(as, base++, 0); \
>           base = (base + 1) & ~1; \
>       } while (0)
> +
> +#define BOOTINFODATA(as, base, id, data, len) \
> +    do { \
> +        int i; \
> +        stw_phys(as, base, id); \
> +        base += 2; \
> +        stw_phys(as, base, \
> +                 (sizeof(struct bi_record) + len + 5) & ~1); \
> +        base += 2; \
> +        stl_phys(as, base, len); \
> +        base += 4; \
> +        for (i = 0; i < len; ++i) { \
> +            stb_phys(as, base++, data[i]); \
> +        } \
> +        base = (base + 1) & ~1; \
> +    } while (0)
>   #endif
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index e215aa3d42..0aa383fa6b 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -9,6 +9,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/units.h"
> +#include "qemu/guest-random.h"
>   #include "sysemu/sysemu.h"
>   #include "cpu.h"
>   #include "hw/boards.h"
> @@ -120,6 +121,7 @@ static void virt_init(MachineState *machine)
>       hwaddr io_base;
>       int i;
>       ResetInfo *reset_info;
> +    uint8_t rng_seed[32];
>   
>       if (ram_size > 3399672 * KiB) {
>           /*
> @@ -245,6 +247,11 @@ static void virt_init(MachineState *machine)
>                           kernel_cmdline);
>           }
>   
> +	/* Pass seed to RNG. */
> +	qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> +	BOOTINFODATA(cs->as, parameters_base, BI_VIRT_RNG_SEED,
> +		     rng_seed, sizeof(rng_seed));
> +
>           /* load initrd */
>           if (initrd_filename) {
>               initrd_size = get_image_size(initrd_filename);
> diff --git a/include/standard-headers/asm-m68k/bootinfo-virt.h b/include/standard-headers/asm-m68k/bootinfo-virt.h
> index 81be1e0924..1b1ffd4705 100644
> --- a/include/standard-headers/asm-m68k/bootinfo-virt.h
> +++ b/include/standard-headers/asm-m68k/bootinfo-virt.h
> @@ -12,6 +12,7 @@
>   #define BI_VIRT_GF_TTY_BASE	0x8003
>   #define BI_VIRT_VIRTIO_BASE	0x8004
>   #define BI_VIRT_CTRL_BASE	0x8005
> +#define BI_VIRT_RNG_SEED	0x8006
>   
>   #define VIRT_BOOTI_VERSION	MK_BI_VERSION(2, 0)
>   

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
