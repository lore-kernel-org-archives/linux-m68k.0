Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43CCC4320A
	for <linux-m68k@archiver.kernel.org>; Sat, 28 Aug 2021 12:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAF5160E8B
	for <linux-m68k@archiver.kernel.org>; Sat, 28 Aug 2021 12:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234318AbhH1MrT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 28 Aug 2021 08:47:19 -0400
Received: from mga18.intel.com ([134.134.136.126]:46276 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234012AbhH1MrS (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 28 Aug 2021 08:47:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10089"; a="205229216"
X-IronPort-AV: E=Sophos;i="5.84,359,1620716400"; 
   d="scan'208";a="205229216"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2021 05:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,359,1620716400"; 
   d="scan'208";a="517922800"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Aug 2021 05:46:26 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mJxj7-0003RC-JK; Sat, 28 Aug 2021 12:46:25 +0000
Date:   Sat, 28 Aug 2021 20:45:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 420b13e4124ab8fa930febb1292602297eeae955
Message-ID: <612a2fea.Ssf/K0lF4tp8Bmoy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 420b13e4124ab8fa930febb1292602297eeae955  m68k: Fix asm register constraints for atomic ops

elapsed time: 7256m

configs tested: 203
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210826
arm                        spear6xx_defconfig
mips                malta_qemu_32r6_defconfig
xtensa                       common_defconfig
powerpc                   lite5200b_defconfig
riscv                    nommu_virt_defconfig
arm                         vf610m4_defconfig
arm                          collie_defconfig
arm                     davinci_all_defconfig
sh                          sdk7786_defconfig
mips                           ip32_defconfig
arm                        multi_v7_defconfig
sh                               j2_defconfig
powerpc                      arches_defconfig
arc                            hsdk_defconfig
mips                         tb0226_defconfig
arm                        neponset_defconfig
sh                                  defconfig
arm                           stm32_defconfig
sh                           sh2007_defconfig
sh                           se7721_defconfig
xtensa                           allyesconfig
arc                        vdk_hs38_defconfig
powerpc                     sbc8548_defconfig
arm                           spitz_defconfig
mips                        nlm_xlr_defconfig
arm                      integrator_defconfig
m68k                          hp300_defconfig
arm                             rpc_defconfig
powerpc                  storcenter_defconfig
powerpc                      ppc6xx_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     pq2fads_defconfig
arm                       aspeed_g4_defconfig
sh                            titan_defconfig
sparc                       sparc64_defconfig
m68k                          multi_defconfig
sh                          lboxre2_defconfig
powerpc                     mpc5200_defconfig
powerpc                      chrp32_defconfig
mips                           ip28_defconfig
s390                          debug_defconfig
mips                        qi_lb60_defconfig
arm                       spear13xx_defconfig
arm                        clps711x_defconfig
sh                          rsk7264_defconfig
mips                             allmodconfig
powerpc                      pmac32_defconfig
mips                          ath79_defconfig
s390                       zfcpdump_defconfig
i386                             alldefconfig
x86_64                              defconfig
arm                             pxa_defconfig
sh                ecovec24-romimage_defconfig
arm                            dove_defconfig
sh                            hp6xx_defconfig
powerpc64                        alldefconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210824
x86_64               randconfig-a006-20210824
x86_64               randconfig-a001-20210824
x86_64               randconfig-a003-20210824
x86_64               randconfig-a004-20210824
x86_64               randconfig-a002-20210824
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
i386                 randconfig-a006-20210824
i386                 randconfig-a001-20210824
i386                 randconfig-a002-20210824
i386                 randconfig-a005-20210824
i386                 randconfig-a003-20210824
i386                 randconfig-a004-20210824
x86_64               randconfig-a014-20210825
x86_64               randconfig-a015-20210825
x86_64               randconfig-a016-20210825
x86_64               randconfig-a013-20210825
x86_64               randconfig-a012-20210825
x86_64               randconfig-a011-20210825
i386                 randconfig-a011-20210825
i386                 randconfig-a016-20210825
i386                 randconfig-a012-20210825
i386                 randconfig-a014-20210825
i386                 randconfig-a013-20210825
i386                 randconfig-a015-20210825
arc                  randconfig-r043-20210822
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
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20210824
s390                 randconfig-c005-20210824
arm                  randconfig-c002-20210824
riscv                randconfig-c006-20210824
powerpc              randconfig-c003-20210824
x86_64               randconfig-c007-20210824
mips                 randconfig-c004-20210824
s390                 randconfig-c005-20210825
i386                 randconfig-c001-20210825
arm                  randconfig-c002-20210825
riscv                randconfig-c006-20210825
powerpc              randconfig-c003-20210825
x86_64               randconfig-c007-20210825
i386                 randconfig-c001-20210822
s390                 randconfig-c005-20210822
arm                  randconfig-c002-20210822
riscv                randconfig-c006-20210822
powerpc              randconfig-c003-20210822
x86_64               randconfig-c007-20210822
mips                 randconfig-c004-20210822
mips                 randconfig-c004-20210825
i386                 randconfig-c001-20210826
s390                 randconfig-c005-20210826
arm                  randconfig-c002-20210826
riscv                randconfig-c006-20210826
powerpc              randconfig-c003-20210826
x86_64               randconfig-c007-20210826
mips                 randconfig-c004-20210826
x86_64               randconfig-a014-20210822
x86_64               randconfig-a016-20210822
x86_64               randconfig-a015-20210822
x86_64               randconfig-a013-20210822
x86_64               randconfig-a012-20210822
x86_64               randconfig-a011-20210822
x86_64               randconfig-a014-20210824
x86_64               randconfig-a015-20210824
x86_64               randconfig-a016-20210824
x86_64               randconfig-a013-20210824
x86_64               randconfig-a012-20210824
x86_64               randconfig-a011-20210824
i386                 randconfig-a011-20210824
i386                 randconfig-a016-20210824
i386                 randconfig-a012-20210824
i386                 randconfig-a014-20210824
i386                 randconfig-a013-20210824
i386                 randconfig-a015-20210824
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
hexagon              randconfig-r041-20210824
hexagon              randconfig-r045-20210824
riscv                randconfig-r042-20210824
s390                 randconfig-r044-20210824

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
