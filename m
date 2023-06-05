Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCE0C7EE24
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jun 2023 23:00:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbjFEXA4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Jun 2023 19:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbjFEXA4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 5 Jun 2023 19:00:56 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E54BE
        for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Jun 2023 16:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686006052; x=1717542052;
  h=date:from:to:cc:subject:message-id;
  bh=TVhCG8+3Jmzff+xSpb10cBbH8VzTRd5bkGuwI05K+ow=;
  b=MbairD2jcbGC8x5mLPiP2TkyTzrw9sSCEegV7rddm1Bh/LRZn5NSxXD0
   8dSeLLTBQ+ceaRXKNLmJE1Tq7Cm1tTYskSqSSF7S1gpTLIyytxcatbb2f
   4KQylJd07kzLhHXsJXJmKZawiDeJUUo3WNQdV8chZIKiQ8JevmbccqHM8
   ePff1ZomEVMAO4yCdIwtyYPRBSIacuw2rwrkSe8nkPiXFoL0kPofLusro
   BinQ5h6izc2TE59vq+YG57Yo2x+Mp4DJSlsfvInOZ7kfxGdM9HGWNI5EN
   2MeO+WNmMGUxuUoPbyOnN7V1Ri/E8xtnxuIXnFxzPIyKMx6BGfufoZaHI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="358956201"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="358956201"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:00:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="853157660"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="853157660"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Jun 2023 16:00:30 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q6JBd-0004W3-0h;
        Mon, 05 Jun 2023 23:00:29 +0000
Date:   Tue, 06 Jun 2023 06:59:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 c2f09b03b611372c80931855a368cf86e1665613
Message-ID: <20230605225950.TVtwV%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: c2f09b03b611372c80931855a368cf86e1665613  Merge tag 'v6.4-rc5'

elapsed time: 725m

configs tested: 245
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230605   gcc  
alpha                randconfig-r013-20230605   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r002-20230605   gcc  
arc          buildonly-randconfig-r005-20230605   gcc  
arc          buildonly-randconfig-r006-20230605   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                  randconfig-r016-20230605   gcc  
arc                  randconfig-r025-20230605   gcc  
arc                  randconfig-r026-20230605   gcc  
arc                  randconfig-r043-20230605   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                  randconfig-r031-20230605   gcc  
arm                  randconfig-r032-20230605   gcc  
arm                  randconfig-r036-20230605   gcc  
arm                  randconfig-r046-20230605   clang
arm                          sp7021_defconfig   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r001-20230605   clang
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230605   clang
arm64                randconfig-r006-20230605   clang
arm64                randconfig-r012-20230605   gcc  
arm64                randconfig-r013-20230605   gcc  
arm64                randconfig-r016-20230605   gcc  
arm64                randconfig-r024-20230605   gcc  
arm64                randconfig-r034-20230605   clang
csky         buildonly-randconfig-r001-20230605   gcc  
csky         buildonly-randconfig-r005-20230605   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230605   gcc  
csky                 randconfig-r004-20230605   gcc  
csky                 randconfig-r012-20230605   gcc  
csky                 randconfig-r014-20230605   gcc  
csky                 randconfig-r015-20230605   gcc  
csky                 randconfig-r023-20230605   gcc  
csky                 randconfig-r031-20230605   gcc  
csky                 randconfig-r032-20230605   gcc  
csky                 randconfig-r034-20230605   gcc  
hexagon              randconfig-r003-20230605   clang
hexagon              randconfig-r004-20230605   clang
hexagon              randconfig-r025-20230605   clang
hexagon              randconfig-r036-20230605   clang
hexagon              randconfig-r041-20230605   clang
hexagon              randconfig-r045-20230605   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230605   clang
i386                 randconfig-i002-20230605   clang
i386                 randconfig-i003-20230605   clang
i386                 randconfig-i004-20230605   clang
i386                 randconfig-i005-20230605   clang
i386                 randconfig-i006-20230605   clang
i386                 randconfig-i011-20230605   gcc  
i386                 randconfig-i012-20230605   gcc  
i386                 randconfig-i013-20230605   gcc  
i386                 randconfig-i014-20230605   gcc  
i386                 randconfig-i015-20230605   gcc  
i386                 randconfig-i016-20230605   gcc  
i386                 randconfig-i051-20230605   clang
i386                 randconfig-i052-20230605   clang
i386                 randconfig-i053-20230605   clang
i386                 randconfig-i054-20230605   clang
i386                 randconfig-i055-20230605   clang
i386                 randconfig-i056-20230605   clang
i386                 randconfig-i061-20230605   clang
i386                 randconfig-i062-20230605   clang
i386                 randconfig-i063-20230605   clang
i386                 randconfig-i064-20230605   clang
i386                 randconfig-i065-20230605   clang
i386                 randconfig-i066-20230605   clang
i386                 randconfig-r006-20230605   clang
i386                 randconfig-r011-20230605   gcc  
i386                 randconfig-r021-20230605   gcc  
i386                 randconfig-r022-20230605   gcc  
i386                 randconfig-r025-20230605   gcc  
i386                 randconfig-r026-20230605   gcc  
i386                 randconfig-r035-20230605   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230605   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230606   gcc  
loongarch            randconfig-r011-20230605   gcc  
loongarch            randconfig-r012-20230605   gcc  
loongarch            randconfig-r016-20230605   gcc  
loongarch            randconfig-r025-20230605   gcc  
loongarch            randconfig-r033-20230605   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230605   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230606   gcc  
m68k                 randconfig-r021-20230605   gcc  
m68k                 randconfig-r023-20230605   gcc  
m68k                 randconfig-r026-20230605   gcc  
microblaze           randconfig-r001-20230605   gcc  
microblaze           randconfig-r003-20230606   gcc  
microblaze           randconfig-r004-20230605   gcc  
microblaze           randconfig-r006-20230605   gcc  
microblaze           randconfig-r026-20230605   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips         buildonly-randconfig-r002-20230605   gcc  
mips         buildonly-randconfig-r003-20230605   gcc  
mips         buildonly-randconfig-r005-20230605   gcc  
mips                           ip28_defconfig   clang
mips                 randconfig-r003-20230605   gcc  
nios2                         10m50_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230605   gcc  
nios2                randconfig-r011-20230605   gcc  
nios2                randconfig-r014-20230605   gcc  
nios2                randconfig-r016-20230605   gcc  
nios2                randconfig-r031-20230605   gcc  
nios2                randconfig-r032-20230605   gcc  
nios2                randconfig-r035-20230605   gcc  
openrisc     buildonly-randconfig-r001-20230605   gcc  
openrisc     buildonly-randconfig-r003-20230605   gcc  
openrisc     buildonly-randconfig-r004-20230605   gcc  
openrisc             randconfig-r006-20230605   gcc  
openrisc             randconfig-r021-20230605   gcc  
openrisc             randconfig-r023-20230605   gcc  
parisc       buildonly-randconfig-r003-20230605   gcc  
parisc       buildonly-randconfig-r004-20230605   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230605   gcc  
parisc               randconfig-r012-20230605   gcc  
parisc               randconfig-r015-20230605   gcc  
parisc               randconfig-r025-20230605   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230605   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                   microwatt_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                      ppc44x_defconfig   clang
powerpc              randconfig-r005-20230606   gcc  
powerpc              randconfig-r012-20230605   gcc  
powerpc              randconfig-r013-20230605   gcc  
powerpc              randconfig-r014-20230605   gcc  
powerpc              randconfig-r015-20230605   gcc  
powerpc              randconfig-r021-20230605   gcc  
powerpc              randconfig-r035-20230605   clang
powerpc              randconfig-r036-20230605   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230605   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230605   clang
riscv                randconfig-r006-20230605   clang
riscv                randconfig-r015-20230605   gcc  
riscv                randconfig-r022-20230605   gcc  
riscv                randconfig-r042-20230605   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230606   gcc  
s390                 randconfig-r015-20230605   gcc  
s390                 randconfig-r016-20230605   gcc  
s390                 randconfig-r035-20230605   clang
s390                 randconfig-r044-20230605   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230605   gcc  
sh           buildonly-randconfig-r004-20230605   gcc  
sh                             espt_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                   randconfig-r013-20230605   gcc  
sh                   randconfig-r034-20230605   gcc  
sh                           se7619_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230605   gcc  
sparc                randconfig-r004-20230605   gcc  
sparc                randconfig-r012-20230605   gcc  
sparc                randconfig-r022-20230605   gcc  
sparc                randconfig-r024-20230605   gcc  
sparc                randconfig-r025-20230605   gcc  
sparc                randconfig-r026-20230605   gcc  
sparc                randconfig-r033-20230605   gcc  
sparc                randconfig-r034-20230605   gcc  
sparc                randconfig-r035-20230605   gcc  
sparc64      buildonly-randconfig-r002-20230605   gcc  
sparc64      buildonly-randconfig-r003-20230605   gcc  
sparc64      buildonly-randconfig-r006-20230605   gcc  
sparc64              randconfig-r011-20230605   gcc  
sparc64              randconfig-r023-20230605   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230605   clang
x86_64               randconfig-a002-20230605   clang
x86_64               randconfig-a003-20230605   clang
x86_64               randconfig-a004-20230605   clang
x86_64               randconfig-a005-20230605   clang
x86_64               randconfig-a006-20230605   clang
x86_64               randconfig-a011-20230605   gcc  
x86_64               randconfig-a012-20230605   gcc  
x86_64               randconfig-a013-20230605   gcc  
x86_64               randconfig-a014-20230605   gcc  
x86_64               randconfig-a015-20230605   gcc  
x86_64               randconfig-a016-20230605   gcc  
x86_64               randconfig-k001-20230605   gcc  
x86_64               randconfig-r005-20230605   clang
x86_64               randconfig-r013-20230605   gcc  
x86_64               randconfig-r016-20230605   gcc  
x86_64               randconfig-r024-20230605   gcc  
x86_64               randconfig-r031-20230605   clang
x86_64               randconfig-r032-20230605   clang
x86_64               randconfig-x051-20230605   gcc  
x86_64               randconfig-x052-20230605   gcc  
x86_64               randconfig-x053-20230605   gcc  
x86_64               randconfig-x054-20230605   gcc  
x86_64               randconfig-x055-20230605   gcc  
x86_64               randconfig-x056-20230605   gcc  
x86_64               randconfig-x061-20230605   gcc  
x86_64               randconfig-x062-20230605   gcc  
x86_64               randconfig-x063-20230605   gcc  
x86_64               randconfig-x064-20230605   gcc  
x86_64               randconfig-x065-20230605   gcc  
x86_64               randconfig-x066-20230605   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230605   gcc  
xtensa       buildonly-randconfig-r005-20230605   gcc  
xtensa       buildonly-randconfig-r006-20230605   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r002-20230605   gcc  
xtensa               randconfig-r011-20230605   gcc  
xtensa               randconfig-r013-20230605   gcc  
xtensa               randconfig-r015-20230605   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
