Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9210FC433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 22 Sep 2021 05:32:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CFD960FA0
	for <linux-m68k@archiver.kernel.org>; Wed, 22 Sep 2021 05:32:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232124AbhIVFeM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 22 Sep 2021 01:34:12 -0400
Received: from mga01.intel.com ([192.55.52.88]:31143 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231908AbhIVFeL (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 22 Sep 2021 01:34:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="245956459"
X-IronPort-AV: E=Sophos;i="5.85,312,1624345200"; 
   d="scan'208";a="245956459"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 22:32:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,312,1624345200"; 
   d="scan'208";a="702071048"
Received: from lkp-server01.sh.intel.com (HELO 3f19c3f57f1d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Sep 2021 22:32:41 -0700
Received: from kbuild by 3f19c3f57f1d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mSus4-00006e-Ez; Wed, 22 Sep 2021 05:32:40 +0000
Date:   Wed, 22 Sep 2021 13:31:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 0fce0a591e9c880edea48b14e08d1ecd7ebb6248
Message-ID: <614abfc3.58NkRyckUFUZuqnd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 0fce0a591e9c880edea48b14e08d1ecd7ebb6248  Merge tag 'v5.15-rc2'

elapsed time: 2414m

configs tested: 104
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                     davinci_all_defconfig
sh                          rsk7269_defconfig
arm                            lart_defconfig
powerpc                      bamboo_defconfig
mips                        qi_lb60_defconfig
powerpc                        warp_defconfig
arm                       aspeed_g4_defconfig
parisc                           alldefconfig
arm                       imx_v6_v7_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                        fsp2_defconfig
sh                          lboxre2_defconfig
mips                  cavium_octeon_defconfig
sh                          landisk_defconfig
arm                         bcm2835_defconfig
arm                         lpc32xx_defconfig
ia64                             alldefconfig
m68k                             alldefconfig
arc                      axs103_smp_defconfig
sh                ecovec24-romimage_defconfig
powerpc                 mpc837x_rdb_defconfig
x86_64               randconfig-c001-20210920
arm                  randconfig-c002-20210920
i386                 randconfig-c001-20210920
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a014-20210920
x86_64               randconfig-a011-20210920
x86_64               randconfig-a013-20210920
x86_64               randconfig-a012-20210920
x86_64               randconfig-a015-20210920
x86_64               randconfig-a016-20210920
i386                 randconfig-a014-20210920
i386                 randconfig-a013-20210920
i386                 randconfig-a016-20210920
i386                 randconfig-a012-20210920
i386                 randconfig-a011-20210920
i386                 randconfig-a015-20210920
arc                  randconfig-r043-20210920
riscv                randconfig-r042-20210920
s390                 randconfig-r044-20210920
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a002-20210920
x86_64               randconfig-a006-20210920
x86_64               randconfig-a005-20210920
x86_64               randconfig-a001-20210920
x86_64               randconfig-a004-20210920
x86_64               randconfig-a003-20210920
i386                 randconfig-a001-20210920
i386                 randconfig-a005-20210920
i386                 randconfig-a002-20210920
i386                 randconfig-a006-20210920
i386                 randconfig-a003-20210920
i386                 randconfig-a004-20210920
hexagon              randconfig-r045-20210920
hexagon              randconfig-r041-20210920

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
