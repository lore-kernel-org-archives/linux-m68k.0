Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2DAC4338F
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 23:55:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89F4360E8B
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 23:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233260AbhHWX4f (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Aug 2021 19:56:35 -0400
Received: from mga17.intel.com ([192.55.52.151]:55104 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233278AbhHWX4e (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 Aug 2021 19:56:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="197448491"
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; 
   d="scan'208";a="197448491"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 16:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; 
   d="scan'208";a="515207952"
Received: from lkp-server02.sh.intel.com (HELO ca0e9373e375) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2021 16:55:50 -0700
Received: from kbuild by ca0e9373e375 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mIJnB-0000XZ-Bk; Mon, 23 Aug 2021 23:55:49 +0000
Date:   Tue, 24 Aug 2021 07:55:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:for-v5.15] BUILD SUCCESS
 87d93029fe83e326d5b906e12e95600b157d2c0d
Message-ID: <61243570.BeBeoiEeM73RbuNp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.15
branch HEAD: 87d93029fe83e326d5b906e12e95600b157d2c0d  m68k: Fix asm register constraints for atomic ops

elapsed time: 729m

configs tested: 140
configs skipped: 114

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                        spear6xx_defconfig
mips                malta_qemu_32r6_defconfig
xtensa                       common_defconfig
mips                             allyesconfig
sh                          sdk7786_defconfig
um                             i386_defconfig
arm                         bcm2835_defconfig
mips                           rs90_defconfig
powerpc                       ppc64_defconfig
arm                       versatile_defconfig
sh                             shx3_defconfig
arm                          collie_defconfig
mips                         rt305x_defconfig
mips                           ip28_defconfig
powerpc                    adder875_defconfig
arm                      footbridge_defconfig
arm                        cerfcube_defconfig
arm                        trizeps4_defconfig
mips                         tb0287_defconfig
powerpc                 mpc832x_mds_defconfig
mips                            e55_defconfig
microblaze                      mmu_defconfig
mips                        bcm63xx_defconfig
arm                         nhk8815_defconfig
arm                     davinci_all_defconfig
mips                           ip32_defconfig
arm                        multi_v7_defconfig
nds32                            alldefconfig
powerpc                     tqm8541_defconfig
sh                        edosk7760_defconfig
m68k                       m5249evb_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                  mpc866_ads_defconfig
mips                           gcw0_defconfig
powerpc64                           defconfig
mips                           mtx1_defconfig
m68k                         amcore_defconfig
powerpc                      katmai_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                             rpc_defconfig
sparc64                          alldefconfig
arm                          iop32x_defconfig
mips                      pistachio_defconfig
mips                      loongson3_defconfig
riscv                    nommu_k210_defconfig
mips                        workpad_defconfig
powerpc                    amigaone_defconfig
sh                          r7780mp_defconfig
m68k                             allmodconfig
s390                          debug_defconfig
arm                        clps711x_defconfig
powerpc                 linkstation_defconfig
mips                  decstation_64_defconfig
arm                            zeus_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                  storcenter_defconfig
s390                             alldefconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210822
x86_64               randconfig-a006-20210822
x86_64               randconfig-a001-20210822
x86_64               randconfig-a003-20210822
x86_64               randconfig-a004-20210822
x86_64               randconfig-a002-20210822
i386                 randconfig-a006-20210822
i386                 randconfig-a001-20210822
i386                 randconfig-a002-20210822
i386                 randconfig-a005-20210822
i386                 randconfig-a003-20210822
i386                 randconfig-a004-20210822
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20210822
s390                 randconfig-c005-20210822
arm                  randconfig-c002-20210822
riscv                randconfig-c006-20210822
powerpc              randconfig-c003-20210822
x86_64               randconfig-c007-20210822
mips                 randconfig-c004-20210822
x86_64               randconfig-a014-20210822
x86_64               randconfig-a016-20210822
x86_64               randconfig-a015-20210822
x86_64               randconfig-a013-20210822
x86_64               randconfig-a012-20210822
x86_64               randconfig-a011-20210822
i386                 randconfig-a011-20210822
i386                 randconfig-a016-20210822
i386                 randconfig-a012-20210822
i386                 randconfig-a014-20210822
i386                 randconfig-a013-20210822
i386                 randconfig-a015-20210822
hexagon              randconfig-r041-20210822
hexagon              randconfig-r045-20210822
riscv                randconfig-r042-20210822
s390                 randconfig-r044-20210822

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
