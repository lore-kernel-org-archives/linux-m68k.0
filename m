Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3D1C433E0
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 20:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B93D64DE7
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 20:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbhA2UX7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 29 Jan 2021 15:23:59 -0500
Received: from mga02.intel.com ([134.134.136.20]:56747 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233279AbhA2UWI (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 29 Jan 2021 15:22:08 -0500
IronPort-SDR: cmcOW331GVQ8iesTmBNXMkTVFXwMzyh6oRz1MstnF3eqXlPWDD/F+Swyb6Th2MSKYRTGNsyUcl
 aa5wbIUN1WTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="167577302"
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; 
   d="scan'208";a="167577302"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 12:21:23 -0800
IronPort-SDR: YEatjvJA3CnBDNJorae4W54SVUxAumQK42OoKC1zJBN0ckKDc27mNbhpsRFKnrQKR4uTPXCbc6
 mceuaUHotPfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; 
   d="scan'208";a="505845306"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 29 Jan 2021 12:21:22 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l5aGg-00044e-5X; Fri, 29 Jan 2021 20:21:22 +0000
Date:   Sat, 30 Jan 2021 04:21:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 242118f751648aa0286acb1000eaadf6accd336d
Message-ID: <60146e3b.HkStCzKzjA4Dddej%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 242118f751648aa0286acb1000eaadf6accd336d  macintosh/adb-iop: Use big-endian autopoll mask

elapsed time: 720m

configs tested: 117
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          polaris_defconfig
powerpc                      mgcoge_defconfig
sh                          sdk7786_defconfig
mips                        nlm_xlr_defconfig
arm                           viper_defconfig
sh                           se7721_defconfig
arc                      axs103_smp_defconfig
m68k                          atari_defconfig
sh                   secureedge5410_defconfig
arm                        keystone_defconfig
ia64                             alldefconfig
mips                         tb0287_defconfig
nios2                         10m50_defconfig
mips                        omega2p_defconfig
mips                      bmips_stb_defconfig
mips                    maltaup_xpa_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      bamboo_defconfig
sparc                       sparc64_defconfig
c6x                        evmc6472_defconfig
arm                      integrator_defconfig
sh                   rts7751r2dplus_defconfig
sh                           se7780_defconfig
powerpc                          allyesconfig
powerpc               mpc834x_itxgp_defconfig
arc                         haps_hs_defconfig
powerpc                     ep8248e_defconfig
mips                         mpc30x_defconfig
arm                           spitz_defconfig
mips                       rbtx49xx_defconfig
xtensa                          iss_defconfig
arm                          badge4_defconfig
arm                          lpd270_defconfig
sh                ecovec24-romimage_defconfig
xtensa                    smp_lx200_defconfig
mips                          malta_defconfig
mips                         tb0226_defconfig
powerpc                     powernv_defconfig
m68k                       m5475evb_defconfig
arm                          ixp4xx_defconfig
arm                          collie_defconfig
openrisc                    or1ksim_defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210129
i386                 randconfig-a002-20210129
i386                 randconfig-a004-20210129
i386                 randconfig-a005-20210129
i386                 randconfig-a003-20210129
i386                 randconfig-a006-20210129
i386                 randconfig-a013-20210129
i386                 randconfig-a011-20210129
i386                 randconfig-a012-20210129
i386                 randconfig-a016-20210129
i386                 randconfig-a014-20210129
i386                 randconfig-a015-20210129
x86_64               randconfig-a002-20210129
x86_64               randconfig-a003-20210129
x86_64               randconfig-a001-20210129
x86_64               randconfig-a005-20210129
x86_64               randconfig-a006-20210129
x86_64               randconfig-a004-20210129
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210129
x86_64               randconfig-a015-20210129
x86_64               randconfig-a016-20210129
x86_64               randconfig-a011-20210129
x86_64               randconfig-a013-20210129
x86_64               randconfig-a014-20210129

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
