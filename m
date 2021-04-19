Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BFCC433B4
	for <linux-m68k@archiver.kernel.org>; Mon, 19 Apr 2021 23:33:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 189A361279
	for <linux-m68k@archiver.kernel.org>; Mon, 19 Apr 2021 23:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhDSXd6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 19 Apr 2021 19:33:58 -0400
Received: from mga12.intel.com ([192.55.52.136]:33096 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232184AbhDSXd5 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 19 Apr 2021 19:33:57 -0400
IronPort-SDR: rCi9Pt0caAIxapOXwU1/lnwgfLGqIvX7rLhhPsqBeHZt1bxoy+Utlc4G+kSzwZHgVRSZVzB46L
 awOZtSlbVfPw==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="174900488"
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; 
   d="scan'208";a="174900488"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2021 16:33:24 -0700
IronPort-SDR: PEYZ7+pAuArFfRqr4Nrj2An6MqJ3BUWgw5So5CPlKWPcBza1fCMeHU40o8GuGGxQz/MzxOYRSl
 c8/q4nHu2keg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; 
   d="scan'208";a="445327582"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2021 16:33:23 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lYdOM-0001xu-Ti; Mon, 19 Apr 2021 23:33:22 +0000
Date:   Tue, 20 Apr 2021 07:32:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:for-v5.13] BUILD SUCCESS
 34e5269bf987aff9a33ad3ab4f5d65c02913cbc1
Message-ID: <607e130c.BOXycg1KFnbRegC5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.13
branch HEAD: 34e5269bf987aff9a33ad3ab4f5d65c02913cbc1  m68k: sun3x: Remove unneeded semicolon

elapsed time: 726m

configs tested: 140
configs skipped: 101

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
m68k                        mvme16x_defconfig
powerpc                 mpc832x_mds_defconfig
mips                           xway_defconfig
sh                             espt_defconfig
sparc64                          alldefconfig
powerpc                   motionpro_defconfig
sh                         ap325rxa_defconfig
nds32                             allnoconfig
mips                      pic32mzda_defconfig
sh                      rts7751r2d1_defconfig
xtensa                         virt_defconfig
arm                            mmp2_defconfig
arm                           omap1_defconfig
arm                        multi_v5_defconfig
powerpc                     tqm8540_defconfig
sh                           se7206_defconfig
powerpc                      ep88xc_defconfig
powerpc                     sbc8548_defconfig
mips                            gpr_defconfig
arm                         orion5x_defconfig
sh                          rsk7201_defconfig
um                                allnoconfig
powerpc                    socrates_defconfig
sparc                       sparc64_defconfig
arm                        magician_defconfig
m68k                            mac_defconfig
powerpc                         ps3_defconfig
xtensa                           allyesconfig
powerpc                 mpc832x_rdb_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                            hp6xx_defconfig
powerpc                 linkstation_defconfig
sh                          sdk7786_defconfig
s390                             allmodconfig
arm                        vexpress_defconfig
alpha                            alldefconfig
arm                            lart_defconfig
powerpc                          g5_defconfig
powerpc                      bamboo_defconfig
mips                        nlm_xlr_defconfig
mips                      fuloong2e_defconfig
parisc                generic-64bit_defconfig
mips                        maltaup_defconfig
arm                           h5000_defconfig
powerpc                     mpc83xx_defconfig
m68k                         amcore_defconfig
mips                        jmr3927_defconfig
mips                       capcella_defconfig
powerpc                        warp_defconfig
alpha                            allyesconfig
mips                        bcm47xx_defconfig
ia64                             allmodconfig
powerpc                 xes_mpc85xx_defconfig
ia64                                defconfig
powerpc                      katmai_defconfig
sh                         ecovec24_defconfig
nios2                         3c120_defconfig
sh                          landisk_defconfig
arm                          pcm027_defconfig
arc                    vdk_hs38_smp_defconfig
sparc                       sparc32_defconfig
arm                          imote2_defconfig
arc                          axs101_defconfig
arm                          pxa168_defconfig
powerpc                 mpc836x_mds_defconfig
arm                          gemini_defconfig
arm                          exynos_defconfig
powerpc                     kmeter1_defconfig
powerpc                 mpc834x_mds_defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
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
x86_64               randconfig-a003-20210419
x86_64               randconfig-a001-20210419
x86_64               randconfig-a005-20210419
x86_64               randconfig-a002-20210419
x86_64               randconfig-a006-20210419
x86_64               randconfig-a004-20210419
i386                 randconfig-a003-20210419
i386                 randconfig-a001-20210419
i386                 randconfig-a006-20210419
i386                 randconfig-a005-20210419
i386                 randconfig-a004-20210419
i386                 randconfig-a002-20210419
i386                 randconfig-a015-20210419
i386                 randconfig-a013-20210419
i386                 randconfig-a014-20210419
i386                 randconfig-a016-20210419
i386                 randconfig-a012-20210419
i386                 randconfig-a011-20210419
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210419
x86_64               randconfig-a015-20210419
x86_64               randconfig-a013-20210419
x86_64               randconfig-a011-20210419
x86_64               randconfig-a012-20210419
x86_64               randconfig-a016-20210419

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
