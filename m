Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25F0C388F9
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Nov 2020 00:43:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8345B24682
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Nov 2020 00:43:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730318AbgKQAnY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Nov 2020 19:43:24 -0500
Received: from mga04.intel.com ([192.55.52.120]:42333 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731037AbgKQAnY (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Nov 2020 19:43:24 -0500
IronPort-SDR: n1SouK9PKe6fO16rYk3WNquKPwLt4bajrvM3vsArZztm/bxuyKRB2OH8dLKw3TdIsL8AOT/CbS
 TFJdhpWWwBUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="168262284"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
   d="scan'208";a="168262284"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 16:43:18 -0800
IronPort-SDR: 6TaKgeookU7hDtGE8xb2xEKA2ta4XFDO1V1RCPTJVtFgHFjK2ROSQgcSaNEgxMTS9zjmhEuZNP
 TxwUPqKCEPoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
   d="scan'208";a="532036575"
Received: from lkp-server01.sh.intel.com (HELO fb398427a497) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Nov 2020 16:43:16 -0800
Received: from kbuild by fb398427a497 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kep5X-0000GW-Rf; Tue, 17 Nov 2020 00:43:15 +0000
Date:   Tue, 17 Nov 2020 08:42:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:for-next] BUILD SUCCESS
 8ae0b65ac7e5b7a93b8d6abc520351ca11d91867
Message-ID: <5fb31c68.qmuEN5tqr0JD1JX6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  for-next
branch HEAD: 8ae0b65ac7e5b7a93b8d6abc520351ca11d91867  m68k: defconfig: Enable KUnit tests

elapsed time: 725m

configs tested: 165
configs skipped: 89

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                     cu1830-neo_defconfig
arm                         socfpga_defconfig
nios2                         10m50_defconfig
powerpc                 mpc8315_rdb_defconfig
xtensa                  nommu_kc705_defconfig
mips                           gcw0_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     mpc512x_defconfig
sh                        sh7785lcr_defconfig
arm                        oxnas_v6_defconfig
m68k                            q40_defconfig
m68k                       m5475evb_defconfig
arm                       cns3420vb_defconfig
arm                        mini2440_defconfig
arm                        vexpress_defconfig
mips                  decstation_64_defconfig
powerpc                  mpc866_ads_defconfig
arm                       mainstone_defconfig
um                           x86_64_defconfig
arm                        magician_defconfig
arm                        spear3xx_defconfig
arm                         shannon_defconfig
sh                 kfr2r09-romimage_defconfig
arm                          iop32x_defconfig
sh                           sh2007_defconfig
powerpc                 linkstation_defconfig
mips                          rb532_defconfig
m68k                        mvme147_defconfig
openrisc                    or1ksim_defconfig
sh                          rsk7201_defconfig
ia64                          tiger_defconfig
mips                       capcella_defconfig
mips                        nlm_xlr_defconfig
sh                        dreamcast_defconfig
arm                        shmobile_defconfig
openrisc                            defconfig
sh                         microdev_defconfig
sh                             espt_defconfig
powerpc                     tqm8555_defconfig
arm                     am200epdkit_defconfig
nds32                               defconfig
mips                          rm200_defconfig
mips                       lemote2f_defconfig
mips                 decstation_r4k_defconfig
sh                     magicpanelr2_defconfig
arc                          axs101_defconfig
powerpc                     ep8248e_defconfig
m68k                             allmodconfig
powerpc                     sbc8548_defconfig
nds32                            alldefconfig
powerpc                      ppc40x_defconfig
arm                          badge4_defconfig
um                            kunit_defconfig
m68k                          hp300_defconfig
arm                          gemini_defconfig
arm                      tct_hammer_defconfig
mips                        bcm47xx_defconfig
powerpc                      walnut_defconfig
alpha                            allyesconfig
m68k                        m5272c3_defconfig
h8300                               defconfig
sh                      rts7751r2d1_defconfig
mips                            gpr_defconfig
powerpc                        icon_defconfig
sh                           se7721_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     powernv_defconfig
arm                            mmp2_defconfig
arm                         lpc32xx_defconfig
ia64                      gensparse_defconfig
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
arc                    vdk_hs38_smp_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc8272_ads_defconfig
m68k                       m5249evb_defconfig
m68k                          sun3x_defconfig
arm                          collie_defconfig
arm                     eseries_pxa_defconfig
arm                           h5000_defconfig
arm                          simpad_defconfig
powerpc                     ppa8548_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
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
i386                 randconfig-a006-20201116
i386                 randconfig-a005-20201116
i386                 randconfig-a001-20201116
i386                 randconfig-a002-20201116
i386                 randconfig-a004-20201116
i386                 randconfig-a003-20201116
x86_64               randconfig-a015-20201115
x86_64               randconfig-a011-20201115
x86_64               randconfig-a014-20201115
x86_64               randconfig-a013-20201115
x86_64               randconfig-a016-20201115
x86_64               randconfig-a012-20201115
i386                 randconfig-a012-20201116
i386                 randconfig-a014-20201116
i386                 randconfig-a016-20201116
i386                 randconfig-a011-20201116
i386                 randconfig-a015-20201116
i386                 randconfig-a013-20201116
x86_64               randconfig-a003-20201116
x86_64               randconfig-a005-20201116
x86_64               randconfig-a004-20201116
x86_64               randconfig-a002-20201116
x86_64               randconfig-a001-20201116
x86_64               randconfig-a006-20201116
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
x86_64               randconfig-a003-20201115
x86_64               randconfig-a005-20201115
x86_64               randconfig-a004-20201115
x86_64               randconfig-a002-20201115
x86_64               randconfig-a001-20201115
x86_64               randconfig-a006-20201115
x86_64               randconfig-a015-20201116
x86_64               randconfig-a011-20201116
x86_64               randconfig-a014-20201116
x86_64               randconfig-a013-20201116
x86_64               randconfig-a016-20201116
x86_64               randconfig-a012-20201116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
