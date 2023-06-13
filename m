Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98CCC7EE2E
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jun 2023 03:27:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233748AbjFMD14 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Jun 2023 23:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233270AbjFMD1y (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Jun 2023 23:27:54 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0937713E
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 20:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686626874; x=1718162874;
  h=date:from:to:cc:subject:message-id;
  bh=4YUco4+6K93boGCdWzwePnB0/MoM52zrigwBx6inWM4=;
  b=fHmLDUV5XXEFJi7B1qjk4SeH+RP6uQ9Q0FlC4hH8I36HJQJB4H4Zwd5Q
   lrbfCFQPX/KhZ/0QllcicC9hXCL1H58K5HKqNcS/YIMkN7tA/O79uNlhk
   eb1QU0w1QXSUiCnBx/kcDwAJqv5a23xkC9lwBMxgRkQniF/8KVu9KvXWT
   CQVZAks0QDl90biqBezeU/euUaqxkw+MJf8DKwRdGDW0sRXMYwhl/KZbz
   iXXPf3t1hzHztagfm5PNbh+1li1PD9rpsBAQrBKOZjm2FTYlFRxSDmRzQ
   QiPafrW2EuIuFgMzKu2matjmgN5Gcs9qH7p6PByIdW93srYWfrUlbc0bH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="424101179"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="424101179"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 20:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="958245980"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="958245980"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Jun 2023 20:27:27 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q8ugp-0000yD-0h;
        Tue, 13 Jun 2023 03:27:27 +0000
Date:   Tue, 13 Jun 2023 11:27:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.5] BUILD SUCCESS
 4055eabe04a26f5d113b5a02588b20b5e166a753
Message-ID: <202306131116.VtBASbwc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.5
branch HEAD: 4055eabe04a26f5d113b5a02588b20b5e166a753  m68k: defconfig: Update defconfigs for v6.4-rc1

elapsed time: 729m

configs tested: 155
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230612   gcc  
alpha                randconfig-r006-20230612   gcc  
alpha                randconfig-r015-20230612   gcc  
alpha                randconfig-r022-20230612   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230612   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r014-20230612   gcc  
arc                  randconfig-r015-20230612   gcc  
arc                  randconfig-r025-20230612   gcc  
arc                  randconfig-r043-20230612   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm          buildonly-randconfig-r004-20230612   clang
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230612   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230612   clang
arm64                randconfig-r036-20230612   clang
csky                                defconfig   gcc  
csky                 randconfig-r011-20230612   gcc  
csky                 randconfig-r034-20230612   gcc  
csky                 randconfig-r036-20230612   gcc  
hexagon              randconfig-r025-20230612   clang
hexagon              randconfig-r031-20230612   clang
hexagon              randconfig-r041-20230612   clang
hexagon              randconfig-r045-20230612   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r006-20230612   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230612   clang
i386                 randconfig-i002-20230612   clang
i386                 randconfig-i003-20230612   clang
i386                 randconfig-i004-20230612   clang
i386                 randconfig-i005-20230612   clang
i386                 randconfig-i006-20230612   clang
i386                 randconfig-i011-20230612   gcc  
i386                 randconfig-i012-20230612   gcc  
i386                 randconfig-i013-20230612   gcc  
i386                 randconfig-i014-20230612   gcc  
i386                 randconfig-i015-20230612   gcc  
i386                 randconfig-i016-20230612   gcc  
i386                 randconfig-r001-20230612   clang
i386                 randconfig-r012-20230612   gcc  
i386                 randconfig-r014-20230612   gcc  
i386                 randconfig-r016-20230612   gcc  
i386                 randconfig-r021-20230612   gcc  
i386                 randconfig-r034-20230612   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230612   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r024-20230612   gcc  
loongarch            randconfig-r031-20230612   gcc  
loongarch            randconfig-r033-20230612   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r006-20230612   gcc  
m68k                 randconfig-r023-20230612   gcc  
m68k                 randconfig-r032-20230612   gcc  
microblaze           randconfig-r002-20230612   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips         buildonly-randconfig-r002-20230612   gcc  
mips         buildonly-randconfig-r003-20230612   gcc  
mips                        maltaup_defconfig   clang
mips                 randconfig-r004-20230612   gcc  
mips                 randconfig-r021-20230612   clang
mips                           xway_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r022-20230612   gcc  
nios2                randconfig-r032-20230612   gcc  
openrisc     buildonly-randconfig-r001-20230612   gcc  
openrisc     buildonly-randconfig-r003-20230612   gcc  
openrisc     buildonly-randconfig-r004-20230612   gcc  
openrisc             randconfig-r013-20230612   gcc  
openrisc             randconfig-r024-20230612   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230612   gcc  
parisc               randconfig-r005-20230612   gcc  
parisc               randconfig-r033-20230612   gcc  
parisc               randconfig-r035-20230612   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r001-20230612   clang
powerpc              randconfig-r002-20230612   clang
powerpc              randconfig-r003-20230612   clang
riscv                            alldefconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230612   clang
riscv                randconfig-r011-20230612   gcc  
riscv                randconfig-r023-20230612   gcc  
riscv                randconfig-r032-20230612   clang
riscv                randconfig-r033-20230612   clang
riscv                randconfig-r042-20230612   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230612   clang
s390                 randconfig-r004-20230612   clang
s390                 randconfig-r015-20230612   gcc  
s390                 randconfig-r016-20230612   gcc  
s390                 randconfig-r025-20230612   gcc  
s390                 randconfig-r026-20230612   gcc  
s390                 randconfig-r044-20230612   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230612   gcc  
sh                   randconfig-r012-20230612   gcc  
sh                          sdk7780_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc        buildonly-randconfig-r005-20230612   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r026-20230612   gcc  
sparc64              randconfig-r013-20230612   gcc  
sparc64              randconfig-r021-20230612   gcc  
sparc64              randconfig-r035-20230612   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r002-20230612   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230612   clang
x86_64               randconfig-a002-20230612   clang
x86_64               randconfig-a003-20230612   clang
x86_64               randconfig-a004-20230612   clang
x86_64               randconfig-a005-20230612   clang
x86_64               randconfig-a006-20230612   clang
x86_64               randconfig-a011-20230612   gcc  
x86_64               randconfig-a012-20230612   gcc  
x86_64               randconfig-a013-20230612   gcc  
x86_64               randconfig-a014-20230612   gcc  
x86_64               randconfig-a015-20230612   gcc  
x86_64               randconfig-a016-20230612   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230612   gcc  
xtensa               randconfig-r013-20230612   gcc  
xtensa               randconfig-r014-20230612   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
