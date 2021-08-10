Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AD0C4338F
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Aug 2021 21:21:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C5FE6024A
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Aug 2021 21:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbhHJVVb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 10 Aug 2021 17:21:31 -0400
Received: from mga09.intel.com ([134.134.136.24]:57180 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233887AbhHJVVb (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 10 Aug 2021 17:21:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="214983665"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="214983665"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 14:21:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="445375638"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Aug 2021 14:21:05 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mDZBJ-000Kwi-34; Tue, 10 Aug 2021 21:21:05 +0000
Date:   Wed, 11 Aug 2021 05:20:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 5f10755da6b9281682cd3cd9b5d868d1c94c0e03
Message-ID: <6112ed95.wznQs1tV1DpmXIzx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 5f10755da6b9281682cd3cd9b5d868d1c94c0e03  Merge tag 'v5.14-rc5'

elapsed time: 1988m

configs tested: 187
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7750_defconfig
arm                         at91_dt_defconfig
arm                          iop32x_defconfig
sh                               allmodconfig
h8300                     edosk2674_defconfig
sh                          r7785rp_defconfig
powerpc                     ksi8560_defconfig
sh                        edosk7705_defconfig
arm                         socfpga_defconfig
s390                             allyesconfig
arc                           tb10x_defconfig
powerpc                     kmeter1_defconfig
sh                         ecovec24_defconfig
arm                      jornada720_defconfig
xtensa                    xip_kc705_defconfig
parisc                              defconfig
m68k                        m5407c3_defconfig
powerpc                     rainier_defconfig
arm                    vt8500_v6_v7_defconfig
arc                                 defconfig
arm                           corgi_defconfig
mips                           rs90_defconfig
powerpc                      acadia_defconfig
mips                            gpr_defconfig
sh                          polaris_defconfig
alpha                            alldefconfig
xtensa                    smp_lx200_defconfig
parisc                generic-32bit_defconfig
arm                          imote2_defconfig
sh                          rsk7264_defconfig
ia64                        generic_defconfig
sh                        sh7785lcr_defconfig
xtensa                  nommu_kc705_defconfig
mips                           ip28_defconfig
powerpc                     tqm8541_defconfig
i386                             alldefconfig
powerpc                      bamboo_defconfig
arm                          pxa910_defconfig
sh                          landisk_defconfig
openrisc                         alldefconfig
arm                           stm32_defconfig
powerpc                      ppc64e_defconfig
powerpc                     tqm8540_defconfig
sh                         apsh4a3a_defconfig
mips                       capcella_defconfig
arm                      pxa255-idp_defconfig
sh                          rsk7201_defconfig
xtensa                         virt_defconfig
arm                         bcm2835_defconfig
sparc64                             defconfig
powerpc                      ppc40x_defconfig
mips                        nlm_xlp_defconfig
powerpc                 mpc834x_itx_defconfig
arm                       aspeed_g5_defconfig
arc                            hsdk_defconfig
mips                          rb532_defconfig
sh                     sh7710voipgw_defconfig
arm                        spear3xx_defconfig
mips                         tb0219_defconfig
arm                        neponset_defconfig
powerpc                      tqm8xx_defconfig
arm                       omap2plus_defconfig
powerpc                      mgcoge_defconfig
mips                         cobalt_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         s3c6400_defconfig
sh                             sh03_defconfig
riscv                    nommu_virt_defconfig
i386                                defconfig
powerpc                     tqm5200_defconfig
sh                            titan_defconfig
powerpc                     taishan_defconfig
arm                            hisi_defconfig
x86_64                            allnoconfig
sh                          urquell_defconfig
mips                     loongson1b_defconfig
mips                     loongson1c_defconfig
powerpc                       holly_defconfig
powerpc                 mpc8540_ads_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210810
x86_64               randconfig-a006-20210810
x86_64               randconfig-a003-20210810
x86_64               randconfig-a005-20210810
x86_64               randconfig-a002-20210810
x86_64               randconfig-a001-20210810
x86_64               randconfig-a003-20210809
x86_64               randconfig-a002-20210809
x86_64               randconfig-a004-20210809
x86_64               randconfig-a006-20210809
x86_64               randconfig-a001-20210809
x86_64               randconfig-a005-20210809
i386                 randconfig-a004-20210809
i386                 randconfig-a005-20210809
i386                 randconfig-a006-20210809
i386                 randconfig-a002-20210809
i386                 randconfig-a001-20210809
i386                 randconfig-a003-20210809
i386                 randconfig-a004-20210808
i386                 randconfig-a005-20210808
i386                 randconfig-a006-20210808
i386                 randconfig-a002-20210808
i386                 randconfig-a001-20210808
i386                 randconfig-a003-20210808
x86_64               randconfig-a016-20210808
x86_64               randconfig-a012-20210808
x86_64               randconfig-a013-20210808
x86_64               randconfig-a011-20210808
x86_64               randconfig-a014-20210808
x86_64               randconfig-a015-20210808
i386                 randconfig-a012-20210808
i386                 randconfig-a015-20210808
i386                 randconfig-a011-20210808
i386                 randconfig-a013-20210808
i386                 randconfig-a014-20210808
i386                 randconfig-a016-20210808
i386                 randconfig-a012-20210809
i386                 randconfig-a015-20210809
i386                 randconfig-a011-20210809
i386                 randconfig-a013-20210809
i386                 randconfig-a014-20210809
i386                 randconfig-a016-20210809
i386                 randconfig-a011-20210810
i386                 randconfig-a015-20210810
i386                 randconfig-a013-20210810
i386                 randconfig-a014-20210810
i386                 randconfig-a016-20210810
i386                 randconfig-a012-20210810
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-c001-20210810
x86_64               randconfig-c001-20210809
x86_64               randconfig-c001-20210808
x86_64               randconfig-a013-20210810
x86_64               randconfig-a011-20210810
x86_64               randconfig-a012-20210810
x86_64               randconfig-a016-20210810
x86_64               randconfig-a014-20210810
x86_64               randconfig-a015-20210810
x86_64               randconfig-a016-20210809
x86_64               randconfig-a012-20210809
x86_64               randconfig-a013-20210809
x86_64               randconfig-a011-20210809
x86_64               randconfig-a014-20210809
x86_64               randconfig-a015-20210809

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
