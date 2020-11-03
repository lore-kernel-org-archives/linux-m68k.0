Return-Path: <SRS0=aUui=EJ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCE0C00A89
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Nov 2020 00:10:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF10222268
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Nov 2020 00:10:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgKCAKE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 2 Nov 2020 19:10:04 -0500
Received: from mga14.intel.com ([192.55.52.115]:5069 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725910AbgKCAKE (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 2 Nov 2020 19:10:04 -0500
IronPort-SDR: 9EhaHnnktkDMfBOhgB6nXlKaouJGqTU8kuKzoNGvFgI1CffzHysiDoKDMwRnZMlB2Il4h1qyCv
 GvzNx4w9eMzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="168190908"
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
   d="scan'208";a="168190908"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 16:10:03 -0800
IronPort-SDR: XmrstGZszCc34W6zh4HjcpT4cGxoHM2h+e9lZU/huhMuxgnh1xr0a69JErcFrAxQx9jZ8/NN86
 Iv8gJmwsChzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
   d="scan'208";a="357493660"
Received: from lkp-server02.sh.intel.com (HELO 9353403cd79d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 02 Nov 2020 16:10:01 -0800
Received: from kbuild by 9353403cd79d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kZjth-0000Ej-CU; Tue, 03 Nov 2020 00:10:01 +0000
Date:   Tue, 03 Nov 2020 08:09:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 98c613483ac642b72c2367085292ed0604f42073
Message-ID: <5fa09fc0.XTcVgdgA1ZqV5IO7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: 98c613483ac642b72c2367085292ed0604f42073  Revert "Revert "msdos fs: remove unsettable atari option""

elapsed time: 723m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                              allmodconfig
c6x                        evmc6457_defconfig
arm                       imx_v6_v7_defconfig
powerpc                      cm5200_defconfig
arm                        magician_defconfig
powerpc                     skiroot_defconfig
sh                        sh7757lcr_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                    amigaone_defconfig
arm                        spear6xx_defconfig
arm                            mmp2_defconfig
ia64                        generic_defconfig
mips                    maltaup_xpa_defconfig
sh                          rsk7269_defconfig
arm                      tct_hammer_defconfig
arm                            xcep_defconfig
sh                   rts7751r2dplus_defconfig
mips                      maltasmvp_defconfig
powerpc                     mpc5200_defconfig
sh                          urquell_defconfig
powerpc                      ep88xc_defconfig
powerpc                 canyonlands_defconfig
arm                          simpad_defconfig
sh                           se7750_defconfig
arm                         at91_dt_defconfig
arm                              zx_defconfig
sh                           se7343_defconfig
sh                            hp6xx_defconfig
powerpc                      makalu_defconfig
powerpc                       maple_defconfig
mips                           ip28_defconfig
arm                         lpc18xx_defconfig
c6x                         dsk6455_defconfig
powerpc                     kilauea_defconfig
m68k                        mvme16x_defconfig
mips                        bcm47xx_defconfig
mips                            gpr_defconfig
powerpc                 mpc837x_mds_defconfig
alpha                               defconfig
ia64                             allyesconfig
arm                     davinci_all_defconfig
mips                     decstation_defconfig
powerpc                 mpc8315_rdb_defconfig
arc                          axs101_defconfig
mips                           gcw0_defconfig
arm                        clps711x_defconfig
arm                     eseries_pxa_defconfig
arm64                            alldefconfig
arm                          pxa168_defconfig
arc                     haps_hs_smp_defconfig
m68k                       bvme6000_defconfig
arm                         vf610m4_defconfig
arm                         mv78xx0_defconfig
powerpc                      ppc40x_defconfig
sh                          sdk7780_defconfig
powerpc                       eiger_defconfig
m68k                          multi_defconfig
arm                         socfpga_defconfig
riscv                            allyesconfig
arm                          badge4_defconfig
arm                           sunxi_defconfig
mips                      maltaaprp_defconfig
xtensa                generic_kc705_defconfig
powerpc                      obs600_defconfig
sh                   sh7770_generic_defconfig
mips                        workpad_defconfig
x86_64                           allyesconfig
powerpc                       holly_defconfig
mips                malta_kvm_guest_defconfig
mips                        jmr3927_defconfig
powerpc                   currituck_defconfig
powerpc                     tqm8541_defconfig
sh                ecovec24-romimage_defconfig
arm                        multi_v5_defconfig
powerpc                     tqm5200_defconfig
powerpc                   lite5200b_defconfig
m68k                        mvme147_defconfig
powerpc                      tqm8xx_defconfig
powerpc                      chrp32_defconfig
sh                        edosk7760_defconfig
riscv                            alldefconfig
arm                          pxa3xx_defconfig
mips                      fuloong2e_defconfig
arm                       cns3420vb_defconfig
arm                  colibri_pxa270_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201102
i386                 randconfig-a006-20201102
i386                 randconfig-a005-20201102
i386                 randconfig-a001-20201102
i386                 randconfig-a002-20201102
i386                 randconfig-a003-20201102
x86_64               randconfig-a012-20201102
x86_64               randconfig-a015-20201102
x86_64               randconfig-a011-20201102
x86_64               randconfig-a013-20201102
x86_64               randconfig-a014-20201102
x86_64               randconfig-a016-20201102
i386                 randconfig-a013-20201102
i386                 randconfig-a015-20201102
i386                 randconfig-a014-20201102
i386                 randconfig-a016-20201102
i386                 randconfig-a011-20201102
i386                 randconfig-a012-20201102
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201102
x86_64               randconfig-a005-20201102
x86_64               randconfig-a003-20201102
x86_64               randconfig-a002-20201102
x86_64               randconfig-a006-20201102
x86_64               randconfig-a001-20201102

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
