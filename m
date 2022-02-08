Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FA6C433EF
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Feb 2022 01:22:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245439AbiBHBWk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Feb 2022 20:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343760AbiBHBW3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Feb 2022 20:22:29 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BC8C0045C9
        for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Feb 2022 17:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644283025; x=1675819025;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vfrjbZnP6iLSO0lpedI2s7pC8BrwbGulUT5faXYH54w=;
  b=gkm2AVIP3FvEkjxvm4AMiR5p3IdYX9+h7OFop1r1JYwXH2963kg5lQ8q
   xpw51npS1slRf7PiwZRW49r2ncv4xsky77cNgkMCMQupP0djJ1xPWdcm6
   Le5So3sVSiA2+Xn+mWISz3m+XAkuzaXCL3ufZ1I0jaI/WLdjlTOVIkCYb
   nDZ12EtXxrlyGMN7RWgmEs6QfOUoNIWiudjPd9oZJvHMBBClM6rnz/8mB
   cacSvHrV0Ks8gPg9nHKW5ryhB4FagsvEhUF52epBHPIdOC+OcA5nuCrOc
   G9eMKVyjeniZhWDorNsrCTi2Gz5m1CdTR6VCwRZNjfqEr0eo4GEHz5FuJ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="312143907"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="312143907"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 17:17:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="481772323"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Feb 2022 17:17:03 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHF7v-0001AR-81; Tue, 08 Feb 2022 01:17:03 +0000
Date:   Tue, 08 Feb 2022 09:16:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.18] BUILD SUCCESS
 469d56485c1bc9c2ccb4e150c42d18be58f0747c
Message-ID: <6201c467.fo4oXOdUTMr9mrms%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.18
branch HEAD: 469d56485c1bc9c2ccb4e150c42d18be58f0747c  m68k: mm: Remove check for VM_IO to fix deferred I/O

elapsed time: 728m

configs tested: 172
configs skipped: 116

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220207
arm                             pxa_defconfig
arm                          iop32x_defconfig
arm                          exynos_defconfig
sparc                       sparc32_defconfig
s390                          debug_defconfig
sh                          kfr2r09_defconfig
powerpc                      arches_defconfig
um                               alldefconfig
mips                      loongson3_defconfig
arc                        nsimosci_defconfig
sh                               alldefconfig
sh                           se7751_defconfig
mips                            ar7_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                        cell_defconfig
sh                         ecovec24_defconfig
nios2                            alldefconfig
arm                           stm32_defconfig
sh                     magicpanelr2_defconfig
powerpc                      ep88xc_defconfig
powerpc                     ep8248e_defconfig
m68k                       m5249evb_defconfig
powerpc                    amigaone_defconfig
sh                           se7343_defconfig
xtensa                    xip_kc705_defconfig
powerpc                  storcenter_defconfig
mips                         tb0226_defconfig
ia64                         bigsur_defconfig
arm                        multi_v7_defconfig
nds32                            alldefconfig
sparc64                             defconfig
arm                        cerfcube_defconfig
sh                            migor_defconfig
m68k                         apollo_defconfig
arm                          lpd270_defconfig
sh                           se7724_defconfig
powerpc                     taishan_defconfig
mips                      maltasmvp_defconfig
powerpc                 linkstation_defconfig
csky                             alldefconfig
arm                         assabet_defconfig
mips                         bigsur_defconfig
arm                        realview_defconfig
arm                        mvebu_v7_defconfig
h8300                       h8s-sim_defconfig
sh                   sh7724_generic_defconfig
m68k                        m5307c3_defconfig
m68k                       m5275evb_defconfig
sh                          rsk7201_defconfig
m68k                       m5475evb_defconfig
m68k                        m5407c3_defconfig
arm                            zeus_defconfig
mips                      fuloong2e_defconfig
powerpc                      ppc6xx_defconfig
i386                                defconfig
arm                             ezx_defconfig
powerpc                       maple_defconfig
arc                     haps_hs_smp_defconfig
sh                          urquell_defconfig
powerpc                   currituck_defconfig
m68k                        stmark2_defconfig
riscv                            allyesconfig
arm                            lart_defconfig
mips                           xway_defconfig
powerpc                     tqm8548_defconfig
mips                            gpr_defconfig
powerpc                      pcm030_defconfig
arm                           corgi_defconfig
arc                         haps_hs_defconfig
powerpc                     rainier_defconfig
mips                        bcm47xx_defconfig
arm                  randconfig-c002-20220207
arm                  randconfig-c002-20220208
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a013-20220207
x86_64               randconfig-a016-20220207
x86_64               randconfig-a015-20220207
x86_64               randconfig-a012-20220207
x86_64               randconfig-a014-20220207
x86_64               randconfig-a011-20220207
i386                 randconfig-a012-20220207
i386                 randconfig-a013-20220207
i386                 randconfig-a015-20220207
i386                 randconfig-a014-20220207
i386                 randconfig-a011-20220207
i386                 randconfig-a016-20220207
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220207
i386                 randconfig-c001-20220207
powerpc              randconfig-c003-20220207
x86_64               randconfig-c007-20220207
mips                 randconfig-c004-20220207
arm                  randconfig-c002-20220207
mips                          rm200_defconfig
mips                        maltaup_defconfig
powerpc                     mpc512x_defconfig
arm                        spear3xx_defconfig
arm                         shannon_defconfig
arm                       cns3420vb_defconfig
powerpc                      ppc44x_defconfig
mips                           ip22_defconfig
mips                        workpad_defconfig
powerpc                    ge_imp3a_defconfig
mips                        bcm63xx_defconfig
mips                     loongson2k_defconfig
mips                      pic32mzda_defconfig
arm                        magician_defconfig
mips                           mtx1_defconfig
arm                            dove_defconfig
arm                    vt8500_v6_v7_defconfig
x86_64               randconfig-a006-20220207
x86_64               randconfig-a004-20220207
x86_64               randconfig-a005-20220207
x86_64               randconfig-a003-20220207
x86_64               randconfig-a002-20220207
x86_64               randconfig-a001-20220207
i386                 randconfig-a005-20220207
i386                 randconfig-a004-20220207
i386                 randconfig-a003-20220207
i386                 randconfig-a006-20220207
i386                 randconfig-a001-20220207
i386                 randconfig-a002-20220207
hexagon              randconfig-r045-20220207
hexagon              randconfig-r041-20220207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
