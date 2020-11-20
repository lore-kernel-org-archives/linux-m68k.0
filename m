Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DCDC5519F
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 07:56:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07BA1222BA
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 07:56:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbgKTH4a (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Nov 2020 02:56:30 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46385 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgKTH4a (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Nov 2020 02:56:30 -0500
Received: by mail-oi1-f195.google.com with SMTP id q206so9455898oif.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2020 23:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TPr5T3DZ53wtsCD7JEASyN08meG9A+0KW3mx3nLQ5mo=;
        b=NFC3cOqrDxwVubI1wpQxJAE6qzEk4RW7vIJhYg56mV8xnFFPExJssK6/aW5yr8wZge
         qofbX0oNCqGwGOMaqeiMuM/41aoeXHFR7wVsacVrxVWwZfRzsVdRNSRNUDvjIbcmrqEU
         n0u5zX8CsYom4Q+q4JCSivm3V/Mq6JHEkNRzlTpc4JCqQ7TxTINoAxbhdRtZkx5kSj52
         +KtpHa1V+1HtE5W9cbJ2A/xCoRcgX4OAOvEBk343FsXn1IAt681y2ekVT+Nyw2av6snK
         RIrXtE/8ep66fv4t3ruYzSEJUVtIjmYwfAlHJAGkcBCpkGSv9R6udsgndVWHOJvtUJtz
         z/ow==
X-Gm-Message-State: AOAM531J42L8nIgIm91S7y++uCjvf5RYY82ruF9ah0eidGaL5Ffj1zpU
        acFkLSmuRywr7+eJNfCXgdy4yqoi8O/qpGgeOJM=
X-Google-Smtp-Source: ABdhPJyZmb4gYamiRVU2ky78A95tTLo5XH/hqASKrT7hIKEXikms3FZsct5p8L8AOBT7x+qbjHMti4y80K8qvUq0ur8=
X-Received: by 2002:aca:c3c4:: with SMTP id t187mr5264945oif.148.1605858989557;
 Thu, 19 Nov 2020 23:56:29 -0800 (PST)
MIME-Version: 1.0
References: <0a7b09f5e5f48e270b82041c19e8f20f54c69216.1605847196.git.fthain@telegraphics.com.au>
In-Reply-To: <0a7b09f5e5f48e270b82041c19e8f20f54c69216.1605847196.git.fthain@telegraphics.com.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Nov 2020 08:56:18 +0100
Message-ID: <CAMuHMdV7m47yAZm0mAo75Z8X=ONuibKMSwhVdpcbEdPqWjpRHw@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: Refactor iop_preinit() and iop_init()
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Nov 20, 2020 at 5:51 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> The idea behind iop_preinit() was to put the SCC IOP into bypass mode.
> However, that remains unimplemented and implementing it would be
> difficult. Let the comments and code reflect this. Even if iop_preinit()
> worked as described in the comments, it gets called immediately before
> iop_init() so it might as well part of iop_init().
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.11 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
