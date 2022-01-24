Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1DFC433FE
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Jan 2022 19:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347493AbiAXTcB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jan 2022 14:32:01 -0500
Received: from mga11.intel.com ([192.55.52.93]:39767 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348191AbiAXT2K (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jan 2022 14:28:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643052489; x=1674588489;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=33Ya51/HWp+tyPbcqdz1Aic1Y/FilIdTaqMul/iElns=;
  b=Ji+4rgVqMgKKjM/HrRexBSVNL25XG4nBssPVu6Pb05SWwrkvTNL9fbI4
   a5Q2YR5bxxVYlRqszXBI6Bpj/utxudWuKaY7rJAXUTzt18BY2GdNjcE3i
   aOKSKI9EEniHK6Uqqhi5ZuYKeLDltMuYDMEO7MatDGjBw2K9I6HchBDo1
   zaT5xSrtkRGXDCuk+qgMA8q/en0jVQcMZtZldv34/UcvlFEQSgwPa46My
   jVHNR2I8KDdx2+2XBB7gHfH7fMHwF+Ck6DYJRicOyPeQCIK9rWsVOfD2T
   2owOSDuKsRdPCcksHqZnNL5aqGowKPfqsjV+GoJ6OlLLjXyGotHHgaucQ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="243727201"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="243727201"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 11:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="479202799"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Jan 2022 11:28:03 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nC50V-000IpJ-1i; Mon, 24 Jan 2022 19:28:03 +0000
Date:   Tue, 25 Jan 2022 03:27:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 f92ead75e19a8698f6621cf2054a5730408a3f3d
Message-ID: <61eefd9d./fDP5mmbWt3r7vyX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: f92ead75e19a8698f6621cf2054a5730408a3f3d  m68k: Add asm/config.h

elapsed time: 1767m

configs tested: 226
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
sh                                  defconfig
sh                           se7722_defconfig
sh                          sdk7786_defconfig
ia64                      gensparse_defconfig
m68k                        stmark2_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                       imx_v6_v7_defconfig
xtensa                       common_defconfig
m68k                          multi_defconfig
i386                                defconfig
arc                         haps_hs_defconfig
arm                            xcep_defconfig
arm                           tegra_defconfig
ia64                            zx1_defconfig
sh                          r7780mp_defconfig
m68k                        m5407c3_defconfig
sh                         apsh4a3a_defconfig
arm                        cerfcube_defconfig
sh                           se7343_defconfig
sh                          landisk_defconfig
powerpc                       eiger_defconfig
sh                          rsk7264_defconfig
m68k                        mvme16x_defconfig
sh                          lboxre2_defconfig
sh                           se7751_defconfig
sh                         microdev_defconfig
powerpc                     stx_gp3_defconfig
mips                         rt305x_defconfig
sh                            titan_defconfig
powerpc                      ppc6xx_defconfig
mips                        vocore2_defconfig
arm                         cm_x300_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc837x_mds_defconfig
arm                          badge4_defconfig
powerpc                      pasemi_defconfig
sh                          rsk7269_defconfig
arm                         vf610m4_defconfig
sh                            shmin_defconfig
parisc                           alldefconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                         ps3_defconfig
xtensa                    smp_lx200_defconfig
x86_64                           alldefconfig
sparc                       sparc32_defconfig
sh                ecovec24-romimage_defconfig
powerpc                 mpc834x_mds_defconfig
s390                          debug_defconfig
nios2                            alldefconfig
sh                 kfr2r09-romimage_defconfig
arm                           corgi_defconfig
alpha                            alldefconfig
microblaze                      mmu_defconfig
powerpc                     taishan_defconfig
xtensa                  audio_kc705_defconfig
powerpc                      ppc40x_defconfig
sh                           se7619_defconfig
i386                             alldefconfig
arc                        vdk_hs38_defconfig
sh                           se7780_defconfig
xtensa                           allyesconfig
sh                           se7705_defconfig
sh                          rsk7201_defconfig
ia64                        generic_defconfig
mips                         cobalt_defconfig
arm                           sunxi_defconfig
sh                           se7724_defconfig
arm                            lart_defconfig
arm                       multi_v4t_defconfig
sh                             shx3_defconfig
sh                         ap325rxa_defconfig
powerpc                     mpc83xx_defconfig
h8300                            alldefconfig
nds32                            alldefconfig
arm                            mps2_defconfig
powerpc                    adder875_defconfig
mips                       capcella_defconfig
m68k                        mvme147_defconfig
powerpc                       maple_defconfig
m68k                          amiga_defconfig
mips                            ar7_defconfig
arm                           u8500_defconfig
arc                              allyesconfig
mips                 decstation_r4k_defconfig
mips                           jazz_defconfig
powerpc                     tqm8541_defconfig
sh                          sdk7780_defconfig
mips                            gpr_defconfig
sh                      rts7751r2d1_defconfig
sh                          rsk7203_defconfig
alpha                               defconfig
arm                  randconfig-c002-20220123
arm                  randconfig-c002-20220124
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
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
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm                  randconfig-c002-20220124
riscv                randconfig-c006-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
x86_64                        randconfig-c007
arm                  randconfig-c002-20220123
powerpc              randconfig-c003-20220123
mips                 randconfig-c004-20220123
i386                          randconfig-c001
s390                 randconfig-c005-20220123
riscv                randconfig-c006-20220123
powerpc                  mpc885_ads_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     tqm8540_defconfig
powerpc                       ebony_defconfig
mips                       rbtx49xx_defconfig
arm                        spear3xx_defconfig
arm                                 defconfig
arm                     am200epdkit_defconfig
mips                          ath79_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      ppc44x_defconfig
powerpc                    gamecube_defconfig
powerpc                   lite5200b_defconfig
arm                          imote2_defconfig
arm                        magician_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     mpc512x_defconfig
mips                           ip22_defconfig
mips                   sb1250_swarm_defconfig
mips                         tb0287_defconfig
arm                        vexpress_defconfig
mips                            e55_defconfig
arm                         bcm2835_defconfig
arm                           sama7_defconfig
riscv                          rv32_defconfig
mips                      maltaaprp_defconfig
arm                          moxart_defconfig
arm                           omap1_defconfig
arm                          ixp4xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220124
hexagon              randconfig-r041-20220124
hexagon              randconfig-r045-20220123
hexagon              randconfig-r041-20220123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
