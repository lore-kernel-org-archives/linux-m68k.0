Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52836C433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Jun 2022 08:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347824AbiFJIqi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 10 Jun 2022 04:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348246AbiFJIqg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 10 Jun 2022 04:46:36 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FFB3B3CC
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jun 2022 01:46:35 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id j8so16129771qtn.13
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jun 2022 01:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FDHFkgu1+zpzbiMkbVNAjHtd/giuN+UF6Mx7hyw7oKQ=;
        b=X/oMykA4GIaMgSEMeUNPXXSSE8rTUAZFtgQowgZ1akQmB4dCTdnTEMmP+JjAg+T5o5
         jCttwQSI7VKzKGNSBU7qZJ2WuBEQGdL/M2PUMK3p+8kCyuBFbwmiu8jbq+eaSLN8DvCz
         At7Lywv3Is9JQp2mBj9FieKuI9SqIO7/kh60icll+mm/pWgMRnAoj9S5Nnbh/1A3zH2I
         eES9vQf1B3rOhkMde4RZ+j+6tp/k46DjfbCOVfxiCYF06VgSKW8/yf/whZTvmACdF59E
         XvH4phPCZGXQjdTTLydpTHWzgd9MEBz6kuS1+F3CpPl3R6plXWJZS7YzvmXoimDZZc+6
         SswQ==
X-Gm-Message-State: AOAM533gQIsSsUqJqOYPZq6caTc/rFA5qv9DqalmhhN8+Zp4xkZqurHU
        5czEhtUhyBlMSzSgeLfObBLsKD+pbeAOfQ==
X-Google-Smtp-Source: ABdhPJxn6GdROe45fxjXqXj4jtifj8TBYSS1YvB/cGVJEQkS5pVovs9PQ0DnQ0B7bKLaN4sX3OaUbQ==
X-Received: by 2002:ac8:5b87:0:b0:2f8:ab4:a050 with SMTP id a7-20020ac85b87000000b002f80ab4a050mr35729587qta.183.1654850794394;
        Fri, 10 Jun 2022 01:46:34 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id b5-20020a37b205000000b006a61650043bsm20345308qkf.124.2022.06.10.01.46.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 01:46:33 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-30ec2aa3b6cso265142647b3.11
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jun 2022 01:46:33 -0700 (PDT)
X-Received: by 2002:a81:4811:0:b0:30c:8021:4690 with SMTP id
 v17-20020a814811000000b0030c80214690mr47246570ywa.47.1654850793149; Fri, 10
 Jun 2022 01:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <202206100855.uY63FJUH-lkp@intel.com>
In-Reply-To: <202206100855.uY63FJUH-lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Jun 2022 10:46:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGdzkaT=SR2OWoN9S=Xr-2Ckki41P_p7t4WDgRLzfuGg@mail.gmail.com>
Message-ID: <CAMuHMdVGdzkaT=SR2OWoN9S=Xr-2Ckki41P_p7t4WDgRLzfuGg@mail.gmail.com>
Subject: Re: {standard input}:3978: Error: value 178 out of range
To:     kernel test robot <lkp@intel.com>
Cc:     Sumit Saxena <sumit.saxena@broadcom.com>, kbuild-all@lists.01.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Himanshu Madhani <himanshu.madhani@oracle.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jun 10, 2022 at 2:47 AM kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6bfb56e93bcef41859c2d5ab234ffd80b691be35
> commit: 43ca110050988c7a0e581d24ce212ef34a4cdf29 scsi: mpi3mr: Add support for PEL commands
> date:   5 weeks ago
> config: m68k-randconfig-r036-20220608 (https://download.01.org/0day-ci/archive/20220610/202206100855.uY63FJUH-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 11.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=43ca110050988c7a0e581d24ce212ef34a4cdf29
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 43ca110050988c7a0e581d24ce212ef34a4cdf29
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    {standard input}: Assembler messages:
> >> {standard input}:3978: Error: value 178 out of range
> >> {standard input}:3978: Error: value of 178 too large for field of 1 byte at 00000fdb

This failure happens while building drivers/scsi/mpi3mr/mpi3mr_fw.o.

How to check:

    make ARCH=m68k drivers/scsi/mpi3mr/mpi3mr_fw.s
    make ARCH=m68k V=1 drivers/scsi/mpi3mr/mpi3mr_fw.o

Run the output from the last command with mpi3mr_fw.c by mpi3mr_fw.s,
so you will get sensible line numbers:

    drivers/scsi/mpi3mr/mpi3mr_fw.s: Assembler messages:
    drivers/scsi/mpi3mr/mpi3mr_fw.s:1849: Error: value -168 out of range
    drivers/scsi/mpi3mr/mpi3mr_fw.s:1849: Error: value of -168 too
large for field of 1 byte at 3175

Note that the value differs, but I'm using a different compiler
(gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04)).

The offending instruction is:

    | drivers/scsi/mpi3mr/mpi3mr_fw.c:299:  switch (host_tag) {
            mvz.w %d2,%d0   | tmp160, host_tag
            mov3q.l #5,%d1  |,
            cmp.l %d0,%d1   | host_tag,
            jcs .L154               |
            tst.w %d6       | host_tag
            jeq .L133               |
            subq.l #2,%d2   |, tmp238
            mvz.w %d2,%d2   | tmp238, tmp240
            mov3q.l #3,%d0  |,
            cmp.l %d2,%d0   | tmp240,
            jcs .L140               |
            add.l %d2,%d2   | tmp244
>>>         move.w .L155(%pc,%d2.l),%d0     |, tmp245
            jra .L186               |

And the table L155 is just too far from the above instruction, so
the displacement is too large, causing the failure.

Looks like a compiler bug to me?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
