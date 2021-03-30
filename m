Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60995C433E0
	for <linux-m68k@archiver.kernel.org>; Tue, 30 Mar 2021 05:23:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 337E061996
	for <linux-m68k@archiver.kernel.org>; Tue, 30 Mar 2021 05:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhC3FWf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 30 Mar 2021 01:22:35 -0400
Received: from mga17.intel.com ([192.55.52.151]:6561 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229479AbhC3FWN (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 30 Mar 2021 01:22:13 -0400
IronPort-SDR: x/CWHRdQAhfIMsDmzpEjSU1UpnXLULIIMRDryeqBWve9YvZkPdS4LnElAdSdnHGM3OPvcA4vkM
 b2R4MrBqeg3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="171708957"
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; 
   d="scan'208";a="171708957"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 22:22:11 -0700
IronPort-SDR: 34R7248YXS3h41WpGPWLVOP3AIxYnrdmiam5tJbHJssUIJ+GmXOZYSIKMH5WiTS2EZFA34UWFY
 Q2/wRG5mOx6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; 
   d="scan'208";a="444942879"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2021 22:22:10 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lR6pN-000533-PP; Tue, 30 Mar 2021 05:22:09 +0000
Date:   Tue, 30 Mar 2021 13:21:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 2eb05a181bda0875199521407134f6b98109d0a9
Message-ID: <6062b55b./QQZCDCLjJWWgznY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 2eb05a181bda0875199521407134f6b98109d0a9  Merge tag 'v5.12-rc5'

elapsed time: 1208m

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
i386                             allyesconfig
sh                               j2_defconfig
powerpc                      cm5200_defconfig
sh                   secureedge5410_defconfig
arm                        spear3xx_defconfig
arm                          pxa3xx_defconfig
mips                       capcella_defconfig
arm                          exynos_defconfig
sh                        dreamcast_defconfig
powerpc                     tqm8540_defconfig
powerpc                  mpc885_ads_defconfig
arm                       aspeed_g4_defconfig
arm                       cns3420vb_defconfig
sh                           sh2007_defconfig
arm                         hackkit_defconfig
m68k                             alldefconfig
parisc                generic-64bit_defconfig
riscv                    nommu_virt_defconfig
xtensa                  cadence_csp_defconfig
powerpc                       maple_defconfig
mips                      fuloong2e_defconfig
mips                           rs90_defconfig
mips                    maltaup_xpa_defconfig
sh                          rsk7201_defconfig
mips                           ip28_defconfig
arm                         lubbock_defconfig
powerpc                         wii_defconfig
sh                           se7619_defconfig
powerpc                      makalu_defconfig
arm                           sama5_defconfig
powerpc                   lite5200b_defconfig
arm                           omap1_defconfig
arm                         s5pv210_defconfig
mips                           ip32_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
x86_64               randconfig-a002-20210329
x86_64               randconfig-a003-20210329
x86_64               randconfig-a006-20210329
x86_64               randconfig-a001-20210329
x86_64               randconfig-a005-20210329
x86_64               randconfig-a004-20210329
i386                 randconfig-a003-20210329
i386                 randconfig-a004-20210329
i386                 randconfig-a001-20210329
i386                 randconfig-a002-20210329
i386                 randconfig-a006-20210329
i386                 randconfig-a005-20210329
i386                 randconfig-a014-20210329
i386                 randconfig-a011-20210329
i386                 randconfig-a015-20210329
i386                 randconfig-a016-20210329
i386                 randconfig-a013-20210329
i386                 randconfig-a012-20210329
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210329
x86_64               randconfig-a012-20210329
x86_64               randconfig-a013-20210329
x86_64               randconfig-a014-20210329
x86_64               randconfig-a011-20210329
x86_64               randconfig-a016-20210329

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
