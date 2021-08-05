Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C044C4338F
	for <linux-m68k@archiver.kernel.org>; Thu,  5 Aug 2021 06:46:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BFF160EC0
	for <linux-m68k@archiver.kernel.org>; Thu,  5 Aug 2021 06:46:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237870AbhHEGq0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 5 Aug 2021 02:46:26 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:42021 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbhHEGq0 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Aug 2021 02:46:26 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MtOOm-1n0btc29Ne-00usHC for <linux-m68k@vger.kernel.org>; Thu, 05 Aug
 2021 08:46:10 +0200
Received: by mail-wr1-f52.google.com with SMTP id n12so5055357wrr.2
        for <linux-m68k@vger.kernel.org>; Wed, 04 Aug 2021 23:46:10 -0700 (PDT)
X-Gm-Message-State: AOAM531ulFdrhe4ZWEadcVjq1lty5GJJOysG0k5L/5t8Q7NxnBtAoKo4
        FiEjgv0dsAoNbPI/X16oy3YB70twQ+bPTkHOfZQ=
X-Google-Smtp-Source: ABdhPJyxgj8VIAwqZDTBChx9JSU3D2TgK9tXtdv41Bto0HO/Dh2DmlkqO4kPCcds3kEGPU1qkuE5cs68sRfYrNll2bs=
X-Received: by 2002:a5d:44c7:: with SMTP id z7mr3409608wrr.286.1628145970199;
 Wed, 04 Aug 2021 23:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <202108050531.p7zYKip9-lkp@intel.com>
In-Reply-To: <202108050531.p7zYKip9-lkp@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 5 Aug 2021 08:45:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Z3eXV=H99z2TDzAXLqY64aS5qB3Zo=sEPHZYVfntqbg@mail.gmail.com>
Message-ID: <CAK8P3a1Z3eXV=H99z2TDzAXLqY64aS5qB3Zo=sEPHZYVfntqbg@mail.gmail.com>
Subject: Re: [linux-next:master 4771/5318] drivers/net/ethernet/cirrus/cs89x0.c:914:3:
 error: implicit declaration of function 'disable_dma'; did you mean 'disable_irq'?
To:     kernel test robot <lkp@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:m7R8ij1apdbKFV8W6Z0MVb5emiB7iIKhZflrxWOxZzGWawfieWi
 wm6IGAnhz2pOUbvGyi51Ve0hhsIErEJ93+/XpKqwbrVbQ46FsYGLPw+MTu6eNFN/4nqw2BW
 S0LNy+NSo7iLXXGDCRjXs/HUR1OUYoRgNdBhpXLr0lwJYzxokh0bqsTC3s5QBoChYctSEQ6
 ySWMVptNOncwUbpBcvEjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GIyZAYXH7S8=:jfey3YrxqV3qVJ6oEbMdpy
 +1rYR8Xqo8ko2GqE626Zg1rAeoZWGUVjqlImEFC6OQ3PgIPzAOamWiisMFSL0DC03r9y1PThp
 Fls12iAkZ5GNnXU1punDme1ZA8UHpK9kIuRg97rmMhvmoBJM9JoL+SCrklHT2SZ/MzJEWigRk
 X+xTgVmYzqVJToTj2AgTXeH5haRJn7qOE0D5VvDWQesSxg93HRSCC70eOuWEFvei5RxyU6blm
 3j3QGdAxfmm5wxyzgkuDoZFa4Enzgh5/Db0tFFwcO4Z9PgLXsvdff0MCJ0p4K2Ifk1N7FEjuD
 1GPrPdihSMxRiTUEb7nC+2h0vVkIb3JLw1R/F0MI669kdaH5o/RswcsiKLhdcZKAp+G61m+60
 +agUy9m77w8hCYyhUEqdP/NWbf+EbYcmwLawRe7TbDWCxQ+HK64Dcwj6rekSH+3qZHsiHFVk9
 0mfp6jYAw1B5Yh0HLKIIjnC03TOt0vxANWxaMnzk+7/woABxzw0Cp2nUbhjiqGcmo9tuAQ1PD
 2gdmsj6eUxJyCYR8Mfd3is+p+BEQJNb4P0P6SoCJG56hI2ZZ/ke8tmA2dCjnTmX1yA2sF4wyK
 5fXzT7sNB77gZo6rSJNelEhlSMp6LICA62pXmXbUYdfxERPADPCNepEeiLcSEk9cgi71fyYO2
 Lhw5Pja35qulhL3BCMmKuKpzcTBWnggi7a2jOarkIQD4Vlc3jW8IqxgJG9V/1OzTBXe3Aj2mp
 EXNs/40jQdq8r5zA6mfq7uQajsMWwQ/+RHsdMK3F8I+qYSX1cumGE2265nTclrPDvP0B88zwz
 ptGRL+ycMOWBuFwxD3KtYXoGFScKWWfC/n2ef4SYPdW8QNOFsYOJqB8NOmlU2VMuoMBQpf4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Aug 4, 2021 at 11:15 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Arnd,
>
> First bad commit (maybe != root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2f73937c9aa561e2082839bc1a8efaac75d6e244
> commit: 47fd22f2b84765a2f7e3f150282497b902624547 [4771/5318] cs89x0: rework driver configuration
> config: m68k-randconfig-c003-20210804 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 10.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=47fd22f2b84765a2f7e3f150282497b902624547
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 47fd22f2b84765a2f7e3f150282497b902624547
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross ARCH=m68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/linux/kernel.h:19,
>                     from include/linux/list.h:9,
>                     from include/linux/module.h:12,
>                     from drivers/net/ethernet/cirrus/cs89x0.c:51:
>    drivers/net/ethernet/cirrus/cs89x0.c: In function 'net_open':
>    drivers/net/ethernet/cirrus/cs89x0.c:897:20: error: implicit declaration of function 'isa_virt_to_bus'; did you mean 'virt_to_bus'? [-Werror=implicit-function-declaration]
>      897 |     (unsigned long)isa_virt_to_bus(lp->dma_buff));
>          |                    ^~~~~~~~~~~~~~~
>    include/linux/printk.h:141:17: note: in definition of macro 'no_printk'
>      141 |   printk(fmt, ##__VA_ARGS__);  \
>          |                 ^~~~~~~~~~~
>    drivers/net/ethernet/cirrus/cs89x0.c:86:3: note: in expansion of macro 'pr_debug'
>       86 |   pr_##level(fmt, ##__VA_ARGS__);   \
>          |   ^~~
>    drivers/net/ethernet/cirrus/cs89x0.c:894:3: note: in expansion of macro 'cs89_dbg'
>      894 |   cs89_dbg(1, debug, "%s: dma %lx %lx\n",
>          |   ^~~~~~~~
> >> drivers/net/ethernet/cirrus/cs89x0.c:914:3: error: implicit declaration of function 'disable_dma'; did you mean 'disable_irq'? [-Werror=implicit-function-declaration]

As far as I can tell, this is a bug with the m68kmmu architecture, not
with my driver:
The CONFIG_ISA_DMA_API option is provided for coldfire, which implements it,
but dragonball also sets the option as a side-effect, without actually
implementing
the interfaces. The patch below should fix it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
index f1be832e2b74..d1e93a39cd3b 100644
--- a/arch/m68k/Kconfig.bus
+++ b/arch/m68k/Kconfig.bus
@@ -63,7 +63,7 @@ source "drivers/zorro/Kconfig"

 endif

-if !MMU
+if COLDFIRE

 config ISA_DMA_API
        def_bool !M5272
