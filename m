Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7B8C6FA83
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 10:52:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236804AbiIZKwi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 06:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234911AbiIZKuh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 06:50:37 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6618058DF0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 03:27:26 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id b23so3750435qtr.13
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 03:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wvCseJKa4wntAVz+3aizGq2aXDX4B8OJZy0Gi3dyPRI=;
        b=EcyhB9rZhQHckhna3MaZPmOMIqpGbiDoYDZYnq863T0g7K62YBdE+pgcclv+dsCCuP
         uaVob9Gxg7iFhWS6NOVyMQJER76HLrZuZjFVI5ETXZZzEMuTj6/n00/NRZ+9vf4Rvu6a
         poLI1sEMoDZwsvDuYeZsHJZ0XEeoN32hpEZAbLiTsnvFDu2bQWgHzBiu66vHIp80v9Fc
         6v8SO9JWqp8xFqI928SR27biN8v0i7GFJkWEgElRw3czkWtdaXUVkLTtDX+Fbbl7WcIL
         NK/PPUvIG0D0zBGFCS0f68kd3ANmdqWGOgvZ1r0rcjSa9hBDkiHsk4Ux8CF8oMPteNoP
         61NQ==
X-Gm-Message-State: ACrzQf2IO2zMGmGaq+AkLAvvXjaEFPThSn3XkudJqV1krT0uHsvLOt39
        gqckOaiQSuMWu9lAtOuZilCbCOaWF5/g2w==
X-Google-Smtp-Source: AMsMyM7TqQFU+YDkDr4NbQkusKQydBTMOYss8q9+0R51Wpg5ZsZ4KjTt/e+hh28CGcu8EmCIcDCa7A==
X-Received: by 2002:a05:622a:19a7:b0:35c:2ad3:c117 with SMTP id u39-20020a05622a19a700b0035c2ad3c117mr17295295qtc.220.1664188045613;
        Mon, 26 Sep 2022 03:27:25 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id u12-20020a37ab0c000000b006b9526cfe6bsm11055243qke.80.2022.09.26.03.27.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 03:27:25 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-3511e80f908so524397b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 03:27:25 -0700 (PDT)
X-Received: by 2002:a81:1691:0:b0:345:17df:4fc6 with SMTP id
 139-20020a811691000000b0034517df4fc6mr19158627yww.502.1664188045078; Mon, 26
 Sep 2022 03:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220923170340.4099226-1-Jason@zx2c4.com> <20220923170340.4099226-3-Jason@zx2c4.com>
In-Reply-To: <20220923170340.4099226-3-Jason@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Sep 2022 12:27:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPcXq_F0dQdJ5nV2io1eDhJs7BZf+TmXWPqGVn9xeLNA@mail.gmail.com>
Message-ID: <CAMuHMdXPcXq_F0dQdJ5nV2io1eDhJs7BZf+TmXWPqGVn9xeLNA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jason,

On Fri, Sep 23, 2022 at 7:03 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> This is useful on !virt platforms for kexec, so change things from
> BI_VIRT_RNG_SEED to be BI_RNG_SEED, and simply remove BI_VIRT_RNG_SEED
> because it only ever lasted one release, and nothing is broken by not
> having it. At the same time, keep a comment noting that it's been
> removed, so that ID isn't reused.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

The approach LGTM, but given my doubts on [PATCH v3 2/3], I think this
patch should be moved up, to not depend on [2/3].

> --- a/arch/m68k/include/uapi/asm/bootinfo-virt.h
> +++ b/arch/m68k/include/uapi/asm/bootinfo-virt.h
> @@ -13,13 +13,8 @@
>  #define BI_VIRT_VIRTIO_BASE    0x8004
>  #define BI_VIRT_CTRL_BASE      0x8005
>
> -/*
> - * A random seed used to initialize the RNG. Record format:
> - *
> - *   - length       [ 2 bytes, 16-bit big endian ]
> - *   - seed data    [ `length` bytes, padded to preserve 2-byte alignment ]
> - */
> -#define BI_VIRT_RNG_SEED       0x8006
> +/* No longer used -- replaced with BI_RNG_SEED -- but don't reuse this index:
> + *     #define BI_VIRT_RNG_SEED        0x8006 */

Please drop the space before TAB.

> --- a/arch/m68k/include/uapi/asm/bootinfo.h
> +++ b/arch/m68k/include/uapi/asm/bootinfo.h
> @@ -64,7 +64,13 @@ struct mem_info {
>                                         /* (struct mem_info) */
>  #define BI_COMMAND_LINE                0x0007  /* kernel command line parameters */
>                                         /* (string) */
> -
> +/*
> + * A random seed used to initialize the RNG. Record format:
> + *
> + *   - length       [ 2 bytes, 16-bit big endian ]
> + *   - seed data    [ `length` bytes, padded to preserve 2-byte alignment ]

While experimenting, I noticed this must actually be a 4-byte alignment,
as data[] is an integral multiple of __be32 words:

    struct bi_record {
            __be16 tag;                     /* tag ID */
            __be16 size;                    /* size of record (in bytes) */
            __be32 data[];                  /* data */
    };

m68kboot[1] and kexec-boot[2] do implement the correct rounding,
but qemu's BOOTINFOSTR()[3] and BOOTINFODATA()[4] do not.
Sorry for missing that before, I guess I was misled by the existing
bug in BOOTINFOSTR().

Consequently, both kexec-tools[5] and the m68k-bootinfo tool[6] cannot
parse /proc/bootinfo if the size is not a multiple of 4, which can
easily be triggered by changing the command line of the m68k virt
machine.

> + */
> +#define BI_RNG_SEED            0x0008
>
>      /*
>       *  Linux/m68k Architectures (BI_MACHTYPE)

[1] https://github.com/geertu/m68kboot/blob/master/common/bootinf.c#L171
[2] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/tree/kexec/arch/m68k/bootinfo.c#n60
[3] https://git.qemu.org/?p=qemu.git;a=blob;f=hw/m68k/bootinfo.h;h=bd8b212fd35ce216917e07eb67783b5b69f1e11b;hb=HEAD#l57
[4] https://git.qemu.org/?p=qemu.git;a=blob;f=hw/m68k/bootinfo.h;h=bd8b212fd35ce216917e07eb67783b5b69f1e11b;hb=HEAD#l73
[5] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/tree/kexec/arch/m68k/bootinfo.c#n106
[6] https://github.com/geertu/m68k-bootinfo/blob/master/m68k-bootinfo.c#L466

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
