Return-Path: <SRS0=3Sed=CX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBC2C43461
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Sep 2020 23:37:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDE3F20897
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Sep 2020 23:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgINXhY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Sep 2020 19:37:24 -0400
Received: from mga07.intel.com ([134.134.136.100]:6327 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725994AbgINXhX (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Sep 2020 19:37:23 -0400
IronPort-SDR: ptCWiaB+5oIEKhXzQgK7mK8qYJCId3oq2NOy+wBwWGwTkLvijes+YB3Q/oaPkEOmx+IbQNKP7J
 8CAgcowavogg==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="223359214"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; 
   d="scan'208";a="223359214"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 16:37:21 -0700
IronPort-SDR: Qu0fFET0Hi8HvwUunxrHMCQx5lFld2cg9UZknb5cKO9JsvedpmgJ4wDnr3JQwB/XffKmoDwiT9
 IKkqV+INpLcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; 
   d="scan'208";a="287788686"
Received: from lkp-server01.sh.intel.com (HELO a75722977aa5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Sep 2020 16:37:20 -0700
Received: from kbuild by a75722977aa5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kHy2B-0001EN-Q2; Mon, 14 Sep 2020 23:37:19 +0000
Date:   Tue, 15 Sep 2020 07:36:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 bf002079ea2aa3d7e2c39a7585e26351185a394d
Message-ID: <5f5ffe80.hvJuxsa7xVSDjYZJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: bf002079ea2aa3d7e2c39a7585e26351185a394d  Merge tag 'v5.9-rc5'

elapsed time: 726m

configs tested: 133
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          sdk7786_defconfig
powerpc                          g5_defconfig
arm                           tegra_defconfig
openrisc                 simple_smp_defconfig
powerpc                        icon_defconfig
alpha                            alldefconfig
mips                      malta_kvm_defconfig
sh                             espt_defconfig
arm                   milbeaut_m10v_defconfig
h8300                               defconfig
powerpc                 xes_mpc85xx_defconfig
x86_64                              defconfig
powerpc                       eiger_defconfig
mips                        nlm_xlr_defconfig
arm                          pxa3xx_defconfig
sh                                  defconfig
m68k                        m5307c3_defconfig
powerpc                      mgcoge_defconfig
sparc                               defconfig
arm                         nhk8815_defconfig
arm                    vt8500_v6_v7_defconfig
ia64                                defconfig
mips                        bcm47xx_defconfig
arc                        nsimosci_defconfig
m68k                          hp300_defconfig
powerpc                      obs600_defconfig
riscv                            alldefconfig
arm                        multi_v5_defconfig
arm                         cm_x300_defconfig
xtensa                generic_kc705_defconfig
arm                         lpc18xx_defconfig
c6x                              allyesconfig
mips                      loongson3_defconfig
powerpc                  mpc866_ads_defconfig
m68k                             alldefconfig
mips                           jazz_defconfig
arm                              zx_defconfig
mips                      bmips_stb_defconfig
sh                          r7780mp_defconfig
arm                       aspeed_g5_defconfig
sparc                       sparc64_defconfig
powerpc                     tqm8560_defconfig
riscv                            allmodconfig
arm                        spear3xx_defconfig
arm                        clps711x_defconfig
mips                     cu1000-neo_defconfig
sparc64                             defconfig
powerpc                        warp_defconfig
sh                          rsk7201_defconfig
ia64                             allmodconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20200914
x86_64               randconfig-a006-20200914
x86_64               randconfig-a003-20200914
x86_64               randconfig-a002-20200914
x86_64               randconfig-a001-20200914
x86_64               randconfig-a005-20200914
i386                 randconfig-a004-20200913
i386                 randconfig-a006-20200913
i386                 randconfig-a003-20200913
i386                 randconfig-a001-20200913
i386                 randconfig-a002-20200913
i386                 randconfig-a005-20200913
i386                 randconfig-a004-20200914
i386                 randconfig-a006-20200914
i386                 randconfig-a001-20200914
i386                 randconfig-a003-20200914
i386                 randconfig-a002-20200914
i386                 randconfig-a005-20200914
x86_64               randconfig-a014-20200913
x86_64               randconfig-a011-20200913
x86_64               randconfig-a012-20200913
x86_64               randconfig-a016-20200913
x86_64               randconfig-a015-20200913
x86_64               randconfig-a013-20200913
i386                 randconfig-a015-20200914
i386                 randconfig-a014-20200914
i386                 randconfig-a011-20200914
i386                 randconfig-a013-20200914
i386                 randconfig-a016-20200914
i386                 randconfig-a012-20200914
i386                 randconfig-a015-20200913
i386                 randconfig-a014-20200913
i386                 randconfig-a011-20200913
i386                 randconfig-a013-20200913
i386                 randconfig-a016-20200913
i386                 randconfig-a012-20200913
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20200914
x86_64               randconfig-a011-20200914
x86_64               randconfig-a016-20200914
x86_64               randconfig-a012-20200914
x86_64               randconfig-a015-20200914
x86_64               randconfig-a013-20200914

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
