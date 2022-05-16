Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4162AC433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 16 May 2022 06:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238054AbiEPG2I (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 May 2022 02:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235673AbiEPG2G (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 16 May 2022 02:28:06 -0400
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D79C26AC2
        for <linux-m68k@vger.kernel.org>; Sun, 15 May 2022 23:28:05 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id jt15so11458328qvb.8
        for <linux-m68k@vger.kernel.org>; Sun, 15 May 2022 23:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1PCtaLVpioB+Dic5cN67+G57CPEYUl3WKqZTUV3CWJM=;
        b=BzVFsTf/ZWueSI5IAYGOc6FKT0Vh3h8Ojhqj9/bcRTvkK5iFpls/PGyRazmH7CDtO6
         R/CMiJBq20Hq5dXL4GNqSpMBYcW5koV5rar9Z4tVSH7+RY71ZjErXvrypF7tUoQ/4H+M
         7/YuVso1HPNLKsh/2OqzQavIefhsE6C/wlgat66ZocmAfNJLbXXoZy2jcwt5TLGM5jHm
         6Ord0UagU022WiTH82DRvdEGPYhZLczGlgx9FO8WEskCNBSKXj7RyjBN+9emaqHNQmN/
         r/9TUVQVOvjk8Ih/coVN6j9ZzTB1S9c/l3ekiDp5UgV7Yu4sBqlOP835j9y0uHGbryLC
         V22Q==
X-Gm-Message-State: AOAM531I+X1mdGodiUcOIpfgYGNFtKjYougISsvdBxTTDxC8d6RkaZ1e
        8b2jl9lm8khvEIIXFLgmX//F7Ufcb5rpiA==
X-Google-Smtp-Source: ABdhPJyIhwPSQZLvM4glw294WB8eBQs9pFpakLe7572aE5W0koJoMI+kDTYDDw+WpG2IgREqT6h96w==
X-Received: by 2002:a05:6214:268f:b0:45a:c52d:85ff with SMTP id gm15-20020a056214268f00b0045ac52d85ffmr13902694qvb.122.1652682484376;
        Sun, 15 May 2022 23:28:04 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id r13-20020ac867cd000000b002f39b99f6aasm5395030qtp.68.2022.05.15.23.28.03
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 May 2022 23:28:03 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id r11so25262214ybg.6
        for <linux-m68k@vger.kernel.org>; Sun, 15 May 2022 23:28:03 -0700 (PDT)
X-Received: by 2002:a05:6902:389:b0:633:31c1:d0f7 with SMTP id
 f9-20020a056902038900b0063331c1d0f7mr15697800ybs.543.1652682483608; Sun, 15
 May 2022 23:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220513075216.4112333-1-gerg@linux-m68k.org>
In-Reply-To: <20220513075216.4112333-1-gerg@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 May 2022 08:27:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMQbW_XbzzdUX9Ub7EcvBMn=BRRQ82X8q6N7UaMj-78w@mail.gmail.com>
Message-ID: <CAMuHMdVMQbW_XbzzdUX9Ub7EcvBMn=BRRQ82X8q6N7UaMj-78w@mail.gmail.com>
Subject: Re: [PATCH] m68knommu: fix undefined reference to `_init_sp'
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, May 14, 2022 at 4:33 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> When configuring a nommu classic m68k system enabling the uboot parameter
> passing support (CONFIG_UBOOT) will produce the following compile error:
>
>    m68k-linux-ld: arch/m68k/kernel/uboot.o: in function `process_uboot_commandline':
>    uboot.c:(.init.text+0x32): undefined reference to `_init_sp'
>
> The logic to support this option is only used on ColdFire based platforms
> (in its head.S startup code). So make the selection of this option
> depend on building for a ColdFire based platform.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
