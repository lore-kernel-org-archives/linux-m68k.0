Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8A1C77B76
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Apr 2023 20:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjDUUqa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Apr 2023 16:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjDUUq1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Apr 2023 16:46:27 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 624E11FD9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Apr 2023 13:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682109985; x=1713645985;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=s9f/Xe5UfWNXnwu+y5p0Rk4WnmGURipxFiPXOAYc55o=;
  b=b2zPS9IEZij2iPOjQkcJ38wwLFvpKufGC1XTpK57iTL5bj59RBo4wtqx
   Z40y775AWHc1P9lHxKC4Q0maw6FEfIqwuIw/RjN+mk7WMKd3SAR3WwGPU
   qwWfBbuU8nMgmJpYUSrcNw1+r/Y/cLpsAIqMOVWdGh/zF3QEs5+8nDmiG
   vCAa43wdFMCt1siIiat3nvnRQK5lJD1FnSWEY9KlTuxKl5aCWLfQMRTtD
   Ee4+HMeVIJzQEiFt9NnipPidYaalftTZdNm9RyOlfqlzJVVyVCx4e485K
   /5TBIS339pXO3zzj2g2ud3wZGuGT3Pztgz2dPK0Sr+Ga/kBOQHKCh6pyv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="409017084"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="409017084"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 13:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="803862394"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="803862394"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2023 13:46:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ppxeA-000gn0-04;
        Fri, 21 Apr 2023 20:46:22 +0000
Date:   Sat, 22 Apr 2023 04:46:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 e5f6e4d13f537cdaba3909e72b1e1e1e91a05aaf
Message-ID: <6442f60a.DF2BHs15+ud7YVGL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: e5f6e4d13f537cdaba3909e72b1e1e1e91a05aaf  m68k: kexec: Include <linux/reboot.h>

elapsed time: 721m

configs tested: 163
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r023-20230421   gcc  
alpha                randconfig-r025-20230420   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                  randconfig-r013-20230416   gcc  
arc                  randconfig-r021-20230420   gcc  
arc                  randconfig-r031-20230421   gcc  
arc                  randconfig-r033-20230421   gcc  
arc                  randconfig-r043-20230420   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230420   clang
arm          buildonly-randconfig-r003-20230420   clang
arm          buildonly-randconfig-r005-20230417   gcc  
arm          buildonly-randconfig-r006-20230418   clang
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230417   clang
arm                  randconfig-r003-20230417   clang
arm                  randconfig-r005-20230421   clang
arm                  randconfig-r011-20230416   clang
arm                  randconfig-r024-20230420   clang
arm                  randconfig-r046-20230420   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230416   gcc  
arm64                randconfig-r035-20230421   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230421   gcc  
csky                 randconfig-r016-20230417   gcc  
csky                 randconfig-r025-20230421   gcc  
csky                 randconfig-r036-20230421   gcc  
hexagon              randconfig-r002-20230416   clang
hexagon              randconfig-r041-20230420   clang
hexagon              randconfig-r041-20230421   clang
hexagon              randconfig-r045-20230420   clang
hexagon              randconfig-r045-20230421   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                          randconfig-a012   gcc  
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                          randconfig-a014   gcc  
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r005-20230421   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r022-20230421   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230420   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230421   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230417   gcc  
m68k                 randconfig-r014-20230421   gcc  
microblaze   buildonly-randconfig-r002-20230416   gcc  
microblaze   buildonly-randconfig-r005-20230420   gcc  
microblaze           randconfig-r013-20230421   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r032-20230421   clang
nios2                               defconfig   gcc  
nios2                randconfig-r022-20230420   gcc  
openrisc     buildonly-randconfig-r003-20230421   gcc  
openrisc     buildonly-randconfig-r004-20230417   gcc  
openrisc             randconfig-r002-20230417   gcc  
parisc       buildonly-randconfig-r002-20230417   gcc  
parisc       buildonly-randconfig-r002-20230421   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230416   gcc  
parisc               randconfig-r006-20230417   gcc  
parisc               randconfig-r024-20230421   gcc  
parisc               randconfig-r031-20230421   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc      buildonly-randconfig-r003-20230417   clang
powerpc      buildonly-randconfig-r003-20230418   gcc  
powerpc                 mpc837x_mds_defconfig   gcc  
powerpc              randconfig-r016-20230416   gcc  
powerpc              randconfig-r032-20230421   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230416   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r015-20230416   gcc  
riscv                randconfig-r035-20230421   gcc  
riscv                randconfig-r042-20230420   gcc  
riscv                randconfig-r042-20230421   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230418   gcc  
s390         buildonly-randconfig-r004-20230418   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r005-20230417   gcc  
s390                 randconfig-r006-20230416   clang
s390                 randconfig-r012-20230417   clang
s390                 randconfig-r015-20230417   clang
s390                 randconfig-r044-20230420   gcc  
s390                 randconfig-r044-20230421   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r026-20230420   gcc  
sh                   randconfig-r036-20230421   gcc  
sh                          rsk7269_defconfig   gcc  
sparc        buildonly-randconfig-r001-20230416   gcc  
sparc        buildonly-randconfig-r002-20230420   gcc  
sparc        buildonly-randconfig-r004-20230421   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r033-20230421   gcc  
sparc                randconfig-r034-20230421   gcc  
sparc64      buildonly-randconfig-r001-20230421   gcc  
sparc64              randconfig-r003-20230416   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r006-20230417   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64                        randconfig-a011   gcc  
x86_64               randconfig-a012-20230417   clang
x86_64               randconfig-a013-20230417   clang
x86_64                        randconfig-a013   gcc  
x86_64               randconfig-a014-20230417   clang
x86_64               randconfig-a015-20230417   clang
x86_64                        randconfig-a015   gcc  
x86_64               randconfig-a016-20230417   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230418   gcc  
xtensa       buildonly-randconfig-r006-20230420   gcc  
xtensa               randconfig-r004-20230417   gcc  
xtensa               randconfig-r021-20230421   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
