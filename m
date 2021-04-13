Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF87BC433B4
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Apr 2021 18:52:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EC6E613C7
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Apr 2021 18:52:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347892AbhDMSwz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Apr 2021 14:52:55 -0400
Received: from mga04.intel.com ([192.55.52.120]:2701 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232517AbhDMSwy (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Apr 2021 14:52:54 -0400
IronPort-SDR: b4HEna/5fSuXnhR1nVGSumgrz8IfohVHfuc1j8+/QjkfAf4r+sB58/U4UuBPZLzcX5IXeFHZpq
 UfmjPpw5vTVQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="192354768"
X-IronPort-AV: E=Sophos;i="5.82,220,1613462400"; 
   d="scan'208";a="192354768"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 11:52:27 -0700
IronPort-SDR: KAO3+b69l0yojjcO1MO9L9hHaAzCDwWNZ5zoMOgLRfpW9+mFaLSECdXFNtl9jMJyzyOLeUPMh+
 mM2e/ggqRwPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,220,1613462400"; 
   d="scan'208";a="452088063"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2021 11:52:25 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lWO9A-0001DO-O0; Tue, 13 Apr 2021 18:52:24 +0000
Date:   Wed, 14 Apr 2021 02:52:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:for-v5.13] BUILD SUCCESS
 f829b4b212a315b912cb23fd10aaf30534bb5ce9
Message-ID: <6075e860.2UsaKWrZfdLiDcIY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.13
branch HEAD: f829b4b212a315b912cb23fd10aaf30534bb5ce9  m68k: Add missing mmap_read_lock() to sys_cacheflush()

elapsed time: 722m

configs tested: 176
configs skipped: 105

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
sh                         microdev_defconfig
sh                             espt_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                           ip32_defconfig
arm                        oxnas_v6_defconfig
h8300                       h8s-sim_defconfig
mips                       bmips_be_defconfig
powerpc                 canyonlands_defconfig
mips                  decstation_64_defconfig
arm                              alldefconfig
s390                       zfcpdump_defconfig
arm                  colibri_pxa300_defconfig
nios2                            alldefconfig
sh                          kfr2r09_defconfig
powerpc                     tqm5200_defconfig
powerpc                      makalu_defconfig
sh                          rsk7269_defconfig
arm                       cns3420vb_defconfig
ia64                          tiger_defconfig
arc                        nsim_700_defconfig
openrisc                 simple_smp_defconfig
sh                          urquell_defconfig
h8300                    h8300h-sim_defconfig
arm                          collie_defconfig
mips                malta_kvm_guest_defconfig
sh                           se7750_defconfig
mips                           rs90_defconfig
powerpc                    gamecube_defconfig
arc                     nsimosci_hs_defconfig
m68k                          hp300_defconfig
powerpc                  storcenter_defconfig
sh                            shmin_defconfig
mips                            gpr_defconfig
ia64                             alldefconfig
powerpc                    socrates_defconfig
powerpc                   lite5200b_defconfig
powerpc                      bamboo_defconfig
arm                            xcep_defconfig
mips                        nlm_xlp_defconfig
powerpc                  iss476-smp_defconfig
mips                        workpad_defconfig
sh                          polaris_defconfig
arm                         assabet_defconfig
arm                           corgi_defconfig
arm                        magician_defconfig
um                                  defconfig
arm                            zeus_defconfig
openrisc                         alldefconfig
powerpc                 mpc832x_rdb_defconfig
m68k                          atari_defconfig
powerpc                     mpc5200_defconfig
h8300                     edosk2674_defconfig
xtensa                  nommu_kc705_defconfig
sh                           se7780_defconfig
sh                        edosk7760_defconfig
powerpc                    klondike_defconfig
powerpc                 mpc8560_ads_defconfig
sh                   sh7770_generic_defconfig
arc                          axs103_defconfig
mips                        omega2p_defconfig
arm                          ixp4xx_defconfig
powerpc                     tqm8540_defconfig
arm                         hackkit_defconfig
m68k                       m5208evb_defconfig
arm                             ezx_defconfig
powerpc                 linkstation_defconfig
powerpc                     pseries_defconfig
arm                           spitz_defconfig
arm                       multi_v4t_defconfig
openrisc                    or1ksim_defconfig
powerpc                      ppc44x_defconfig
um                           x86_64_defconfig
sh                         apsh4a3a_defconfig
arc                         haps_hs_defconfig
powerpc                      cm5200_defconfig
mips                        qi_lb60_defconfig
arm                            mmp2_defconfig
arm                          ep93xx_defconfig
m68k                            mac_defconfig
arm                  colibri_pxa270_defconfig
mips                           ci20_defconfig
arm                        clps711x_defconfig
sh                          landisk_defconfig
x86_64                           alldefconfig
sh                           sh2007_defconfig
m68k                          multi_defconfig
powerpc                    amigaone_defconfig
powerpc                     powernv_defconfig
powerpc                       ebony_defconfig
arm                           stm32_defconfig
sh                        sh7785lcr_defconfig
m68k                          amiga_defconfig
mips                          ath25_defconfig
mips                 decstation_r4k_defconfig
arc                          axs101_defconfig
powerpc                   motionpro_defconfig
arm                       netwinder_defconfig
mips                        nlm_xlr_defconfig
m68k                             allyesconfig
sh                     magicpanelr2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210413
x86_64               randconfig-a002-20210413
x86_64               randconfig-a001-20210413
x86_64               randconfig-a005-20210413
x86_64               randconfig-a006-20210413
x86_64               randconfig-a004-20210413
i386                 randconfig-a003-20210413
i386                 randconfig-a001-20210413
i386                 randconfig-a006-20210413
i386                 randconfig-a005-20210413
i386                 randconfig-a004-20210413
i386                 randconfig-a002-20210413
i386                 randconfig-a015-20210413
i386                 randconfig-a014-20210413
i386                 randconfig-a013-20210413
i386                 randconfig-a012-20210413
i386                 randconfig-a016-20210413
i386                 randconfig-a011-20210413
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210413
x86_64               randconfig-a015-20210413
x86_64               randconfig-a011-20210413
x86_64               randconfig-a013-20210413
x86_64               randconfig-a012-20210413
x86_64               randconfig-a016-20210413

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
