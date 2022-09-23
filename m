Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126E9C6FA82
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Sep 2022 11:30:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbiIWLaY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Sep 2022 07:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbiIWLaU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Sep 2022 07:30:20 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7D3F3100
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 04:30:19 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id s18so8170374qtx.6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 04:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vgb4KaCMBS26tk8RsPqB4bluO87s7au7hKeumOGx9zw=;
        b=xzw9dT57+PAonT4nhTxxAXCmuaaA/XjwD2cR3lPbUD1ryQEcqPefDmW6rZsXjjqBSi
         kOMwxsAXPyBU62E4u3vjMHg/q22d6wKVWdBRfh1EWR5HI3DMe0owNsRrcruf2EqxL6ve
         SFLiL+RtqXFtrGULfGbgDaXdP7+Ol0KAs+1gFwpZZKkpzg1PiK+g3RfDFQaXeLywcEhr
         OkW6l96KpU2aF9FQfZmmZJ3S3wIQx3zzytOEAHVNevbj2oFQlSBkNbma8Egb2n0V++BK
         njktRQ7eW3WG90ZN187XFtjQh7peIJoZ+FuTwuvOFByJK8nT6HczqhIiFjy1uOsHFxMI
         mohQ==
X-Gm-Message-State: ACrzQf2TG8FoWR33j6A5a8SvLSKG8zcbAhPB7eC3k9p4PVchpWg2eFrl
        sG+4hrgyw5XeVgemyoHKjrA5VZASTNq5pQ==
X-Google-Smtp-Source: AMsMyM5bogXklvaWkD/mg06NrZEtlab4FgKKv1cNePOkXtFmUbJaEdL2vy3MqD9fLtnU0Si9t3AJnw==
X-Received: by 2002:a05:622a:216:b0:35d:773:63ce with SMTP id b22-20020a05622a021600b0035d077363cemr6725522qtx.541.1663932618743;
        Fri, 23 Sep 2022 04:30:18 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id v19-20020a05620a441300b006b945519488sm5473221qkp.88.2022.09.23.04.30.18
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 04:30:18 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id f189so958408yba.12
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 04:30:18 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr8165572ybl.604.1663932618054; Fri, 23
 Sep 2022 04:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220921185208.3549140-1-Jason@zx2c4.com> <20220921185208.3549140-2-Jason@zx2c4.com>
In-Reply-To: <20220921185208.3549140-2-Jason@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Sep 2022 13:30:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUuM85s1APoxRmXnw13hHHEGgo8Z9EKvpV6maaZPaVUfA@mail.gmail.com>
Message-ID: <CAMuHMdUuM85s1APoxRmXnw13hHHEGgo8Z9EKvpV6maaZPaVUfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: virt: generate new RNG seed on reboot
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jason,

On Wed, Sep 21, 2022 at 8:52 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Rather than rebooting into a system with no entropy, regenerate the RNG
> seed before rebooting, so that the new system has a fresh seed.
>
> Fixes: a1ee38ab1a75 ("m68k: virt: Use RNG seed from bootinfo block")
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Thanks for your patch!

> --- a/arch/m68k/virt/config.c
> +++ b/arch/m68k/virt/config.c
> @@ -45,10 +45,18 @@ static void virt_halt(void)
>                 ;
>  }
>
> +static struct bi_record *rng_seed_record;

This can be const...

> +
>  static void virt_reset(void)
>  {
>         void __iomem *base = (void __iomem *)virt_bi_data.ctrl.mmio;
>
> +       if (rng_seed_record && rng_seed_record->size > sizeof(*rng_seed_record) + 2) {
> +               u16 len = rng_seed_record->size - sizeof(*rng_seed_record) - 2;
> +               get_random_bytes((u8 *)rng_seed_record->data + 2, len);
> +               *(u16 *)rng_seed_record->data = len;

Wouldn't it be simpler to just use the existing length?

    if (rnd_seed_record) {
           u16 len = be16_to_cpup(data);
           get_random_bytes((u8 *)rng_seed_record->data + 2, len);
    }

However, I have my doubts this will actually work. Was this tested?
The bootinfo is passed from userspace, usually by reading
/proc/bootinfo, and adapting it where needed.
So I think you should implement this in kexec-tools instead.

> +       }
> +
>         iowrite32be(CMD_RESET, base + VIRT_CTRL_REG_CMD);
>         local_irq_disable();
>         while (1)
> @@ -101,6 +109,8 @@ int __init virt_parse_bootinfo(const struct bi_record *record)
>                  * length to prevent kexec from using it.
>                  */
>                 memzero_explicit((void *)data, len + 2);
> +                /* Store a reference to be filled in on reboot. */
> +               rng_seed_record = (void *)record;

... so this cast can be dropped.

>                 break;
>         }
>         default:

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
