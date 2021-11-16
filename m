Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C18C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 16 Nov 2021 07:21:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D414613A7
	for <linux-m68k@archiver.kernel.org>; Tue, 16 Nov 2021 07:21:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbhKPHYk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 16 Nov 2021 02:24:40 -0500
Received: from mga04.intel.com ([192.55.52.120]:14740 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230241AbhKPHYH (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 16 Nov 2021 02:24:07 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="232360041"
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; 
   d="scan'208";a="232360041"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 23:21:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; 
   d="scan'208";a="494355110"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Nov 2021 23:21:06 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mmsm9-0000B8-FD; Tue, 16 Nov 2021 07:21:05 +0000
Date:   Tue, 16 Nov 2021 15:20:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 0c3f9e7220ddd6ad1d9093b4a1bae7ec750d523c
Message-ID: <61935bbd.DSa+OUwpSIgoGj/B%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 0c3f9e7220ddd6ad1d9093b4a1bae7ec750d523c  Merge tag 'v5.16-rc1'

elapsed time: 1216m

configs tested: 141
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                 randconfig-c001-20211115
m68k                        m5307c3_defconfig
arm64                            alldefconfig
arc                            hsdk_defconfig
arm                         lpc32xx_defconfig
s390                          debug_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         cm_x300_defconfig
m68k                          atari_defconfig
sh                             espt_defconfig
arm                        vexpress_defconfig
h8300                    h8300h-sim_defconfig
xtensa                generic_kc705_defconfig
arc                        vdk_hs38_defconfig
powerpc64                           defconfig
arm                        mvebu_v5_defconfig
arm                         mv78xx0_defconfig
sh                           se7619_defconfig
arm                      tct_hammer_defconfig
sh                          sdk7780_defconfig
powerpc                      cm5200_defconfig
powerpc                   microwatt_defconfig
mips                       bmips_be_defconfig
um                               alldefconfig
powerpc                   lite5200b_defconfig
mips                           ip32_defconfig
powerpc                      ppc6xx_defconfig
xtensa                         virt_defconfig
arm                             mxs_defconfig
mips                      maltaaprp_defconfig
sh                         apsh4a3a_defconfig
parisc                generic-64bit_defconfig
powerpc                     pseries_defconfig
arm                  randconfig-c002-20211116
arm                  randconfig-c002-20211115
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a003-20211115
x86_64               randconfig-a002-20211115
x86_64               randconfig-a001-20211115
x86_64               randconfig-a006-20211115
x86_64               randconfig-a004-20211115
x86_64               randconfig-a005-20211115
i386                 randconfig-a006-20211115
i386                 randconfig-a003-20211115
i386                 randconfig-a005-20211115
i386                 randconfig-a001-20211115
i386                 randconfig-a004-20211115
i386                 randconfig-a002-20211115
i386                 randconfig-a014-20211116
i386                 randconfig-a016-20211116
i386                 randconfig-a012-20211116
i386                 randconfig-a013-20211116
i386                 randconfig-a011-20211116
i386                 randconfig-a015-20211116
arc                  randconfig-r043-20211115
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-c007-20211115
i386                 randconfig-c001-20211115
arm                  randconfig-c002-20211115
riscv                randconfig-c006-20211115
powerpc              randconfig-c003-20211115
s390                 randconfig-c005-20211115
mips                 randconfig-c004-20211115
i386                 randconfig-a006-20211116
i386                 randconfig-a003-20211116
i386                 randconfig-a005-20211116
i386                 randconfig-a001-20211116
i386                 randconfig-a004-20211116
i386                 randconfig-a002-20211116
x86_64               randconfig-a013-20211115
x86_64               randconfig-a011-20211115
x86_64               randconfig-a012-20211115
x86_64               randconfig-a014-20211115
x86_64               randconfig-a015-20211115
x86_64               randconfig-a016-20211115
i386                 randconfig-a014-20211115
i386                 randconfig-a016-20211115
i386                 randconfig-a012-20211115
i386                 randconfig-a013-20211115
i386                 randconfig-a011-20211115
i386                 randconfig-a015-20211115
x86_64               randconfig-a005-20211116
x86_64               randconfig-a003-20211116
x86_64               randconfig-a001-20211116
x86_64               randconfig-a002-20211116
x86_64               randconfig-a006-20211116
x86_64               randconfig-a004-20211116
hexagon              randconfig-r045-20211115
hexagon              randconfig-r041-20211115
s390                 randconfig-r044-20211115
riscv                randconfig-r042-20211115

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
