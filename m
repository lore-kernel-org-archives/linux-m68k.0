Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A63C433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Dec 2021 21:08:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbhLTVIZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Dec 2021 16:08:25 -0500
Received: from mga05.intel.com ([192.55.52.43]:18270 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229795AbhLTVIZ (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Dec 2021 16:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640034505; x=1671570505;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bb3QnXDckVi6i4Hznj0qlbdMxP1yZnNAOYQdJpHegoQ=;
  b=AfJL89q1QtlUSOCLyrnm27/l0VGhRopunk12bFVsRTHcsH5p+Z4sZ3x3
   hrEjgm7gNkNJLEhs6Z/fyJdvAFvfw1ALEhcdCvStS+zRrAqPsowo+JLgw
   Fr14z9xCClaBMA6oT823xp0bwXf61BYKAfAxilw1Ol1HQFy5vdoN/dTm0
   vYdFoIZbiaOG5Tjwk37B22xhhMG6uAheA/ZlUfKpZov1xTAakryZAHKSc
   N97JtXQUcz1vB+rWRKlbiUzYhL6NavcQVkTkeXRBv0AODHW98PWEnLBU4
   Eh1tM65tT3X7wR9AkR3E019D/oA7Sr9WQFTguGY69VRmLSL86N4URhX6V
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="326568681"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="326568681"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 13:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="684419741"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Dec 2021 13:08:23 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzPtO-0008FT-DO; Mon, 20 Dec 2021 21:08:22 +0000
Date:   Tue, 21 Dec 2021 05:08:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 e4c085679585b7ab78af0244cc6dcb67724aacdf
Message-ID: <61c0f0bf.FFAXk55oQAS/umh4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: e4c085679585b7ab78af0244cc6dcb67724aacdf  Merge tag 'v5.16-rc6'

elapsed time: 726m

configs tested: 124
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5208evb_defconfig
mips                         bigsur_defconfig
arm                        magician_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                       maple_defconfig
arm                       imx_v4_v5_defconfig
sh                           se7712_defconfig
arm                        vexpress_defconfig
mips                       bmips_be_defconfig
arm                        shmobile_defconfig
sh                        edosk7760_defconfig
sh                             espt_defconfig
arm                      footbridge_defconfig
arm                           tegra_defconfig
sh                        sh7757lcr_defconfig
powerpc                      chrp32_defconfig
powerpc                 mpc832x_mds_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                 canyonlands_defconfig
powerpc                      ppc44x_defconfig
powerpc                           allnoconfig
mips                     loongson2k_defconfig
m68k                        m5272c3_defconfig
powerpc                 mpc836x_mds_defconfig
openrisc                  or1klitex_defconfig
powerpc                     tqm5200_defconfig
arm                           omap1_defconfig
powerpc                      walnut_defconfig
powerpc64                        alldefconfig
arm                         hackkit_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                             sh03_defconfig
parisc                generic-64bit_defconfig
powerpc                       eiger_defconfig
sh                            hp6xx_defconfig
arc                     haps_hs_smp_defconfig
mips                        jmr3927_defconfig
arc                              alldefconfig
arm                         nhk8815_defconfig
arm                  randconfig-c002-20211220
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a001-20211220
x86_64               randconfig-a003-20211220
x86_64               randconfig-a006-20211220
x86_64               randconfig-a004-20211220
x86_64               randconfig-a002-20211220
i386                 randconfig-a004-20211220
i386                 randconfig-a002-20211220
i386                 randconfig-a003-20211220
i386                 randconfig-a005-20211220
i386                 randconfig-a001-20211220
i386                 randconfig-a006-20211220
i386                 randconfig-a015-20211219
x86_64               randconfig-a005-20211220
arc                  randconfig-r043-20211220
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig

clang tested configs:
x86_64               randconfig-a013-20211220
x86_64               randconfig-a015-20211220
x86_64               randconfig-a014-20211220
x86_64               randconfig-a012-20211220
x86_64               randconfig-a011-20211220
x86_64               randconfig-a016-20211220
i386                 randconfig-a012-20211220
i386                 randconfig-a011-20211220
i386                 randconfig-a014-20211220
i386                 randconfig-a016-20211220
i386                 randconfig-a015-20211220
i386                 randconfig-a013-20211220
s390                 randconfig-r044-20211220
hexagon              randconfig-r041-20211220
hexagon              randconfig-r045-20211220
riscv                randconfig-r042-20211220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
