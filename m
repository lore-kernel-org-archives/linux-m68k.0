Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E89CEEB572
	for <linux-m68k@archiver.kernel.org>; Fri,  8 Sep 2023 20:46:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234611AbjIHUqi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 8 Sep 2023 16:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjIHUqh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 8 Sep 2023 16:46:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1D1A3
        for <linux-m68k@lists.linux-m68k.org>; Fri,  8 Sep 2023 13:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694205992; x=1725741992;
  h=date:from:to:cc:subject:message-id;
  bh=nfDn5YcWw5v1eOGeix6UKzaG0+D7uOEOolkonS4eAYQ=;
  b=ihGj0lrU/ME+78pR6XuzCDqmVWcxJRuQm+aVj09h8mOBJL87O4NKh6Q9
   W/uj4LgqTjVUp+g307aX7f+hMoWkr/skFaacIOtXAHL2G5vWCi0h/9HrC
   Ch00X/4A849h7Ez3d92gMVxKA8MNqNqKW03T+cOjytCtn/xTYx3A91C8V
   b1zXeEfp6hvlZgWuY+4/K46mdX0D/C300zR4C5pwGVsV0+LJ/8XJP717t
   SLD7gLmrGR9R1qs5kmeGPVB0xEwh+wETTdbzwO5RjcygunnGam0zV4zB9
   3FmMU+1HPkWIJ/ZHskStIdT7B9xrWo3L/6QgorYgpPg8HJsNTs/eDEblx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357207465"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="357207465"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 13:46:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="866226941"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="866226941"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Sep 2023 13:46:29 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qeiN1-0002bP-1Q;
        Fri, 08 Sep 2023 20:46:27 +0000
Date:   Sat, 09 Sep 2023 04:45:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.6] BUILD SUCCESS
 c9ba16f87e056c53ad0bd0ad6fe79e61b1a2e425
Message-ID: <202309090437.HMnCOxut-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.6
branch HEAD: c9ba16f87e056c53ad0bd0ad6fe79e61b1a2e425  m68k: sun3/3x: Add and use "sun3.h"

elapsed time: 720m

configs tested: 274
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230909   gcc  
alpha                randconfig-r012-20230909   gcc  
alpha                randconfig-r034-20230908   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                   randconfig-001-20230909   clang
arm                  randconfig-r024-20230908   gcc  
arm                           u8500_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r016-20230909   gcc  
arm64                randconfig-r024-20230908   clang
csky                             alldefconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230908   gcc  
hexagon               randconfig-001-20230908   clang
hexagon               randconfig-001-20230909   clang
hexagon               randconfig-002-20230908   clang
hexagon               randconfig-002-20230909   clang
hexagon              randconfig-r005-20230909   clang
hexagon              randconfig-r014-20230908   clang
hexagon              randconfig-r026-20230908   clang
hexagon              randconfig-r032-20230909   clang
hexagon              randconfig-r033-20230908   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230908   gcc  
i386         buildonly-randconfig-001-20230909   clang
i386         buildonly-randconfig-002-20230908   gcc  
i386         buildonly-randconfig-002-20230909   clang
i386         buildonly-randconfig-003-20230908   gcc  
i386         buildonly-randconfig-003-20230909   clang
i386         buildonly-randconfig-004-20230908   gcc  
i386         buildonly-randconfig-004-20230909   clang
i386         buildonly-randconfig-005-20230908   gcc  
i386         buildonly-randconfig-005-20230909   clang
i386         buildonly-randconfig-006-20230908   gcc  
i386         buildonly-randconfig-006-20230909   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230908   gcc  
i386                  randconfig-001-20230909   clang
i386                  randconfig-002-20230908   gcc  
i386                  randconfig-002-20230909   clang
i386                  randconfig-003-20230908   gcc  
i386                  randconfig-003-20230909   clang
i386                  randconfig-004-20230908   gcc  
i386                  randconfig-004-20230909   clang
i386                  randconfig-005-20230908   gcc  
i386                  randconfig-005-20230909   clang
i386                  randconfig-006-20230908   gcc  
i386                  randconfig-006-20230909   clang
i386                  randconfig-011-20230908   clang
i386                  randconfig-011-20230909   gcc  
i386                  randconfig-012-20230908   clang
i386                  randconfig-012-20230909   gcc  
i386                  randconfig-013-20230908   clang
i386                  randconfig-013-20230909   gcc  
i386                  randconfig-014-20230908   clang
i386                  randconfig-014-20230909   gcc  
i386                  randconfig-015-20230908   clang
i386                  randconfig-015-20230909   gcc  
i386                  randconfig-016-20230908   clang
i386                  randconfig-016-20230909   gcc  
i386                 randconfig-r002-20230909   clang
i386                 randconfig-r015-20230908   clang
i386                 randconfig-r024-20230908   clang
i386                 randconfig-r031-20230908   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230908   gcc  
loongarch             randconfig-001-20230909   gcc  
loongarch            randconfig-r015-20230909   gcc  
loongarch            randconfig-r021-20230908   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                 randconfig-r001-20230908   gcc  
m68k                 randconfig-r013-20230909   gcc  
m68k                 randconfig-r033-20230908   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r004-20230908   gcc  
microblaze           randconfig-r023-20230908   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   clang
mips                 randconfig-r025-20230908   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r022-20230909   gcc  
nios2                randconfig-r026-20230908   gcc  
nios2                randconfig-r035-20230908   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r014-20230909   gcc  
openrisc             randconfig-r022-20230908   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                    amigaone_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   clang
powerpc              randconfig-r021-20230908   clang
powerpc              randconfig-r024-20230909   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc64                           defconfig   gcc  
powerpc64            randconfig-r003-20230909   clang
powerpc64            randconfig-r005-20230908   gcc  
powerpc64            randconfig-r006-20230908   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230909   clang
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230908   clang
s390                 randconfig-r006-20230909   clang
s390                 randconfig-r026-20230908   clang
s390                 randconfig-r033-20230909   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                   randconfig-r034-20230908   gcc  
sh                   randconfig-r036-20230908   gcc  
sh                           se7619_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230908   gcc  
sparc                randconfig-r036-20230908   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230908   gcc  
x86_64       buildonly-randconfig-001-20230909   clang
x86_64       buildonly-randconfig-002-20230908   gcc  
x86_64       buildonly-randconfig-002-20230909   clang
x86_64       buildonly-randconfig-003-20230908   gcc  
x86_64       buildonly-randconfig-003-20230909   clang
x86_64       buildonly-randconfig-004-20230908   gcc  
x86_64       buildonly-randconfig-004-20230909   clang
x86_64       buildonly-randconfig-005-20230908   gcc  
x86_64       buildonly-randconfig-005-20230909   clang
x86_64       buildonly-randconfig-006-20230908   gcc  
x86_64       buildonly-randconfig-006-20230909   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230908   clang
x86_64                randconfig-001-20230909   gcc  
x86_64                randconfig-002-20230908   clang
x86_64                randconfig-002-20230909   gcc  
x86_64                randconfig-003-20230908   clang
x86_64                randconfig-003-20230909   gcc  
x86_64                randconfig-004-20230908   clang
x86_64                randconfig-004-20230909   gcc  
x86_64                randconfig-005-20230908   clang
x86_64                randconfig-005-20230909   gcc  
x86_64                randconfig-006-20230908   clang
x86_64                randconfig-006-20230909   gcc  
x86_64                randconfig-011-20230908   gcc  
x86_64                randconfig-011-20230909   clang
x86_64                randconfig-012-20230908   gcc  
x86_64                randconfig-012-20230909   clang
x86_64                randconfig-013-20230908   gcc  
x86_64                randconfig-013-20230909   clang
x86_64                randconfig-014-20230908   gcc  
x86_64                randconfig-014-20230909   clang
x86_64                randconfig-015-20230908   gcc  
x86_64                randconfig-015-20230909   clang
x86_64                randconfig-016-20230908   gcc  
x86_64                randconfig-016-20230909   clang
x86_64                randconfig-071-20230908   gcc  
x86_64                randconfig-071-20230909   clang
x86_64                randconfig-072-20230908   gcc  
x86_64                randconfig-072-20230909   clang
x86_64                randconfig-073-20230908   gcc  
x86_64                randconfig-073-20230909   clang
x86_64                randconfig-074-20230908   gcc  
x86_64                randconfig-074-20230909   clang
x86_64                randconfig-075-20230908   gcc  
x86_64                randconfig-075-20230909   clang
x86_64                randconfig-076-20230908   gcc  
x86_64                randconfig-076-20230909   clang
x86_64               randconfig-r022-20230908   clang
x86_64               randconfig-r031-20230909   clang
x86_64               randconfig-r032-20230908   gcc  
x86_64               randconfig-r035-20230909   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r023-20230909   gcc  
xtensa               randconfig-r032-20230908   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
