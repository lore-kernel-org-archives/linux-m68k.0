Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8EAC2BB48
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Dec 2020 21:00:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D552224B0
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Dec 2020 21:00:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503608AbgLNU75 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Dec 2020 15:59:57 -0500
Received: from mga09.intel.com ([134.134.136.24]:35131 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503625AbgLNU7j (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Dec 2020 15:59:39 -0500
IronPort-SDR: pSjd5M2aeuH0HBSQhO9ly0fijlhnlm6WkdSylQ/PtQAlq8LIxzL4leWSDRH/AqvAIh6Gb/4y+V
 zvsz9kunrsqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="174921569"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="174921569"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 12:58:54 -0800
IronPort-SDR: NAovHAWrG2PvPfE22cabRGvvdnKDY3Gdz8mtGd1hUQ4a2JNgpsMwWDnNTEqa8FlTd65ff3uYl4
 JImXubLOhWLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="389440384"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2020 12:58:52 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kouvk-0000Sx-2M; Mon, 14 Dec 2020 20:58:52 +0000
Date:   Tue, 15 Dec 2020 04:58:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-queue] BUILD SUCCESS
 2c8080953b63a1dd1ac4c60539f4d22f3cdbf4e8
Message-ID: <5fd7d201.AXg9uC7j1yj51qOt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
branch HEAD: 2c8080953b63a1dd1ac4c60539f4d22f3cdbf4e8  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 720m

configs tested: 153
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5249evb_defconfig
powerpc                mpc7448_hpc2_defconfig
microblaze                      mmu_defconfig
sh                           se7705_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7206_defconfig
powerpc                   bluestone_defconfig
sh                   secureedge5410_defconfig
c6x                         dsk6455_defconfig
xtensa                    smp_lx200_defconfig
mips                          malta_defconfig
xtensa                    xip_kc705_defconfig
mips                           xway_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     ppa8548_defconfig
microblaze                    nommu_defconfig
powerpc                      tqm8xx_defconfig
m68k                         apollo_defconfig
sparc                               defconfig
arm                             mxs_defconfig
powerpc                     sbc8548_defconfig
mips                        nlm_xlr_defconfig
arm                         hackkit_defconfig
parisc                              defconfig
mips                         bigsur_defconfig
m68k                       m5275evb_defconfig
arc                      axs103_smp_defconfig
mips                          rm200_defconfig
arm                       spear13xx_defconfig
i386                             alldefconfig
arm                       cns3420vb_defconfig
arc                            hsdk_defconfig
m68k                          sun3x_defconfig
powerpc                      acadia_defconfig
arm                          pxa168_defconfig
powerpc                    sam440ep_defconfig
powerpc                      cm5200_defconfig
xtensa                  audio_kc705_defconfig
sh                        dreamcast_defconfig
arm                        clps711x_defconfig
mips                        jmr3927_defconfig
i386                                defconfig
arm                  colibri_pxa270_defconfig
powerpc                     mpc512x_defconfig
powerpc                         ps3_defconfig
powerpc                      obs600_defconfig
sh                ecovec24-romimage_defconfig
sh                   sh7770_generic_defconfig
powerpc                     kmeter1_defconfig
mips                        nlm_xlp_defconfig
powerpc                     akebono_defconfig
powerpc                    adder875_defconfig
m68k                          amiga_defconfig
powerpc                       holly_defconfig
mips                      maltaaprp_defconfig
mips                     loongson1b_defconfig
sh                             sh03_defconfig
x86_64                           alldefconfig
arm                      pxa255-idp_defconfig
arm                         cm_x300_defconfig
openrisc                         alldefconfig
arm                         at91_dt_defconfig
arm                       netwinder_defconfig
arm                          ixp4xx_defconfig
arm                          pxa910_defconfig
sh                         ap325rxa_defconfig
powerpc                     tqm5200_defconfig
csky                             alldefconfig
mips                      pistachio_defconfig
mips                         tb0287_defconfig
powerpc                     tqm8541_defconfig
sh                          urquell_defconfig
arc                        nsim_700_defconfig
powerpc                     tqm8555_defconfig
arc                              alldefconfig
arm                           sama5_defconfig
arm                        mvebu_v5_defconfig
mips                         mpc30x_defconfig
m68k                       m5475evb_defconfig
mips                        bcm47xx_defconfig
m68k                          multi_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20201214
i386                 randconfig-a004-20201214
i386                 randconfig-a003-20201214
i386                 randconfig-a002-20201214
i386                 randconfig-a006-20201214
i386                 randconfig-a005-20201214
x86_64               randconfig-a016-20201214
x86_64               randconfig-a012-20201214
x86_64               randconfig-a013-20201214
x86_64               randconfig-a015-20201214
x86_64               randconfig-a014-20201214
x86_64               randconfig-a011-20201214
i386                 randconfig-a014-20201214
i386                 randconfig-a013-20201214
i386                 randconfig-a012-20201214
i386                 randconfig-a011-20201214
i386                 randconfig-a015-20201214
i386                 randconfig-a016-20201214
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201214
x86_64               randconfig-a006-20201214
x86_64               randconfig-a002-20201214
x86_64               randconfig-a005-20201214
x86_64               randconfig-a004-20201214
x86_64               randconfig-a001-20201214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
