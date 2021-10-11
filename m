Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16804C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Oct 2021 21:28:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E477760C49
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Oct 2021 21:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235268AbhJKVav (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Oct 2021 17:30:51 -0400
Received: from mga06.intel.com ([134.134.136.31]:40933 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235223AbhJKVav (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Oct 2021 17:30:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="287850560"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; 
   d="scan'208";a="287850560"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2021 14:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; 
   d="scan'208";a="526171952"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 11 Oct 2021 14:28:48 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ma2ql-0002kk-UL; Mon, 11 Oct 2021 21:28:47 +0000
Date:   Tue, 12 Oct 2021 05:27:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 6ef3012a72516d31109f7fcec7e8d458f4b514fd
Message-ID: <6164ac5b.DklEQ3Fm97kXkUGE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 6ef3012a72516d31109f7fcec7e8d458f4b514fd  Merge tag 'v5.15-rc5'

elapsed time: 721m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211011
sh                           se7705_defconfig
m68k                             alldefconfig
sh                              ul2_defconfig
sh                            hp6xx_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                   sb1250_swarm_defconfig
powerpc                    ge_imp3a_defconfig
arm                            qcom_defconfig
powerpc                     powernv_defconfig
sh                               alldefconfig
nios2                         10m50_defconfig
arm                        realview_defconfig
arm                        multi_v5_defconfig
riscv                               defconfig
sh                     magicpanelr2_defconfig
arm                         at91_dt_defconfig
arm                             mxs_defconfig
mips                    maltaup_xpa_defconfig
mips                        maltaup_defconfig
parisc                generic-32bit_defconfig
microblaze                          defconfig
sh                        sh7785lcr_defconfig
mips                           ip22_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 linkstation_defconfig
arc                         haps_hs_defconfig
m68k                       m5249evb_defconfig
mips                        vocore2_defconfig
powerpc                       ebony_defconfig
arm                        keystone_defconfig
arm                          iop32x_defconfig
mips                            e55_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                          rsk7203_defconfig
mips                      fuloong2e_defconfig
powerpc                      ppc64e_defconfig
xtensa                           alldefconfig
arm                     davinci_all_defconfig
sh                          sdk7780_defconfig
powerpc                   microwatt_defconfig
powerpc                     mpc512x_defconfig
sh                        sh7757lcr_defconfig
mips                          malta_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     skiroot_defconfig
arm                        trizeps4_defconfig
mips                        nlm_xlp_defconfig
arm                  randconfig-c002-20211011
x86_64               randconfig-c001-20211011
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211011
x86_64               randconfig-a012-20211011
x86_64               randconfig-a016-20211011
x86_64               randconfig-a014-20211011
x86_64               randconfig-a013-20211011
x86_64               randconfig-a011-20211011
i386                 randconfig-a016-20211011
i386                 randconfig-a014-20211011
i386                 randconfig-a011-20211011
i386                 randconfig-a015-20211011
i386                 randconfig-a012-20211011
i386                 randconfig-a013-20211011
arc                  randconfig-r043-20211011
s390                 randconfig-r044-20211011
riscv                randconfig-r042-20211011
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
arm                  randconfig-c002-20211011
mips                 randconfig-c004-20211011
i386                 randconfig-c001-20211011
s390                 randconfig-c005-20211011
x86_64               randconfig-c007-20211011
powerpc              randconfig-c003-20211011
riscv                randconfig-c006-20211011
x86_64               randconfig-a004-20211011
x86_64               randconfig-a006-20211011
x86_64               randconfig-a001-20211011
x86_64               randconfig-a005-20211011
x86_64               randconfig-a002-20211011
x86_64               randconfig-a003-20211011
i386                 randconfig-a001-20211011
i386                 randconfig-a003-20211011
i386                 randconfig-a004-20211011
i386                 randconfig-a005-20211011
i386                 randconfig-a002-20211011
i386                 randconfig-a006-20211011
hexagon              randconfig-r041-20211011
hexagon              randconfig-r045-20211011

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
