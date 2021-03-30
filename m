Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A7EC433C1
	for <linux-m68k@archiver.kernel.org>; Tue, 30 Mar 2021 05:57:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67F4F6198A
	for <linux-m68k@archiver.kernel.org>; Tue, 30 Mar 2021 05:57:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbhC3F50 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 30 Mar 2021 01:57:26 -0400
Received: from mga07.intel.com ([134.134.136.100]:16906 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229822AbhC3F5R (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 30 Mar 2021 01:57:17 -0400
IronPort-SDR: EG9ZFtwS7Spq8rw7sj5prS24b8YaIFuQf6oTh4o6Cy1khlXLByfLFZp5MgS5fWPupQK3qu78eg
 AiIrxSWc9x+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="255688637"
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; 
   d="scan'208";a="255688637"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 22:57:15 -0700
IronPort-SDR: UdMbVpa+h/bsNHWkD5YNFiUVvizN0l0/A15uQdFgQSZI/aezKd8EkRvW4+8nzjbztLdrYUl0aS
 76zhIRdu0xDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; 
   d="scan'208";a="527215163"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Mar 2021 22:57:13 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lR7NJ-00054M-2A; Tue, 30 Mar 2021 05:57:13 +0000
Date:   Tue, 30 Mar 2021 13:56:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:for-v5.13] BUILD SUCCESS
 152ec0d0d0e1643cd6392b691c3dd6d1fb0fe391
Message-ID: <6062bd84.uQIJqWyZCP6PNFM4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.13
branch HEAD: 152ec0d0d0e1643cd6392b691c3dd6d1fb0fe391  m68k: defconfig: Update defconfigs for v5.12-rc1

elapsed time: 1245m

configs tested: 196
configs skipped: 101

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
riscv                            allyesconfig
arm64                            alldefconfig
xtensa                              defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                          atari_defconfig
sh                           se7712_defconfig
arc                        nsim_700_defconfig
arc                           tb10x_defconfig
arm                        keystone_defconfig
powerpc                      pcm030_defconfig
powerpc                    socrates_defconfig
mips                       lemote2f_defconfig
powerpc                      ppc44x_defconfig
arm                    vt8500_v6_v7_defconfig
arm                         cm_x300_defconfig
riscv                            alldefconfig
arm                            hisi_defconfig
microblaze                      mmu_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                            hsdk_defconfig
sh                            hp6xx_defconfig
powerpc                      makalu_defconfig
powerpc                      walnut_defconfig
parisc                generic-32bit_defconfig
sh                         ecovec24_defconfig
sh                                  defconfig
arm                      pxa255-idp_defconfig
arm                          iop32x_defconfig
powerpc                 mpc836x_mds_defconfig
sh                               j2_defconfig
powerpc                      cm5200_defconfig
sh                   secureedge5410_defconfig
arm                        spear3xx_defconfig
powerpc                    sam440ep_defconfig
powerpc                  storcenter_defconfig
parisc                           allyesconfig
arm                          simpad_defconfig
m68k                        stmark2_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                       ebony_defconfig
sh                            titan_defconfig
sparc64                             defconfig
powerpc                 mpc834x_itx_defconfig
mips                         tb0219_defconfig
mips                            ar7_defconfig
arm                     am200epdkit_defconfig
arm                          pxa910_defconfig
arm                          collie_defconfig
sh                           se7722_defconfig
xtensa                generic_kc705_defconfig
parisc                generic-64bit_defconfig
m68k                        mvme147_defconfig
h8300                    h8300h-sim_defconfig
powerpc                        cell_defconfig
riscv                    nommu_virt_defconfig
powerpc                   motionpro_defconfig
mips                           gcw0_defconfig
arm                          gemini_defconfig
powerpc                     ppa8548_defconfig
mips                         cobalt_defconfig
arm                      tct_hammer_defconfig
powerpc                       holly_defconfig
m68k                            mac_defconfig
powerpc64                        alldefconfig
arm                         hackkit_defconfig
m68k                             alldefconfig
xtensa                  cadence_csp_defconfig
alpha                               defconfig
powerpc                     tqm8541_defconfig
i386                             alldefconfig
sparc                       sparc64_defconfig
arc                          axs101_defconfig
powerpc                      chrp32_defconfig
mips                           xway_defconfig
powerpc                 canyonlands_defconfig
sh                          rsk7203_defconfig
powerpc                     redwood_defconfig
powerpc                     tqm5200_defconfig
arm                  colibri_pxa270_defconfig
sh                        edosk7705_defconfig
sh                           se7724_defconfig
m68k                        m5407c3_defconfig
arm                          pcm027_defconfig
mips                           rs90_defconfig
powerpc                      ppc40x_defconfig
sh                        dreamcast_defconfig
arm                        clps711x_defconfig
powerpc                 mpc837x_mds_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                       maple_defconfig
mips                      fuloong2e_defconfig
mips                    maltaup_xpa_defconfig
sh                          rsk7201_defconfig
arm                             pxa_defconfig
sh                         ap325rxa_defconfig
mips                        maltaup_defconfig
powerpc                      katmai_defconfig
powerpc                     mpc5200_defconfig
powerpc                  mpc885_ads_defconfig
mips                     loongson1b_defconfig
mips                     decstation_defconfig
sh                         apsh4a3a_defconfig
arm                         assabet_defconfig
powerpc                      bamboo_defconfig
powerpc                        warp_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     pq2fads_defconfig
sh                        edosk7760_defconfig
sh                        sh7757lcr_defconfig
powerpc                         ps3_defconfig
arm                       mainstone_defconfig
arm                           omap1_defconfig
mips                      pic32mzda_defconfig
mips                        jmr3927_defconfig
m68k                       m5275evb_defconfig
mips                        nlm_xlp_defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210329
x86_64               randconfig-a003-20210329
x86_64               randconfig-a006-20210329
x86_64               randconfig-a001-20210329
x86_64               randconfig-a005-20210329
x86_64               randconfig-a004-20210329
i386                 randconfig-a003-20210329
i386                 randconfig-a004-20210329
i386                 randconfig-a001-20210329
i386                 randconfig-a002-20210329
i386                 randconfig-a006-20210329
i386                 randconfig-a005-20210329
i386                 randconfig-a004-20210330
i386                 randconfig-a006-20210330
i386                 randconfig-a003-20210330
i386                 randconfig-a002-20210330
i386                 randconfig-a001-20210330
i386                 randconfig-a005-20210330
i386                 randconfig-a014-20210329
i386                 randconfig-a011-20210329
i386                 randconfig-a015-20210329
i386                 randconfig-a016-20210329
i386                 randconfig-a013-20210329
i386                 randconfig-a012-20210329
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210329
x86_64               randconfig-a012-20210329
x86_64               randconfig-a013-20210329
x86_64               randconfig-a014-20210329
x86_64               randconfig-a011-20210329
x86_64               randconfig-a016-20210329

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
