Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0818FC433F5
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Dec 2021 21:18:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238869AbhLFVVx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Dec 2021 16:21:53 -0500
Received: from mga01.intel.com ([192.55.52.88]:22548 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240931AbhLFVVw (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Dec 2021 16:21:52 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="261472090"
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; 
   d="scan'208";a="261472090"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 13:18:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; 
   d="scan'208";a="679144518"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Dec 2021 13:18:20 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1muLNL-000Lle-Mh; Mon, 06 Dec 2021 21:18:19 +0000
Date:   Tue, 07 Dec 2021 05:17:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 f00c047f99d9c29630f421820c85dd7c7dd8f012
Message-ID: <61ae7def.eYRZOhV6t/w7D4sH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: f00c047f99d9c29630f421820c85dd7c7dd8f012  Merge tag 'v5.16-rc4'

elapsed time: 725m

configs tested: 121
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
sh                          r7780mp_defconfig
powerpc                     tqm5200_defconfig
powerpc                     asp8347_defconfig
arm                            xcep_defconfig
m68k                          amiga_defconfig
ia64                            zx1_defconfig
m68k                             allyesconfig
powerpc                     powernv_defconfig
powerpc                        fsp2_defconfig
arm                       cns3420vb_defconfig
sparc64                             defconfig
m68k                            mac_defconfig
arm                        multi_v5_defconfig
arm                          ixp4xx_defconfig
powerpc                         ps3_defconfig
sh                        edosk7760_defconfig
arm                        keystone_defconfig
ia64                      gensparse_defconfig
arm                            mps2_defconfig
arm                       imx_v4_v5_defconfig
arm                           sama7_defconfig
arm                            zeus_defconfig
arm                         vf610m4_defconfig
arm                      integrator_defconfig
arm                        multi_v7_defconfig
sh                               alldefconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      mgcoge_defconfig
arm                         s3c6400_defconfig
sh                           se7721_defconfig
sh                          polaris_defconfig
sh                           se7705_defconfig
um                           x86_64_defconfig
arm                  randconfig-c002-20211206
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
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
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a016-20211206
x86_64               randconfig-a011-20211206
x86_64               randconfig-a013-20211206
x86_64               randconfig-a014-20211206
x86_64               randconfig-a012-20211206
x86_64               randconfig-a015-20211206
i386                 randconfig-a016-20211206
i386                 randconfig-a013-20211206
i386                 randconfig-a011-20211206
i386                 randconfig-a014-20211206
i386                 randconfig-a012-20211206
i386                 randconfig-a015-20211206
arc                  randconfig-r043-20211206
s390                 randconfig-r044-20211206
riscv                randconfig-r042-20211206
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-c007-20211206
arm                  randconfig-c002-20211206
mips                 randconfig-c004-20211206
i386                 randconfig-c001-20211206
powerpc              randconfig-c003-20211206
s390                 randconfig-c005-20211206
riscv                randconfig-c006-20211206
x86_64               randconfig-a006-20211206
x86_64               randconfig-a005-20211206
x86_64               randconfig-a001-20211206
x86_64               randconfig-a002-20211206
x86_64               randconfig-a004-20211206
x86_64               randconfig-a003-20211206
i386                 randconfig-a001-20211206
i386                 randconfig-a005-20211206
i386                 randconfig-a002-20211206
i386                 randconfig-a003-20211206
i386                 randconfig-a006-20211206
i386                 randconfig-a004-20211206
hexagon              randconfig-r045-20211206
hexagon              randconfig-r041-20211206

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
