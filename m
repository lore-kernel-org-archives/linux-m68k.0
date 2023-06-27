Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167F3EB64D7
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Jun 2023 01:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjF0BPm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Jun 2023 21:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjF0BPk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Jun 2023 21:15:40 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045741984
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jun 2023 18:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687828539; x=1719364539;
  h=date:from:to:cc:subject:message-id;
  bh=RZai8aLCzOZei12PBCdCrTiopXuj0v1gpTmRTdPWAnM=;
  b=R7nywGElHC/SSFKknDe1mR5BFHvTrN51vdBiSePSvpSajzFT4aOLIo9R
   IrSeA1Uj+uLgzskPWcnIKypVBkbnPWgZgm0OIpfjWKp75wKcXL4p+Z22Q
   4lEEKuxhlBmcVaO/eX3rhbcH5qC3rLQTCECBQCif0d0bW8OfTXeov0MWH
   DtoTBaK3IK9i5Sa3cTtBsAEyeeDcNTrO3cVxLlbAnWkgbNcSb/Xcg4nHz
   vsAhByU7DX+l8Uw5Aeh2eDbxuXEJfQUmECyyCIeFw1jnqgJTY0snDtsFb
   dIuDHln2JuVQwgaPW960qOeCMKSF/x9iJCK1Dnx5R9hYGAfprq7amoei9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="447821705"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="447821705"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 18:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="693669019"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="693669019"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Jun 2023 18:15:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qDxIu-000BFv-1o;
        Tue, 27 Jun 2023 01:15:36 +0000
Date:   Tue, 27 Jun 2023 09:14:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 908f2ae6a112cfddb175e47343b5608173c41760
Message-ID: <202306270944.wYSRa1sf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 908f2ae6a112cfddb175e47343b5608173c41760  Merge tag 'v6.4'

elapsed time: 844m

configs tested: 109
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r022-20230626   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r043-20230626   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                       netwinder_defconfig   clang
arm                  randconfig-r046-20230626   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r031-20230626   clang
hexagon              randconfig-r041-20230626   clang
hexagon              randconfig-r045-20230626   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230626   clang
i386         buildonly-randconfig-r005-20230626   clang
i386         buildonly-randconfig-r006-20230626   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230626   clang
i386                 randconfig-i002-20230626   clang
i386                 randconfig-i003-20230626   clang
i386                 randconfig-i004-20230626   clang
i386                 randconfig-i005-20230626   clang
i386                 randconfig-i006-20230626   clang
i386                 randconfig-i011-20230626   gcc  
i386                 randconfig-i012-20230626   gcc  
i386                 randconfig-i013-20230626   gcc  
i386                 randconfig-i014-20230626   gcc  
i386                 randconfig-i015-20230626   gcc  
i386                 randconfig-i016-20230626   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r024-20230626   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                 randconfig-r021-20230626   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                           ip22_defconfig   clang
mips                     loongson2k_defconfig   clang
mips                 randconfig-r033-20230626   gcc  
mips                 randconfig-r035-20230626   gcc  
mips                          rm200_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230626   gcc  
openrisc                            defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
riscv                            alldefconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230626   clang
riscv                randconfig-r042-20230626   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230626   clang
s390                 randconfig-r011-20230626   gcc  
s390                 randconfig-r044-20230626   gcc  
sh                               allmodconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                   randconfig-r014-20230626   gcc  
sh                           se7206_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230626   gcc  
sparc64              randconfig-r013-20230626   gcc  
sparc64              randconfig-r016-20230626   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230626   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230626   clang
x86_64       buildonly-randconfig-r002-20230626   clang
x86_64       buildonly-randconfig-r003-20230626   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r003-20230626   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230626   gcc  
xtensa               randconfig-r034-20230626   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
