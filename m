Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39563C77B75
	for <linux-m68k@archiver.kernel.org>; Tue,  9 May 2023 01:08:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbjEIBI6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 8 May 2023 21:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232571AbjEIBI5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 8 May 2023 21:08:57 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D05184
        for <linux-m68k@lists.linux-m68k.org>; Mon,  8 May 2023 18:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683594536; x=1715130536;
  h=date:from:to:cc:subject:message-id;
  bh=3Nsnq3fOstgAbLzLk/hkrPeHcS5XN3xMXfeZhmOsc5U=;
  b=MKB3Tuira5JfSLgtlwCVRdDDpnh4cEy8Q+IvFd4eDM6pGiCIoCbiQfB2
   3hghyDKtP2252n91I/nzQA93uTNYM2xfIYrKvWmJVeyXBHzB6CykQl6Nw
   ralDb9r+DaSR5FDDg2IW2+HIkOtY17DmEcYNYURqmmXGrRO5G4YHpn7mL
   XpykfRkdUA0o8dJf74Dk8JiSLoMtp1mIZYDlMBVG0czHhOe8/S1pZKCdO
   7y4aOjK8DVyWeNLa21AJVvHBDDmKrGgxOgH+2P4+Y4xIj+5AV66B1Ad2C
   VeTlIWnSDyPmifHcDJWtKlOa87A1vyJz0NrNtWf99ja0Wv7mPe5GgrflD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="352845468"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="352845468"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 18:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="676256344"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="676256344"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 May 2023 18:08:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pwBqR-0001Wh-0J;
        Tue, 09 May 2023 01:08:47 +0000
Date:   Tue, 09 May 2023 09:08:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 c61671b384a1b4c4ab08bf6e75376081e06fdf97
Message-ID: <20230509010827.9nFmT%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: c61671b384a1b4c4ab08bf6e75376081e06fdf97  Merge tag 'v6.4-rc1'

elapsed time: 721m

configs tested: 131
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230508   gcc  
alpha                randconfig-r025-20230507   gcc  
alpha                randconfig-r026-20230507   gcc  
alpha                randconfig-r032-20230507   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r005-20230507   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230508   gcc  
arc                  randconfig-r043-20230507   gcc  
arc                  randconfig-r043-20230508   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230507   clang
arm                  randconfig-r003-20230507   clang
arm                  randconfig-r026-20230508   clang
arm                  randconfig-r036-20230508   gcc  
arm                  randconfig-r046-20230507   gcc  
arm                  randconfig-r046-20230508   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230508   clang
arm64                randconfig-r015-20230508   gcc  
arm64                randconfig-r016-20230508   gcc  
arm64                randconfig-r033-20230508   clang
csky                                defconfig   gcc  
csky                 randconfig-r012-20230508   gcc  
csky                 randconfig-r031-20230507   gcc  
hexagon      buildonly-randconfig-r004-20230508   clang
hexagon              randconfig-r015-20230507   clang
hexagon              randconfig-r023-20230507   clang
hexagon              randconfig-r032-20230508   clang
hexagon              randconfig-r041-20230507   clang
hexagon              randconfig-r041-20230508   clang
hexagon              randconfig-r045-20230507   clang
hexagon              randconfig-r045-20230508   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r001-20230508   clang
i386         buildonly-randconfig-r005-20230508   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230508   clang
i386                 randconfig-a002-20230508   clang
i386                 randconfig-a003-20230508   clang
i386                 randconfig-a004-20230508   clang
i386                 randconfig-a005-20230508   clang
i386                 randconfig-a006-20230508   clang
i386                 randconfig-a011-20230508   gcc  
i386                 randconfig-a012-20230508   gcc  
i386                 randconfig-a013-20230508   gcc  
i386                 randconfig-a014-20230508   gcc  
i386                 randconfig-a015-20230508   gcc  
i386                 randconfig-a016-20230508   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r021-20230507   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r016-20230507   gcc  
loongarch            randconfig-r033-20230507   gcc  
loongarch            randconfig-r034-20230508   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230507   gcc  
m68k                 randconfig-r013-20230507   gcc  
m68k                 randconfig-r014-20230508   gcc  
m68k                 randconfig-r024-20230507   gcc  
microblaze           randconfig-r014-20230507   gcc  
microblaze           randconfig-r022-20230507   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r003-20230507   clang
nios2                               defconfig   gcc  
nios2                randconfig-r034-20230507   gcc  
openrisc     buildonly-randconfig-r001-20230507   gcc  
openrisc             randconfig-r036-20230507   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230507   clang
powerpc              randconfig-r006-20230507   gcc  
powerpc              randconfig-r022-20230508   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230508   gcc  
riscv                randconfig-r025-20230508   gcc  
riscv                randconfig-r042-20230507   clang
riscv                randconfig-r042-20230508   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230508   clang
s390                 randconfig-r006-20230508   clang
s390                 randconfig-r031-20230508   clang
s390                 randconfig-r044-20230507   clang
s390                 randconfig-r044-20230508   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230507   gcc  
sh                   randconfig-r005-20230508   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r035-20230508   gcc  
sparc64      buildonly-randconfig-r006-20230507   gcc  
sparc64              randconfig-r001-20230507   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r002-20230508   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64               randconfig-a011-20230508   gcc  
x86_64               randconfig-a012-20230508   gcc  
x86_64               randconfig-a013-20230508   gcc  
x86_64               randconfig-a014-20230508   gcc  
x86_64               randconfig-a015-20230508   gcc  
x86_64               randconfig-a016-20230508   gcc  
x86_64               randconfig-r011-20230508   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r021-20230508   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
