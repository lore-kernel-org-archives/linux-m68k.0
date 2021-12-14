Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618A0C4332F
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Dec 2021 03:25:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhLNDZH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Dec 2021 22:25:07 -0500
Received: from mga06.intel.com ([134.134.136.31]:55688 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233040AbhLNDZG (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Dec 2021 22:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639452306; x=1670988306;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0khvALZhZC+geM/2jgMzbiPmgdirJ31lxGcT4CQMENM=;
  b=oGgoxZev+xceVahjswxCJ/pcNvRh5BTzXswFje5i0bnRBlHyzFcVAKSa
   CKJ4l1ZgmOtKvPzjFl1m11iBrJ2V1QjXWL17LiWAh2NbWDZiPtbjdFGW/
   xTlG+xZZ9Qx8XMOMG5BQucG9jvbW4d9zQ65gSMT/lCb0bWyu2+wzPI3Af
   amd9F6RAijJZ2ee8m5bH1pFfEYmEe9ZheR51oRJWKooimTNDzBMa252RE
   r5uSX0s32hlzNarKv2yzKELS+BXZ1jGTS/ZL0o2oB37LR1HQOAjlK36eb
   +tYSjJa+yT37BBf5petx5klsiCtfEv3uih3I0o1pw6/i+ZLe8CER8ullc
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="299667224"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="299667224"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 19:25:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="754684317"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Dec 2021 19:25:03 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mwyR4-0007Mt-NG; Tue, 14 Dec 2021 03:25:02 +0000
Date:   Tue, 14 Dec 2021 11:24:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 c97317e6439dd40d0ae1ea0ab38bffacaf79c103
Message-ID: <61b80e79.hD1/pyFQACSrfa+B%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: c97317e6439dd40d0ae1ea0ab38bffacaf79c103  Merge tag 'v5.16-rc5'

elapsed time: 729m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211213
arc                        vdk_hs38_defconfig
powerpc                     pq2fads_defconfig
arm                           h5000_defconfig
powerpc                 mpc837x_mds_defconfig
i386                             alldefconfig
sh                         ap325rxa_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                      ppc6xx_defconfig
arc                          axs101_defconfig
powerpc                      obs600_defconfig
m68k                          atari_defconfig
mips                     loongson1c_defconfig
openrisc                 simple_smp_defconfig
arm                            qcom_defconfig
sh                           se7724_defconfig
mips                      bmips_stb_defconfig
arm                  randconfig-c002-20211213
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20211213
x86_64               randconfig-a012-20211213
x86_64               randconfig-a014-20211213
x86_64               randconfig-a013-20211213
x86_64               randconfig-a016-20211213
x86_64               randconfig-a015-20211213
i386                 randconfig-a013-20211213
i386                 randconfig-a011-20211213
i386                 randconfig-a016-20211213
i386                 randconfig-a014-20211213
i386                 randconfig-a015-20211213
i386                 randconfig-a012-20211213
riscv                randconfig-r042-20211213
arc                  randconfig-r043-20211213
s390                 randconfig-r044-20211213
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-c007-20211213
arm                  randconfig-c002-20211213
mips                 randconfig-c004-20211213
s390                 randconfig-c005-20211213
powerpc              randconfig-c003-20211213
x86_64               randconfig-a002-20211213
x86_64               randconfig-a004-20211213
x86_64               randconfig-a001-20211213
x86_64               randconfig-a003-20211213
x86_64               randconfig-a006-20211213
x86_64               randconfig-a005-20211213
i386                 randconfig-a001-20211213
i386                 randconfig-a002-20211213
i386                 randconfig-a003-20211213
i386                 randconfig-a004-20211213
i386                 randconfig-a005-20211213
i386                 randconfig-a006-20211213
hexagon              randconfig-r041-20211213
hexagon              randconfig-r045-20211213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
