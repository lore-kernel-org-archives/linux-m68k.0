Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9479BC07545
	for <linux-m68k@archiver.kernel.org>; Wed, 25 Oct 2023 19:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjJYTLc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 25 Oct 2023 15:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjJYTLb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 25 Oct 2023 15:11:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D75ABB
        for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Oct 2023 12:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698261089; x=1729797089;
  h=date:from:to:cc:subject:message-id;
  bh=/DftNFdqKKIOESVN0rkEmd20DraGiFcNVSM+d8UxgcQ=;
  b=CDC8SEzOeOIM77Fr33CkTLQinhsEbci8JwqCvzXr4SVZOH7uoirGy2Oj
   az+APUign3kI2AvuX+WAbJCnQlvR854+Q2BtNdqT1CHf3lYZfRkVXwWc9
   yBfSj0mS+IPPnwff2u0AE2VdtrfglUXXPWAb5j+Lyz58F/jpTXP2Lkj9x
   UTx5dYNrFFJp8ocnD/JKrZCmFjQS/dVfxllxYHInPu+NevnYx3zopFFUb
   ztY/YQmPmxTysBV5GNA3Kv1ZyT/QV5wihdtP3RMv8sz20IrcD+l1FkBBo
   aSpSuU3sZNCyHaLB4Ur4JKKkF3BVa+MkXA3eF5S4sDjuk3aYpOsuyzl5N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="366728615"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="366728615"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 12:11:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="1006117548"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="1006117548"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Oct 2023 12:11:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qvjHp-00098a-0a;
        Wed, 25 Oct 2023 19:11:25 +0000
Date:   Thu, 26 Oct 2023 03:10:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 3878e988e2f6f4d79ea551941694658771f8f983
Message-ID: <202310260334.wbjM9LKX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 3878e988e2f6f4d79ea551941694658771f8f983  Merge tag 'v6.6-rc7'

elapsed time: 3160m

configs tested: 123
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
arc                   randconfig-001-20231023   gcc  
arc                   randconfig-001-20231024   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231024   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
i386                              allnoconfig   gcc  
i386         buildonly-randconfig-001-20231024   gcc  
i386         buildonly-randconfig-002-20231024   gcc  
i386         buildonly-randconfig-003-20231024   gcc  
i386         buildonly-randconfig-004-20231024   gcc  
i386         buildonly-randconfig-005-20231024   gcc  
i386         buildonly-randconfig-006-20231024   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231024   gcc  
i386                  randconfig-002-20231024   gcc  
i386                  randconfig-003-20231024   gcc  
i386                  randconfig-004-20231024   gcc  
i386                  randconfig-005-20231024   gcc  
i386                  randconfig-006-20231024   gcc  
i386                  randconfig-011-20231024   gcc  
i386                  randconfig-012-20231024   gcc  
i386                  randconfig-013-20231024   gcc  
i386                  randconfig-014-20231024   gcc  
i386                  randconfig-015-20231024   gcc  
i386                  randconfig-016-20231024   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231023   gcc  
loongarch             randconfig-001-20231024   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231024   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231024   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231024   gcc  
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
x86_64       buildonly-randconfig-001-20231024   gcc  
x86_64       buildonly-randconfig-002-20231024   gcc  
x86_64       buildonly-randconfig-003-20231024   gcc  
x86_64       buildonly-randconfig-004-20231024   gcc  
x86_64       buildonly-randconfig-005-20231024   gcc  
x86_64       buildonly-randconfig-006-20231024   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-005-20231024   gcc  
x86_64                randconfig-006-20231024   gcc  
x86_64                randconfig-011-20231024   gcc  
x86_64                randconfig-012-20231024   gcc  
x86_64                randconfig-013-20231024   gcc  
x86_64                randconfig-014-20231024   gcc  
x86_64                randconfig-015-20231024   gcc  
x86_64                randconfig-016-20231024   gcc  
x86_64                randconfig-071-20231024   gcc  
x86_64                randconfig-072-20231024   gcc  
x86_64                randconfig-073-20231024   gcc  
x86_64                randconfig-074-20231024   gcc  
x86_64                randconfig-075-20231024   gcc  
x86_64                randconfig-076-20231024   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
