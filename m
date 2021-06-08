Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720CDC47094
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Jun 2021 03:08:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BEA761027
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Jun 2021 03:08:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhFHDKC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Jun 2021 23:10:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:50817 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230237AbhFHDKB (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Jun 2021 23:10:01 -0400
IronPort-SDR: ZVLfiZNluXCuWYLW0Zk43h6fMYGBo4nRVfb0ZKE4MrJJLoRDGlqZZFDpYS6INUUZ84NL9fcBqA
 s/8Kl13+bHBg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="265913963"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; 
   d="scan'208";a="265913963"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 20:08:08 -0700
IronPort-SDR: MQstOYvj7hNSMr2l/7zDPSSbALeJwe41GCXb0in/6Cf1RgED20LsX7RKdNxYHsoHwcANt2Q+af
 yaU7JAn8GOqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; 
   d="scan'208";a="619152556"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Jun 2021 20:08:07 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lqS62-0008jD-IX; Tue, 08 Jun 2021 03:08:06 +0000
Date:   Tue, 08 Jun 2021 11:08:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 9a1f66c20bdd605801537cdf8b8b142838166fd2
Message-ID: <60bedf12.csXN7LCaAr9d6q3f%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 9a1f66c20bdd605801537cdf8b8b142838166fd2  m68k: atari: Fix ATARI_KBD_CORE kconfig unmet dependency warning

elapsed time: 732m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                     loongson2k_defconfig
sh                          r7780mp_defconfig
arc                    vdk_hs38_smp_defconfig
arm                      pxa255-idp_defconfig
arm                         assabet_defconfig
arc                          axs103_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                             sh03_defconfig
arm                           sama5_defconfig
mips                        omega2p_defconfig
s390                             alldefconfig
powerpc                     powernv_defconfig
mips                           rs90_defconfig
arm                         mv78xx0_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          simpad_defconfig
xtensa                           allyesconfig
arc                            hsdk_defconfig
s390                                defconfig
powerpc                      pasemi_defconfig
arm                        realview_defconfig
mips                           ci20_defconfig
powerpc                 mpc832x_mds_defconfig
sh                             espt_defconfig
arc                           tb10x_defconfig
powerpc                         wii_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                           se7343_defconfig
arm                        shmobile_defconfig
m68k                            q40_defconfig
arm                         vf610m4_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                            migor_defconfig
um                           x86_64_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                            qcom_defconfig
mips                           mtx1_defconfig
arm                         s5pv210_defconfig
nios2                               defconfig
arc                        vdk_hs38_defconfig
sh                         microdev_defconfig
sh                     magicpanelr2_defconfig
sh                      rts7751r2d1_defconfig
sh                                  defconfig
powerpc                        warp_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                        fsp2_defconfig
x86_64                              defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
csky                                defconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210607
i386                 randconfig-a006-20210607
i386                 randconfig-a004-20210607
i386                 randconfig-a002-20210607
i386                 randconfig-a001-20210607
i386                 randconfig-a005-20210607
x86_64               randconfig-a015-20210607
x86_64               randconfig-a011-20210607
x86_64               randconfig-a013-20210607
x86_64               randconfig-a014-20210607
x86_64               randconfig-a012-20210607
x86_64               randconfig-a016-20210607
i386                 randconfig-a015-20210607
i386                 randconfig-a011-20210607
i386                 randconfig-a012-20210607
i386                 randconfig-a013-20210607
i386                 randconfig-a016-20210607
i386                 randconfig-a014-20210607
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210607
x86_64               randconfig-a004-20210607
x86_64               randconfig-a003-20210607
x86_64               randconfig-a006-20210607
x86_64               randconfig-a001-20210607
x86_64               randconfig-a002-20210607
x86_64               randconfig-a005-20210607

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
