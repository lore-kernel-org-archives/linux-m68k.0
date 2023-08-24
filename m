Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4CEC6FA8F
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Aug 2023 11:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237870AbjHXLys (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 24 Aug 2023 07:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234511AbjHXLyQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 24 Aug 2023 07:54:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98CA198A
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Aug 2023 04:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692878053; x=1724414053;
  h=date:from:to:cc:subject:message-id;
  bh=SJI17UMu71EmrhaAA1mTk2p6/Y9jZW1xu1WskLB8DGs=;
  b=XCX/xZc3kWc9i5ac+e8j3Zd224lj4OfW0tqh7Tzt6sRbcW2FMWuKeHy1
   WmAeYys63bJn5ZoH7fNswBYanwhTy2xHoKSwBtYWfUSUBVWPVVpMIuRsK
   E89ngiwoSq91LFNu+QtAS1FCrkJgZWzTorvCjfpsq+2u9Tr28k8m//FMo
   FkCrCZyT1M9WRrmaeAuOrxVWLrRWs+15eANDi3eUfRnMoVUaD5bZnPnv2
   bbmLqfeavrOPJ2tpo7oMjtOYiwqxkq11vDJdma0sw7NymuCzwoUu3pXB+
   wiCustkNnefzFxtuKZTb3GaYOMdBDlKqUr/5ddBiyZt+US+1EhPXnzXn9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374382910"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="374382910"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 04:54:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="802514394"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="802514394"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 24 Aug 2023 04:54:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qZ8uh-0002Da-0G;
        Thu, 24 Aug 2023 11:54:11 +0000
Date:   Thu, 24 Aug 2023 19:54:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.6] BUILD SUCCESS
 eb1e6ccdcf785e633863c5c7cec32d6c1e7b09dd
Message-ID: <202308241906.2g42YM64-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.6
branch HEAD: eb1e6ccdcf785e633863c5c7cec32d6c1e7b09dd  zorro: Include zorro.h in names.c

elapsed time: 4344m

configs tested: 394
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r021-20230821   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20230821   gcc  
arc                   randconfig-001-20230822   gcc  
arc                   randconfig-001-20230823   gcc  
arc                  randconfig-r005-20230821   gcc  
arc                  randconfig-r011-20230822   gcc  
arc                  randconfig-r012-20230823   gcc  
arc                  randconfig-r026-20230821   gcc  
arc                  randconfig-r035-20230823   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                       imx_v6_v7_defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                          moxart_defconfig   clang
arm                        mvebu_v5_defconfig   clang
arm                        neponset_defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                           omap1_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                   randconfig-001-20230821   clang
arm                   randconfig-001-20230822   gcc  
arm                  randconfig-r006-20230822   clang
arm                  randconfig-r014-20230822   gcc  
arm                  randconfig-r021-20230821   clang
arm                  randconfig-r031-20230821   gcc  
arm                        realview_defconfig   gcc  
arm                           sama5_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r015-20230823   gcc  
arm64                randconfig-r032-20230822   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230821   gcc  
csky                 randconfig-r012-20230822   gcc  
csky                 randconfig-r013-20230821   gcc  
csky                 randconfig-r014-20230821   gcc  
csky                 randconfig-r016-20230822   gcc  
csky                 randconfig-r026-20230821   gcc  
csky                 randconfig-r026-20230822   gcc  
csky                 randconfig-r031-20230821   gcc  
csky                 randconfig-r033-20230821   gcc  
hexagon               randconfig-001-20230821   clang
hexagon               randconfig-001-20230822   clang
hexagon               randconfig-002-20230821   clang
hexagon               randconfig-002-20230822   clang
hexagon              randconfig-r005-20230823   clang
hexagon              randconfig-r006-20230821   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230821   clang
i386         buildonly-randconfig-001-20230822   gcc  
i386         buildonly-randconfig-001-20230823   clang
i386         buildonly-randconfig-002-20230821   clang
i386         buildonly-randconfig-002-20230822   gcc  
i386         buildonly-randconfig-002-20230823   clang
i386         buildonly-randconfig-003-20230821   clang
i386         buildonly-randconfig-003-20230822   gcc  
i386         buildonly-randconfig-003-20230823   clang
i386         buildonly-randconfig-004-20230821   clang
i386         buildonly-randconfig-004-20230822   gcc  
i386         buildonly-randconfig-004-20230823   clang
i386         buildonly-randconfig-005-20230821   clang
i386         buildonly-randconfig-005-20230822   gcc  
i386         buildonly-randconfig-005-20230823   clang
i386         buildonly-randconfig-006-20230821   clang
i386         buildonly-randconfig-006-20230822   gcc  
i386         buildonly-randconfig-006-20230823   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230821   clang
i386                  randconfig-001-20230822   gcc  
i386                  randconfig-001-20230823   clang
i386                  randconfig-002-20230821   clang
i386                  randconfig-002-20230822   gcc  
i386                  randconfig-002-20230823   clang
i386                  randconfig-003-20230821   clang
i386                  randconfig-003-20230822   gcc  
i386                  randconfig-003-20230823   clang
i386                  randconfig-004-20230821   clang
i386                  randconfig-004-20230822   gcc  
i386                  randconfig-004-20230823   clang
i386                  randconfig-005-20230821   clang
i386                  randconfig-005-20230822   gcc  
i386                  randconfig-005-20230823   clang
i386                  randconfig-006-20230821   clang
i386                  randconfig-006-20230822   gcc  
i386                  randconfig-006-20230823   clang
i386                  randconfig-011-20230821   gcc  
i386                  randconfig-011-20230822   clang
i386                  randconfig-011-20230823   gcc  
i386                  randconfig-012-20230821   gcc  
i386                  randconfig-012-20230822   clang
i386                  randconfig-012-20230823   gcc  
i386                  randconfig-013-20230821   gcc  
i386                  randconfig-013-20230822   clang
i386                  randconfig-013-20230823   gcc  
i386                  randconfig-014-20230821   gcc  
i386                  randconfig-014-20230822   clang
i386                  randconfig-014-20230823   gcc  
i386                  randconfig-015-20230821   gcc  
i386                  randconfig-015-20230822   clang
i386                  randconfig-015-20230823   gcc  
i386                  randconfig-016-20230821   gcc  
i386                  randconfig-016-20230822   clang
i386                  randconfig-016-20230823   gcc  
i386                 randconfig-r022-20230823   gcc  
i386                 randconfig-r023-20230821   gcc  
i386                 randconfig-r034-20230821   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230821   gcc  
loongarch             randconfig-001-20230822   gcc  
loongarch             randconfig-001-20230823   gcc  
loongarch            randconfig-r013-20230822   gcc  
loongarch            randconfig-r015-20230821   gcc  
loongarch            randconfig-r016-20230821   gcc  
loongarch            randconfig-r032-20230821   gcc  
loongarch            randconfig-r033-20230821   gcc  
loongarch            randconfig-r036-20230821   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                 randconfig-r014-20230822   gcc  
m68k                 randconfig-r034-20230822   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r002-20230821   gcc  
microblaze           randconfig-r011-20230821   gcc  
microblaze           randconfig-r014-20230823   gcc  
microblaze           randconfig-r021-20230822   gcc  
microblaze           randconfig-r033-20230821   gcc  
microblaze           randconfig-r034-20230821   gcc  
microblaze           randconfig-r036-20230821   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                  decstation_64_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                        maltaup_defconfig   clang
mips                 randconfig-r002-20230822   clang
mips                 randconfig-r025-20230821   clang
mips                 randconfig-r033-20230823   gcc  
mips                           rs90_defconfig   clang
mips                           xway_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230821   gcc  
nios2                randconfig-r016-20230821   gcc  
nios2                randconfig-r016-20230823   gcc  
nios2                randconfig-r035-20230821   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc             randconfig-r005-20230822   gcc  
openrisc             randconfig-r006-20230821   gcc  
openrisc             randconfig-r015-20230822   gcc  
openrisc             randconfig-r022-20230821   gcc  
openrisc             randconfig-r023-20230823   gcc  
openrisc             randconfig-r035-20230821   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230821   gcc  
parisc               randconfig-r013-20230823   gcc  
parisc               randconfig-r015-20230822   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                          g5_defconfig   gcc  
powerpc                      katmai_defconfig   gcc  
powerpc                     kilauea_defconfig   clang
powerpc                 linkstation_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc                     ppa8548_defconfig   clang
powerpc                      ppc40x_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r003-20230822   gcc  
powerpc              randconfig-r004-20230821   clang
powerpc                     redwood_defconfig   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc64                        alldefconfig   gcc  
powerpc64            randconfig-r031-20230822   gcc  
powerpc64            randconfig-r036-20230822   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20230821   clang
riscv                 randconfig-001-20230822   gcc  
riscv                randconfig-r001-20230821   clang
riscv                randconfig-r002-20230822   gcc  
riscv                randconfig-r012-20230821   gcc  
riscv                randconfig-r025-20230821   gcc  
riscv                randconfig-r032-20230821   clang
riscv                randconfig-r034-20230821   clang
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230821   gcc  
s390                  randconfig-001-20230822   clang
s390                  randconfig-001-20230823   gcc  
s390                 randconfig-r005-20230821   clang
s390                 randconfig-r032-20230821   clang
s390                 randconfig-r035-20230821   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                         microdev_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                   randconfig-r001-20230821   gcc  
sh                   randconfig-r001-20230822   gcc  
sh                   randconfig-r013-20230822   gcc  
sh                   randconfig-r026-20230823   gcc  
sh                          rsk7201_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230822   gcc  
sparc                randconfig-r022-20230822   gcc  
sparc                randconfig-r024-20230821   gcc  
sparc                randconfig-r025-20230823   gcc  
sparc                randconfig-r031-20230823   gcc  
sparc                randconfig-r034-20230823   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r004-20230821   gcc  
sparc64              randconfig-r015-20230821   gcc  
sparc64              randconfig-r024-20230823   gcc  
sparc64              randconfig-r031-20230821   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r002-20230821   gcc  
um                   randconfig-r003-20230821   gcc  
um                   randconfig-r011-20230821   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230821   clang
x86_64       buildonly-randconfig-001-20230822   gcc  
x86_64       buildonly-randconfig-001-20230823   clang
x86_64       buildonly-randconfig-002-20230821   clang
x86_64       buildonly-randconfig-002-20230822   gcc  
x86_64       buildonly-randconfig-002-20230823   clang
x86_64       buildonly-randconfig-003-20230821   clang
x86_64       buildonly-randconfig-003-20230822   gcc  
x86_64       buildonly-randconfig-003-20230823   clang
x86_64       buildonly-randconfig-004-20230821   clang
x86_64       buildonly-randconfig-004-20230822   gcc  
x86_64       buildonly-randconfig-004-20230823   clang
x86_64       buildonly-randconfig-005-20230821   clang
x86_64       buildonly-randconfig-005-20230822   gcc  
x86_64       buildonly-randconfig-005-20230823   clang
x86_64       buildonly-randconfig-006-20230821   clang
x86_64       buildonly-randconfig-006-20230822   gcc  
x86_64       buildonly-randconfig-006-20230823   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230821   gcc  
x86_64                randconfig-001-20230822   clang
x86_64                randconfig-001-20230823   gcc  
x86_64                randconfig-002-20230821   gcc  
x86_64                randconfig-002-20230822   clang
x86_64                randconfig-002-20230823   gcc  
x86_64                randconfig-003-20230821   gcc  
x86_64                randconfig-003-20230822   clang
x86_64                randconfig-003-20230823   gcc  
x86_64                randconfig-004-20230821   gcc  
x86_64                randconfig-004-20230822   clang
x86_64                randconfig-004-20230823   gcc  
x86_64                randconfig-005-20230821   gcc  
x86_64                randconfig-005-20230822   clang
x86_64                randconfig-005-20230823   gcc  
x86_64                randconfig-006-20230821   gcc  
x86_64                randconfig-006-20230822   clang
x86_64                randconfig-006-20230823   gcc  
x86_64                randconfig-011-20230821   clang
x86_64                randconfig-011-20230823   clang
x86_64                randconfig-012-20230821   clang
x86_64                randconfig-012-20230823   clang
x86_64                randconfig-013-20230821   clang
x86_64                randconfig-013-20230823   clang
x86_64                randconfig-014-20230821   clang
x86_64                randconfig-014-20230823   clang
x86_64                randconfig-015-20230821   clang
x86_64                randconfig-015-20230823   clang
x86_64                randconfig-016-20230821   clang
x86_64                randconfig-016-20230823   clang
x86_64                randconfig-071-20230821   clang
x86_64                randconfig-071-20230822   gcc  
x86_64                randconfig-071-20230823   clang
x86_64                randconfig-072-20230821   clang
x86_64                randconfig-072-20230822   gcc  
x86_64                randconfig-072-20230823   clang
x86_64                randconfig-073-20230821   clang
x86_64                randconfig-073-20230822   gcc  
x86_64                randconfig-073-20230823   clang
x86_64                randconfig-074-20230821   clang
x86_64                randconfig-074-20230822   gcc  
x86_64                randconfig-074-20230823   clang
x86_64                randconfig-075-20230821   clang
x86_64                randconfig-075-20230822   gcc  
x86_64                randconfig-075-20230823   clang
x86_64                randconfig-076-20230821   clang
x86_64                randconfig-076-20230822   gcc  
x86_64                randconfig-076-20230823   clang
x86_64               randconfig-r001-20230823   clang
x86_64               randconfig-r003-20230821   clang
x86_64               randconfig-r003-20230823   clang
x86_64               randconfig-r024-20230821   gcc  
x86_64               randconfig-r035-20230822   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r032-20230823   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
