Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3781C4332F
	for <linux-m68k@archiver.kernel.org>; Wed, 20 Apr 2022 20:05:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381986AbiDTUHu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 20 Apr 2022 16:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382070AbiDTUHk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 20 Apr 2022 16:07:40 -0400
X-Greylist: delayed 38962 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 20 Apr 2022 13:04:51 PDT
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DDA1029
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Apr 2022 13:04:50 -0700 (PDT)
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N1xZX-1nsaBE0a1R-012K7E for <linux-m68k@lists.linux-m68k.org>; Wed, 20
 Apr 2022 22:04:49 +0200
Received: by mail-wr1-f48.google.com with SMTP id w4so3708413wrg.12
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Apr 2022 13:04:49 -0700 (PDT)
X-Gm-Message-State: AOAM532fl6+V5iWvNWV06ew6dLGPnqogN5ANapuIwFGSN8gepdiNfOdj
        6Y8iZttv0YDkjg5NsYI4IHuJ4FJIHe7PduCsQh0=
X-Google-Smtp-Source: ABdhPJzQqXetCmaGkZ0VLDQKkxSmuQBexNxn4+LtaoO2pmxTQhac0Nj1iF3iDiepN/wJPA+ZQPYKZ600Fq7P1vAaoZE=
X-Received: by 2002:adf:e106:0:b0:20a:b31b:213d with SMTP id
 t6-20020adfe106000000b0020ab31b213dmr2425684wrz.219.1650485088720; Wed, 20
 Apr 2022 13:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <mhng-32cab6aa-87a3-4a5c-bf83-836c25432fdd@palmer-ri-x1c9>
 <20220420165935.GA12207@brightrain.aerifal.cx> <202204201044.ACFEB0C@keescook>
In-Reply-To: <202204201044.ACFEB0C@keescook>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 20 Apr 2022 22:04:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2KvK78bbW_5DWKsrxLvKxYDqoCkii-kxi-mB7W9DCvNA@mail.gmail.com>
Message-ID: <CAK8P3a2KvK78bbW_5DWKsrxLvKxYDqoCkii-kxi-mB7W9DCvNA@mail.gmail.com>
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
To:     Kees Cook <keescook@chromium.org>
Cc:     Rich Felker <dalias@libc.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Niklas.Cassel@wdc.com, Al Viro <viro@zeniv.linux.org.uk>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Mike Frysinger <vapier@gentoo.org>,
        "# 3.4.x" <stable@vger.kernel.org>,
        Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vazAsgwJflSB8Kl2VWKEjFHoznbIwrYROnrYAlX1FR45ueXSEcj
 AuhCTePvOtwI2luN5pwcmHDKJPswRAx/jaqZjRqAPivij9EwDSaWIQXyW4JKMAntCrEXs1r
 ummnWjhYKrCkqFDqiZqvUlbjlZrQH6FnXasHFSPtXmLFOaQ/W018mu+eHtNe00RidLD4oyz
 tYszwdNVBvPhCPljLyIbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uvKwJKiBDbA=:W+QqJAaXGKOtJHpm9llb2Q
 iaDzYZa3OGFAmzPminS0F9QWCxmYm7oUuOsGguYhWWebBJjX+7Gj9uFW3K4G/8APJU06VsqOc
 pZLHwhJdND/7YVtdsgjy86CFHKY9ivlZjAsSWehTPjC5/A2k7UwLWYUsE6Vizqx2CRc29pBkJ
 iB6SGDK1G5485oVGw0L3EeI0eFLbO+lcVenJooPhHSCrJ1FMIdDpEifbxiaHww379WEMPC+Bw
 8mqXA/d6BwacIdgdN8dR0BOvUtaiSiwQtIdD05dWH9wqP3+f8Lpi8oyVViiB8LbO3CUQMWp76
 0cRxCJtlHS4ohHDTArDqzOtmabzyFTKlh8PCi1ZlQeRJwTpta7nZ/Sha8xXaEno0RDsALWsGb
 ZqaajpBGFldWXqr3diyBooKN8I+xi1TrurloKVHEyxcuyo54wD1IRHrXEFyEkZabs/96qmti0
 113zI52plXvJhowL3YHOT8rTLz8gVfcujYN6wjHkJUScDTZmPeU6blhGPH8kKbSCPLV6tB90J
 Nh+T4SOOaydg9SsxNauKMqHzLtMmKRzm9sF4GDMhnw4W/WYbCocPd0YcAkKdpqqtjHw0ky2jv
 dCFdllpFvSzZLjX+F/ojueWopCKfi7nt+kMZ46Pwxh8v0DJqlEXPDk3yko7qTDRwqn22kGfbA
 VgugH98CM2yDVmDKfX3c97Zs6a0NTfa2+CVWMhoPKPWS25wWAKgSIVj/kzQerQLdUS6xhPUjw
 ftZ4O6DxRZDTHrdIs/2jRoheVO72Ic06hHYsZZT6REfSZWWC0C/K3jrbOwHuJ20fSbUeH/UZj
 Ht6mA1F+OQD8DUChkOAt4qzjqE7Tvb1NLcn2Ip2VpFJxHJ+dOs=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Apr 20, 2022 at 7:47 PM Kees Cook <keescook@chromium.org> wrote:
>
> Yeah, I was trying to understand why systems were using binfmt_flat and
> not binfmt_elf, given the mention of elf2flat -- is there really such a
> large kernel memory footprint savings to be had from removing
> binfmt_elf?

I think the main reason for using flat binaries is nommu support on
m68k, xtensa and risc-v. The regular binfmt_elf support requires
an MMU, and the elf-fdpic variant is only available for arm and sh
at this point (the other nommu architectures got removed over time).

        Arnd
