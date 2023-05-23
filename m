Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7CDC7EE30
	for <linux-m68k@archiver.kernel.org>; Tue, 23 May 2023 09:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235926AbjEWJWm convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 May 2023 05:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235594AbjEWJWk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 May 2023 05:22:40 -0400
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB70102
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 02:22:39 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-19a08412723so5592856fac.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 02:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684833759; x=1687425759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElqaZMSGIZr1PDsUyYzS4b4CKhVSDM9bJ+kKBcpqibs=;
        b=jqp0vIWJRgq9JV6zqhvBgMFmTQ67vsGSZCk2TmP0pjtZnNZXewdw4/E98xDq4qFNJ9
         XJI13Y6mrtryigaIRgL4LPoknqciQZBi8vtKyfOtoXxe3zGzjAYTzNLHg0xUBlTFe8ai
         kBzLykQYfxFqi5jlSh4KhoPJEeUiyBvyERyv/vqkfLkvWnjo5vdmIO6dW1EG0YAZtwcn
         T0XyGto7W2Vnphcb3R8hXcElGaK0zbnS3br9ZYXTVX6U/isfPp3XT7uyJghsIwXCteY+
         IlJFu19bRZ7Fkav9ltat1fHRIZn2H1kuwl/bVdbC6WWX8st3oB8HuNisXwsv+oLO7+9B
         BeMw==
X-Gm-Message-State: AC+VfDwQYpYbPKTrpqlNKnLxE54d/ZIkAScKzQBRk1xhvc5bvKXgjScz
        fMPofL9JkDjxbrlX5c12hAU9jec2yNbGpw==
X-Google-Smtp-Source: ACHHUZ55Z1kQmCt/QJlGuz6QsNlttAqAzlw+oF1uny530TkoY0ruCQAnL/UYkYA4wI1u4s9dkF6U6Q==
X-Received: by 2002:a05:6808:342:b0:387:77f1:21 with SMTP id j2-20020a056808034200b0038777f10021mr7630473oie.48.1684833758582;
        Tue, 23 May 2023 02:22:38 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id v203-20020acaded4000000b0038ee0c3b38esm3685336oig.44.2023.05.23.02.22.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 02:22:37 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5527167350bso4514886eaf.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 02:22:37 -0700 (PDT)
X-Received: by 2002:a81:5bc6:0:b0:562:16d7:e6eb with SMTP id
 p189-20020a815bc6000000b0056216d7e6ebmr15255699ywb.40.1684833736388; Tue, 23
 May 2023 02:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230523091139.21449-1-vbabka@suse.cz>
In-Reply-To: <20230523091139.21449-1-vbabka@suse.cz>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 May 2023 11:22:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRZmA1iEG2aXdKZ+wWgSTgg-P7KY7pTTJx9EmvuEa58A@mail.gmail.com>
Message-ID: <CAMuHMdWRZmA1iEG2aXdKZ+wWgSTgg-P7KY7pTTJx9EmvuEa58A@mail.gmail.com>
Subject: Re: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Qin Jian <qinjian@cqplus1.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Vlastimil,

Thanks for your patch!

On Tue, May 23, 2023 at 11:12 AM Vlastimil Babka <vbabka@suse.cz> wrote:
> As discussed at LSF/MM [1] [2] and with no objections raised there,
> deprecate the SLAB allocator. Rename the user-visible option so that
> users with CONFIG_SLAB=y get a new prompt with explanation during make
> oldconfig, while make olddefconfig will just switch to SLUB.
>
> In all defconfigs with CONFIG_SLAB=y remove the line so those also
> switch to SLUB. Regressions due to the switch should be reported to
> linux-mm and slab maintainers.

Technically, removing these lines from the defconfig files does not
have any impact, right?
And it removes one more sync point indicating the last time some
defconfig files were (not) updated by their maintainers ;-)

> [1] https://lore.kernel.org/all/4b9fc9c6-b48c-198f-5f80-811a44737e5f@suse.cz/
> [2] https://lwn.net/Articles/932201/
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

>  arch/m68k/configs/amiga_defconfig               |  1 -
>  arch/m68k/configs/apollo_defconfig              |  1 -
>  arch/m68k/configs/atari_defconfig               |  1 -
>  arch/m68k/configs/bvme6000_defconfig            |  1 -
>  arch/m68k/configs/hp300_defconfig               |  1 -
>  arch/m68k/configs/mac_defconfig                 |  1 -
>  arch/m68k/configs/multi_defconfig               |  1 -
>  arch/m68k/configs/mvme147_defconfig             |  1 -
>  arch/m68k/configs/mvme16x_defconfig             |  1 -
>  arch/m68k/configs/q40_defconfig                 |  1 -
>  arch/m68k/configs/sun3_defconfig                |  1 -
>  arch/m68k/configs/sun3x_defconfig               |  1 -

Regardless,
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
