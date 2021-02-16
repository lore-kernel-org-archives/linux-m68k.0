Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BE1C433DB
	for <linux-m68k@archiver.kernel.org>; Tue, 16 Feb 2021 19:42:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D54164E7D
	for <linux-m68k@archiver.kernel.org>; Tue, 16 Feb 2021 19:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhBPTmA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 16 Feb 2021 14:42:00 -0500
Received: from mga12.intel.com ([192.55.52.136]:6386 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229699AbhBPTmA (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 16 Feb 2021 14:42:00 -0500
IronPort-SDR: 4r9d6MX7mOgV5T7f9jMhsptBM3VTRKPD5t9TV7JcoqVGXd7VKxRKEyciQmgNR0KsAGS1zcncgD
 Af0Kxr/USCag==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162133252"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162133252"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 11:41:19 -0800
IronPort-SDR: kDG47DmvBnKIcKhD1q5hONPWjVfSjzwgAeuEuZBb2LU5a7XHObWBxEQ8RcMrcZI0iCwY4YsAif
 besWyr2g4bOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="384789186"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Feb 2021 11:41:18 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lC6Dl-0008Mu-IL; Tue, 16 Feb 2021 19:41:17 +0000
Date:   Wed, 17 Feb 2021 03:41:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-v5.11] BUILD SUCCESS
 df2c81e80007c370ee5429f93bf044221dad6c4b
Message-ID: <602c1fda.8/EmnrzBKIHNvyXX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v5.11
branch HEAD: df2c81e80007c370ee5429f93bf044221dad6c4b  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 722m

configs tested: 132
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sparc64                             defconfig
powerpc                        cell_defconfig
powerpc                     mpc512x_defconfig
openrisc                 simple_smp_defconfig
arm                          lpd270_defconfig
sh                           se7721_defconfig
arm                           efm32_defconfig
arm                     eseries_pxa_defconfig
sparc                            alldefconfig
powerpc                      ppc6xx_defconfig
mips                           jazz_defconfig
powerpc                        fsp2_defconfig
csky                             alldefconfig
arc                           tb10x_defconfig
sh                           se7343_defconfig
mips                     cu1830-neo_defconfig
arm                        shmobile_defconfig
c6x                        evmc6678_defconfig
m68k                          atari_defconfig
arm                              zx_defconfig
nios2                         10m50_defconfig
powerpc                     tqm5200_defconfig
arm                       aspeed_g5_defconfig
arm                         assabet_defconfig
arm                        neponset_defconfig
sh                        sh7785lcr_defconfig
openrisc                  or1klitex_defconfig
c6x                                 defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                    sam440ep_defconfig
arm                         s3c6400_defconfig
sh                         apsh4a3a_defconfig
powerpc                  storcenter_defconfig
ia64                         bigsur_defconfig
sh                        dreamcast_defconfig
powerpc                      chrp32_defconfig
powerpc                    amigaone_defconfig
ia64                                defconfig
arc                 nsimosci_hs_smp_defconfig
mips                malta_kvm_guest_defconfig
riscv                    nommu_k210_defconfig
powerpc                     taishan_defconfig
arm                        multi_v5_defconfig
arm                          simpad_defconfig
sh                           se7780_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
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
i386                 randconfig-a003-20210216
i386                 randconfig-a005-20210216
i386                 randconfig-a002-20210216
i386                 randconfig-a006-20210216
i386                 randconfig-a001-20210216
i386                 randconfig-a004-20210216
i386                 randconfig-a003-20210215
i386                 randconfig-a005-20210215
i386                 randconfig-a002-20210215
i386                 randconfig-a006-20210215
i386                 randconfig-a004-20210215
i386                 randconfig-a001-20210215
x86_64               randconfig-a016-20210215
x86_64               randconfig-a013-20210215
x86_64               randconfig-a012-20210215
x86_64               randconfig-a015-20210215
x86_64               randconfig-a014-20210215
x86_64               randconfig-a011-20210215
i386                 randconfig-a016-20210215
i386                 randconfig-a014-20210215
i386                 randconfig-a012-20210215
i386                 randconfig-a013-20210215
i386                 randconfig-a011-20210215
i386                 randconfig-a015-20210215
i386                 randconfig-a016-20210216
i386                 randconfig-a014-20210216
i386                 randconfig-a012-20210216
i386                 randconfig-a013-20210216
i386                 randconfig-a011-20210216
i386                 randconfig-a015-20210216
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210215
x86_64               randconfig-a002-20210215
x86_64               randconfig-a001-20210215
x86_64               randconfig-a004-20210215
x86_64               randconfig-a005-20210215
x86_64               randconfig-a006-20210215

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
