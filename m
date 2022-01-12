Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A6AC433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Jan 2022 13:53:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238942AbiALNxx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Jan 2022 08:53:53 -0500
Received: from mga03.intel.com ([134.134.136.65]:23396 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353749AbiALNxu (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 12 Jan 2022 08:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641995630; x=1673531630;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JF9zoMFy8qzFXP3pztMeJTmWtD3811DfRIKLaVaoMBM=;
  b=GZoAV2+WqUQC13ddyOvtmisIWSapUApsfm/pX08Dj+OEVKkWxmo2qzYX
   TB0DES6RyNpsFDEuh3kvyHEnaJSY/5kCrijC0mYr7Zb47wyQo4ooL+uGX
   llnYlNU51EtnMIn7Uv8IC2iBC29wU7L9ZcfdBaOWqTebp+Az6O+lkqWeM
   YdKPUzMnHGhBLl/f6U7LJdMtaJmztJve3d394r//5IthOulEYTr4dQgnI
   8LbTfg+U42fXmt3rSYMXRc1MyKr4TTZTJ6pfFfzhsPvaN0eCfJh+IvE7M
   apv0aYuHmIYzLRquzEYEg/6zJQH8gq9X2ps7s9u/HmuGaZe6ddgBL48O/
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="243692314"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="243692314"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 05:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="472833280"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Jan 2022 05:53:48 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n7e4R-0005t5-QC; Wed, 12 Jan 2022 13:53:47 +0000
Date:   Wed, 12 Jan 2022 21:52:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 6f42711e47bb379b5552af8007969eba5c015152
Message-ID: <61dedd2f.LsPzoQ2LpIGulroE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 6f42711e47bb379b5552af8007969eba5c015152  Merge tag 'v5.16'

elapsed time: 3124m

configs tested: 153
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
sh                           se7750_defconfig
arm                          badge4_defconfig
m68k                           sun3_defconfig
m68k                       m5475evb_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     mpc83xx_defconfig
mips                      maltasmvp_defconfig
m68k                          hp300_defconfig
arm                         axm55xx_defconfig
um                             i386_defconfig
sparc                            alldefconfig
arm                           stm32_defconfig
sh                                  defconfig
powerpc                      ep88xc_defconfig
arm                        mini2440_defconfig
sh                            migor_defconfig
m68k                                defconfig
sh                          r7780mp_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                         ps3_defconfig
sh                 kfr2r09-romimage_defconfig
arc                        nsim_700_defconfig
powerpc                   currituck_defconfig
sh                          rsk7203_defconfig
powerpc                 linkstation_defconfig
powerpc                      cm5200_defconfig
powerpc                     tqm8541_defconfig
sh                            titan_defconfig
powerpc                       ppc64_defconfig
arm                        multi_v7_defconfig
arm                            zeus_defconfig
sh                           se7722_defconfig
ia64                        generic_defconfig
mips                         mpc30x_defconfig
arc                          axs103_defconfig
powerpc                      pcm030_defconfig
arm                         assabet_defconfig
xtensa                       common_defconfig
powerpc                   motionpro_defconfig
sh                          kfr2r09_defconfig
m68k                             allmodconfig
sh                           se7780_defconfig
m68k                         apollo_defconfig
arm                       aspeed_g5_defconfig
arm                        cerfcube_defconfig
um                               alldefconfig
sh                             espt_defconfig
xtensa                    smp_lx200_defconfig
arm                        realview_defconfig
powerpc                     taishan_defconfig
ia64                             alldefconfig
arm                  randconfig-c002-20220111
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220111
arc                  randconfig-r043-20220111
s390                 randconfig-r044-20220111
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func

clang tested configs:
arm                  randconfig-c002-20220111
x86_64                        randconfig-c007
riscv                randconfig-c006-20220111
powerpc              randconfig-c003-20220111
i386                          randconfig-c001
mips                 randconfig-c004-20220111
s390                 randconfig-c005-20220111
arm                  colibri_pxa300_defconfig
mips                          malta_defconfig
arm                          ep93xx_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     akebono_defconfig
powerpc                     kilauea_defconfig
powerpc                        fsp2_defconfig
powerpc                      pmac32_defconfig
arm                    vt8500_v6_v7_defconfig
mips                          rm200_defconfig
powerpc                      acadia_defconfig
hexagon                          alldefconfig
mips                           ip22_defconfig
powerpc                   lite5200b_defconfig
arm                        vexpress_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220111
hexagon              randconfig-r041-20220111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
