Return-Path: <SRS0=kwK6=CQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8420EC43461
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 06:24:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53CD1215A4
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 06:24:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgIGGY7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Sep 2020 02:24:59 -0400
Received: from verein.lst.de ([213.95.11.211]:47782 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725823AbgIGGY6 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Sep 2020 02:24:58 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8033D6736F; Mon,  7 Sep 2020 08:24:56 +0200 (CEST)
Date:   Mon, 7 Sep 2020 08:24:56 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     kernel test robot <lkp@intel.com>
Cc:     Christoph Hellwig <hch@lst.de>, kbuild-all@lists.01.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: [char-misc:char-misc-next 28/28] drivers/char/mem.c:737:21:
 sparse: sparse: incorrect type in argument 1 (different address
 spaces)
Message-ID: <20200907062456.GA19124@lst.de>
References: <202009060512.tOc1hWe8%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202009060512.tOc1hWe8%lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Sep 06, 2020 at 05:14:15AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
> head:   99f667352f6c938440d9043d0f66f859d6f3d50d
> commit: 99f667352f6c938440d9043d0f66f859d6f3d50d [28/28] /dev/zero: also implement ->read
> config: m68k-randconfig-s031-20200904 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0

Looks like m68 does not have proper __user annotations for clear_user..

> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.2-191-g10164920-dirty
>         git checkout 99f667352f6c938440d9043d0f66f859d6f3d50d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=m68k 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> 
> sparse warnings: (new ones prefixed by >>)
> 
>    drivers/char/mem.c:163:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got char [noderef] __user *buf @@
>    drivers/char/mem.c:163:37: sparse:     expected void *to
>    drivers/char/mem.c:163:37: sparse:     got char [noderef] __user *buf
> >> drivers/char/mem.c:737:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got char [noderef] __user * @@
>    drivers/char/mem.c:737:21: sparse:     expected void *to
> >> drivers/char/mem.c:737:21: sparse:     got char [noderef] __user *
> 
> # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/?id=99f667352f6c938440d9043d0f66f859d6f3d50d
> git remote add char-misc https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
> git fetch --no-tags char-misc char-misc-next
> git checkout 99f667352f6c938440d9043d0f66f859d6f3d50d
> vim +737 drivers/char/mem.c
> 
>    728	
>    729	static ssize_t read_zero(struct file *file, char __user *buf,
>    730				 size_t count, loff_t *ppos)
>    731	{
>    732		size_t cleared = 0;
>    733	
>    734		while (count) {
>    735			size_t chunk = min_t(size_t, count, PAGE_SIZE);
>    736	
>  > 737			if (clear_user(buf + cleared, chunk))
>    738				return cleared ? cleared : -EFAULT;
>    739			cleared += chunk;
>    740			count -= chunk;
>    741	
>    742			if (signal_pending(current))
>    743				return cleared ? cleared : -ERESTARTSYS;
>    744			cond_resched();
>    745		}
>    746	
>    747		return cleared;
>    748	}
>    749	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


---end quoted text---
