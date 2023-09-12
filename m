Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80646CA0EC3
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Sep 2023 03:32:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237530AbjILDcW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Sep 2023 23:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234167AbjILDcK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Sep 2023 23:32:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3536A18A42
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Sep 2023 20:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694488094; x=1726024094;
  h=date:from:to:cc:subject:message-id;
  bh=ut+N9snKM6NP2/6LMixX/QmfaFgJFmJorTB2EVVk3gA=;
  b=GlfOa81hDk6mUbJs69Y3BF7BcDPLwyR5Y3Nc/pUprrrb9PphUHpXByku
   iljM1GrI3LqOI+c8SOeMN/856B87qAFQw/LJSk0lkHHi4vCYQaUR0kE8q
   wQPW9IzyjQ5CihxtXHBvsVfkqUwz47/ar+0kzcNV4PSTg5bn7YkSp1qAI
   HPpDBUMK1v+pSl+pvInTZg72gMeNxABCHAf0GsvMYUxiD2l5BKCuG7454
   zOXnvd7z4phRNlgh/BTeuPrXf7wsqsqyMRs8CPlm+Ctln4O4QVPPD9fah
   NgdU+VOZIlpquQ/eg1pe9Cl1/L1zG28z3aJYOnEqV6K4b4KSHgkg9VI6s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="357698725"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="357698725"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 20:08:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="778628089"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="778628089"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Sep 2023 20:08:11 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qftl3-0007C2-20;
        Tue, 12 Sep 2023 03:08:09 +0000
Date:   Tue, 12 Sep 2023 11:07:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 524810b47c7c2ec8157caa58cc7a8fda7fe9bf18
Message-ID: <202309121155.HAE2ihh6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 524810b47c7c2ec8157caa58cc7a8fda7fe9bf18  Merge tag 'v6.6-rc1'

elapsed time: 727m

configs tested: 166
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230912   gcc  
alpha                randconfig-r011-20230912   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230912   gcc  
arc                  randconfig-r006-20230912   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                        mvebu_v5_defconfig   clang
arm                   randconfig-001-20230912   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r033-20230912   gcc  
csky                 randconfig-r034-20230912   gcc  
hexagon               randconfig-001-20230912   clang
hexagon               randconfig-002-20230912   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230912   clang
i386         buildonly-randconfig-002-20230912   clang
i386         buildonly-randconfig-003-20230912   clang
i386         buildonly-randconfig-004-20230912   clang
i386         buildonly-randconfig-005-20230912   clang
i386         buildonly-randconfig-006-20230912   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-011-20230912   gcc  
i386                  randconfig-012-20230912   gcc  
i386                  randconfig-013-20230912   gcc  
i386                  randconfig-014-20230912   gcc  
i386                  randconfig-015-20230912   gcc  
i386                  randconfig-016-20230912   gcc  
i386                 randconfig-r005-20230912   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230912   gcc  
loongarch            randconfig-r032-20230912   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                 randconfig-r013-20230912   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                           ip27_defconfig   clang
mips                 randconfig-r035-20230912   gcc  
mips                         rt305x_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r016-20230912   gcc  
parisc               randconfig-r025-20230912   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   clang
powerpc64            randconfig-r002-20230912   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230912   clang
riscv                randconfig-r024-20230912   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230912   gcc  
s390                 randconfig-r022-20230912   gcc  
s390                 randconfig-r031-20230912   clang
s390                 randconfig-r036-20230912   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r001-20230912   gcc  
sparc64              randconfig-r003-20230912   gcc  
sparc64              randconfig-r012-20230912   gcc  
sparc64              randconfig-r014-20230912   gcc  
sparc64              randconfig-r015-20230912   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r023-20230912   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230912   clang
x86_64       buildonly-randconfig-002-20230912   clang
x86_64       buildonly-randconfig-003-20230912   clang
x86_64       buildonly-randconfig-004-20230912   clang
x86_64       buildonly-randconfig-005-20230912   clang
x86_64       buildonly-randconfig-006-20230912   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230912   gcc  
x86_64                randconfig-002-20230912   gcc  
x86_64                randconfig-003-20230912   gcc  
x86_64                randconfig-004-20230912   gcc  
x86_64                randconfig-005-20230912   gcc  
x86_64                randconfig-006-20230912   gcc  
x86_64                randconfig-011-20230912   clang
x86_64                randconfig-012-20230912   clang
x86_64                randconfig-013-20230912   clang
x86_64                randconfig-014-20230912   clang
x86_64                randconfig-015-20230912   clang
x86_64                randconfig-016-20230912   clang
x86_64                randconfig-071-20230912   clang
x86_64                randconfig-072-20230912   clang
x86_64                randconfig-073-20230912   clang
x86_64                randconfig-074-20230912   clang
x86_64                randconfig-075-20230912   clang
x86_64                randconfig-076-20230912   clang
x86_64               randconfig-r021-20230912   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa               randconfig-r026-20230912   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
