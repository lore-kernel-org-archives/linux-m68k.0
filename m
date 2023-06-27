Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2C6EB64D9
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Jun 2023 01:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjF0BNo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Jun 2023 21:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbjF0BNm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Jun 2023 21:13:42 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E599C173A
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jun 2023 18:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687828418; x=1719364418;
  h=date:from:to:cc:subject:message-id;
  bh=mZPx81Q7FD6gBH87Rs7ji9v3FPDvps8vlsOr9ZkuqVY=;
  b=BYmbbsesr99iAK/JFEul+51M90IrqtLe1Mq7gEAGMx6lNRwPdv6RBeJK
   BFLLB948gnqfEnuNg6uPXXRNgFPuU/5NJse7cYuLRyLEIVWb6rl8w3Ej2
   jvAlWwqD2QKlYwU8Vheqv7f0ejKB+38lZCO7oXR5p4tIEO8afaboUP5Iu
   CiN56zwla5Y84pRxr5eBb8JCh4QSaDAIxzlxMQW1gwnukcDF0iZa0KCoS
   BU2+4jkDj+kicBZozZiepMuTPjdg/X6V6883AbddTYgtLEvpmq9rx9Rtt
   mbHSqdLYTjOk1N0Af0aZL5SGeVNgUwCQbxTbO5mPod100JO3y/DQ5aPjs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="360301221"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="360301221"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 18:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890481463"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="890481463"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jun 2023 18:13:36 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qDxGx-000BDz-2N;
        Tue, 27 Jun 2023 01:13:35 +0000
Date:   Tue, 27 Jun 2023 09:12:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v6.4] BUILD SUCCESS
 3e61457e9c28626b1ca28c810d814cd713464578
Message-ID: <202306270935.9KDofssv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v6.4
branch HEAD: 3e61457e9c28626b1ca28c810d814cd713464578  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 842m

configs tested: 110
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230626   gcc  
alpha                randconfig-r036-20230626   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r043-20230626   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          ixp4xx_defconfig   clang
arm                        mvebu_v7_defconfig   gcc  
arm                  randconfig-r013-20230626   clang
arm                  randconfig-r034-20230626   gcc  
arm                  randconfig-r046-20230626   clang
arm                    vt8500_v6_v7_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230626   gcc  
arm64                randconfig-r031-20230626   clang
csky                                defconfig   gcc  
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
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                 randconfig-r026-20230626   gcc  
microblaze           randconfig-r011-20230626   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                 randconfig-r006-20230626   gcc  
mips                 randconfig-r024-20230626   clang
mips                 randconfig-r025-20230626   clang
mips                 randconfig-r035-20230626   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230626   gcc  
nios2                randconfig-r032-20230626   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230626   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                     redwood_defconfig   gcc  
powerpc                     skiroot_defconfig   clang
riscv                            alldefconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230626   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230626   gcc  
sh                               allmodconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                   randconfig-r001-20230626   gcc  
sh                   randconfig-r003-20230626   gcc  
sh                   randconfig-r005-20230626   gcc  
sh                           se7206_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230626   gcc  
sparc64              randconfig-r021-20230626   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230626   clang
x86_64       buildonly-randconfig-r002-20230626   clang
x86_64       buildonly-randconfig-r003-20230626   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r004-20230626   clang
x86_64               randconfig-r022-20230626   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r016-20230626   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
