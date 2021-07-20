Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501B8C07E95
	for <linux-m68k@archiver.kernel.org>; Tue, 20 Jul 2021 06:12:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E6F16113A
	for <linux-m68k@archiver.kernel.org>; Tue, 20 Jul 2021 06:12:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236197AbhGTFcE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 20 Jul 2021 01:32:04 -0400
Received: from mga05.intel.com ([192.55.52.43]:10943 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236094AbhGTFcA (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 20 Jul 2021 01:32:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="296746091"
X-IronPort-AV: E=Sophos;i="5.84,254,1620716400"; 
   d="scan'208";a="296746091"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2021 23:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,254,1620716400"; 
   d="scan'208";a="453933879"
Received: from lkp-server02.sh.intel.com (HELO 1b5a72ed9419) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Jul 2021 23:12:23 -0700
Received: from kbuild by 1b5a72ed9419 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m5izO-00001u-D3; Tue, 20 Jul 2021 06:12:22 +0000
Date:   Tue, 20 Jul 2021 08:10:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 05f25d0bea1e40424b38787cf1a81f65684e760c
Message-ID: <60f61461.Gury7I3JENBeT44Z%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 05f25d0bea1e40424b38787cf1a81f65684e760c  m68k: emu: Fix invalid free in nfeth_cleanup()

elapsed time: 794m

configs tested: 172
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                  colibri_pxa300_defconfig
arm                       netwinder_defconfig
powerpc                    gamecube_defconfig
m68k                           sun3_defconfig
sh                            hp6xx_defconfig
powerpc                     rainier_defconfig
x86_64                              defconfig
mips                   sb1250_swarm_defconfig
arm                        shmobile_defconfig
sh                        dreamcast_defconfig
arm                        neponset_defconfig
sh                     sh7710voipgw_defconfig
openrisc                 simple_smp_defconfig
arm                            mps2_defconfig
mips                  maltasmvp_eva_defconfig
sparc64                             defconfig
arm                         mv78xx0_defconfig
arm                         lpc32xx_defconfig
arm                          imote2_defconfig
powerpc                     ep8248e_defconfig
mips                             allmodconfig
sh                           se7343_defconfig
powerpc                     stx_gp3_defconfig
mips                           ci20_defconfig
mips                          malta_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                       rbtx49xx_defconfig
powerpc                     mpc83xx_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                             mxs_defconfig
arm                            pleb_defconfig
mips                        omega2p_defconfig
mips                           ip32_defconfig
mips                     loongson1c_defconfig
powerpc                      bamboo_defconfig
powerpc                      katmai_defconfig
sh                           se7780_defconfig
arm                        mvebu_v5_defconfig
arm                         lubbock_defconfig
arm                   milbeaut_m10v_defconfig
um                               alldefconfig
powerpc                  iss476-smp_defconfig
arm                       imx_v4_v5_defconfig
sh                          polaris_defconfig
m68k                        m5307c3_defconfig
parisc                              defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                   microwatt_defconfig
arm                         at91_dt_defconfig
mips                        bcm63xx_defconfig
powerpc                      ppc44x_defconfig
m68k                             allyesconfig
powerpc                 xes_mpc85xx_defconfig
sh                               j2_defconfig
powerpc                 mpc832x_mds_defconfig
arm                            mmp2_defconfig
arm                       mainstone_defconfig
sh                          r7780mp_defconfig
arm                           u8500_defconfig
openrisc                         alldefconfig
arm                          gemini_defconfig
xtensa                    xip_kc705_defconfig
riscv                    nommu_virt_defconfig
arm                           spitz_defconfig
powerpc                     ppa8548_defconfig
sh                     magicpanelr2_defconfig
powerpc                           allnoconfig
powerpc                   motionpro_defconfig
m68k                          atari_defconfig
sh                ecovec24-romimage_defconfig
sh                               allmodconfig
arm                    vt8500_v6_v7_defconfig
nds32                             allnoconfig
arm                        trizeps4_defconfig
h8300                            allyesconfig
h8300                     edosk2674_defconfig
powerpc                     tqm8548_defconfig
sh                   rts7751r2dplus_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
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
x86_64               randconfig-a005-20210718
x86_64               randconfig-a004-20210718
x86_64               randconfig-a002-20210718
x86_64               randconfig-a003-20210718
x86_64               randconfig-a006-20210718
x86_64               randconfig-a001-20210718
i386                 randconfig-a005-20210720
i386                 randconfig-a003-20210720
i386                 randconfig-a004-20210720
i386                 randconfig-a002-20210720
i386                 randconfig-a001-20210720
i386                 randconfig-a006-20210720
i386                 randconfig-a005-20210719
i386                 randconfig-a004-20210719
i386                 randconfig-a006-20210719
i386                 randconfig-a001-20210719
i386                 randconfig-a003-20210719
i386                 randconfig-a002-20210719
x86_64               randconfig-a013-20210719
x86_64               randconfig-a012-20210719
x86_64               randconfig-a015-20210719
x86_64               randconfig-a014-20210719
x86_64               randconfig-a011-20210719
x86_64               randconfig-a016-20210719
i386                 randconfig-a014-20210719
i386                 randconfig-a015-20210719
i386                 randconfig-a011-20210719
i386                 randconfig-a013-20210719
i386                 randconfig-a016-20210719
i386                 randconfig-a012-20210719
i386                 randconfig-a016-20210720
i386                 randconfig-a013-20210720
i386                 randconfig-a012-20210720
i386                 randconfig-a014-20210720
i386                 randconfig-a011-20210720
i386                 randconfig-a015-20210720
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210720
x86_64               randconfig-b001-20210719
x86_64               randconfig-a005-20210719
x86_64               randconfig-a004-20210719
x86_64               randconfig-a002-20210719
x86_64               randconfig-a003-20210719
x86_64               randconfig-a006-20210719
x86_64               randconfig-a001-20210719
x86_64               randconfig-a011-20210720
x86_64               randconfig-a016-20210720
x86_64               randconfig-a013-20210720
x86_64               randconfig-a014-20210720
x86_64               randconfig-a012-20210720
x86_64               randconfig-a015-20210720

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
