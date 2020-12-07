Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F6FC0018C
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Dec 2020 23:32:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6459D23A21
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Dec 2020 23:32:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgLGXcK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Dec 2020 18:32:10 -0500
Received: from mga09.intel.com ([134.134.136.24]:13241 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727135AbgLGXcJ (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Dec 2020 18:32:09 -0500
IronPort-SDR: 9CKuxJqUJ3ey3sFrEQhnEZcIPI1KcIbgbmpKher9A5cnwS7rqDVnXNqtjRF5jiN/yvBpK2ILzJ
 zLVM2jA0sCAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173945856"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; 
   d="scan'208";a="173945856"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 15:31:28 -0800
IronPort-SDR: ZkqNgmQe7qeZAjEMKNGUGj6bea0m1R8VnChOAq/bhC4XPDkfMHtl+kFN2U4LUh2LxZ9NoSvytu
 ZPXxaafnmUlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; 
   d="scan'208";a="317443783"
Received: from lkp-server01.sh.intel.com (HELO f1d34cfde454) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2020 15:31:26 -0800
Received: from kbuild by f1d34cfde454 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kmPyY-0000CF-4r; Mon, 07 Dec 2020 23:31:26 +0000
Date:   Tue, 08 Dec 2020 07:30:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:for-next] BUILD SUCCESS
 2ae92e8b9b7eb042ccb7e9fc7ea9431f211a1bd3
Message-ID: <5fcebb21.0eICRJs2TOAUO6su%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  for-next
branch HEAD: 2ae92e8b9b7eb042ccb7e9fc7ea9431f211a1bd3  MAINTAINERS: Update m68k Mac entry

elapsed time: 722m

configs tested: 184
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
powerpc                      walnut_defconfig
arm                         palmz72_defconfig
arm                          simpad_defconfig
arm                         cm_x300_defconfig
mips                      maltasmvp_defconfig
arc                     nsimosci_hs_defconfig
powerpc                     kilauea_defconfig
s390                                defconfig
arm                       imx_v6_v7_defconfig
arm                          tango4_defconfig
microblaze                      mmu_defconfig
arm                        trizeps4_defconfig
arm                         shannon_defconfig
arc                         haps_hs_defconfig
sh                               j2_defconfig
mips                         cobalt_defconfig
powerpc                  mpc866_ads_defconfig
xtensa                    smp_lx200_defconfig
arm                        multi_v5_defconfig
arm                  colibri_pxa270_defconfig
sh                   rts7751r2dplus_defconfig
arm                         orion5x_defconfig
powerpc                  mpc885_ads_defconfig
mips                           ip28_defconfig
powerpc                     pq2fads_defconfig
powerpc                 mpc832x_rdb_defconfig
c6x                         dsk6455_defconfig
m68k                        m5272c3_defconfig
xtensa                generic_kc705_defconfig
m68k                        mvme16x_defconfig
m68k                          amiga_defconfig
mips                      pistachio_defconfig
sh                           se7750_defconfig
mips                     cu1830-neo_defconfig
mips                    maltaup_xpa_defconfig
mips                         tb0226_defconfig
arm                        multi_v7_defconfig
powerpc                   motionpro_defconfig
mips                malta_qemu_32r6_defconfig
arm                           stm32_defconfig
sh                             shx3_defconfig
powerpc                      ep88xc_defconfig
arm                         bcm2835_defconfig
mips                        maltaup_defconfig
powerpc                      makalu_defconfig
m68k                          multi_defconfig
h8300                     edosk2674_defconfig
sh                   secureedge5410_defconfig
arm                            dove_defconfig
powerpc                        icon_defconfig
arm                         s3c6400_defconfig
powerpc                     tqm8555_defconfig
arm                          ixp4xx_defconfig
sh                           se7780_defconfig
mips                     loongson1b_defconfig
arc                            hsdk_defconfig
sh                            shmin_defconfig
c6x                              alldefconfig
arc                     haps_hs_smp_defconfig
arm                            mmp2_defconfig
arm                          pcm027_defconfig
m68k                         amcore_defconfig
arm                          pxa168_defconfig
mips                      fuloong2e_defconfig
x86_64                           alldefconfig
openrisc                 simple_smp_defconfig
powerpc                      pcm030_defconfig
powerpc                 mpc8313_rdb_defconfig
sparc                            alldefconfig
arm                      footbridge_defconfig
powerpc                      ppc40x_defconfig
sh                            migor_defconfig
arm                            qcom_defconfig
powerpc                      katmai_defconfig
c6x                        evmc6474_defconfig
sh                        edosk7705_defconfig
mips                           xway_defconfig
powerpc                       maple_defconfig
powerpc                      chrp32_defconfig
sh                          rsk7269_defconfig
arm                           sama5_defconfig
mips                      bmips_stb_defconfig
powerpc                     ksi8560_defconfig
mips                         rt305x_defconfig
nios2                         3c120_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                    klondike_defconfig
sparc64                          alldefconfig
arm                         mv78xx0_defconfig
mips                            ar7_defconfig
arm                       netwinder_defconfig
x86_64                              defconfig
arm                             ezx_defconfig
mips                          ath79_defconfig
mips                         tb0287_defconfig
m68k                             alldefconfig
arm                           omap1_defconfig
um                            kunit_defconfig
arm                       mainstone_defconfig
arc                              alldefconfig
mips                           ip32_defconfig
arm                          lpd270_defconfig
powerpc                         ps3_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                 mpc837x_rdb_defconfig
nds32                             allnoconfig
arc                 nsimosci_hs_smp_defconfig
mips                          rb532_defconfig
sh                          landisk_defconfig
arm64                            alldefconfig
arm                            u300_defconfig
powerpc                     stx_gp3_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20201207
i386                 randconfig-a004-20201207
i386                 randconfig-a001-20201207
i386                 randconfig-a002-20201207
i386                 randconfig-a006-20201207
i386                 randconfig-a003-20201207
x86_64               randconfig-a016-20201207
x86_64               randconfig-a012-20201207
x86_64               randconfig-a014-20201207
x86_64               randconfig-a013-20201207
x86_64               randconfig-a015-20201207
x86_64               randconfig-a011-20201207
i386                 randconfig-a014-20201207
i386                 randconfig-a013-20201207
i386                 randconfig-a011-20201207
i386                 randconfig-a015-20201207
i386                 randconfig-a012-20201207
i386                 randconfig-a016-20201207
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
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201207
x86_64               randconfig-a006-20201207
x86_64               randconfig-a002-20201207
x86_64               randconfig-a001-20201207
x86_64               randconfig-a005-20201207
x86_64               randconfig-a003-20201207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
