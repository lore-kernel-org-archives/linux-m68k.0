Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E115EC001DC
	for <linux-m68k@archiver.kernel.org>; Sun, 30 Jul 2023 00:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbjG3A1f (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Jul 2023 20:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjG3A1e (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 29 Jul 2023 20:27:34 -0400
Received: from mgamail.intel.com (unknown [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73D21708
        for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Jul 2023 17:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690676852; x=1722212852;
  h=date:from:cc:subject:message-id:mime-version;
  bh=OuzcrPy0T2l72WTHFir/aJWL0QGdRasCj9tiY3HRa7g=;
  b=TaUhmfdNWkMv4cT4InQj/TmW9A0V0XnXTeCiGGrrpz+LuRdylod35O6z
   UKWS/dimcGQeYNAGlUSUsvuurZA4k4FFYtIcvcWDhwgcLIXNXI9DFzxNe
   rjb9flnfoD6y3vRx1NpivEfUPhouKmUR/1eSTSgGAaiCMXSYG6ECuAIgS
   aBG+Z1xqpPYsyKFx36q50DfOPtuJ3eKnUxNyE0OPiRcSGxfEFIMXJ9yv1
   bavYHcG/a1UEy1H75lSDbla9fTZVnIHX1RrmCK2phghjU0nYZXIy7oPLv
   CnoCmy+4l03pG9sR8cublCIQAZPhpwzlhMsjoxz0X32M3GQ02CNDxNpWU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="455162211"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="455162211"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 17:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="762950067"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="762950067"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Jul 2023 17:27:30 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPuHR-0004Lz-1e;
        Sun, 30 Jul 2023 00:27:29 +0000
Date:   Sun, 30 Jul 2023 08:26:47 +0800
From:   kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [geert-m68k:master 1282/1440] drivers/usb/host/isp116x.h:411:15:
 sparse: sparse: cast removes address space '__iomem' of expression
Message-ID: <202307300829.lIyWQvDG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
head:   cd76bba726300611d2add29cb025db2b42d70b41
commit: b971c823ecb945e93fbe49e98884e4ef9ee5e859 [1282/1440] Merge tag 'v5.8-rc2'
config: m68k-randconfig-r093-20230730 (https://download.01.org/0day-ci/archive/20230730/202307300829.lIyWQvDG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300829.lIyWQvDG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307300829.lIyWQvDG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/host/isp116x-hcd.c:137:55: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/usb/host/isp116x-hcd.c:137:55: sparse:     expected unsigned short [usertype] val
   drivers/usb/host/isp116x-hcd.c:137:55: sparse:     got restricted __le16 [usertype]
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c:184:34: sparse: sparse: cast to restricted __le16
   drivers/usb/host/isp116x-hcd.c: note: in included file:
>> drivers/usb/host/isp116x.h:411:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/host/isp116x.h:411:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:391:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:391:9: sparse:    void
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:391:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:391:9: sparse:    void
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:391:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:391:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:391:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:391:9: sparse:    void
   drivers/usb/host/isp116x.h:427:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:427:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:427:9: sparse:    void
   drivers/usb/host/isp116x.h:429:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:429:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:429:9: sparse:    void
   drivers/usb/host/isp116x.h:403:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:403:9: sparse:    int
   drivers/usb/host/isp116x.h:403:9: sparse:    void
   drivers/usb/host/isp116x.h:403:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:403:9: sparse:    int
   drivers/usb/host/isp116x.h:403:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:403:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:403:9: sparse:    int
   drivers/usb/host/isp116x.h:403:9: sparse:    void
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:391:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:391:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:397:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:397:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:397:9: sparse:    void
   drivers/usb/host/isp116x.h:391:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/usb/host/isp116x.h:391:9: sparse:    unsigned short
   drivers/usb/host/isp116x.h:391:9: sparse:    void

vim +/__iomem +411 drivers/usb/host/isp116x.h

4808a1c0261176 Olav Kongas     2005-04-09  406  
4808a1c0261176 Olav Kongas     2005-04-09  407  static inline u16 isp116x_read_data16(struct isp116x *isp116x)
4808a1c0261176 Olav Kongas     2005-04-09  408  {
4808a1c0261176 Olav Kongas     2005-04-09  409  	u16 val;
4808a1c0261176 Olav Kongas     2005-04-09  410  
2f0f9fcd96fa8d Michael Schmitz 2013-04-06 @411  	val = isp_readw(isp116x->data_reg);
4808a1c0261176 Olav Kongas     2005-04-09  412  	isp116x_delay(isp116x, 150);
4808a1c0261176 Olav Kongas     2005-04-09  413  	return val;
4808a1c0261176 Olav Kongas     2005-04-09  414  }
4808a1c0261176 Olav Kongas     2005-04-09  415  

:::::: The code at line 411 was first introduced by commit
:::::: 2f0f9fcd96fa8dbeec54cce98170985f7b384a41 m68k/atari: USB - add ISP1160 USB host controller support

:::::: TO: Michael Schmitz <schmitzmic@gmail.com>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
