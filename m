Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF225C05027
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Feb 2023 14:03:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjBIODp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 9 Feb 2023 09:03:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbjBIODo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 9 Feb 2023 09:03:44 -0500
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0B617CFE
        for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Feb 2023 06:03:40 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-52bfa3dfd95so26083847b3.9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Feb 2023 06:03:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5LEMYJKTULDF0yIN2Ry+IVsYPZvyA1Fu5NFvlX6eN4=;
        b=L1KkV1jKnYP7mSAYrCXd+Yso5rAV5OTBtIwX5OHfYgn1yn6KczGFR6KMIqtAxDk8YO
         gXnM9HbWBtOkvklECljw+TOvRp9hkz9QnVjpQHJa6GwQDrtGes47EgOOWvoI5St8UZd7
         wz93r8AKA5WVkLD3pqpak33KUb0LZHzN8RMy590WdUYqjA8J+zWHirx6fe+cD8KrGfni
         XTF8J5IFMNeQZv5ty1eqlhUUkfssN6SZf+/xcTjh5FyzaWxURtPc7v6+K0pej5DNkYWI
         qeySfKTZmA4JdrWI80s+l0O2vEEARzO+lCiOXRRVnzQF7H9qXPVqiqGcNMvPN2q3xpl2
         jfYQ==
X-Gm-Message-State: AO0yUKWA8iDhG6ib0ppgetx3QkCHJD6x4PcpGlQuAkEXlO2yredpHgkS
        nrJIhZpSBPoao3715LeFwaHrWbj1W+vAGg==
X-Google-Smtp-Source: AK7set/M52dwxQcXuGig96ARo137KznPGHZsM2AO6uAhwUlDIR8R0ARK+tjgIY+3OY/hq0ytgwR9MQ==
X-Received: by 2002:a81:4427:0:b0:52e:bb2c:9691 with SMTP id r39-20020a814427000000b0052ebb2c9691mr1040737ywa.27.1675951418784;
        Thu, 09 Feb 2023 06:03:38 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id k6-20020a378806000000b0072c86374ddfsm1375969qkd.71.2023.02.09.06.03.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 06:03:38 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id t1so2446030ybd.4
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Feb 2023 06:03:38 -0800 (PST)
X-Received: by 2002:a25:5d11:0:b0:839:c329:be37 with SMTP id
 r17-20020a255d11000000b00839c329be37mr1244416ybb.89.1675951418101; Thu, 09
 Feb 2023 06:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20230209010635.24016-1-rdunlap@infradead.org>
In-Reply-To: <20230209010635.24016-1-rdunlap@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Feb 2023 15:03:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUrmKsi0arun17uVkAaoRe2vs1Xy_XY8Mb2dA6wu8q9iQ@mail.gmail.com>
Message-ID: <CAMuHMdUrmKsi0arun17uVkAaoRe2vs1Xy_XY8Mb2dA6wu8q9iQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: allow PM menu options for COMPILE_TEST
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Randy,

On Thu, Feb 9, 2023 at 2:06 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> Allow PM options for COMPILE_TEST. This quietens a kconfig
> warning.
>
> This is similar to a patch for Sparc32 that was suggested by
> Arnd.
>
> WARNING: unmet direct dependencies detected for PM
>   Depends on [n]: !MMU [=y]
>   Selected by [y]:
>   - SUN20I_PPU [=y] && (ARCH_SUNXI || COMPILE_TEST [=y])
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for your patch!

> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -126,7 +126,7 @@ menu "Kernel Features"
>
>  endmenu
>
> -if !MMU
> +if !MMU || COMPILE_TEST
>  menu "Power management options"

I think this is the wrong solution.
All other selects of PM are done by architecture/platform-gating
symbols, and none of them can be enabled for compile-testing.

So either SUN20I_PPU should depend on PM, or ARCH_SUNXI
should select PM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
