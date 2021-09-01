Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED50DC432BE
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Sep 2021 13:43:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5D1A60BD3
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Sep 2021 13:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244221AbhIANoz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Sep 2021 09:44:55 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:47064 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243518AbhIANoz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 1 Sep 2021 09:44:55 -0400
Received: by mail-ua1-f47.google.com with SMTP id 37so1343247uau.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Sep 2021 06:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gWwkSDKtYGpqljVYI1y+WfrFXR09Q3LdZi5r8xigkjk=;
        b=gnUjd5Thb6/lSybyYIa4/wgoN1aOSfH+Fwrp6ZDT5pfwozAOgSBemducjKV9UDeMjw
         IqkoyEaZf/GGDeb41BrYHNw27bEp4VGGJD9YmMJTySKZpQhqrJJ+8BVS0Qal9O4dNeqH
         qmd7XJufptCSvMECIeHeiQrYGgoX6+T9gD6k3QwjxOP+Y9m8j8/+18CVcLluxTtvws3J
         ARWG19pL0W93t4/CLs3Oei6Z/32o+eViWnAtStoDeVQjWSjbglZgg8haNX8N/uBiiEcq
         Fts9N8dOKT91QTI/UW/PnuKJ2mhvBasqXi974+KsPSO/5pXB+4iSqsnp5+bY4DXSeaIH
         fYXw==
X-Gm-Message-State: AOAM530Xp/ISJ3bSn7SqucFbOOg+PyzzlUEa4QQnSp4bpH8Z5e2YayWt
        1+hjsA89u+kjGp/gcT0zKMNcbTROFA+SkeyuoLQ=
X-Google-Smtp-Source: ABdhPJwQuBYdXPN25peyItUun+pLAld/i8v6Ep8jdmiUeF2ltHZxB5QeDFZxYSpkK7+IOC5bnXvgZm+ETQziLUn4arE=
X-Received: by 2002:ab0:2989:: with SMTP id u9mr22973907uap.122.1630503838209;
 Wed, 01 Sep 2021 06:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210830221000.179369-1-mcgrof@kernel.org> <20210830221000.179369-4-mcgrof@kernel.org>
In-Reply-To: <20210830221000.179369-4-mcgrof@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 Sep 2021 15:43:46 +0200
Message-ID: <CAMuHMdXCUhrnXSmjFP7nJKHZp2joVRz-Ka2BUNMcZFA06CJ1wQ@mail.gmail.com>
Subject: Re: [PATCH 03/15] m68k/emu/nfblock: add error handling support for add_disk()
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Jens Axboe <axboe@kernel.dk>, justin@coraid.com,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Hannes Reinecke <hare@suse.de>, Tejun Heo <tj@kernel.org>,
        Philipp Reisner <philipp.reisner@linbit.com>,
        Lars Ellenberg <lars.ellenberg@linbit.com>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes.berg@intel.com>,
        chris.obbard@collabora.com,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        YiFei Zhu <zhuyifei1999@gmail.com>, thehajime@gmail.com,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Tim Waugh <tim@cyberelk.net>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Lars Ellenberg <drbd-dev@lists.linbit.com>,
        linux-block@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Aug 31, 2021 at 12:10 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
