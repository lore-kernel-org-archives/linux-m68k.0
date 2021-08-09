Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0578FC432BE
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Aug 2021 08:00:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D76836105A
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Aug 2021 08:00:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233749AbhHIIAv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Aug 2021 04:00:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:48698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233744AbhHIIAr (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 9 Aug 2021 04:00:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9FAD60462;
        Mon,  9 Aug 2021 08:00:25 +0000 (UTC)
Subject: Re: [linux-next:master 4771/5318]
 drivers/net/ethernet/cirrus/cs89x0.c:914:3: error: implicit declaration of
 function 'disable_dma'; did you mean 'disable_irq'?
To:     Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <202108050531.p7zYKip9-lkp@intel.com>
 <CAK8P3a1Z3eXV=H99z2TDzAXLqY64aS5qB3Zo=sEPHZYVfntqbg@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <5734a1f8-54c9-ebfb-11e3-f884e9131266@linux-m68k.org>
Date:   Mon, 9 Aug 2021 18:00:23 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1Z3eXV=H99z2TDzAXLqY64aS5qB3Zo=sEPHZYVfntqbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

On 5/8/21 4:45 pm, Arnd Bergmann wrote:
> On Wed, Aug 4, 2021 at 11:15 PM kernel test robot <lkp@intel.com> wrote:
>>
>> Hi Arnd,
>>
>> First bad commit (maybe != root cause):
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   2f73937c9aa561e2082839bc1a8efaac75d6e244
>> commit: 47fd22f2b84765a2f7e3f150282497b902624547 [4771/5318] cs89x0: rework driver configuration
>> config: m68k-randconfig-c003-20210804 (attached as .config)
>> compiler: m68k-linux-gcc (GCC) 10.3.0
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=47fd22f2b84765a2f7e3f150282497b902624547
>>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>          git fetch --no-tags linux-next master
>>          git checkout 47fd22f2b84765a2f7e3f150282497b902624547
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross ARCH=m68k
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     In file included from include/linux/kernel.h:19,
>>                      from include/linux/list.h:9,
>>                      from include/linux/module.h:12,
>>                      from drivers/net/ethernet/cirrus/cs89x0.c:51:
>>     drivers/net/ethernet/cirrus/cs89x0.c: In function 'net_open':
>>     drivers/net/ethernet/cirrus/cs89x0.c:897:20: error: implicit declaration of function 'isa_virt_to_bus'; did you mean 'virt_to_bus'? [-Werror=implicit-function-declaration]
>>       897 |     (unsigned long)isa_virt_to_bus(lp->dma_buff));
>>           |                    ^~~~~~~~~~~~~~~
>>     include/linux/printk.h:141:17: note: in definition of macro 'no_printk'
>>       141 |   printk(fmt, ##__VA_ARGS__);  \
>>           |                 ^~~~~~~~~~~
>>     drivers/net/ethernet/cirrus/cs89x0.c:86:3: note: in expansion of macro 'pr_debug'
>>        86 |   pr_##level(fmt, ##__VA_ARGS__);   \
>>           |   ^~~
>>     drivers/net/ethernet/cirrus/cs89x0.c:894:3: note: in expansion of macro 'cs89_dbg'
>>       894 |   cs89_dbg(1, debug, "%s: dma %lx %lx\n",
>>           |   ^~~~~~~~
>>>> drivers/net/ethernet/cirrus/cs89x0.c:914:3: error: implicit declaration of function 'disable_dma'; did you mean 'disable_irq'? [-Werror=implicit-function-declaration]
> 
> As far as I can tell, this is a bug with the m68kmmu architecture, not
> with my driver:
> The CONFIG_ISA_DMA_API option is provided for coldfire, which implements it,
> but dragonball also sets the option as a side-effect, without actually
> implementing
> the interfaces. The patch below should fix it.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
> index f1be832e2b74..d1e93a39cd3b 100644
> --- a/arch/m68k/Kconfig.bus
> +++ b/arch/m68k/Kconfig.bus
> @@ -63,7 +63,7 @@ source "drivers/zorro/Kconfig"
> 
>   endif
> 
> -if !MMU
> +if COLDFIRE
> 
>   config ISA_DMA_API
>          def_bool !M5272
> 

Yes I think that is right.
Though this does mean now that the ColdFire with MMU has this turned on.
I think that is ok.

I'll apply to the m68knommu git tree, for-next branch.

Regards
Greg

