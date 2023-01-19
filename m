Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF292C38159
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Jan 2023 05:14:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbjATFOB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Jan 2023 00:14:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjATFNs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Jan 2023 00:13:48 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4029BD175
        for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Jan 2023 21:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674190927; x=1705726927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fSk95QAuUTqmlrBucA2/5hj/b+IHKynrjBnK8AFM3A4=;
  b=V5jmA+OGXeoulNASIPSTS0jFutFF8RiDSjV3kyFj4XV0qf3uiGNtSX/Y
   8TsZxqeaLhSe7mBRwCwsiL+YM6O1tj0scIwRC2vZvWDt9JmUleDcwSkVp
   4nQZ7zQUVqPrWmJi/JB4/rlTJqmJc7d4wy0RcLfbwSkb55CsB8nwOpC0W
   CguaT+Uh8RW2J3Uy94Twgz17kD+D+EBXO9TIIyfxRm3dSZXdT46FhiMGD
   AHEtrCtNI77TPCszVcbJhA8TL4WT2lS2nIMz7OSs4ZLLLpq0/92wd45lF
   pfag/z8NkPLeCq9eim2/YUdJxdx2Yw9cdnAei3332mWbqi+d3Ozp4KsxW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="308937846"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="308937846"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 09:44:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="728795398"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="728795398"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2023 09:44:03 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pIYxG-0001gi-2j;
        Thu, 19 Jan 2023 17:44:02 +0000
Date:   Fri, 20 Jan 2023 01:43:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Greg Ungerer <gerg@uclinux.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3]
 arch/arm/include/asm/glue-cache.h:126:2: error: #error Unknown cache
 maintenance model
Message-ID: <202301200141.KvEj5eit-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   667bf6b32356ac9ee1f89433d919f17ace3bb899
commit: 667bf6b32356ac9ee1f89433d919f17ace3bb899 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-c023-20230119 (https://download.01.org/0day-ci/archive/20230120/202301200141.KvEj5eit-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git/commit/?id=667bf6b32356ac9ee1f89433d919f17ace3bb899
        git remote add gerg-m68knommu https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
        git fetch --no-tags gerg-m68knommu armnommu
        git checkout 667bf6b32356ac9ee1f89433d919f17ace3bb899
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

         |       ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/list.h:11,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14:
   arch/arm/include/asm/barrier.h: At top level:
   arch/arm/include/asm/barrier.h:9:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
       9 | #if __LINUX_ARM_ARCH__ >= 7 ||          \
         |     ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/barrier.h:10:10: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      10 |         (__LINUX_ARM_ARCH__ == 6 && defined(CONFIG_CPU_32v6K))
         |          ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/barrier.h:18:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      18 | #if __LINUX_ARM_ARCH__ >= 7
         |     ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/barrier.h:28:35: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      28 | #elif defined(CONFIG_CPU_XSC3) || __LINUX_ARM_ARCH__ == 6
         |                                   ^~~~~~~~~~~~~~~~~~
   In file included from arch/arm/include/asm/processor.h:17,
                    from include/linux/prefetch.h:15,
                    from arch/arm/include/asm/atomic.h:12,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11:
   arch/arm/include/asm/vdso/processor.h:10:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      10 | #if __LINUX_ARM_ARCH__ == 6 || defined(CONFIG_ARM_ERRATA_754327)
         |     ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/processor.h:107:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
     107 | #if __LINUX_ARM_ARCH__ >= 5
         |     ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/irqflags.h:16,
                    from arch/arm/include/asm/atomic.h:14:
   arch/arm/include/asm/irqflags.h:22:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      22 | #if __LINUX_ARM_ARCH__ >= 6
         |     ^~~~~~~~~~~~~~~~~~
   In file included from arch/arm/include/asm/atomic.h:16:
   arch/arm/include/asm/cmpxchg.h: In function '__xchg':
   arch/arm/include/asm/cmpxchg.h:35:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      35 | #if __LINUX_ARM_ARCH__ >= 6
         |     ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/cmpxchg.h:42:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      42 | #if __LINUX_ARM_ARCH__ >= 6
         |     ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/cmpxchg.h: At top level:
   arch/arm/include/asm/cmpxchg.h:124:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
     124 | #if __LINUX_ARM_ARCH__ < 6
         |     ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/atomic.h:28:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      28 | #if __LINUX_ARM_ARCH__ >= 6
         |     ^~~~~~~~~~~~~~~~~~
   In file included from arch/arm/include/asm/swab.h:19,
                    from include/uapi/linux/swab.h:8,
                    from include/linux/swab.h:5,
                    from arch/arm/include/asm/opcodes.h:86,
                    from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27:
   arch/arm/include/uapi/asm/swab.h:27:29: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      27 | #if !defined(__KERNEL__) || __LINUX_ARM_ARCH__ < 6
         |                             ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/swab.h:21:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      21 | #if __LINUX_ARM_ARCH__ >= 6
         |     ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27:
   arch/arm/include/asm/bitops.h:218:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
     218 | #if __LINUX_ARM_ARCH__ < 5
         |     ^~~~~~~~~~~~~~~~~~
   In file included from arch/arm/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60:
   arch/arm/include/asm/fpstate.h:29:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      29 | #if __LINUX_ARM_ARCH__ < 6
         |     ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:740,
                    from arch/arm/kernel/asm-offsets.c:12:
   arch/arm/include/asm/uaccess.h:302:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
     302 | #if __LINUX_ARM_ARCH__ >= 6
         |     ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:404:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
     404 | #if __LINUX_ARM_ARCH__ >= 6
         |     ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:10,
                    from arch/arm/kernel/asm-offsets.c:13:
   arch/arm/include/asm/io.h:53:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      53 | #if __LINUX_ARM_ARCH__ < 6
         |     ^~~~~~~~~~~~~~~~~~
   In file included from arch/arm/include/asm/cacheflush.h:12,
                    from arch/arm/kernel/asm-offsets.c:14:
>> arch/arm/include/asm/glue-cache.h:126:2: error: #error Unknown cache maintenance model
     126 | #error Unknown cache maintenance model
         |  ^~~~~
   In file included from arch/arm/include/asm/cacheflush.h:14:
   arch/arm/include/asm/cachetype.h:29:5: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      29 | #if __LINUX_ARM_ARCH__ >= 7
         |     ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/cachetype.h:34:7: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
      34 | #elif __LINUX_ARM_ARCH__ >= 6
         |       ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/cacheflush.h:197:7: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
     197 | #elif __LINUX_ARM_ARCH__ >= 7 && defined(CONFIG_SMP)
         |       ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/cacheflush.h:199:7: warning: "__LINUX_ARM_ARCH__" is not defined, evaluates to 0 [-Wundef]
     199 | #elif __LINUX_ARM_ARCH__ == 6 && defined(CONFIG_ARM_ERRATA_411920)
         |       ^~~~~~~~~~~~~~~~~~
   In file included from arch/arm/kernel/asm-offsets.c:16:
>> arch/arm/include/asm/glue-df.h:96:2: error: #error Unknown data abort handler type
      96 | #error Unknown data abort handler type
         |  ^~~~~
   In file included from arch/arm/kernel/asm-offsets.c:17:
>> arch/arm/include/asm/glue-pf.h:51:2: error: #error Unknown prefetch abort handler type
      51 | #error Unknown prefetch abort handler type
         |  ^~~~~
   make[2]: *** [scripts/Makefile.build:114: arch/arm/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +126 arch/arm/include/asm/glue-cache.h

55bdd694116597 Catalin Marinas 2010-05-21  124  
753790e713d80b Russell King    2011-02-06  125  #if !defined(_CACHE) && !defined(MULTI_CACHE)
25985edcedea63 Lucas De Marchi 2011-03-30 @126  #error Unknown cache maintenance model
753790e713d80b Russell King    2011-02-06  127  #endif
753790e713d80b Russell King    2011-02-06  128  

:::::: The code at line 126 was first introduced by commit
:::::: 25985edcedea6396277003854657b5f3cb31a628 Fix common misspellings

:::::: TO: Lucas De Marchi <lucas.demarchi@profusion.mobi>
:::::: CC: Lucas De Marchi <lucas.demarchi@profusion.mobi>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
