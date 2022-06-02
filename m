Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D74DC433EF
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Jun 2022 07:13:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbiFBHNf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 2 Jun 2022 03:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbiFBHNb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 2 Jun 2022 03:13:31 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD42B4E
        for <linux-m68k@lists.linux-m68k.org>; Thu,  2 Jun 2022 00:13:27 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id i19so3011311qvu.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 02 Jun 2022 00:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DTx4+fJmVhIyXMyNirvzWdPuJKhlL8UJzLpiO+xxcus=;
        b=YvrgGMB+aU7yNko4KxtfQWHyy9qEN8xZ6/AmZ+XrgcSjh1MvVB8KNAqKafoieaF7pk
         nn9pZZvj5+c505XDC32XUy3hxLiMpPMD1JpzncKnYxQwZtzCBFtzkxLAnNpSXbJi+qRN
         gSte+6agxdOo/aKrVkCgKZbuJ3RwxF+8y5cRulAgB9CPoQBmdjmI5Bj6CXYzUOI2g+Lw
         54MFuGJOXVCQ3Tvo2bLiW+NzOk/cFuqJAoD84RNwKmHPqMIFzR+dV4eiwNz75NNmk4kp
         1rAAvTP+4hOM3XppMlBIQ8iEMCktNWlkQuR2vcgVGdsrtG8AQtmOVd9GJ75VgHRygBUp
         4Qog==
X-Gm-Message-State: AOAM532ET0mBbG2T809PAeb96hP1D8HlZar/KFjwizjUQS86o/TPVY5w
        MQKVDzWSEU4hxRVaAtgJQVKKIN16I6181g==
X-Google-Smtp-Source: ABdhPJzI+Y1eoZJIwhaNTBSNf/c87Eb4c0PZH6rR31eJiXxzEvPSl7BtsCIlQXygTPNc8eSECiiKig==
X-Received: by 2002:a05:6214:5005:b0:461:c843:98e7 with SMTP id jo5-20020a056214500500b00461c84398e7mr2441596qvb.16.1654154006661;
        Thu, 02 Jun 2022 00:13:26 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id u26-20020a05620a121a00b0069fd21d0b09sm2686615qkj.0.2022.06.02.00.13.26
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 00:13:26 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id h75so6840084ybg.4
        for <linux-m68k@lists.linux-m68k.org>; Thu, 02 Jun 2022 00:13:26 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr3810398ybb.202.1654154006045; Thu, 02
 Jun 2022 00:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220531174514.1586248-1-laurent@vivier.eu>
In-Reply-To: <20220531174514.1586248-1-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Jun 2022 09:13:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbUZU3YA6nDC_LDAfUYQVmHTuCzrCfxDqwF=ZZyR5fqw@mail.gmail.com>
Message-ID: <CAMuHMdUbUZU3YA6nDC_LDAfUYQVmHTuCzrCfxDqwF=ZZyR5fqw@mail.gmail.com>
Subject: Re: [PATCH] m68k: virt: Kconfig minor fixes
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, May 31, 2022 at 7:45 PM Laurent Vivier <laurent@vivier.eu> wrote:
> Select VIRTIO_MENU as it is needed by VIRTIO_MMIO.
>
> Add an ending period at the end the virt machine help message.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.20 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
