Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B678C433ED
	for <linux-m68k@archiver.kernel.org>; Mon, 19 Apr 2021 23:33:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F34CE61077
	for <linux-m68k@archiver.kernel.org>; Mon, 19 Apr 2021 23:33:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbhDSXd6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 19 Apr 2021 19:33:58 -0400
Received: from mga09.intel.com ([134.134.136.24]:63970 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229842AbhDSXd5 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 19 Apr 2021 19:33:57 -0400
IronPort-SDR: O+xEtNi4hPie2cDTJiT3G+ueZg8OuRfn+YWAE8Ki23Cw7kQVvNM8ip0gi/1nvvbpew7Te7DQIE
 O6+ecycRDCwg==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="195529648"
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; 
   d="scan'208";a="195529648"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2021 16:33:25 -0700
IronPort-SDR: 8bmvwhWyIBuQoaHM5ATob/ouPQPG1FkZGb7WGbmqvlaMtUs3aEIXkhigb2i9DXLefAS2f0U5wT
 lJtGMROZN3OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; 
   d="scan'208";a="383888203"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Apr 2021 16:33:23 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lYdOM-0001xr-QX; Mon, 19 Apr 2021 23:33:22 +0000
Date:   Tue, 20 Apr 2021 07:32:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 116a46c3f0cf8a2053aef36d5e59fc3dea7da0d5
Message-ID: <607e1311.AesqewX8atBiRAwN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 116a46c3f0cf8a2053aef36d5e59fc3dea7da0d5  m68k: sun3x: Remove unneeded semicolon

elapsed time: 724m

configs tested: 121
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
arm                        mvebu_v5_defconfig
arm                        realview_defconfig
powerpc                     pseries_defconfig
arm                      pxa255-idp_defconfig
arm                       versatile_defconfig
arm                       multi_v4t_defconfig
sh                           se7206_defconfig
powerpc                      ep88xc_defconfig
powerpc                     sbc8548_defconfig
mips                            gpr_defconfig
arm                         orion5x_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc834x_itx_defconfig
xtensa                    smp_lx200_defconfig
arm                        mini2440_defconfig
arm                        neponset_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                         ps3_defconfig
xtensa                           allyesconfig
powerpc                 mpc832x_rdb_defconfig
sparc                       sparc64_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                            hp6xx_defconfig
powerpc                     redwood_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                      bamboo_defconfig
ia64                         bigsur_defconfig
arm                          simpad_defconfig
ia64                                defconfig
sparc                               defconfig
powerpc                      ppc64e_defconfig
powerpc                         wii_defconfig
mips                            e55_defconfig
xtensa                generic_kc705_defconfig
m68k                        mvme16x_defconfig
mips                          rm200_defconfig
powerpc                     tqm8560_defconfig
powerpc                     ksi8560_defconfig
arc                          axs101_defconfig
arm                          pxa168_defconfig
riscv                          rv32_defconfig
powerpc                 mpc836x_mds_defconfig
arm                          gemini_defconfig
arm                          exynos_defconfig
powerpc                     kmeter1_defconfig
powerpc                 mpc834x_mds_defconfig
ia64                             allmodconfig
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
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210419
x86_64               randconfig-a001-20210419
x86_64               randconfig-a005-20210419
x86_64               randconfig-a002-20210419
x86_64               randconfig-a006-20210419
x86_64               randconfig-a004-20210419
i386                 randconfig-a003-20210419
i386                 randconfig-a001-20210419
i386                 randconfig-a006-20210419
i386                 randconfig-a005-20210419
i386                 randconfig-a004-20210419
i386                 randconfig-a002-20210419
i386                 randconfig-a015-20210419
i386                 randconfig-a013-20210419
i386                 randconfig-a014-20210419
i386                 randconfig-a016-20210419
i386                 randconfig-a012-20210419
i386                 randconfig-a011-20210419
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
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
x86_64               randconfig-a014-20210419
x86_64               randconfig-a015-20210419
x86_64               randconfig-a013-20210419
x86_64               randconfig-a011-20210419
x86_64               randconfig-a012-20210419
x86_64               randconfig-a016-20210419

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
