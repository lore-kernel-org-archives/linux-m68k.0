Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E17C432BE
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Aug 2021 21:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8251160F3A
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Aug 2021 21:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhH3V0r (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Aug 2021 17:26:47 -0400
Received: from mga01.intel.com ([192.55.52.88]:56517 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230255AbhH3V0n (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Aug 2021 17:26:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="240597422"
X-IronPort-AV: E=Sophos;i="5.84,364,1620716400"; 
   d="scan'208";a="240597422"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 14:25:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,364,1620716400"; 
   d="scan'208";a="459597088"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Aug 2021 14:25:46 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mKomn-0005Vu-IK; Mon, 30 Aug 2021 21:25:45 +0000
Date:   Tue, 31 Aug 2021 05:24:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-v5.14] BUILD SUCCESS
 9bebcd3cc120ae9463b619251362ed460f0ccb3c
Message-ID: <612d4ca4.FLX/5YUcMM8vKt6K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v5.14
branch HEAD: 9bebcd3cc120ae9463b619251362ed460f0ccb3c  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 720m

configs tested: 167
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210830
s390                       zfcpdump_defconfig
mips                         tb0287_defconfig
m68k                       m5475evb_defconfig
powerpc                     sequoia_defconfig
arm                              alldefconfig
arm                          gemini_defconfig
powerpc64                           defconfig
powerpc                      arches_defconfig
arm                         vf610m4_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     tqm8541_defconfig
mips                          ath25_defconfig
arc                     nsimosci_hs_defconfig
arm                         nhk8815_defconfig
arm                       omap2plus_defconfig
arm                          pxa3xx_defconfig
arm                           h3600_defconfig
arm                          iop32x_defconfig
mips                      pistachio_defconfig
xtensa                  nommu_kc705_defconfig
sh                           se7206_defconfig
mips                     loongson2k_defconfig
arm                           h5000_defconfig
xtensa                         virt_defconfig
powerpc                     powernv_defconfig
sh                          sdk7786_defconfig
csky                                defconfig
arm                        neponset_defconfig
mips                           ip28_defconfig
powerpc                          g5_defconfig
powerpc                        cell_defconfig
ia64                             alldefconfig
mips                         tb0219_defconfig
mips                           xway_defconfig
mips                         mpc30x_defconfig
arm                          badge4_defconfig
mips                         cobalt_defconfig
sh                        edosk7705_defconfig
powerpc                     mpc5200_defconfig
sparc64                             defconfig
arm                        magician_defconfig
mips                        nlm_xlr_defconfig
mips                           ci20_defconfig
openrisc                  or1klitex_defconfig
mips                      malta_kvm_defconfig
powerpc                      cm5200_defconfig
sparc                       sparc32_defconfig
powerpc                  mpc885_ads_defconfig
arm                            mmp2_defconfig
powerpc                      ppc6xx_defconfig
sh                           se7721_defconfig
m68k                             alldefconfig
mips                      fuloong2e_defconfig
powerpc                      bamboo_defconfig
arm                         s3c2410_defconfig
arm                           sunxi_defconfig
mips                           gcw0_defconfig
powerpc                    socrates_defconfig
arm                       netwinder_defconfig
arc                           tb10x_defconfig
sh                          rsk7201_defconfig
mips                     cu1830-neo_defconfig
alpha                            alldefconfig
sh                            titan_defconfig
mips                       bmips_be_defconfig
h8300                       h8s-sim_defconfig
sh                           se7724_defconfig
m68k                        m5407c3_defconfig
sh                         apsh4a3a_defconfig
powerpc                 mpc834x_mds_defconfig
mips                        vocore2_defconfig
nios2                         3c120_defconfig
m68k                            q40_defconfig
sh                           se7751_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                   sh7770_generic_defconfig
arm                         bcm2835_defconfig
powerpc                     tqm8555_defconfig
powerpc                     pq2fads_defconfig
mips                     decstation_defconfig
arm                         s3c6400_defconfig
powerpc                       eiger_defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a014-20210830
x86_64               randconfig-a015-20210830
x86_64               randconfig-a013-20210830
x86_64               randconfig-a016-20210830
x86_64               randconfig-a012-20210830
x86_64               randconfig-a011-20210830
i386                 randconfig-a016-20210830
i386                 randconfig-a011-20210830
i386                 randconfig-a015-20210830
i386                 randconfig-a014-20210830
i386                 randconfig-a012-20210830
i386                 randconfig-a013-20210830
s390                 randconfig-r044-20210830
arc                  randconfig-r043-20210830
riscv                randconfig-r042-20210830
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
i386                 randconfig-c001-20210830
s390                 randconfig-c005-20210830
riscv                randconfig-c006-20210830
powerpc              randconfig-c003-20210830
mips                 randconfig-c004-20210830
arm                  randconfig-c002-20210830
x86_64               randconfig-c007-20210830
x86_64               randconfig-a005-20210830
x86_64               randconfig-a001-20210830
x86_64               randconfig-a003-20210830
x86_64               randconfig-a002-20210830
x86_64               randconfig-a004-20210830
x86_64               randconfig-a006-20210830
i386                 randconfig-a005-20210830
i386                 randconfig-a002-20210830
i386                 randconfig-a003-20210830
i386                 randconfig-a006-20210830
i386                 randconfig-a004-20210830
i386                 randconfig-a001-20210830

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
