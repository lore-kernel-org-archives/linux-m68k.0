Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FD6C4338F
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Jul 2021 01:10:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BD2060F58
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Jul 2021 01:10:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbhG0AaZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Jul 2021 20:30:25 -0400
Received: from mga17.intel.com ([192.55.52.151]:5664 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231479AbhG0AaZ (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Jul 2021 20:30:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="192621897"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="192621897"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 18:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; 
   d="scan'208";a="579956817"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2021 18:10:46 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m8BcL-0006IE-Hr; Tue, 27 Jul 2021 01:10:45 +0000
Date:   Tue, 27 Jul 2021 09:10:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 0fa29511984b3e62b2ecdec53f7b7ea3c84c4d09
Message-ID: <60ff5cff.TQB/zyFe3FhLq7b0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 0fa29511984b3e62b2ecdec53f7b7ea3c84c4d09  Merge tag 'v5.14-rc3'

elapsed time: 721m

configs tested: 119
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                 randconfig-c001-20210727
nds32                            alldefconfig
mips                     cu1830-neo_defconfig
sh                         ap325rxa_defconfig
arm                            xcep_defconfig
arm                        multi_v5_defconfig
arc                     nsimosci_hs_defconfig
sh                          kfr2r09_defconfig
sh                          r7780mp_defconfig
mips                       bmips_be_defconfig
arm                          pxa168_defconfig
sh                         microdev_defconfig
parisc                generic-64bit_defconfig
arc                              alldefconfig
sh                              ul2_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                          g5_defconfig
mips                           rs90_defconfig
riscv                    nommu_virt_defconfig
m68k                        mvme147_defconfig
sh                     magicpanelr2_defconfig
powerpc                 linkstation_defconfig
sh                          r7785rp_defconfig
ia64                          tiger_defconfig
arm                           spitz_defconfig
ia64                             alldefconfig
sh                          urquell_defconfig
mips                        bcm47xx_defconfig
arm                          exynos_defconfig
powerpc                     stx_gp3_defconfig
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig
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
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210726
x86_64               randconfig-a006-20210726
x86_64               randconfig-a001-20210726
x86_64               randconfig-a005-20210726
x86_64               randconfig-a004-20210726
x86_64               randconfig-a002-20210726
i386                 randconfig-a005-20210726
i386                 randconfig-a003-20210726
i386                 randconfig-a004-20210726
i386                 randconfig-a002-20210726
i386                 randconfig-a001-20210726
i386                 randconfig-a006-20210726
i386                 randconfig-a005-20210725
i386                 randconfig-a003-20210725
i386                 randconfig-a004-20210725
i386                 randconfig-a002-20210725
i386                 randconfig-a001-20210725
i386                 randconfig-a006-20210725
x86_64               randconfig-a011-20210727
x86_64               randconfig-a016-20210727
x86_64               randconfig-a013-20210727
x86_64               randconfig-a014-20210727
x86_64               randconfig-a012-20210727
x86_64               randconfig-a015-20210727
i386                 randconfig-a016-20210726
i386                 randconfig-a013-20210726
i386                 randconfig-a012-20210726
i386                 randconfig-a011-20210726
i386                 randconfig-a014-20210726
i386                 randconfig-a015-20210726
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210726
x86_64               randconfig-a011-20210726
x86_64               randconfig-a016-20210726
x86_64               randconfig-a013-20210726
x86_64               randconfig-a014-20210726
x86_64               randconfig-a012-20210726
x86_64               randconfig-a015-20210726

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
