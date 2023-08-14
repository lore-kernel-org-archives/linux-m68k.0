Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867CFC001B0
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Aug 2023 23:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbjHNX7E (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Aug 2023 19:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233099AbjHNX66 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Aug 2023 19:58:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 990AC1722
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 16:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692057537; x=1723593537;
  h=date:from:to:cc:subject:message-id;
  bh=RUahPwtsfyqUXNE8HyGLp1JaadhJHcq6jYMheuuhcho=;
  b=PwL6p5BkpEGB8nFEsr9PGChGGoD+/Fi+2yCuN2KcJjzhwIWBl48ElSFY
   mO3tFdSVdU8IHMksASl39Y3tpUJBa9HZyKbPOYaVuXhwvX8vAEdLSyRhf
   hAfOJXu54qq17/eBYlfF26z2tYgx/Qemn1cq+NfbGCtbbm6PLn+lCFbtG
   soz6JtgwH55+tNVBHXrciL0L5QogsPu7SH9MV900d0Pgm6f3aGqQkVWj4
   RqmTXq3XA0u+ZHutKnvPGCJkUPFn2VJ1EqQ3VEdgcqGt1xmnWpXmLkheF
   CCLRLxwTEJIufRx+dGsW5zmX5HVascQmBvXzJQZII1m9vpPl1AS/43Zgk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403144736"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="403144736"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 16:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="980196552"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="980196552"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2023 16:58:55 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qVhSY-0000W1-20;
        Mon, 14 Aug 2023 23:58:54 +0000
Date:   Tue, 15 Aug 2023 07:58:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 442a3d4bbb94d7f6de9874a9ddc5af8fb7fd9df4
Message-ID: <202308150707.ttxkwNIb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 442a3d4bbb94d7f6de9874a9ddc5af8fb7fd9df4  Merge tag 'v6.5-rc6'

elapsed time: 721m

configs tested: 206
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230814   gcc  
alpha                randconfig-r004-20230814   gcc  
alpha                randconfig-r013-20230815   gcc  
alpha                randconfig-r024-20230814   gcc  
alpha                randconfig-r034-20230815   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230815   gcc  
arc                  randconfig-r003-20230815   gcc  
arc                  randconfig-r023-20230815   gcc  
arc                  randconfig-r043-20230814   gcc  
arc                  randconfig-r043-20230815   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230814   clang
arm                  randconfig-r006-20230815   gcc  
arm                  randconfig-r026-20230814   gcc  
arm                  randconfig-r046-20230814   gcc  
arm                  randconfig-r046-20230815   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230814   gcc  
arm64                randconfig-r021-20230815   gcc  
arm64                randconfig-r025-20230815   gcc  
arm64                randconfig-r026-20230815   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230814   gcc  
csky                 randconfig-r013-20230815   gcc  
csky                 randconfig-r031-20230815   gcc  
csky                 randconfig-r035-20230814   gcc  
hexagon              randconfig-r003-20230814   clang
hexagon              randconfig-r041-20230814   clang
hexagon              randconfig-r041-20230815   clang
hexagon              randconfig-r045-20230814   clang
hexagon              randconfig-r045-20230815   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230814   gcc  
i386         buildonly-randconfig-r004-20230815   clang
i386         buildonly-randconfig-r005-20230814   gcc  
i386         buildonly-randconfig-r005-20230815   clang
i386         buildonly-randconfig-r006-20230814   gcc  
i386         buildonly-randconfig-r006-20230815   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230814   gcc  
i386                 randconfig-i001-20230815   clang
i386                 randconfig-i002-20230814   gcc  
i386                 randconfig-i002-20230815   clang
i386                 randconfig-i003-20230814   gcc  
i386                 randconfig-i003-20230815   clang
i386                 randconfig-i004-20230814   gcc  
i386                 randconfig-i004-20230815   clang
i386                 randconfig-i005-20230814   gcc  
i386                 randconfig-i005-20230815   clang
i386                 randconfig-i006-20230814   gcc  
i386                 randconfig-i006-20230815   clang
i386                 randconfig-i011-20230814   clang
i386                 randconfig-i011-20230815   gcc  
i386                 randconfig-i012-20230814   clang
i386                 randconfig-i012-20230815   gcc  
i386                 randconfig-i013-20230814   clang
i386                 randconfig-i013-20230815   gcc  
i386                 randconfig-i014-20230814   clang
i386                 randconfig-i014-20230815   gcc  
i386                 randconfig-i015-20230814   clang
i386                 randconfig-i015-20230815   gcc  
i386                 randconfig-i016-20230814   clang
i386                 randconfig-i016-20230815   gcc  
i386                 randconfig-r002-20230814   gcc  
i386                 randconfig-r004-20230815   clang
i386                 randconfig-r005-20230814   gcc  
i386                 randconfig-r005-20230815   clang
i386                 randconfig-r016-20230815   gcc  
i386                 randconfig-r022-20230814   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r021-20230814   gcc  
loongarch            randconfig-r022-20230814   gcc  
loongarch            randconfig-r025-20230814   gcc  
loongarch            randconfig-r031-20230814   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230814   gcc  
m68k                 randconfig-r016-20230814   gcc  
m68k                 randconfig-r021-20230815   gcc  
m68k                 randconfig-r024-20230815   gcc  
m68k                 randconfig-r025-20230814   gcc  
m68k                 randconfig-r036-20230814   gcc  
microblaze           randconfig-r005-20230814   gcc  
microblaze           randconfig-r011-20230815   gcc  
microblaze           randconfig-r012-20230815   gcc  
microblaze           randconfig-r013-20230814   gcc  
microblaze           randconfig-r022-20230815   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r002-20230815   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230814   gcc  
nios2                randconfig-r003-20230814   gcc  
nios2                randconfig-r005-20230815   gcc  
openrisc             randconfig-r001-20230815   gcc  
openrisc             randconfig-r006-20230815   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230815   gcc  
parisc               randconfig-r032-20230815   gcc  
parisc               randconfig-r034-20230814   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r016-20230814   clang
powerpc              randconfig-r023-20230815   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230814   clang
riscv                randconfig-r031-20230814   gcc  
riscv                randconfig-r033-20230814   gcc  
riscv                randconfig-r042-20230814   clang
riscv                randconfig-r042-20230815   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r021-20230814   clang
s390                 randconfig-r022-20230815   gcc  
s390                 randconfig-r044-20230814   clang
s390                 randconfig-r044-20230815   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230814   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230814   gcc  
sparc                randconfig-r006-20230814   gcc  
sparc                randconfig-r014-20230814   gcc  
sparc                randconfig-r023-20230814   gcc  
sparc                randconfig-r024-20230815   gcc  
sparc64              randconfig-r002-20230814   gcc  
sparc64              randconfig-r004-20230815   gcc  
sparc64              randconfig-r005-20230814   gcc  
sparc64              randconfig-r015-20230814   gcc  
sparc64              randconfig-r023-20230814   gcc  
sparc64              randconfig-r035-20230814   gcc  
sparc64              randconfig-r036-20230815   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230815   gcc  
um                   randconfig-r005-20230815   gcc  
um                   randconfig-r006-20230814   clang
um                   randconfig-r013-20230814   gcc  
um                   randconfig-r024-20230814   gcc  
um                   randconfig-r026-20230814   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230814   gcc  
x86_64       buildonly-randconfig-r001-20230815   clang
x86_64       buildonly-randconfig-r002-20230814   gcc  
x86_64       buildonly-randconfig-r002-20230815   clang
x86_64       buildonly-randconfig-r003-20230814   gcc  
x86_64       buildonly-randconfig-r003-20230815   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r004-20230814   gcc  
x86_64               randconfig-r015-20230814   clang
x86_64               randconfig-r015-20230815   gcc  
x86_64               randconfig-r021-20230815   gcc  
x86_64               randconfig-r025-20230815   gcc  
x86_64               randconfig-x001-20230814   clang
x86_64               randconfig-x001-20230815   gcc  
x86_64               randconfig-x002-20230814   clang
x86_64               randconfig-x002-20230815   gcc  
x86_64               randconfig-x003-20230814   clang
x86_64               randconfig-x003-20230815   gcc  
x86_64               randconfig-x004-20230814   clang
x86_64               randconfig-x004-20230815   gcc  
x86_64               randconfig-x005-20230814   clang
x86_64               randconfig-x005-20230815   gcc  
x86_64               randconfig-x006-20230814   clang
x86_64               randconfig-x006-20230815   gcc  
x86_64               randconfig-x011-20230814   gcc  
x86_64               randconfig-x011-20230815   clang
x86_64               randconfig-x012-20230814   gcc  
x86_64               randconfig-x012-20230815   clang
x86_64               randconfig-x013-20230814   gcc  
x86_64               randconfig-x013-20230815   clang
x86_64               randconfig-x014-20230814   gcc  
x86_64               randconfig-x014-20230815   clang
x86_64               randconfig-x015-20230814   gcc  
x86_64               randconfig-x015-20230815   clang
x86_64               randconfig-x016-20230814   gcc  
x86_64               randconfig-x016-20230815   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r015-20230815   gcc  
xtensa               randconfig-r022-20230815   gcc  
xtensa               randconfig-r033-20230814   gcc  
xtensa               randconfig-r033-20230815   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
