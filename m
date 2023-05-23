Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350DAC7EE29
	for <linux-m68k@archiver.kernel.org>; Tue, 23 May 2023 01:12:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjEWBMn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 22 May 2023 21:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234015AbjEWBMi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 22 May 2023 21:12:38 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7108493
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 18:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684804357; x=1716340357;
  h=date:from:to:cc:subject:message-id;
  bh=LUzC9utb/9kt5oA0DiqChztVeVst0KMfXCzMD9tDc6E=;
  b=OYAOpEpi513MNIGlJDHzjGFw5fqH91qglvVhaLPgez9knpZ4o26GzCOG
   XKss0rhdk/n7AALa7iltBSEkEEWyRnLKh4wKMxLby2XUvVGKs0zkukz3X
   tselt+9u8XE62R0skcrfQ4+vrZ7EYCUkSaW9m7AYGD9jr+XznMv+KwiUl
   dbMwRxd8uqVYvl9z8EdzLTB8jO+0rJJ+3k3sHY2Ls5ulcvW/R0LXbZzrx
   HGEzP5AIv81pzooxAyoSD9Jgr7nncxOavWc4xGO0xmevRnun8f4u7mr2s
   c7Y8asgrWOIJYQFGF0nqMIQ1fiH4msYCob1KuCqqS6HO4ZlBURoy/NJKW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="353115183"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="353115183"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 18:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="773588061"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="773588061"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 May 2023 18:12:34 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q1GZm-000DOA-0s;
        Tue, 23 May 2023 01:12:34 +0000
Date:   Tue, 23 May 2023 09:12:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.5] BUILD SUCCESS
 72b44f6577f15f37fe964c8dcc42a7c5736e604c
Message-ID: <20230523011206.WFH81%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: INFO setup_repo_specs: /db/releases/20230522162832/lkp-src/repo/*/geert-m68k
https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.5
branch HEAD: 72b44f6577f15f37fe964c8dcc42a7c5736e604c  nubus: Don't list slot resources by default

elapsed time: 722m

configs tested: 244
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230521   gcc  
alpha        buildonly-randconfig-r003-20230522   gcc  
alpha        buildonly-randconfig-r006-20230521   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230522   gcc  
alpha                randconfig-r011-20230522   gcc  
alpha                randconfig-r013-20230521   gcc  
alpha                randconfig-r025-20230521   gcc  
alpha                randconfig-r033-20230522   gcc  
alpha                randconfig-r034-20230521   gcc  
alpha                randconfig-r036-20230522   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230521   gcc  
arc          buildonly-randconfig-r001-20230522   gcc  
arc          buildonly-randconfig-r003-20230522   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230521   gcc  
arc                  randconfig-r005-20230521   gcc  
arc                  randconfig-r013-20230521   gcc  
arc                  randconfig-r016-20230522   gcc  
arc                  randconfig-r025-20230522   gcc  
arc                  randconfig-r034-20230522   gcc  
arc                  randconfig-r035-20230521   gcc  
arc                  randconfig-r036-20230521   gcc  
arc                  randconfig-r043-20230521   gcc  
arc                  randconfig-r043-20230522   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                  randconfig-r003-20230521   gcc  
arm                  randconfig-r024-20230522   gcc  
arm                  randconfig-r046-20230521   clang
arm                  randconfig-r046-20230522   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230522   clang
arm64                randconfig-r016-20230522   clang
arm64                randconfig-r023-20230521   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230521   gcc  
csky                 randconfig-r002-20230521   gcc  
csky                 randconfig-r004-20230521   gcc  
csky                 randconfig-r011-20230522   gcc  
csky                 randconfig-r012-20230521   gcc  
csky                 randconfig-r015-20230521   gcc  
csky                 randconfig-r021-20230521   gcc  
csky                 randconfig-r023-20230522   gcc  
csky                 randconfig-r026-20230522   gcc  
csky                 randconfig-r035-20230521   gcc  
hexagon      buildonly-randconfig-r001-20230521   clang
hexagon      buildonly-randconfig-r001-20230522   clang
hexagon      buildonly-randconfig-r006-20230522   clang
hexagon              randconfig-r021-20230522   clang
hexagon              randconfig-r023-20230521   clang
hexagon              randconfig-r031-20230521   clang
hexagon              randconfig-r032-20230521   clang
hexagon              randconfig-r041-20230521   clang
hexagon              randconfig-r041-20230522   clang
hexagon              randconfig-r045-20230521   clang
hexagon              randconfig-r045-20230522   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230522   gcc  
i386                 randconfig-a002-20230522   gcc  
i386                 randconfig-a003-20230522   gcc  
i386                 randconfig-a004-20230522   gcc  
i386                 randconfig-a005-20230522   gcc  
i386                 randconfig-a006-20230522   gcc  
i386                 randconfig-a011-20230522   clang
i386                 randconfig-a012-20230522   clang
i386                 randconfig-a013-20230522   clang
i386                 randconfig-a014-20230522   clang
i386                 randconfig-a015-20230522   clang
i386                 randconfig-a016-20230522   clang
i386                 randconfig-r034-20230522   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r002-20230521   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230521   gcc  
ia64                 randconfig-r005-20230522   gcc  
ia64                 randconfig-r015-20230522   gcc  
ia64                 randconfig-r016-20230521   gcc  
ia64                 randconfig-r021-20230521   gcc  
ia64                 randconfig-r022-20230521   gcc  
ia64                 randconfig-r025-20230522   gcc  
ia64                          tiger_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230521   gcc  
loongarch            randconfig-r012-20230522   gcc  
loongarch            randconfig-r022-20230522   gcc  
loongarch            randconfig-r026-20230522   gcc  
loongarch            randconfig-r033-20230522   gcc  
loongarch            randconfig-r034-20230521   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r005-20230522   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230522   gcc  
m68k                 randconfig-r002-20230522   gcc  
m68k                 randconfig-r013-20230522   gcc  
m68k                 randconfig-r014-20230522   gcc  
m68k                 randconfig-r021-20230522   gcc  
m68k                 randconfig-r024-20230522   gcc  
microblaze   buildonly-randconfig-r006-20230522   gcc  
microblaze           randconfig-r022-20230522   gcc  
microblaze           randconfig-r025-20230521   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips         buildonly-randconfig-r002-20230522   clang
mips         buildonly-randconfig-r005-20230521   gcc  
mips                 randconfig-r032-20230521   gcc  
mips                 randconfig-r036-20230521   gcc  
mips                 randconfig-r036-20230522   clang
nios2        buildonly-randconfig-r004-20230521   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r033-20230521   gcc  
nios2                randconfig-r036-20230521   gcc  
openrisc     buildonly-randconfig-r004-20230521   gcc  
openrisc             randconfig-r015-20230522   gcc  
openrisc             randconfig-r031-20230522   gcc  
openrisc             randconfig-r032-20230521   gcc  
openrisc             randconfig-r034-20230521   gcc  
parisc       buildonly-randconfig-r002-20230521   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230522   gcc  
parisc               randconfig-r035-20230522   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230521   gcc  
powerpc      buildonly-randconfig-r005-20230521   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc                      ppc40x_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc              randconfig-r004-20230522   gcc  
powerpc              randconfig-r005-20230521   clang
powerpc              randconfig-r023-20230522   clang
powerpc              randconfig-r032-20230522   gcc  
powerpc                         wii_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230522   gcc  
riscv                randconfig-r042-20230521   gcc  
riscv                randconfig-r042-20230522   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230521   gcc  
s390         buildonly-randconfig-r004-20230522   clang
s390                                defconfig   gcc  
s390                 randconfig-r011-20230521   gcc  
s390                 randconfig-r013-20230521   gcc  
s390                 randconfig-r032-20230522   gcc  
s390                 randconfig-r033-20230521   clang
s390                 randconfig-r044-20230521   gcc  
s390                 randconfig-r044-20230522   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r006-20230521   gcc  
sh                          polaris_defconfig   gcc  
sh                   randconfig-r003-20230522   gcc  
sh                   randconfig-r006-20230521   gcc  
sh                   randconfig-r015-20230521   gcc  
sh                   randconfig-r034-20230522   gcc  
sh                   randconfig-r035-20230522   gcc  
sh                          sdk7786_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230521   gcc  
sparc                randconfig-r015-20230522   gcc  
sparc                randconfig-r033-20230521   gcc  
sparc                randconfig-r035-20230522   gcc  
sparc64      buildonly-randconfig-r003-20230521   gcc  
sparc64      buildonly-randconfig-r003-20230522   gcc  
sparc64      buildonly-randconfig-r005-20230521   gcc  
sparc64              randconfig-r004-20230521   gcc  
sparc64              randconfig-r006-20230521   gcc  
sparc64              randconfig-r011-20230521   gcc  
sparc64              randconfig-r016-20230521   gcc  
sparc64              randconfig-r026-20230522   gcc  
sparc64              randconfig-r035-20230521   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r002-20230522   gcc  
x86_64       buildonly-randconfig-r005-20230522   gcc  
x86_64       buildonly-randconfig-r006-20230522   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230522   gcc  
x86_64               randconfig-a002-20230522   gcc  
x86_64               randconfig-a003-20230522   gcc  
x86_64               randconfig-a004-20230522   gcc  
x86_64               randconfig-a005-20230522   gcc  
x86_64               randconfig-a006-20230522   gcc  
x86_64               randconfig-a011-20230522   clang
x86_64               randconfig-a012-20230522   clang
x86_64               randconfig-a013-20230522   clang
x86_64               randconfig-a014-20230522   clang
x86_64               randconfig-a015-20230522   clang
x86_64               randconfig-a016-20230522   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-r003-20230522   gcc  
x86_64               randconfig-r013-20230522   clang
x86_64               randconfig-r022-20230522   clang
x86_64               randconfig-r025-20230522   clang
x86_64               randconfig-r036-20230522   gcc  
x86_64               randconfig-x051-20230522   clang
x86_64               randconfig-x052-20230522   clang
x86_64               randconfig-x053-20230522   clang
x86_64               randconfig-x054-20230522   clang
x86_64               randconfig-x055-20230522   clang
x86_64               randconfig-x056-20230522   clang
x86_64               randconfig-x061-20230522   clang
x86_64               randconfig-x062-20230522   clang
x86_64               randconfig-x063-20230522   clang
x86_64               randconfig-x064-20230522   clang
x86_64               randconfig-x065-20230522   clang
x86_64               randconfig-x066-20230522   clang
x86_64               randconfig-x071-20230522   gcc  
x86_64               randconfig-x072-20230522   gcc  
x86_64               randconfig-x073-20230522   gcc  
x86_64               randconfig-x074-20230522   gcc  
x86_64               randconfig-x075-20230522   gcc  
x86_64               randconfig-x076-20230522   gcc  
x86_64               randconfig-x081-20230522   gcc  
x86_64               randconfig-x082-20230522   gcc  
x86_64               randconfig-x083-20230522   gcc  
x86_64               randconfig-x084-20230522   gcc  
x86_64               randconfig-x085-20230522   gcc  
x86_64               randconfig-x086-20230522   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230522   gcc  
xtensa               randconfig-r031-20230522   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
