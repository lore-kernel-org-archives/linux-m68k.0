Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7910C83F29
	for <linux-m68k@archiver.kernel.org>; Thu, 31 Aug 2023 06:04:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233804AbjHaGER (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 31 Aug 2023 02:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjHaGEQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 31 Aug 2023 02:04:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60189E0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Aug 2023 23:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693461853; x=1724997853;
  h=date:from:to:cc:subject:message-id;
  bh=+CPZBo8A3ALVL+4P2I3wiVi64LB6iMumYkWz6IWMIYA=;
  b=BTdQ2qzjr5Q/5a9h9RAdaL7zt6uIWy2JrWYE5alm0yz9rWw6R14t9H98
   Cs7QQF2USZjjGDUvsNIEKV1XaqpArt474aOz8rCaIToCOfbm/GkP8korg
   oxhtTaQJloJAAlm1dWLsrcn9KuwCyCr5YocB8LxrdSjqihCGUqxKcQrde
   iK9pHM77j3LJdxdhcVGEm1TGyow9Tdd3a3WpaXAksy2JZodLDFbIWyrqb
   fouBCcwto1vSWxTtTGVIbOUF5d/1nuEH1Pf9eDtGsmBTEEU1RDP3qV9S0
   KIT66RRqqx/jJUqVGpw4H3V6JHwsfUajDSIKejRqMEHRQ15vNhY3gG6t9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442186051"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="442186051"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 23:04:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="986061609"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="986061609"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2023 23:04:10 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qbamd-000AxG-15;
        Thu, 31 Aug 2023 06:04:02 +0000
Date:   Thu, 31 Aug 2023 14:02:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v6.5] BUILD SUCCESS
 c6798fa4b5b57663d9f79b654fabc8ce1ca00a48
Message-ID: <202308311423.GxWV8pKQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v6.5
branch HEAD: c6798fa4b5b57663d9f79b654fabc8ce1ca00a48  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 3923m

configs tested: 161
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r034-20230828   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230828   gcc  
arc                  randconfig-r015-20230828   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230828   gcc  
arm                  randconfig-r002-20230828   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon               randconfig-001-20230828   clang
hexagon               randconfig-002-20230828   clang
hexagon              randconfig-r024-20230828   clang
hexagon              randconfig-r025-20230828   clang
hexagon              randconfig-r033-20230828   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230828   gcc  
i386         buildonly-randconfig-002-20230828   gcc  
i386         buildonly-randconfig-003-20230828   gcc  
i386         buildonly-randconfig-004-20230828   gcc  
i386         buildonly-randconfig-005-20230828   gcc  
i386         buildonly-randconfig-006-20230828   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230828   gcc  
i386                  randconfig-002-20230828   gcc  
i386                  randconfig-003-20230828   gcc  
i386                  randconfig-004-20230828   gcc  
i386                  randconfig-005-20230828   gcc  
i386                  randconfig-006-20230828   gcc  
i386                  randconfig-011-20230828   clang
i386                  randconfig-012-20230828   clang
i386                  randconfig-013-20230828   clang
i386                  randconfig-014-20230828   clang
i386                  randconfig-015-20230828   clang
i386                  randconfig-016-20230828   clang
i386                 randconfig-r005-20230828   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230828   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r022-20230828   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r035-20230828   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230828   clang
mips                 randconfig-r004-20230828   clang
mips                 randconfig-r012-20230828   gcc  
mips                 randconfig-r016-20230828   gcc  
mips                 randconfig-r023-20230828   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r026-20230828   gcc  
nios2                randconfig-r036-20230828   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r014-20230828   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230828   gcc  
parisc               randconfig-r013-20230828   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc64            randconfig-r021-20230828   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230828   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230828   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r006-20230828   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r011-20230828   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r031-20230828   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230828   gcc  
x86_64       buildonly-randconfig-002-20230828   gcc  
x86_64       buildonly-randconfig-003-20230828   gcc  
x86_64       buildonly-randconfig-004-20230828   gcc  
x86_64       buildonly-randconfig-005-20230828   gcc  
x86_64       buildonly-randconfig-006-20230828   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230828   clang
x86_64                randconfig-002-20230828   clang
x86_64                randconfig-003-20230828   clang
x86_64                randconfig-004-20230828   clang
x86_64                randconfig-005-20230828   clang
x86_64                randconfig-006-20230828   clang
x86_64                randconfig-011-20230828   gcc  
x86_64                randconfig-012-20230828   gcc  
x86_64                randconfig-013-20230828   gcc  
x86_64                randconfig-014-20230828   gcc  
x86_64                randconfig-015-20230828   gcc  
x86_64                randconfig-016-20230828   gcc  
x86_64                randconfig-071-20230828   gcc  
x86_64                randconfig-072-20230828   gcc  
x86_64                randconfig-073-20230828   gcc  
x86_64                randconfig-074-20230828   gcc  
x86_64                randconfig-075-20230828   gcc  
x86_64                randconfig-076-20230828   gcc  
x86_64               randconfig-r032-20230828   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
