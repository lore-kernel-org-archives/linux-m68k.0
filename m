Return-Path: <SRS0=jiH+=DF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E66C2D0A8
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Sep 2020 21:40:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B80C62083B
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Sep 2020 21:40:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgI1VkV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Sep 2020 17:40:21 -0400
Received: from mga04.intel.com ([192.55.52.120]:17351 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726958AbgI1VkV (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 28 Sep 2020 17:40:21 -0400
IronPort-SDR: +tXJVEsEWL888YULwzH5GzBcJyryEB3+YTVI38YeORDaQHXadt0N4zQDb4WceIuCERLZJc1qLy
 4P9sG3fdMjfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="159445363"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="159445363"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 14:27:15 -0700
IronPort-SDR: 6uHgVc09equlDxJQ2VTnO+MSb4hJD6TnNSW0t39NY62WzBZPdywo7AjT8s4QlZ7uk4qGv2Ek61
 PkIiBJ0o1H2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="345027768"
Received: from lkp-server01.sh.intel.com (HELO 0e0978ea3297) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2020 14:27:14 -0700
Received: from kbuild by 0e0978ea3297 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kN0fx-0000PB-Tv; Mon, 28 Sep 2020 21:27:13 +0000
Date:   Tue, 29 Sep 2020 05:26:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:for-v5.10] BUILD SUCCESS
 50c5feeea0af99a4401fd54fd72bec1333a496ca
Message-ID: <5f725520.PxEqqgj8HJu91dny%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  for-v5.10
branch HEAD: 50c5feeea0af99a4401fd54fd72bec1333a496ca  ide/macide: Convert Mac IDE driver to platform driver

elapsed time: 725m

configs tested: 158
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                                 defconfig
sparc                               defconfig
mips                           mtx1_defconfig
powerpc                      bamboo_defconfig
riscv                    nommu_virt_defconfig
s390                                defconfig
nios2                               defconfig
powerpc                    amigaone_defconfig
sh                          kfr2r09_defconfig
mips                         cobalt_defconfig
sh                          rsk7269_defconfig
powerpc                    adder875_defconfig
powerpc                 mpc8560_ads_defconfig
m68k                         amcore_defconfig
sparc64                          alldefconfig
powerpc                      acadia_defconfig
ia64                             allmodconfig
powerpc                      obs600_defconfig
sh                        apsh4ad0a_defconfig
sh                            shmin_defconfig
arm                        neponset_defconfig
arm                          collie_defconfig
nios2                         3c120_defconfig
powerpc                     rainier_defconfig
powerpc                     mpc512x_defconfig
mips                       lemote2f_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
arc                         haps_hs_defconfig
mips                        qi_lb60_defconfig
arm                        vexpress_defconfig
mips                           ci20_defconfig
sh                        edosk7760_defconfig
mips                      bmips_stb_defconfig
arm                        magician_defconfig
mips                           ip22_defconfig
mips                        workpad_defconfig
xtensa                       common_defconfig
powerpc64                        alldefconfig
arm                          lpd270_defconfig
arm                        multi_v7_defconfig
arm                       aspeed_g4_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                        mvebu_v5_defconfig
mips                    maltaup_xpa_defconfig
powerpc                          allmodconfig
arm                          simpad_defconfig
powerpc                     akebono_defconfig
arc                          axs101_defconfig
arm                          prima2_defconfig
sh                        sh7763rdp_defconfig
sh                           se7619_defconfig
ia64                      gensparse_defconfig
mips                     loongson1b_defconfig
xtensa                    smp_lx200_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                           gcw0_defconfig
m68k                             allmodconfig
arm                         vf610m4_defconfig
mips                       rbtx49xx_defconfig
arc                           tb10x_defconfig
arm                          ep93xx_defconfig
powerpc                     mpc83xx_defconfig
ia64                             alldefconfig
sh                   rts7751r2dplus_defconfig
sh                      rts7751r2d1_defconfig
m68k                             alldefconfig
mips                     decstation_defconfig
arm                           stm32_defconfig
powerpc                     kilauea_defconfig
powerpc                   lite5200b_defconfig
m68k                          sun3x_defconfig
powerpc                     sequoia_defconfig
arm                         orion5x_defconfig
powerpc                 mpc8540_ads_defconfig
sh                            titan_defconfig
powerpc                   currituck_defconfig
mips                        bcm47xx_defconfig
parisc                              defconfig
powerpc                     ep8248e_defconfig
sh                        dreamcast_defconfig
parisc                           allyesconfig
arm                          pxa910_defconfig
sh                           se7750_defconfig
mips                           xway_defconfig
arm                        cerfcube_defconfig
arm                  colibri_pxa270_defconfig
sh                          rsk7201_defconfig
mips                      maltaaprp_defconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nios2                            allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20200928
x86_64               randconfig-a003-20200928
x86_64               randconfig-a004-20200928
x86_64               randconfig-a002-20200928
x86_64               randconfig-a006-20200928
x86_64               randconfig-a001-20200928
i386                 randconfig-a006-20200928
i386                 randconfig-a002-20200928
i386                 randconfig-a003-20200928
i386                 randconfig-a004-20200928
i386                 randconfig-a005-20200928
i386                 randconfig-a001-20200928
i386                 randconfig-a012-20200928
i386                 randconfig-a016-20200928
i386                 randconfig-a014-20200928
i386                 randconfig-a013-20200928
i386                 randconfig-a015-20200928
i386                 randconfig-a011-20200928
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20200927
x86_64               randconfig-a003-20200927
x86_64               randconfig-a004-20200927
x86_64               randconfig-a002-20200927
x86_64               randconfig-a006-20200927
x86_64               randconfig-a001-20200927
x86_64               randconfig-a011-20200928
x86_64               randconfig-a013-20200928
x86_64               randconfig-a015-20200928
x86_64               randconfig-a014-20200928
x86_64               randconfig-a016-20200928
x86_64               randconfig-a012-20200928

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
