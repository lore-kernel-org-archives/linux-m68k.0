Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E595BC433DB
	for <linux-m68k@archiver.kernel.org>; Fri,  8 Jan 2021 13:56:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A703D238E8
	for <linux-m68k@archiver.kernel.org>; Fri,  8 Jan 2021 13:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbhAHN4d (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 8 Jan 2021 08:56:33 -0500
Received: from mga06.intel.com ([134.134.136.31]:54987 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726060AbhAHN4c (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 8 Jan 2021 08:56:32 -0500
IronPort-SDR: kwzPpBKUG6h4JpIAgRgaDUWz+esg83T14R1iUDXaRJGIRey1n+f/zsEGw0mX9PRBNhELrDm4sT
 WMdVYKhnn5Bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="239147202"
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="239147202"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 05:55:50 -0800
IronPort-SDR: JsOTU4s99EFGWb6s6RTWtADSUzDkEgrer4m4VDFrj++ecnikLA2CDSxCXu8nDwq25T08nJjLpU
 kFaEU9nWA/tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="351685252"
Received: from lkp-server01.sh.intel.com (HELO 412602b27703) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Jan 2021 05:55:49 -0800
Received: from kbuild by 412602b27703 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kxsF2-0000IS-QM; Fri, 08 Jan 2021 13:55:48 +0000
Date:   Fri, 08 Jan 2021 21:55:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 372db483c50711db1dbc28f2e8183a16907dbed0
Message-ID: <5ff86458.gcHR0J+1uNkXTtQC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: 372db483c50711db1dbc28f2e8183a16907dbed0  Merge tag 'v5.11-rc2'

elapsed time: 732m

configs tested: 105
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    sam440ep_defconfig
arc                        nsim_700_defconfig
arm                         lpc32xx_defconfig
sh                           se7343_defconfig
arm                          collie_defconfig
powerpc                      makalu_defconfig
nios2                            allyesconfig
powerpc                    mvme5100_defconfig
mips                          ath25_defconfig
sh                             shx3_defconfig
m68k                          multi_defconfig
sh                          lboxre2_defconfig
mips                     cu1830-neo_defconfig
nios2                         3c120_defconfig
mips                     decstation_defconfig
arm                            xcep_defconfig
arm                          ep93xx_defconfig
sh                          rsk7269_defconfig
sh                               j2_defconfig
arm                       multi_v4t_defconfig
h8300                            alldefconfig
arm                       aspeed_g4_defconfig
nios2                            alldefconfig
arm                         vf610m4_defconfig
arm                          badge4_defconfig
arm                        neponset_defconfig
sh                           se7751_defconfig
openrisc                            defconfig
arm64                            alldefconfig
sh                            migor_defconfig
mips                           ip22_defconfig
powerpc                  mpc885_ads_defconfig
arm                             mxs_defconfig
parisc                generic-32bit_defconfig
arm                      pxa255-idp_defconfig
m68k                           sun3_defconfig
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
csky                                defconfig
alpha                               defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210108
i386                 randconfig-a002-20210108
i386                 randconfig-a001-20210108
i386                 randconfig-a003-20210108
i386                 randconfig-a006-20210108
i386                 randconfig-a004-20210108
i386                 randconfig-a016-20210108
i386                 randconfig-a011-20210108
i386                 randconfig-a014-20210108
i386                 randconfig-a015-20210108
i386                 randconfig-a013-20210108
i386                 randconfig-a012-20210108
x86_64               randconfig-a004-20210108
x86_64               randconfig-a006-20210108
x86_64               randconfig-a001-20210108
x86_64               randconfig-a002-20210108
x86_64               randconfig-a003-20210108
x86_64               randconfig-a005-20210108
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
