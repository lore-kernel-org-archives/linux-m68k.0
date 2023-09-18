Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B698CD13DE
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Sep 2023 22:52:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbjIRWwT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 18 Sep 2023 18:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjIRWwS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 18 Sep 2023 18:52:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9691F91
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Sep 2023 15:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695077532; x=1726613532;
  h=date:from:to:cc:subject:message-id;
  bh=Nh73IanIne1GU+r8JtFqPQlQLwOuKW71IH9pb/4d8vg=;
  b=J6+8Va+dRnewkRwT0SHFbU4e9rYkrXqXnWHp990Z8+s1cx03/4KD9c3D
   SG8mwzHTvzm480neKbrORAHhnQh3YFbR4x22Bru/bp0RI2XTnXRY6Ueqw
   BPt2aI0XY9oyKzsN69zhbH0CzLqaKMpFvt5wGei0yR5+qdtpRBeYj1tYG
   G+aMCfiCNz/JiJ4XUqx44xCiLwIaB7bYBjLZXfi+dEQ+esGmK4lAv06rI
   /RnIWhM15X0KsjCcmcG+xBtu9v+6Z1fPcFs2YIf2TGdUvklEWx2+xN9yf
   kWebrj4thTR9f5GtEb69lw26zRAaQzOaHluJkrgRo509znZ8ZrcB0enNx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443885460"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="443885460"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 15:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="889270514"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="889270514"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2023 15:51:17 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qiN5z-0006bK-1e;
        Mon, 18 Sep 2023 22:51:59 +0000
Date:   Tue, 19 Sep 2023 06:51:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 647e24211c8b205cf2bca94be8291856732e8e74
Message-ID: <202309190649.KQDWBJwK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 647e24211c8b205cf2bca94be8291856732e8e74  Merge tag 'v6.6-rc2'

elapsed time: 722m

configs tested: 155
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20230918   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                   randconfig-001-20230918   gcc  
arm                           sama7_defconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230918   gcc  
i386         buildonly-randconfig-002-20230918   gcc  
i386         buildonly-randconfig-003-20230918   gcc  
i386         buildonly-randconfig-004-20230918   gcc  
i386         buildonly-randconfig-005-20230918   gcc  
i386         buildonly-randconfig-006-20230918   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230918   gcc  
i386                  randconfig-002-20230918   gcc  
i386                  randconfig-003-20230918   gcc  
i386                  randconfig-004-20230918   gcc  
i386                  randconfig-005-20230918   gcc  
i386                  randconfig-006-20230918   gcc  
i386                  randconfig-011-20230918   gcc  
i386                  randconfig-012-20230918   gcc  
i386                  randconfig-013-20230918   gcc  
i386                  randconfig-014-20230918   gcc  
i386                  randconfig-015-20230918   gcc  
i386                  randconfig-016-20230918   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230918   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         alldefconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                    socrates_defconfig   clang
powerpc                     tqm8541_defconfig   gcc  
powerpc                     tqm8560_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230918   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230918   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230918   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230918   gcc  
x86_64       buildonly-randconfig-002-20230918   gcc  
x86_64       buildonly-randconfig-003-20230918   gcc  
x86_64       buildonly-randconfig-004-20230918   gcc  
x86_64       buildonly-randconfig-005-20230918   gcc  
x86_64       buildonly-randconfig-006-20230918   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230918   gcc  
x86_64                randconfig-002-20230918   gcc  
x86_64                randconfig-003-20230918   gcc  
x86_64                randconfig-004-20230918   gcc  
x86_64                randconfig-005-20230918   gcc  
x86_64                randconfig-006-20230918   gcc  
x86_64                randconfig-011-20230918   gcc  
x86_64                randconfig-012-20230918   gcc  
x86_64                randconfig-013-20230918   gcc  
x86_64                randconfig-014-20230918   gcc  
x86_64                randconfig-015-20230918   gcc  
x86_64                randconfig-016-20230918   gcc  
x86_64                randconfig-071-20230918   gcc  
x86_64                randconfig-072-20230918   gcc  
x86_64                randconfig-073-20230918   gcc  
x86_64                randconfig-074-20230918   gcc  
x86_64                randconfig-075-20230918   gcc  
x86_64                randconfig-076-20230918   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
