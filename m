Return-Path: <SRS0=iVNi=DU=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D022CC433E7
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Oct 2020 00:12:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FB9F20878
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Oct 2020 00:12:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgJMAMf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 20:12:35 -0400
Received: from mga05.intel.com ([192.55.52.43]:47016 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726394AbgJMAMf (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Oct 2020 20:12:35 -0400
IronPort-SDR: A7aO0u7nvlFAsGCoIRIL+baaNeUWz9wEUlZIIzS0s1J866qNgJKVB2J3FQQaRQfkUlpstazayE
 C34SiYOdKcmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="250517478"
X-IronPort-AV: E=Sophos;i="5.77,368,1596524400"; 
   d="scan'208";a="250517478"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 17:12:33 -0700
IronPort-SDR: SkqWnwK4dR+ZlhpBsYT7cnL4DykLGpCfmFYYXmZ6HnnAGrz/TQCix1yLxcyf5Unbq2OThXg/9G
 iEolCaDhGR6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,368,1596524400"; 
   d="scan'208";a="520851439"
Received: from lkp-server01.sh.intel.com (HELO aa1d92d39b27) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Oct 2020 17:12:32 -0700
Received: from kbuild by aa1d92d39b27 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kS7vb-0000Di-UB; Tue, 13 Oct 2020 00:12:31 +0000
Date:   Tue, 13 Oct 2020 08:12:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-queue] BUILD SUCCESS
 814cd3aaf9f1818139ef0f90e9429f6e717b6317
Message-ID: <5f84f0e6.402W61bUTbTr8w8D%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
branch HEAD: 814cd3aaf9f1818139ef0f90e9429f6e717b6317  fat: Use correct logical sector size for Atari GEMDOS FAT

elapsed time: 722m

configs tested: 159
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    sam440ep_defconfig
s390                          debug_defconfig
ia64                                defconfig
powerpc                      cm5200_defconfig
arm                            mmp2_defconfig
sh                          rsk7201_defconfig
h8300                       h8s-sim_defconfig
sh                   sh7724_generic_defconfig
arm                            pleb_defconfig
arm                           spitz_defconfig
mips                           ip32_defconfig
powerpc                     mpc512x_defconfig
h8300                            allyesconfig
arm                       mainstone_defconfig
openrisc                 simple_smp_defconfig
csky                                defconfig
arm                           stm32_defconfig
mips                       bmips_be_defconfig
arm                          badge4_defconfig
c6x                        evmc6474_defconfig
arm                              alldefconfig
powerpc                 mpc832x_mds_defconfig
powerpc                     asp8347_defconfig
arm                  colibri_pxa270_defconfig
mips                      loongson3_defconfig
powerpc                     kilauea_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                   sh7770_generic_defconfig
arm                         palmz72_defconfig
arm                      integrator_defconfig
arm                        multi_v7_defconfig
arm                      tct_hammer_defconfig
mips                         db1xxx_defconfig
arm                        realview_defconfig
powerpc                 mpc834x_mds_defconfig
xtensa                    xip_kc705_defconfig
sh                   secureedge5410_defconfig
arm                          iop32x_defconfig
mips                      pistachio_defconfig
openrisc                    or1ksim_defconfig
powerpc                 mpc85xx_cds_defconfig
arc                        vdk_hs38_defconfig
powerpc                    amigaone_defconfig
powerpc                    mvme5100_defconfig
sh                              ul2_defconfig
arc                              allyesconfig
powerpc                 mpc8313_rdb_defconfig
openrisc                            defconfig
ia64                         bigsur_defconfig
powerpc                 mpc836x_mds_defconfig
i386                             alldefconfig
powerpc                   bluestone_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        m5307c3_defconfig
powerpc                 canyonlands_defconfig
sh                           se7724_defconfig
mips                      pic32mzda_defconfig
c6x                         dsk6455_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                       omap2plus_defconfig
mips                       lemote2f_defconfig
mips                         cobalt_defconfig
xtensa                  cadence_csp_defconfig
arm                           corgi_defconfig
sh                          sdk7780_defconfig
um                            kunit_defconfig
arm                      jornada720_defconfig
h8300                     edosk2674_defconfig
powerpc                      pcm030_defconfig
arm64                            alldefconfig
arm                             rpc_defconfig
powerpc                     tqm8555_defconfig
arm                       multi_v4t_defconfig
powerpc                       ebony_defconfig
arm                        vexpress_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     ppa8548_defconfig
arm                             pxa_defconfig
sh                          rsk7203_defconfig
mips                            ar7_defconfig
powerpc                  mpc866_ads_defconfig
arm                         at91_dt_defconfig
m68k                         amcore_defconfig
sh                          lboxre2_defconfig
mips                     cu1830-neo_defconfig
m68k                            q40_defconfig
um                             i386_defconfig
sh                            migor_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
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
i386                 randconfig-a005-20201012
i386                 randconfig-a006-20201012
i386                 randconfig-a001-20201012
i386                 randconfig-a003-20201012
i386                 randconfig-a004-20201012
i386                 randconfig-a002-20201012
x86_64               randconfig-a016-20201012
x86_64               randconfig-a015-20201012
x86_64               randconfig-a012-20201012
x86_64               randconfig-a013-20201012
x86_64               randconfig-a014-20201012
x86_64               randconfig-a011-20201012
i386                 randconfig-a016-20201012
i386                 randconfig-a015-20201012
i386                 randconfig-a013-20201012
i386                 randconfig-a012-20201012
i386                 randconfig-a011-20201012
i386                 randconfig-a014-20201012
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201012
x86_64               randconfig-a002-20201012
x86_64               randconfig-a006-20201012
x86_64               randconfig-a001-20201012
x86_64               randconfig-a003-20201012
x86_64               randconfig-a005-20201012

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
