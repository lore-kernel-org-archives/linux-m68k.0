Return-Path: <SRS0=jiH+=DF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE2EC4727F
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Sep 2020 21:27:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D21F2083B
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Sep 2020 21:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgI1V1S (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Sep 2020 17:27:18 -0400
Received: from mga06.intel.com ([134.134.136.31]:1339 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726656AbgI1V1S (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 28 Sep 2020 17:27:18 -0400
IronPort-SDR: dM6+7qXO7GV7b0lNPlS0is42nDOj6VlOSOU5jSteQ6Kr1HYMYySq7Z0p8152C18LAf37l0oHoc
 P5BfaKZS6wEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="223658304"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="223658304"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 14:27:15 -0700
IronPort-SDR: A5EOKc4cy020L8roSIPV/6l2SmdtmA1MrCbEZjAAFBw15yO8sCb3prf4QYdI8K0eNabJL5I9hd
 prVkC2Q8TdmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="513599781"
Received: from lkp-server01.sh.intel.com (HELO 0e0978ea3297) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Sep 2020 14:27:14 -0700
Received: from kbuild by 0e0978ea3297 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kN0fx-0000P9-QY; Mon, 28 Sep 2020 21:27:13 +0000
Date:   Tue, 29 Sep 2020 05:26:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 59e0f7c1de77e871c3df8d7a1881abc01fa4b2a2
Message-ID: <5f725523.Ej4uaMB8uEteA+oG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: 59e0f7c1de77e871c3df8d7a1881abc01fa4b2a2  ide/macide: Convert Mac IDE driver to platform driver

elapsed time: 723m

configs tested: 110
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7269_defconfig
powerpc                    adder875_defconfig
powerpc                 mpc8560_ads_defconfig
m68k                         amcore_defconfig
sparc64                          alldefconfig
powerpc                      acadia_defconfig
riscv                            allyesconfig
arc                         haps_hs_defconfig
mips                        qi_lb60_defconfig
arm                        vexpress_defconfig
mips                           ci20_defconfig
arm                       aspeed_g4_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                        mvebu_v5_defconfig
mips                    maltaup_xpa_defconfig
arm                          simpad_defconfig
mips                           gcw0_defconfig
m68k                             allmodconfig
arm                         vf610m4_defconfig
mips                       rbtx49xx_defconfig
sh                      rts7751r2d1_defconfig
arm                       imx_v4_v5_defconfig
c6x                         dsk6455_defconfig
powerpc                     kmeter1_defconfig
ia64                             alldefconfig
powerpc                   lite5200b_defconfig
m68k                          sun3x_defconfig
powerpc                     sequoia_defconfig
arm                         orion5x_defconfig
parisc                              defconfig
powerpc                     ep8248e_defconfig
sh                        dreamcast_defconfig
parisc                           allyesconfig
arm                          pxa910_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20200928
x86_64               randconfig-a003-20200928
x86_64               randconfig-a004-20200928
x86_64               randconfig-a002-20200928
x86_64               randconfig-a006-20200928
x86_64               randconfig-a001-20200928
i386                 randconfig-a002-20200927
i386                 randconfig-a006-20200927
i386                 randconfig-a003-20200927
i386                 randconfig-a004-20200927
i386                 randconfig-a005-20200927
i386                 randconfig-a001-20200927
x86_64               randconfig-a011-20200927
x86_64               randconfig-a013-20200927
x86_64               randconfig-a014-20200927
x86_64               randconfig-a015-20200927
x86_64               randconfig-a012-20200927
x86_64               randconfig-a016-20200927
i386                 randconfig-a012-20200928
i386                 randconfig-a016-20200928
i386                 randconfig-a014-20200928
i386                 randconfig-a013-20200928
i386                 randconfig-a015-20200928
i386                 randconfig-a011-20200928
riscv                    nommu_k210_defconfig
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
x86_64               randconfig-a011-20200928
x86_64               randconfig-a013-20200928
x86_64               randconfig-a015-20200928
x86_64               randconfig-a014-20200928
x86_64               randconfig-a016-20200928
x86_64               randconfig-a012-20200928

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
