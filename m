Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C868C433FE
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Feb 2022 01:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbiBHBWl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Feb 2022 20:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343794AbiBHBW3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Feb 2022 20:22:29 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 538CEC0045D1
        for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Feb 2022 17:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644283039; x=1675819039;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=g7J2nC+yIh6xHSEh+vy0LzDv3N0bPRwCVUh3RRuesWM=;
  b=EhkDK9rAK+D+q7Fldnq7bZRia2EEDxAeERYcyFGxpEIPitWYm+Xz2qgM
   17eGlZ7SOmFg7Yi6EQbmIr8kVFlyumtUL6U1NczaJkgbjxUz1GY4DuRYH
   VLDNI8TzakBiKxAGqxIlCL2n9sUal0FdkqMl5DLe3O7bpU4SgGIDiK4+k
   9meG1fXvGxgnEar94K0fcT6CqYYKL62n8buZy5HuBEUJZ+2QUi8GZRPOu
   FsnFMfllYIdSmdnC4YBCCJORo7Iy9spcYv5hlioP8HX1L30rbS8bTl5Ps
   7DmWOyhZME3wYhM3/bJr4lE/bgEK+pKcMLoxB3mQweLjgixoxZANEkpoW
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="309589139"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="309589139"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 17:17:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; 
   d="scan'208";a="585023337"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Feb 2022 17:17:03 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHF7v-0001AU-8l; Tue, 08 Feb 2022 01:17:03 +0000
Date:   Tue, 08 Feb 2022 09:16:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 0966f2d6178459e692717274055ac9847e593f83
Message-ID: <6201c46b.SlxfLCIangB8iMwN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 0966f2d6178459e692717274055ac9847e593f83  m68k: mm: Remove check for VM_IO to fix deferred I/O

elapsed time: 722m

configs tested: 168
configs skipped: 4

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
nios2                            alldefconfig
arm                           stm32_defconfig
sh                     magicpanelr2_defconfig
mips                         bigsur_defconfig
mips                         cobalt_defconfig
sh                        sh7785lcr_defconfig
s390                             allmodconfig
powerpc                    amigaone_defconfig
sh                           se7343_defconfig
powerpc                        cell_defconfig
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
alpha                               defconfig
sh                          sdk7786_defconfig
arm                         lubbock_defconfig
m68k                       m5208evb_defconfig
powerpc                     sequoia_defconfig
mips                         rt305x_defconfig
h8300                       h8s-sim_defconfig
sh                   sh7724_generic_defconfig
m68k                        m5307c3_defconfig
m68k                       m5275evb_defconfig
sh                          rsk7201_defconfig
m68k                       m5475evb_defconfig
m68k                        m5407c3_defconfig
nds32                             allnoconfig
sh                               j2_defconfig
sh                          r7785rp_defconfig
x86_64                              defconfig
arm                      jornada720_defconfig
arm                            zeus_defconfig
mips                      fuloong2e_defconfig
powerpc                      ppc6xx_defconfig
i386                                defconfig
arm                             ezx_defconfig
powerpc                       maple_defconfig
powerpc                      ep88xc_defconfig
arc                     haps_hs_smp_defconfig
sh                          urquell_defconfig
m68k                        stmark2_defconfig
powerpc                      pcm030_defconfig
arm                           corgi_defconfig
arc                         haps_hs_defconfig
mips                            ar7_defconfig
powerpc                     rainier_defconfig
mips                        bcm47xx_defconfig
arm                  randconfig-c002-20220207
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
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
arc                  randconfig-r043-20220207
riscv                randconfig-r042-20220207
s390                 randconfig-r044-20220207
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
riscv                randconfig-c006-20220207
i386                 randconfig-c001-20220207
powerpc              randconfig-c003-20220207
x86_64               randconfig-c007-20220207
mips                 randconfig-c004-20220207
arm                  randconfig-c002-20220207
s390                 randconfig-c005-20220207
arm                            dove_defconfig
powerpc                     mpc512x_defconfig
mips                        maltaup_defconfig
mips                           ip22_defconfig
arm                          pxa168_defconfig
powerpc                   lite5200b_defconfig
mips                           mtx1_defconfig
arm                       imx_v4_v5_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      ppc44x_defconfig
arm                         mv78xx0_defconfig
mips                      maltaaprp_defconfig
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
