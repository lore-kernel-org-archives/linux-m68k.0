Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B3EC432BE
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Sep 2021 13:42:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E2C060BD3
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Sep 2021 13:42:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244396AbhIANm4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Sep 2021 09:42:56 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:39541 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244344AbhIANm4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 1 Sep 2021 09:42:56 -0400
Received: by mail-vs1-f50.google.com with SMTP id m190so2460932vsm.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Sep 2021 06:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/xOCv7duiKV85YEAr3p0lxEIgvNf6vJOyFaux8D3sgc=;
        b=hkdVykL+tGLtJXy03pDX3GVsfgciDJ1LFVjJLH582elA1WQnXghz+bIf84VJ3DRZBM
         qnalxpBGnDEw+PedPH7RvqpD4eC9aacP2+f3Ra1Yv6n3hPK7TNQ/zCXwZaPOlpUhp/BA
         0menEcgdphq/4RzIbdueeoxXm/5PgGpKOwWOitmCC92ddmh7Xne4hMFVGoWJv2f+uWVp
         J8RR4F8Th4GZSkorX4DEglEPfoD8L963c1VtG4YyV4okJiSba/1fIe5Whds2AG2erWTm
         ekpKQr6qGUP6vscPpmjQN751xQSK8ppbzO1JdcTY/nZjeApFYcfzD+7kx/SoHupGP5fb
         rp2w==
X-Gm-Message-State: AOAM532ZEb35Q/FsU4Q7tvmhW7CJHpIJ/ILPXXlCKVJJEh6yXFESypa/
        QE6syLHzoBlElRvD02eN0/r+NamZxAvQJldHb90=
X-Google-Smtp-Source: ABdhPJx/jw1Hd9z5dejjk2bylHrBEE4LNmlEMO2utTQ/YLBtNm+pHtrY/uki14hOKxAFDVFkelRD3cReRgD5NymWjeI=
X-Received: by 2002:a05:6102:34c9:: with SMTP id a9mr18408820vst.26.1630503718663;
 Wed, 01 Sep 2021 06:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210830221000.179369-1-mcgrof@kernel.org> <20210830221000.179369-2-mcgrof@kernel.org>
In-Reply-To: <20210830221000.179369-2-mcgrof@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 Sep 2021 15:41:47 +0200
Message-ID: <CAMuHMdUUrp-ktVmOPRs7KinykrVKEMx-dG42RapPc-egxODNnQ@mail.gmail.com>
Subject: Re: [PATCH 01/15] z2ram: add error handling support for add_disk()
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

Hi Luis,

On Tue, Aug 31, 2021 at 12:10 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling. Only the disk is cleaned up inside
> z2ram_register_disk() as the caller deals with the rest.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Thanks for your patch!

> --- a/drivers/block/z2ram.c
> +++ b/drivers/block/z2ram.c
> @@ -318,6 +318,7 @@ static const struct blk_mq_ops z2_mq_ops = {
>  static int z2ram_register_disk(int minor)
>  {
>         struct gendisk *disk;
> +       int err;
>
>         disk = blk_mq_alloc_disk(&tag_set, NULL);
>         if (IS_ERR(disk))
> @@ -333,8 +334,10 @@ static int z2ram_register_disk(int minor)
>                 sprintf(disk->disk_name, "z2ram");
>
>         z2ram_gendisk[minor] = disk;
> -       add_disk(disk);
> -       return 0;
> +       err = add_disk(disk);
> +       if (err)
> +               blk_cleaup_disk(disk);

blk_cleanup_disk()?

Seems like lkp already detected this back in July...

> +       return err;
>  }
>
>  static int __init z2_init(void)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
