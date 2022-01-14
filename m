Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278A1C433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 14 Jan 2022 04:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233312AbiANEv2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 13 Jan 2022 23:51:28 -0500
Received: from mga06.intel.com ([134.134.136.31]:55416 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233086AbiANEv2 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 13 Jan 2022 23:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642135888; x=1673671888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ftiXt+A5FqoSllsgjd1y+CGKiwwHEZfFWIE2pVDmd+w=;
  b=gLFyQNZ/IIVIT7q/MfyQ3YA4LBgsC2h8QmKd0Hez+zwEvU7oN7SfZ/Tk
   QGnHM3Hxe7z8jIB4yHgwdQtSHjQQ2Pj98QIPMcPFq29DHmSIcOTRonsnA
   ohPVRsf3Y8KWlqJADEz5hMNWO5h7LSMUVFSpyiGRJEoSqe7G4R+z6Nv6q
   6IhBGpi6las7dzPngp0x3bcg4AELcPFeAW7sY9ZoPlxkDjV28W2ajgaMD
   e2bR72nSkZhZFsmK709i+kcanzp/bqY/jja0Y04f7Q1F3IvgsKM6q7raG
   Qh1C3ymth9wS8W28BTL4MmbZgxvsO1rxj+B3b9ZFc4CCo+JijIbH7ZTJP
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="304915077"
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; 
   d="scan'208";a="304915077"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 20:51:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; 
   d="scan'208";a="765768402"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Jan 2022 20:51:24 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n8EYd-000876-PK; Fri, 14 Jan 2022 04:51:23 +0000
Date:   Fri, 14 Jan 2022 12:50:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Laurent Vivier <laurent@vivier.eu>, linux-kernel@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Thomas Gleixner <tglx@linutronix.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-m68k@lists.linux-m68k.org,
        John Stultz <john.stultz@linaro.org>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6 3/4] clocksource/drivers: Add a goldfish-timer
 clocksource
Message-ID: <202201141238.HZZyqTBE-lkp@intel.com>
References: <20220113201920.3201760-4-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113201920.3201760-4-laurent@vivier.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Laurent,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on geert-m68k/for-next]
[also build test WARNING on linux/master v5.16]
[cannot apply to tip/timers/core linus/master next-20220113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Laurent-Vivier/m68k-Add-Virtual-M68k-Machine/20220114-042103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20220114/202201141238.HZZyqTBE-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7e887e6ec0d7193083a2f0020007688db2318c76
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Laurent-Vivier/m68k-Add-Virtual-M68k-Machine/20220114-042103
        git checkout 7e887e6ec0d7193083a2f0020007688db2318c76
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=s390 SHELL=/bin/bash drivers/clocksource/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/clocksource/timer-goldfish.c: In function 'goldfish_timer_init':
   drivers/clocksource/timer-goldfish.c:94:20: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'? [-Werror=implicit-function-declaration]
      94 |         timerdrv = kzalloc(sizeof(*timerdrv), GFP_KERNEL);
         |                    ^~~~~~~
         |                    vzalloc
>> drivers/clocksource/timer-goldfish.c:94:18: warning: assignment to 'struct goldfish_timer *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      94 |         timerdrv = kzalloc(sizeof(*timerdrv), GFP_KERNEL);
         |                  ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RTC_CLASS
   Depends on !S390
   Selected by
   - GOLDFISH_TIMER && GENERIC_CLOCKEVENTS
   WARNING: unmet direct dependencies detected for RTC_DRV_GOLDFISH
   Depends on RTC_CLASS && HAS_IOMEM
   Selected by
   - GOLDFISH_TIMER && GENERIC_CLOCKEVENTS


vim +94 drivers/clocksource/timer-goldfish.c

    88	
    89	void __init goldfish_timer_init(int irq, void __iomem *base)
    90	{
    91		struct goldfish_timer *timerdrv;
    92		int ret;
    93	
  > 94		timerdrv = kzalloc(sizeof(*timerdrv), GFP_KERNEL);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
