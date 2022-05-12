Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1AB1C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 12 May 2022 14:01:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354888AbiELOBc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 12 May 2022 10:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354904AbiELOBb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 12 May 2022 10:01:31 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636A150043
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 May 2022 07:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652364090; x=1683900090;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4IRl5GIUV30N2fkhU+ADwOaykLoV8zKX3gqG0isoI0k=;
  b=Hq56h71KjZlrR0q4tE8SIqEDUh8nuxXGrEYyaSpretrU7ZgCPu51Bva0
   eYM6/S4j7xZgAef680qhybAOBJZcOmKXWdYrfEoMrTlK8ZzICt6s+HeMy
   OSmIAzKj1iy55V/05iZ7nNnqOQf9jmEl0cvH3nZIZUdd0Arx1AFCfSE2i
   VyD23tBJKXaokS8YEf7QNqujc7CrwEY65eHnRmwftwK6Vibwpmi6p1rBh
   PUh6Axol2ZzxSZQMBJXPaSLRRorpJeM2M0K+4nrAbQh2MtBq3d3eWRYAp
   zchdzEY490r1D+Lao0r4V1wX2RoFbqqXWH5WctJqVfMLYRfoIh61TXIIm
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="356433123"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="356433123"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 07:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="658609943"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 May 2022 07:01:26 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1np9Nd-000KVx-Fm;
        Thu, 12 May 2022 14:01:25 +0000
Date:   Thu, 12 May 2022 22:01:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.19] BUILD SUCCESS
 4fbdb1a9e9e5c802080aa86c8d557135922fb859
Message-ID: <627d131e.r4yABmFSh8s0OMzR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.19
branch HEAD: 4fbdb1a9e9e5c802080aa86c8d557135922fb859  m68k: math-emu: Fix typos in comments

elapsed time: 4443m

configs tested: 326
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
i386                 randconfig-c001-20220509
i386                          randconfig-c001
sh                               j2_defconfig
sh                         ap325rxa_defconfig
sh                      rts7751r2d1_defconfig
arm                       imx_v6_v7_defconfig
powerpc                       ppc64_defconfig
xtensa                  cadence_csp_defconfig
sh                           se7705_defconfig
ia64                            zx1_defconfig
powerpc64                           defconfig
sh                        edosk7760_defconfig
arc                          axs101_defconfig
h8300                       h8s-sim_defconfig
xtensa                generic_kc705_defconfig
mips                       capcella_defconfig
sh                          rsk7269_defconfig
powerpc                        warp_defconfig
sh                           se7721_defconfig
arm                           corgi_defconfig
mips                 decstation_r4k_defconfig
powerpc                       eiger_defconfig
mips                           xway_defconfig
powerpc                      pasemi_defconfig
arm                        mini2440_defconfig
arm                        multi_v7_defconfig
m68k                        m5272c3_defconfig
sh                          rsk7201_defconfig
arm                         at91_dt_defconfig
parisc                           alldefconfig
sh                          urquell_defconfig
arm                         lubbock_defconfig
arm                       omap2plus_defconfig
ia64                             alldefconfig
sh                          rsk7203_defconfig
arm                        spear6xx_defconfig
h8300                            allyesconfig
arm                           h3600_defconfig
arm                          iop32x_defconfig
arm                         cm_x300_defconfig
arm                             rpc_defconfig
mips                         cobalt_defconfig
riscv                            allyesconfig
parisc64                         alldefconfig
m68k                            mac_defconfig
sparc                       sparc64_defconfig
arm                       aspeed_g5_defconfig
ia64                        generic_defconfig
xtensa                  nommu_kc705_defconfig
arm                        clps711x_defconfig
arc                              alldefconfig
sh                          landisk_defconfig
powerpc                           allnoconfig
sparc64                             defconfig
arm                            zeus_defconfig
nios2                            alldefconfig
sh                           sh2007_defconfig
i386                                defconfig
m68k                             allmodconfig
powerpc                     sequoia_defconfig
sh                          polaris_defconfig
sh                            hp6xx_defconfig
sparc                            alldefconfig
arc                         haps_hs_defconfig
arm                         axm55xx_defconfig
arc                        vdk_hs38_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     tqm8548_defconfig
powerpc                       holly_defconfig
mips                        vocore2_defconfig
arm                        keystone_defconfig
riscv             nommu_k210_sdcard_defconfig
openrisc                            defconfig
arm                          pxa910_defconfig
h8300                               defconfig
arm                            qcom_defconfig
arc                      axs103_smp_defconfig
sh                        edosk7705_defconfig
sh                        sh7763rdp_defconfig
sh                   sh7724_generic_defconfig
nios2                            allyesconfig
h8300                    h8300h-sim_defconfig
m68k                          multi_defconfig
sh                          sdk7780_defconfig
s390                             allyesconfig
mips                             allmodconfig
powerpc                    klondike_defconfig
arm                        realview_defconfig
arc                          axs103_defconfig
arm                         lpc18xx_defconfig
powerpc                 mpc8540_ads_defconfig
nios2                         10m50_defconfig
sparc                       sparc32_defconfig
sh                           se7750_defconfig
arm                          exynos_defconfig
sh                             sh03_defconfig
arc                                 defconfig
s390                                defconfig
csky                                defconfig
openrisc                 simple_smp_defconfig
sh                           se7751_defconfig
m68k                       m5208evb_defconfig
powerpc                      pcm030_defconfig
arm                           sunxi_defconfig
sh                         apsh4a3a_defconfig
xtensa                    xip_kc705_defconfig
mips                         tb0226_defconfig
powerpc                 canyonlands_defconfig
mips                            ar7_defconfig
xtensa                    smp_lx200_defconfig
sh                         microdev_defconfig
powerpc                     taishan_defconfig
xtensa                           allyesconfig
arm                          badge4_defconfig
sh                          r7785rp_defconfig
nios2                               defconfig
powerpc                      tqm8xx_defconfig
mips                           gcw0_defconfig
arm                          simpad_defconfig
ia64                         bigsur_defconfig
xtensa                       common_defconfig
powerpc                 mpc837x_mds_defconfig
sh                          kfr2r09_defconfig
sh                            migor_defconfig
powerpc                     tqm8555_defconfig
arm                      jornada720_defconfig
powerpc                      cm5200_defconfig
arm                            mps2_defconfig
parisc                generic-32bit_defconfig
alpha                            allyesconfig
m68k                        mvme147_defconfig
powerpc                        cell_defconfig
ia64                                defconfig
powerpc                     stx_gp3_defconfig
powerpc                      ppc6xx_defconfig
m68k                          amiga_defconfig
sh                         ecovec24_defconfig
mips                        bcm47xx_defconfig
arm                           tegra_defconfig
sh                        sh7757lcr_defconfig
sh                           se7722_defconfig
openrisc                  or1klitex_defconfig
m68k                        m5407c3_defconfig
riscv                               defconfig
xtensa                           alldefconfig
powerpc                   currituck_defconfig
sh                     sh7710voipgw_defconfig
sh                          r7780mp_defconfig
m68k                        stmark2_defconfig
m68k                       bvme6000_defconfig
sh                           se7206_defconfig
sh                          lboxre2_defconfig
sh                           se7724_defconfig
sh                           se7780_defconfig
mips                             allyesconfig
sh                            shmin_defconfig
arm                           stm32_defconfig
arc                     nsimosci_hs_defconfig
arm                         assabet_defconfig
mips                            gpr_defconfig
powerpc                    adder875_defconfig
powerpc                         ps3_defconfig
ia64                      gensparse_defconfig
arm                          lpd270_defconfig
m68k                       m5249evb_defconfig
arc                           tb10x_defconfig
arc                            hsdk_defconfig
um                                  defconfig
microblaze                          defconfig
powerpc                     rainier_defconfig
arm                         vf610m4_defconfig
s390                       zfcpdump_defconfig
arm                            hisi_defconfig
powerpc                      makalu_defconfig
sh                             espt_defconfig
riscv                    nommu_k210_defconfig
openrisc                         alldefconfig
arc                        nsim_700_defconfig
powerpc                      ep88xc_defconfig
powerpc                  iss476-smp_defconfig
powerpc                     tqm8541_defconfig
powerpc                       maple_defconfig
sh                           se7712_defconfig
powerpc                 mpc834x_itx_defconfig
x86_64               randconfig-c001-20220509
arm                  randconfig-c002-20220509
x86_64                        randconfig-c001
arm                  randconfig-c002-20220512
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                                defconfig
arc                              allyesconfig
alpha                               defconfig
sh                               allmodconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a015-20220509
x86_64               randconfig-a012-20220509
x86_64               randconfig-a016-20220509
x86_64               randconfig-a014-20220509
x86_64               randconfig-a013-20220509
x86_64               randconfig-a011-20220509
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                 randconfig-a011-20220509
i386                 randconfig-a013-20220509
i386                 randconfig-a016-20220509
i386                 randconfig-a015-20220509
i386                 randconfig-a014-20220509
i386                 randconfig-a012-20220509
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220509
s390                 randconfig-r044-20220509
riscv                randconfig-r042-20220509
s390                 randconfig-r044-20220512
riscv                randconfig-r042-20220512
arc                  randconfig-r043-20220512
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64               randconfig-c007-20220509
i386                 randconfig-c001-20220509
powerpc              randconfig-c003-20220509
riscv                randconfig-c006-20220509
mips                 randconfig-c004-20220509
arm                  randconfig-c002-20220509
s390                 randconfig-c005-20220509
powerpc              randconfig-c003-20220510
x86_64                        randconfig-c007
riscv                randconfig-c006-20220510
mips                 randconfig-c004-20220510
i386                          randconfig-c001
arm                  randconfig-c002-20220510
s390                 randconfig-c005-20220510
s390                 randconfig-c005-20220512
powerpc              randconfig-c003-20220512
riscv                randconfig-c006-20220512
mips                 randconfig-c004-20220512
arm                  randconfig-c002-20220512
mips                        bcm63xx_defconfig
arm                           omap1_defconfig
mips                     cu1830-neo_defconfig
powerpc                      acadia_defconfig
powerpc                    mvme5100_defconfig
arm                                 defconfig
powerpc                     tqm5200_defconfig
powerpc                     kmeter1_defconfig
arm                        spear3xx_defconfig
arm                         socfpga_defconfig
powerpc                     akebono_defconfig
powerpc                     powernv_defconfig
powerpc                          allmodconfig
arm                      pxa255-idp_defconfig
hexagon                             defconfig
mips                        omega2p_defconfig
powerpc                      walnut_defconfig
arm                     am200epdkit_defconfig
mips                            e55_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                       aspeed_g4_defconfig
arm                       versatile_defconfig
arm                         s3c2410_defconfig
mips                          ath79_defconfig
powerpc                     skiroot_defconfig
arm                          ixp4xx_defconfig
mips                      pic32mzda_defconfig
arm                          pcm027_defconfig
arm                          collie_defconfig
mips                        workpad_defconfig
powerpc                     tqm8560_defconfig
arm                        vexpress_defconfig
mips                     loongson1c_defconfig
arm                       netwinder_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                          pxa168_defconfig
x86_64               randconfig-a006-20220509
x86_64               randconfig-a002-20220509
x86_64               randconfig-a001-20220509
x86_64               randconfig-a004-20220509
x86_64               randconfig-a005-20220509
x86_64               randconfig-a003-20220509
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                 randconfig-a004-20220509
i386                 randconfig-a006-20220509
i386                 randconfig-a002-20220509
i386                 randconfig-a003-20220509
i386                 randconfig-a001-20220509
i386                 randconfig-a005-20220509
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220509
hexagon              randconfig-r045-20220509
hexagon              randconfig-r045-20220512
hexagon              randconfig-r041-20220512

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
