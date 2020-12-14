Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785A0C2BB48
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Dec 2020 21:08:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 437732253A
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Dec 2020 21:08:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503453AbgLNVHr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Dec 2020 16:07:47 -0500
Received: from mga18.intel.com ([134.134.136.126]:43064 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503607AbgLNVGk (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Dec 2020 16:06:40 -0500
IronPort-SDR: 25dCoHY6Xt8h0PSkCJnODnhCvF2qnDkA35JS/V/lbPekX9Ka/6WD6ajX2Oxa0TUcSiptBQXl2L
 jolFZnnNkaRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="162527393"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="162527393"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 13:05:57 -0800
IronPort-SDR: IH4AZczA+7Ty7hG31vMTp2Y5YNhJEr5lt/0qJPqzuQhvYLFebbHvk3jJtNQBOui+Dp1ph5qJdE
 BLerWzx8dSdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="389442668"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2020 13:05:56 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kov2Z-0000TL-En; Mon, 14 Dec 2020 21:05:55 +0000
Date:   Tue, 15 Dec 2020 05:05:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 7cab52709da1bbad76e54e7797b69f3ee7ca054d
Message-ID: <5fd7d3b0.fr8HR7Q20NolQSiY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: 7cab52709da1bbad76e54e7797b69f3ee7ca054d  Merge tag 'v5.10'

elapsed time: 721m

configs tested: 103
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5249evb_defconfig
powerpc                mpc7448_hpc2_defconfig
microblaze                      mmu_defconfig
powerpc                      tqm8xx_defconfig
m68k                         apollo_defconfig
sparc                               defconfig
arm                             mxs_defconfig
powerpc                     sbc8548_defconfig
mips                        nlm_xlr_defconfig
arc                      axs103_smp_defconfig
mips                          rm200_defconfig
arm                       spear13xx_defconfig
powerpc                     akebono_defconfig
powerpc                    adder875_defconfig
m68k                          amiga_defconfig
powerpc                       holly_defconfig
mips                      maltaaprp_defconfig
mips                         tb0287_defconfig
powerpc                     tqm8541_defconfig
sh                          urquell_defconfig
arc                        nsim_700_defconfig
powerpc                     tqm8555_defconfig
arc                              alldefconfig
xtensa                    xip_kc705_defconfig
m68k                       m5475evb_defconfig
arc                            hsdk_defconfig
mips                        bcm47xx_defconfig
powerpc                     ppa8548_defconfig
m68k                          multi_defconfig
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
nds32                             allnoconfig
c6x                              allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20201214
i386                 randconfig-a004-20201214
i386                 randconfig-a003-20201214
i386                 randconfig-a002-20201214
i386                 randconfig-a006-20201214
i386                 randconfig-a005-20201214
x86_64               randconfig-a016-20201214
x86_64               randconfig-a012-20201214
x86_64               randconfig-a013-20201214
x86_64               randconfig-a015-20201214
x86_64               randconfig-a014-20201214
x86_64               randconfig-a011-20201214
i386                 randconfig-a014-20201214
i386                 randconfig-a013-20201214
i386                 randconfig-a012-20201214
i386                 randconfig-a011-20201214
i386                 randconfig-a015-20201214
i386                 randconfig-a016-20201214
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
x86_64               randconfig-a003-20201214
x86_64               randconfig-a006-20201214
x86_64               randconfig-a002-20201214
x86_64               randconfig-a005-20201214
x86_64               randconfig-a004-20201214
x86_64               randconfig-a001-20201214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
