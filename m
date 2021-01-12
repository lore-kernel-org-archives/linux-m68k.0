Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF5EC43219
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Jan 2021 21:49:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8019620720
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Jan 2021 21:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbhALVs2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 12 Jan 2021 16:48:28 -0500
Received: from mga07.intel.com ([134.134.136.100]:34092 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393333AbhALVgX (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 12 Jan 2021 16:36:23 -0500
IronPort-SDR: pCUkpd2S58qrm1sLJuv5vtcIHzgocwkaztZ8iMbKxO8rfv9qtUfpoVdD7EUuLH8VYbmwhy5AV2
 pfdyNuKaXCXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="242181466"
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; 
   d="scan'208";a="242181466"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 13:35:40 -0800
IronPort-SDR: LktkyGWe/40AhlFa6d8dIwDSGuCfs8ID+kiQIW7D6C/413LtFu8AH0gq2hRqUgB3G0mRzzMfo/
 rMCl0rZelRfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; 
   d="scan'208";a="464667012"
Received: from lkp-server01.sh.intel.com (HELO b73930e00c65) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2021 13:35:38 -0800
Received: from kbuild by b73930e00c65 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kzRKE-0000V9-8a; Tue, 12 Jan 2021 21:35:38 +0000
Date:   Wed, 13 Jan 2021 05:35:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 c941d009e8721648ba8eb1f5226125c3808a6cfe
Message-ID: <5ffe1618.e5VEWCEjqR2pCPc6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: c941d009e8721648ba8eb1f5226125c3808a6cfe  Merge tag 'v5.11-rc3'

elapsed time: 796m

configs tested: 224
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7206_defconfig
um                            kunit_defconfig
sh                               allmodconfig
sh                          r7780mp_defconfig
powerpc                       ebony_defconfig
c6x                         dsk6455_defconfig
mips                         tb0226_defconfig
powerpc                     akebono_defconfig
powerpc                  mpc866_ads_defconfig
mips                         db1xxx_defconfig
mips                           rs90_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                  cadence_csp_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                   motionpro_defconfig
c6x                        evmc6678_defconfig
m68k                       m5275evb_defconfig
h8300                               defconfig
arm                         shannon_defconfig
sparc64                             defconfig
arm                            xcep_defconfig
arm                            hisi_defconfig
powerpc                     tqm8548_defconfig
mips                           jazz_defconfig
powerpc                      cm5200_defconfig
arm                          iop32x_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     ep8248e_defconfig
mips                    maltaup_xpa_defconfig
arm                          collie_defconfig
arc                     nsimosci_hs_defconfig
arm                         cm_x300_defconfig
m68k                       m5475evb_defconfig
ia64                          tiger_defconfig
mips                      loongson3_defconfig
m68k                          amiga_defconfig
mips                        qi_lb60_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc836x_mds_defconfig
sh                           se7780_defconfig
sh                          sdk7786_defconfig
arm                         mv78xx0_defconfig
arm                          tango4_defconfig
powerpc                      walnut_defconfig
mips                           mtx1_defconfig
powerpc                      arches_defconfig
powerpc                      ppc6xx_defconfig
arm                            lart_defconfig
arm                         lubbock_defconfig
arm                     am200epdkit_defconfig
mips                        bcm47xx_defconfig
ia64                      gensparse_defconfig
h8300                     edosk2674_defconfig
arm                           h5000_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                        bcm63xx_defconfig
sh                      rts7751r2d1_defconfig
arm                          moxart_defconfig
openrisc                  or1klitex_defconfig
arm                        magician_defconfig
arm                           corgi_defconfig
sh                          r7785rp_defconfig
powerpc                       eiger_defconfig
m68k                            mac_defconfig
arm                       spear13xx_defconfig
sh                                  defconfig
mips                      malta_kvm_defconfig
sh                ecovec24-romimage_defconfig
mips                        maltaup_defconfig
sh                        dreamcast_defconfig
nios2                         3c120_defconfig
sh                             espt_defconfig
arm                      footbridge_defconfig
powerpc                 canyonlands_defconfig
sh                     magicpanelr2_defconfig
arm                           h3600_defconfig
m68k                         amcore_defconfig
sh                            shmin_defconfig
c6x                        evmc6472_defconfig
sh                              ul2_defconfig
powerpc                    socrates_defconfig
um                           x86_64_defconfig
arm                         palmz72_defconfig
arm                         assabet_defconfig
powerpc                     stx_gp3_defconfig
sh                   rts7751r2dplus_defconfig
sh                           se7722_defconfig
powerpc                 mpc834x_itx_defconfig
csky                             alldefconfig
arm                           omap1_defconfig
mips                         cobalt_defconfig
m68k                       bvme6000_defconfig
arm                        cerfcube_defconfig
sh                             shx3_defconfig
m68k                           sun3_defconfig
powerpc                  storcenter_defconfig
sparc64                          alldefconfig
powerpc                     kmeter1_defconfig
xtensa                  nommu_kc705_defconfig
mips                           xway_defconfig
csky                                defconfig
arm                          prima2_defconfig
arm                           stm32_defconfig
arc                           tb10x_defconfig
arc                              alldefconfig
mips                 decstation_r4k_defconfig
powerpc                      mgcoge_defconfig
powerpc                       ppc64_defconfig
mips                       rbtx49xx_defconfig
powerpc                      makalu_defconfig
mips                           ip27_defconfig
arm                       cns3420vb_defconfig
parisc                generic-32bit_defconfig
arm                             rpc_defconfig
powerpc                      bamboo_defconfig
arm                          ixp4xx_defconfig
arm                         hackkit_defconfig
m68k                          atari_defconfig
arm                              zx_defconfig
powerpc                          g5_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
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
x86_64               randconfig-a004-20210111
x86_64               randconfig-a006-20210111
x86_64               randconfig-a001-20210111
x86_64               randconfig-a003-20210111
x86_64               randconfig-a005-20210111
x86_64               randconfig-a002-20210111
i386                 randconfig-a002-20210112
i386                 randconfig-a005-20210112
i386                 randconfig-a006-20210112
i386                 randconfig-a003-20210112
i386                 randconfig-a001-20210112
i386                 randconfig-a004-20210112
i386                 randconfig-a002-20210111
i386                 randconfig-a005-20210111
i386                 randconfig-a006-20210111
i386                 randconfig-a001-20210111
i386                 randconfig-a003-20210111
i386                 randconfig-a004-20210111
i386                 randconfig-a002-20210110
i386                 randconfig-a005-20210110
i386                 randconfig-a006-20210110
i386                 randconfig-a001-20210110
i386                 randconfig-a003-20210110
i386                 randconfig-a004-20210110
x86_64               randconfig-a015-20210112
x86_64               randconfig-a012-20210112
x86_64               randconfig-a013-20210112
x86_64               randconfig-a016-20210112
x86_64               randconfig-a014-20210112
x86_64               randconfig-a011-20210112
i386                 randconfig-a012-20210112
i386                 randconfig-a011-20210112
i386                 randconfig-a016-20210112
i386                 randconfig-a013-20210112
i386                 randconfig-a015-20210112
i386                 randconfig-a014-20210112
i386                 randconfig-a012-20210111
i386                 randconfig-a011-20210111
i386                 randconfig-a016-20210111
i386                 randconfig-a015-20210111
i386                 randconfig-a013-20210111
i386                 randconfig-a014-20210111
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
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210112
x86_64               randconfig-a004-20210112
x86_64               randconfig-a001-20210112
x86_64               randconfig-a005-20210112
x86_64               randconfig-a003-20210112
x86_64               randconfig-a002-20210112
x86_64               randconfig-a015-20210111
x86_64               randconfig-a012-20210111
x86_64               randconfig-a013-20210111
x86_64               randconfig-a016-20210111
x86_64               randconfig-a014-20210111
x86_64               randconfig-a011-20210111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
