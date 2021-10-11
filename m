Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1A4C433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Oct 2021 21:28:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D71160F3A
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Oct 2021 21:28:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235223AbhJKVav (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Oct 2021 17:30:51 -0400
Received: from mga06.intel.com ([134.134.136.31]:40933 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235256AbhJKVav (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Oct 2021 17:30:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="287850561"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; 
   d="scan'208";a="287850561"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2021 14:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; 
   d="scan'208";a="591481070"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 11 Oct 2021 14:28:48 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ma2ql-0002kf-Td; Mon, 11 Oct 2021 21:28:47 +0000
Date:   Tue, 12 Oct 2021 05:28:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.16] BUILD SUCCESS
 8a3c0a74ae87473589cb881a3854948d40000b7a
Message-ID: <6164ac68.157/qZNkIYLJZxsv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.16
branch HEAD: 8a3c0a74ae87473589cb881a3854948d40000b7a  m68k: defconfig: Update defconfigs for v5.15-rc1

elapsed time: 727m

configs tested: 164
configs skipped: 106

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
i386                 randconfig-c001-20211011
sh                           se7206_defconfig
powerpc                      pcm030_defconfig
sh                        edosk7760_defconfig
m68k                                defconfig
sh                           se7705_defconfig
m68k                             alldefconfig
sh                              ul2_defconfig
sh                            hp6xx_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                   sb1250_swarm_defconfig
powerpc                    amigaone_defconfig
arm                       aspeed_g5_defconfig
arc                            hsdk_defconfig
sparc                       sparc64_defconfig
s390                                defconfig
xtensa                  cadence_csp_defconfig
i386                             allyesconfig
mips                       capcella_defconfig
m68k                           sun3_defconfig
sh                     sh7710voipgw_defconfig
sh                               alldefconfig
nios2                         10m50_defconfig
arm                        realview_defconfig
arm                        multi_v5_defconfig
riscv                               defconfig
sh                     magicpanelr2_defconfig
mips                  maltasmvp_eva_defconfig
powerpc64                           defconfig
powerpc                     taishan_defconfig
powerpc                     mpc83xx_defconfig
openrisc                    or1ksim_defconfig
powerpc                     akebono_defconfig
sh                         microdev_defconfig
powerpc                     kilauea_defconfig
mips                        maltaup_defconfig
parisc                generic-32bit_defconfig
microblaze                          defconfig
sh                        sh7785lcr_defconfig
mips                           ip22_defconfig
arm                       mainstone_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      ppc6xx_defconfig
arm                        cerfcube_defconfig
mips                           ci20_defconfig
mips                  cavium_octeon_defconfig
mips                           gcw0_defconfig
powerpc                   bluestone_defconfig
powerpc                     pseries_defconfig
mips                      maltasmvp_defconfig
sh                                  defconfig
sh                          r7785rp_defconfig
arm                         lubbock_defconfig
xtensa                           alldefconfig
powerpc                      ppc44x_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 linkstation_defconfig
arc                         haps_hs_defconfig
m68k                       m5249evb_defconfig
mips                        vocore2_defconfig
powerpc                       ebony_defconfig
arm                        keystone_defconfig
arm                          iop32x_defconfig
mips                            e55_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                          rsk7203_defconfig
mips                      fuloong2e_defconfig
powerpc                      ppc64e_defconfig
powerpc                    sam440ep_defconfig
m68k                         apollo_defconfig
mips                           xway_defconfig
openrisc                 simple_smp_defconfig
arm                     am200epdkit_defconfig
powerpc                    gamecube_defconfig
arm                      integrator_defconfig
arm                            mps2_defconfig
nds32                            alldefconfig
sh                      rts7751r2d1_defconfig
ia64                        generic_defconfig
xtensa                    smp_lx200_defconfig
m68k                        m5407c3_defconfig
arm                         assabet_defconfig
arm                        neponset_defconfig
sh                         ecovec24_defconfig
arm                  randconfig-c002-20211011
x86_64               randconfig-c001-20211011
arm                  randconfig-c002-20211012
i386                 randconfig-c001-20211012
x86_64               randconfig-c001-20211012
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211011
x86_64               randconfig-a012-20211011
x86_64               randconfig-a016-20211011
x86_64               randconfig-a014-20211011
x86_64               randconfig-a013-20211011
x86_64               randconfig-a011-20211011
i386                 randconfig-a016-20211011
i386                 randconfig-a014-20211011
i386                 randconfig-a011-20211011
i386                 randconfig-a015-20211011
i386                 randconfig-a012-20211011
i386                 randconfig-a013-20211011
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211011
mips                 randconfig-c004-20211011
i386                 randconfig-c001-20211011
s390                 randconfig-c005-20211011
x86_64               randconfig-c007-20211011
powerpc              randconfig-c003-20211011
riscv                randconfig-c006-20211011
x86_64               randconfig-a004-20211011
x86_64               randconfig-a006-20211011
x86_64               randconfig-a001-20211011
x86_64               randconfig-a005-20211011
x86_64               randconfig-a002-20211011
x86_64               randconfig-a003-20211011
i386                 randconfig-a001-20211011
i386                 randconfig-a003-20211011
i386                 randconfig-a004-20211011
i386                 randconfig-a005-20211011
i386                 randconfig-a002-20211011
i386                 randconfig-a006-20211011
hexagon              randconfig-r041-20211011
hexagon              randconfig-r045-20211011

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
