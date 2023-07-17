Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1808EB64DC
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Jul 2023 22:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjGQW3P (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Jul 2023 18:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjGQW3O (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 Jul 2023 18:29:14 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6031B99
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Jul 2023 15:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689632953; x=1721168953;
  h=date:from:to:cc:subject:message-id;
  bh=ozzK2nI4ikG+JZ1lRF130C0CnKn5b0OTBHUIDAJNH08=;
  b=W/iYkdAbF7KIYi4rHaLWxtAyhP1hkMLnHCRO1hKGGvjgy5Y5ncSIdD6D
   IpjVROFPcTMvxwGuHu34JOFFWi+eOcx2lF3Xpu2DqKsj8jmSCKB+VHuqB
   9wAznlkWaavPQ7ZDfLS7jAhXuDGCWo7D76AD3B4vFoOGcZQmbNQuyYkHE
   mFKJXeOU9sWHLzHYorP3MMY5cwxjTeFGi/qMpObvQM9wHK7YeB2pZLnci
   GJJZPWsO6hE1gSYFYNEATManK9x2yCfxadNEeyAa/7eUBiSaWF7NtYZuN
   2WJh+0LIXdz7Ol9f/1qlTy/LnTXPmxBkl0IMJIBz3aTOZ4rB0MhaQnL5q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432229793"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432229793"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 15:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="837051651"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="837051651"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2023 15:29:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qLWiM-0009xo-1G;
        Mon, 17 Jul 2023 22:29:10 +0000
Date:   Tue, 18 Jul 2023 06:28:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 7591c31aed751c09d2d0ea295babb43e95d4f644
Message-ID: <202307180640.w9ozMtfk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 7591c31aed751c09d2d0ea295babb43e95d4f644  Merge tag 'v6.5-rc2'

elapsed time: 721m

configs tested: 140
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230717   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r006-20230717   gcc  
arm                  randconfig-r046-20230717   clang
arm                        realview_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r016-20230717   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r014-20230717   gcc  
hexagon              randconfig-r013-20230717   clang
hexagon              randconfig-r034-20230717   clang
hexagon              randconfig-r041-20230717   clang
hexagon              randconfig-r045-20230717   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230717   clang
i386         buildonly-randconfig-r005-20230717   clang
i386         buildonly-randconfig-r006-20230717   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230717   clang
i386                 randconfig-i002-20230717   clang
i386                 randconfig-i003-20230717   clang
i386                 randconfig-i004-20230717   clang
i386                 randconfig-i005-20230717   clang
i386                 randconfig-i006-20230717   clang
i386                 randconfig-i011-20230717   gcc  
i386                 randconfig-i012-20230717   gcc  
i386                 randconfig-i013-20230717   gcc  
i386                 randconfig-i014-20230717   gcc  
i386                 randconfig-i015-20230717   gcc  
i386                 randconfig-i016-20230717   gcc  
i386                 randconfig-r005-20230717   clang
i386                 randconfig-r022-20230717   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                 randconfig-r012-20230717   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze           randconfig-r002-20230717   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                          malta_defconfig   clang
mips                malta_qemu_32r6_defconfig   clang
mips                        omega2p_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                 randconfig-r035-20230717   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r025-20230717   gcc  
openrisc             randconfig-r026-20230717   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230717   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc                      katmai_defconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc              randconfig-r036-20230717   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r021-20230717   gcc  
riscv                randconfig-r031-20230717   clang
riscv                randconfig-r042-20230717   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230717   gcc  
sh                               allmodconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                            titan_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r001-20230717   gcc  
sparc64              randconfig-r032-20230717   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r004-20230717   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230717   clang
x86_64       buildonly-randconfig-r002-20230717   clang
x86_64       buildonly-randconfig-r003-20230717   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r024-20230717   gcc  
x86_64               randconfig-x001-20230717   gcc  
x86_64               randconfig-x002-20230717   gcc  
x86_64               randconfig-x003-20230717   gcc  
x86_64               randconfig-x004-20230717   gcc  
x86_64               randconfig-x005-20230717   gcc  
x86_64               randconfig-x006-20230717   gcc  
x86_64               randconfig-x011-20230717   clang
x86_64               randconfig-x012-20230717   clang
x86_64               randconfig-x013-20230717   clang
x86_64               randconfig-x014-20230717   clang
x86_64               randconfig-x015-20230717   clang
x86_64               randconfig-x016-20230717   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
