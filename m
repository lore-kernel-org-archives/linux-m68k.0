Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790EAE7E626
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Sep 2023 11:49:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbjIZLto (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Sep 2023 07:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233947AbjIZLtm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Sep 2023 07:49:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C843EB
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Sep 2023 04:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695728975; x=1727264975;
  h=date:from:to:cc:subject:message-id;
  bh=tGluSvteTRw28IUInqbZ5xQBqW6rjr77ET4WzraqlFg=;
  b=R+jzyVLzVI8wVdrv9VbQgGWCuV3BNsNXQ69c6AfE2eWCigpcTXkJqu9i
   bN71OC5e1+ufEc4eTe3TPYv0FM5UdCIs+VlD7OIqMXfENQAxKQ2bKLAqk
   ZjETnHHUMHmdeJUlWgwlPT9wQ/z1sYcrG8NPedCBlQi+mtJO7F8XmQRrn
   JKPOIwcfULHkBev0saoQFt30KaLivUiWhVm/QKaAALsTKW72iTQOhqm6M
   TcFVpVpu4DVYS/fEqmNga0sfbsFTtIAX3+C6K3/czygfzNvukJB9za/Nd
   K14Y7XNxgnxDrf6LW3LH644FDBSt1M+ONe8gt2s6Nij4Gizu7OYts0jfd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366604657"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="366604657"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 04:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="752149368"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="752149368"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 26 Sep 2023 04:49:32 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ql6ZG-0002mF-0x;
        Tue, 26 Sep 2023 11:49:30 +0000
Date:   Tue, 26 Sep 2023 19:48:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 62722428143388e4ebec8ab2a847c19cfb3ad22e
Message-ID: <202309261949.NPsIcG31-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 62722428143388e4ebec8ab2a847c19cfb3ad22e  Merge tag 'v6.6-rc3'

elapsed time: 1410m

configs tested: 183
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
arc                   randconfig-001-20230925   gcc  
arc                   randconfig-001-20230926   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230925   gcc  
arm                   randconfig-001-20230926   gcc  
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
i386         buildonly-randconfig-001-20230925   gcc  
i386         buildonly-randconfig-001-20230926   gcc  
i386         buildonly-randconfig-002-20230925   gcc  
i386         buildonly-randconfig-002-20230926   gcc  
i386         buildonly-randconfig-003-20230925   gcc  
i386         buildonly-randconfig-003-20230926   gcc  
i386         buildonly-randconfig-004-20230925   gcc  
i386         buildonly-randconfig-004-20230926   gcc  
i386         buildonly-randconfig-005-20230925   gcc  
i386         buildonly-randconfig-005-20230926   gcc  
i386         buildonly-randconfig-006-20230925   gcc  
i386         buildonly-randconfig-006-20230926   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230925   gcc  
i386                  randconfig-001-20230926   gcc  
i386                  randconfig-002-20230925   gcc  
i386                  randconfig-002-20230926   gcc  
i386                  randconfig-003-20230925   gcc  
i386                  randconfig-003-20230926   gcc  
i386                  randconfig-004-20230925   gcc  
i386                  randconfig-004-20230926   gcc  
i386                  randconfig-005-20230925   gcc  
i386                  randconfig-005-20230926   gcc  
i386                  randconfig-006-20230925   gcc  
i386                  randconfig-006-20230926   gcc  
i386                  randconfig-011-20230925   gcc  
i386                  randconfig-011-20230926   gcc  
i386                  randconfig-012-20230925   gcc  
i386                  randconfig-012-20230926   gcc  
i386                  randconfig-013-20230925   gcc  
i386                  randconfig-013-20230926   gcc  
i386                  randconfig-014-20230925   gcc  
i386                  randconfig-014-20230926   gcc  
i386                  randconfig-015-20230925   gcc  
i386                  randconfig-015-20230926   gcc  
i386                  randconfig-016-20230925   gcc  
i386                  randconfig-016-20230926   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230925   gcc  
loongarch             randconfig-001-20230926   gcc  
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
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230925   gcc  
riscv                 randconfig-001-20230926   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230925   gcc  
s390                  randconfig-001-20230926   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230925   gcc  
sparc                 randconfig-001-20230926   gcc  
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
x86_64       buildonly-randconfig-001-20230925   gcc  
x86_64       buildonly-randconfig-001-20230926   gcc  
x86_64       buildonly-randconfig-002-20230925   gcc  
x86_64       buildonly-randconfig-002-20230926   gcc  
x86_64       buildonly-randconfig-003-20230925   gcc  
x86_64       buildonly-randconfig-003-20230926   gcc  
x86_64       buildonly-randconfig-004-20230925   gcc  
x86_64       buildonly-randconfig-004-20230926   gcc  
x86_64       buildonly-randconfig-005-20230925   gcc  
x86_64       buildonly-randconfig-005-20230926   gcc  
x86_64       buildonly-randconfig-006-20230925   gcc  
x86_64       buildonly-randconfig-006-20230926   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230925   gcc  
x86_64                randconfig-001-20230926   gcc  
x86_64                randconfig-002-20230925   gcc  
x86_64                randconfig-002-20230926   gcc  
x86_64                randconfig-003-20230925   gcc  
x86_64                randconfig-003-20230926   gcc  
x86_64                randconfig-004-20230925   gcc  
x86_64                randconfig-004-20230926   gcc  
x86_64                randconfig-005-20230925   gcc  
x86_64                randconfig-005-20230926   gcc  
x86_64                randconfig-006-20230925   gcc  
x86_64                randconfig-006-20230926   gcc  
x86_64                randconfig-011-20230925   gcc  
x86_64                randconfig-011-20230926   gcc  
x86_64                randconfig-012-20230925   gcc  
x86_64                randconfig-012-20230926   gcc  
x86_64                randconfig-013-20230925   gcc  
x86_64                randconfig-013-20230926   gcc  
x86_64                randconfig-014-20230925   gcc  
x86_64                randconfig-014-20230926   gcc  
x86_64                randconfig-015-20230925   gcc  
x86_64                randconfig-015-20230926   gcc  
x86_64                randconfig-016-20230925   gcc  
x86_64                randconfig-016-20230926   gcc  
x86_64                randconfig-071-20230925   gcc  
x86_64                randconfig-071-20230926   gcc  
x86_64                randconfig-072-20230925   gcc  
x86_64                randconfig-072-20230926   gcc  
x86_64                randconfig-073-20230925   gcc  
x86_64                randconfig-073-20230926   gcc  
x86_64                randconfig-074-20230925   gcc  
x86_64                randconfig-074-20230926   gcc  
x86_64                randconfig-075-20230925   gcc  
x86_64                randconfig-075-20230926   gcc  
x86_64                randconfig-076-20230925   gcc  
x86_64                randconfig-076-20230926   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
