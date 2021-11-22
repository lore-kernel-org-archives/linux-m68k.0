Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EA5C433FE
	for <linux-m68k@archiver.kernel.org>; Mon, 22 Nov 2021 23:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhKVX1V (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 22 Nov 2021 18:27:21 -0500
Received: from mga03.intel.com ([134.134.136.65]:50448 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229779AbhKVX1V (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 22 Nov 2021 18:27:21 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="234853862"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; 
   d="scan'208";a="234853862"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 15:24:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; 
   d="scan'208";a="674243640"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Nov 2021 15:24:09 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mpIfQ-0000qF-Pt; Mon, 22 Nov 2021 23:24:08 +0000
Date:   Tue, 23 Nov 2021 07:23:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 c9ab59f27f9ab56550096b19e26cff7f743b0b4a
Message-ID: <619c2683.WveV0QfotbL/2HzQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: c9ab59f27f9ab56550096b19e26cff7f743b0b4a  Merge tag 'v5.16-rc2'

elapsed time: 722m

configs tested: 104
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211122
sh                           se7722_defconfig
arm                          iop32x_defconfig
powerpc                      ppc40x_defconfig
xtensa                  nommu_kc705_defconfig
mips                             allmodconfig
arm                         axm55xx_defconfig
i386                             alldefconfig
arm                            mmp2_defconfig
arm                           u8500_defconfig
mips                           ip28_defconfig
arm                         mv78xx0_defconfig
powerpc                     kmeter1_defconfig
arm                    vt8500_v6_v7_defconfig
mips                       rbtx49xx_defconfig
ia64                      gensparse_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                            zeus_defconfig
mips                         tb0287_defconfig
arm                            dove_defconfig
xtensa                              defconfig
powerpc                 mpc8315_rdb_defconfig
arm                  randconfig-c002-20211122
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20211122
x86_64               randconfig-a012-20211122
x86_64               randconfig-a016-20211122
x86_64               randconfig-a013-20211122
x86_64               randconfig-a015-20211122
x86_64               randconfig-a014-20211122
i386                 randconfig-a012-20211122
i386                 randconfig-a013-20211122
i386                 randconfig-a014-20211122
i386                 randconfig-a011-20211122
i386                 randconfig-a016-20211122
i386                 randconfig-a015-20211122
arc                  randconfig-r043-20211122
riscv                randconfig-r042-20211122
s390                 randconfig-r044-20211122
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a001-20211122
x86_64               randconfig-a003-20211122
x86_64               randconfig-a005-20211122
x86_64               randconfig-a006-20211122
x86_64               randconfig-a004-20211122
x86_64               randconfig-a002-20211122
i386                 randconfig-a001-20211122
i386                 randconfig-a002-20211122
i386                 randconfig-a005-20211122
i386                 randconfig-a006-20211122
i386                 randconfig-a004-20211122
i386                 randconfig-a003-20211122
hexagon              randconfig-r041-20211122
hexagon              randconfig-r045-20211122

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
