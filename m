Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6E8E784AC
	for <linux-m68k@archiver.kernel.org>; Mon,  2 Oct 2023 13:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237310AbjJBNMf convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 2 Oct 2023 09:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236163AbjJBNMe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 2 Oct 2023 09:12:34 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EBE93
        for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Oct 2023 06:12:31 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59f6e6b7600so139752957b3.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 02 Oct 2023 06:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696252351; x=1696857151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sH/JE9V8CyScfvNbdP533tae/oPZjky+UiCYZoWPE1E=;
        b=gruTD1m7pN/cxtee8CA/perTZWWzDEIhlQNzzGLE6NVtl5cUQN6+AiC545oZvR1yPI
         cHvBH9yCpxgjgzFcOjG1m8P0Ny+Bazf+J1JEbw8hVVhk3oYEAG6OMRYQRsJO4bG3s6f0
         w8dOt/Invj5oy//QyxbWjDPGfx3r+F+/1YNE1bLXc2U6ub8ls6qDC1EPiBuSoCE6hUsz
         bJ6buuIpgM3sJ1xlbhLaSd3xVMh5JT2BV/JuvLH4dH2u4npnqPthePBcbOw7cAzzBAOJ
         mNFUZHoOa2Z1sUpoBFUGBoHNjI5VCur4xUGOcQfMKZbbfDRjk8l7EgLVSn3JW4APSBr6
         mC2Q==
X-Gm-Message-State: AOJu0Yydz77tRb03+sJBk8bfaRZleP1NjargRtRgrXa6tnxvrN1nyOgL
        BVUQP015NvhSU4HbsASYyfpiPeQjJHcMow==
X-Google-Smtp-Source: AGHT+IFiOFXD4xmYID0yJXUd22kTfJfV4V/mcHlf3kV4PEyCAn8ZJNkEq0LLxaQLY20lrECz5gM3rw==
X-Received: by 2002:a0d:c2c2:0:b0:59c:a7f:ca7b with SMTP id e185-20020a0dc2c2000000b0059c0a7fca7bmr9238880ywd.51.1696252350568;
        Mon, 02 Oct 2023 06:12:30 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id q185-20020a8180c2000000b005956b451fb8sm7670378ywf.100.2023.10.02.06.12.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 06:12:30 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59f4f80d084so159854867b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 02 Oct 2023 06:12:30 -0700 (PDT)
X-Received: by 2002:a81:5305:0:b0:57a:8ecb:11ad with SMTP id
 h5-20020a815305000000b0057a8ecb11admr11166921ywb.43.1696252350020; Mon, 02
 Oct 2023 06:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230925155328.443664-1-arnd@kernel.org>
In-Reply-To: <20230925155328.443664-1-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Oct 2023 15:12:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFCSQgsf_0qwdkkAif3zDXM2N-WEymJBa1eeT4N6Ezcw@mail.gmail.com>
Message-ID: <CAMuHMdWFCSQgsf_0qwdkkAif3zDXM2N-WEymJBa1eeT4N6Ezcw@mail.gmail.com>
Subject: Re: [PATCH] m68k: asm/io.h: mark mmio read addresses as const
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     kernel test robot <lkp@intel.com>, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

On Mon, Sep 25, 2023 at 5:53 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Passing constant __iomem tokens into the readl() family of helpers
> or any of the others causes a warning on m68k:
>
> include/asm-generic/io.h: In function 'ioread8_rep':
> arch/m68k/include/asm/io_mm.h:375:44: warning: passing argument 1 of 'raw_insb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>      375 | #define readsb(port, buf, nr)     raw_insb((port), (u8
>
> Add a 'const' modifier to the pointers to shut up the warnings here.
>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309251926.bPl23AhG-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/m68k/include/asm/raw_io.h
> +++ b/arch/m68k/include/asm/raw_io.h
> @@ -17,15 +17,15 @@
>   * two accesses to memory, which may be undesirable for some devices.
>   */
>  #define in_8(addr) \
> -    ({ u8 __v = (*(__force volatile u8 *) (unsigned long)(addr)); __v; })
> +    ({ u8 __v = (*(__force const volatile u8 *) (unsigned long)(addr)); __v; })
>  #define in_be16(addr) \
> -    ({ u16 __v = (*(__force volatile u16 *) (unsigned long)(addr)); __v; })
> +    ({ u16 __v = (*(__force const volatile u16 *) (unsigned long)(addr)); __v; })
>  #define in_be32(addr) \
> -    ({ u32 __v = (*(__force volatile u32 *) (unsigned long)(addr)); __v; })
> +    ({ u32 __v = (*(__force const volatile u32 *) (unsigned long)(addr)); __v; })
>  #define in_le16(addr) \
> -    ({ u16 __v = le16_to_cpu(*(__force volatile __le16 *) (unsigned long)(addr)); __v; })
> +    ({ u16 __v = le16_to_cpu(*(__force const volatile __le16 *) (unsigned long)(addr)); __v; })
>  #define in_le32(addr) \
> -    ({ u32 __v = le32_to_cpu(*(__force volatile __le32 *) (unsigned long)(addr)); __v; })
> +    ({ u32 __v = le32_to_cpu(*(__force const volatile __le32 *) (unsigned long)(addr)); __v; })
>
>  #define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(addr)) = (b))
>  #define out_be16(addr,w) (void)((*(__force volatile u16 *) (unsigned long)(addr)) = (w))

Shouldn't a similar change be made to rom_in_{8,be16,le16}()?

I can do that while applying...

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
