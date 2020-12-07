Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FF4C197BF
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Dec 2020 23:32:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B69723A1C
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Dec 2020 23:32:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbgLGXcK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Dec 2020 18:32:10 -0500
Received: from mga14.intel.com ([192.55.52.115]:19185 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727135AbgLGXcK (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Dec 2020 18:32:10 -0500
IronPort-SDR: SaeQeU/Q5myiCnSY5uuaYL1Aa2HEMLYK4HjNl+mtfAKmwdm1Jthu2RJ8XOqeEHveDfJYU1Frx3
 Av/xTIvPe6wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173032084"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; 
   d="scan'208";a="173032084"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 15:31:28 -0800
IronPort-SDR: qFvHnR7X7vrZLHqfOM5JQO9AEvv4EKeoDivsXhFGpKY5diMjsMbwrqSdHbJ9OMAWacg/Vr7FWH
 QvekYzwwljSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; 
   d="scan'208";a="552007721"
Received: from lkp-server01.sh.intel.com (HELO f1d34cfde454) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Dec 2020 15:31:26 -0800
Received: from kbuild by f1d34cfde454 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kmPyY-0000CA-3d; Mon, 07 Dec 2020 23:31:26 +0000
Date:   Tue, 08 Dec 2020 07:30:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 dfdc20e91ca3bfc9f5fb9dde0231d8d19ddf737f
Message-ID: <5fcebb20.KS9XmSZr/DvFOQgf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: dfdc20e91ca3bfc9f5fb9dde0231d8d19ddf737f  MAINTAINERS: Update m68k Mac entry

elapsed time: 720m

configs tested: 107
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       imx_v6_v7_defconfig
arm                          tango4_defconfig
microblaze                      mmu_defconfig
arm                        trizeps4_defconfig
powerpc                      ep88xc_defconfig
arm                         bcm2835_defconfig
mips                        maltaup_defconfig
powerpc                      makalu_defconfig
m68k                          multi_defconfig
powerpc                     pq2fads_defconfig
arc                     haps_hs_smp_defconfig
arm                            mmp2_defconfig
arm                          pcm027_defconfig
m68k                         amcore_defconfig
arm                          pxa168_defconfig
arm                            zeus_defconfig
arm                     eseries_pxa_defconfig
sh                          r7780mp_defconfig
powerpc64                           defconfig
arm                          ixp4xx_defconfig
arm                       mainstone_defconfig
arm                           omap1_defconfig
arc                              alldefconfig
mips                           ip32_defconfig
arm                          lpd270_defconfig
powerpc                         ps3_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                 mpc837x_rdb_defconfig
nds32                             allnoconfig
arc                 nsimosci_hs_smp_defconfig
mips                          rb532_defconfig
m68k                        m5272c3_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
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
i386                 randconfig-a005-20201207
i386                 randconfig-a004-20201207
i386                 randconfig-a001-20201207
i386                 randconfig-a002-20201207
i386                 randconfig-a006-20201207
i386                 randconfig-a003-20201207
x86_64               randconfig-a016-20201207
x86_64               randconfig-a012-20201207
x86_64               randconfig-a014-20201207
x86_64               randconfig-a013-20201207
x86_64               randconfig-a015-20201207
x86_64               randconfig-a011-20201207
i386                 randconfig-a014-20201207
i386                 randconfig-a013-20201207
i386                 randconfig-a011-20201207
i386                 randconfig-a015-20201207
i386                 randconfig-a012-20201207
i386                 randconfig-a016-20201207
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
x86_64               randconfig-a004-20201207
x86_64               randconfig-a006-20201207
x86_64               randconfig-a002-20201207
x86_64               randconfig-a001-20201207
x86_64               randconfig-a005-20201207
x86_64               randconfig-a003-20201207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
