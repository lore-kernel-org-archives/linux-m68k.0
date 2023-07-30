Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18729C0015E
	for <linux-m68k@archiver.kernel.org>; Sun, 30 Jul 2023 03:01:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjG3DBY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Jul 2023 23:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjG3DBW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 29 Jul 2023 23:01:22 -0400
Received: from mgamail.intel.com (unknown [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD5F1BFC
        for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Jul 2023 20:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690686080; x=1722222080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RSxpak/CfpPX42kY2c5dZ8PAH2kUUyDtkYnsnY9B9oY=;
  b=m+JkqOLZP/1bP8FZBqjLP28ZSpNEWG4aRG67k2vXbCvJzvAbtw83t3H6
   AI3q4kR54/nY9NNkbuzSZoEXk+KpL8z2EIkQLQsVhJcEAbtr75+F0nb4n
   jzKJl2dNmKUwOH2sgZmjIvlfwglPA/fXQ9cAwOnQNyq108vSrfCVaf0jf
   t8cUMEsRVJHZNFRg9GCDdVNkZcP3fM5Ur9YJqObcWnpX77xsZT1hhnBuN
   NJH+PpXSv8XTaJOevnha2CjGljwR5aQI1o+lubVjRjAHBLipCxAlDOtw/
   LD7U0uUDMsSTT1mKkU5F6aOoByCHkzI+gliI08beII9qXCVIhUmTbYFpf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="372438239"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="372438239"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 20:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="727869974"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="727869974"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Jul 2023 20:01:18 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPwgH-0004PB-1H;
        Sun, 30 Jul 2023 03:01:17 +0000
Date:   Sun, 30 Jul 2023 11:00:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [geert-m68k:master 1/2] drivers/usb/host/isp116x.h:419:15: sparse:
 sparse: cast to restricted __le16
Message-ID: <202307301003.8cQ3Oey6-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
head:   cd76bba726300611d2add29cb025db2b42d70b41
commit: 84fdf8f72e6db3433914e7de7c8e64d95dacaaef [1/2] m68k: atari: Make Atari ROM port I/O write macros return void
config: m68k-randconfig-r093-20230730 (https://download.01.org/0day-ci/archive/20230730/202307301003.8cQ3Oey6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307301003.8cQ3Oey6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307301003.8cQ3Oey6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/host/isp116x-hcd.c:137:55: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/usb/host/isp116x-hcd.c:137:55: sparse:     expected unsigned short [usertype] val
   drivers/usb/host/isp116x-hcd.c:137:55: sparse:     got restricted __le16 [usertype]
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c: note: in included file:
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:436:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:436:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:438:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:438:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:426:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:426:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:428:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:428:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:402:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x.h:419:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:396:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:390:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:410:15: sparse: sparse: cast removes address space '__iomem' of expression

vim +419 drivers/usb/host/isp116x.h

4808a1c0261176 Olav Kongas     2005-04-09  414  
4808a1c0261176 Olav Kongas     2005-04-09  415  static inline u16 isp116x_raw_read_data16(struct isp116x *isp116x)
4808a1c0261176 Olav Kongas     2005-04-09  416  {
4808a1c0261176 Olav Kongas     2005-04-09  417  	u16 val;
4808a1c0261176 Olav Kongas     2005-04-09  418  
2f0f9fcd96fa8d Michael Schmitz 2013-04-06 @419  	val = isp_raw_readw(isp116x->data_reg);
4808a1c0261176 Olav Kongas     2005-04-09  420  	isp116x_delay(isp116x, 150);
4808a1c0261176 Olav Kongas     2005-04-09  421  	return val;
4808a1c0261176 Olav Kongas     2005-04-09  422  }
4808a1c0261176 Olav Kongas     2005-04-09  423  

:::::: The code at line 419 was first introduced by commit
:::::: 2f0f9fcd96fa8dbeec54cce98170985f7b384a41 m68k/atari: USB - add ISP1160 USB host controller support

:::::: TO: Michael Schmitz <schmitzmic@gmail.com>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
