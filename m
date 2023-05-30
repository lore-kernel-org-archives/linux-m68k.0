Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3391C7EE23
	for <linux-m68k@archiver.kernel.org>; Tue, 30 May 2023 09:03:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbjE3JDN convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 30 May 2023 05:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbjE3JDM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 30 May 2023 05:03:12 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5380AEA
        for <linux-m68k@lists.linux-m68k.org>; Tue, 30 May 2023 02:03:11 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-565c9109167so26179047b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 30 May 2023 02:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685437390; x=1688029390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jltyANNk0K1fvjo+smvqDLimsWHFFV2WMW5ttZVPjPA=;
        b=MUsQm/hlrMLjS51j9pVuvQKOUSL1Wh/LRItKnKEfcMCSkAt6CbuxCjSJ6AUptIYMlC
         O7wZt8QDV+MwZo/EGU5mS4UwdFbsMhYLpEYoT3lyo+o2Oy8eGgFoKbVmhRAsZmVLJXCx
         n/pVjY6/bSsZ/Zhm7i1CU+GXXBUsJf9NPun1mnXZsOsZFbnAZPTb4XHHOr5c+CaEX46Z
         AAnhjqV/Ea2FkMSm8/RYdyo6MjbXC93d0bZmR8hWFXcLBMtHCBU5GjG1QDOnt2Nhs+b+
         8oVB1sv723lY5gZkrZx97mciTr23/PI1JCv/UepknqUHJdOuW+62b5lh9L0wuzUvtiKY
         AQEQ==
X-Gm-Message-State: AC+VfDzWo6atRYk6UOIgDCghZNv1enO0zPfCWqygZVCQvAKV9F/G98KQ
        jkEO+EJESAYKHnrkDmAvB9AZ3pAEm4Lj4Q==
X-Google-Smtp-Source: ACHHUZ7wCyB9l0HLwYSRj6wRv6GItl21c46a73vwsBnVC7kK7JhE8vzDpIrXM/hqZfv7UVXzxWBANw==
X-Received: by 2002:a81:494f:0:b0:55d:3e67:2c6f with SMTP id w76-20020a81494f000000b0055d3e672c6fmr1714973ywa.22.1685437390264;
        Tue, 30 May 2023 02:03:10 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id d124-20020a814f82000000b00565c3415844sm3166316ywb.66.2023.05.30.02.03.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 02:03:09 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-565ca65e7ffso25453117b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 30 May 2023 02:03:09 -0700 (PDT)
X-Received: by 2002:a81:a242:0:b0:568:928a:f482 with SMTP id
 z2-20020a81a242000000b00568928af482mr1598735ywg.24.1685437389317; Tue, 30 May
 2023 02:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <202305301407.z33zOjcG-lkp@intel.com>
In-Reply-To: <202305301407.z33zOjcG-lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 May 2023 11:02:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVM1UoJ=s0TvPVcwzvDe1dHxJehL90WacE8ieirNPNwYA@mail.gmail.com>
Message-ID: <CAMuHMdVM1UoJ=s0TvPVcwzvDe1dHxJehL90WacE8ieirNPNwYA@mail.gmail.com>
Subject: Re: [linux-stable-rc:queue/5.15 17/69] m68k-linux-ld: section .rodata
 VMA [00001000,0024925f] overlaps section .text VMA [00000400,00439aff]
To:     kernel test robot <lkp@intel.com>
Cc:     Finn Thain <fthain@linux-m68k.org>, oe-kbuild-all@lists.linux.dev,
        Sasha Levin <sashal@kernel.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Robot,

Thanks for your report!

On Tue, May 30, 2023 at 8:09 AM kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.15
> head:   45d082d2c0daa97f3ea394c47e705afdd1c621e0
> commit: 43f232d748d57057e2e9dd041907c55177c50cf2 [17/69] m68k: Move signal frame following exception on 68020/030
> config: m68k-randconfig-r035-20230530 (https://download.01.org/0day-ci/archive/20230530/202305301407.z33zOjcG-lkp@intel.com/config)

FTR, this is a CONFIG_M68000/CONFIG_M68EZ328 config.

> compiler: m68k-linux-gcc (GCC) 12.3.0
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=43f232d748d57057e2e9dd041907c55177c50cf2
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc queue/5.15
>         git checkout 43f232d748d57057e2e9dd041907c55177c50cf2
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305301407.z33zOjcG-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> m68k-linux-ld: section .rodata VMA [00001000,0024925f] overlaps section .text VMA [00000400,00439aff]

This is not a regression introduced by the aforementioned commit.
The same issue is present in 5.1.113, 5.1, and v6.4-rc4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
