Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E10C6FD19
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Mar 2023 00:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjCNA1I (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Mar 2023 20:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbjCNA1G (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Mar 2023 20:27:06 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE43E7C3E0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Mar 2023 17:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678753625; x=1710289625;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YhE+4SwJptIgw3cq1bu7d4XHhQYWNHCD1cofSx7b/ZM=;
  b=WF9Lbm0vpgkzoK1z/BThKCSJcaKb9F1rwFdZOgNd9RmJfpbAk8pWK1TI
   W4RSrSzhc3jBtfMcFzbj7krkv5RnWUDG7clmp7dAZHGRpBAIBES1vrP91
   m1iVhvo/NYNYUwhaBLmLbo6QyHnHgv46iV5y0wS11iwiGk1Wi1FJNLvPb
   +xgYiM9OfX4p5vGrW0EPnvn/C5dAVESDpVa9osc7GrEle+A8Gz+fuWgV0
   Q8q51RbVJ6v1KXf6tdfRifY1Z9bg6p8RamdMOiHwNWe7hlsGI/vu2xq1E
   /O7KwzBJJ1vBfRkXEybTWUz92unvwcF94RlqtFA/5eB+SbDXyLf6tw6Mc
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="338840813"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="338840813"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 17:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="822159839"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="822159839"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2023 17:26:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pbsVC-0006IJ-34;
        Tue, 14 Mar 2023 00:26:54 +0000
Date:   Tue, 14 Mar 2023 08:26:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 28230bb22d4ea73c91d7e934dc2f162f931733ae
Message-ID: <640fbf44.6/N9RneBht/eeBdR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 28230bb22d4ea73c91d7e934dc2f162f931733ae  Merge tag 'v6.3-rc2'

elapsed time: 731m

configs tested: 128
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230313   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r005-20230312   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230312   gcc  
arc                  randconfig-r043-20230312   gcc  
arc                  randconfig-r043-20230313   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r026-20230312   clang
arm                  randconfig-r046-20230312   clang
arm                  randconfig-r046-20230313   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230312   clang
arm64                randconfig-r005-20230313   gcc  
arm64                randconfig-r006-20230312   clang
csky                                defconfig   gcc  
csky                 randconfig-r002-20230313   gcc  
csky                 randconfig-r031-20230313   gcc  
hexagon              randconfig-r015-20230312   clang
hexagon              randconfig-r041-20230312   clang
hexagon              randconfig-r041-20230313   clang
hexagon              randconfig-r045-20230312   clang
hexagon              randconfig-r045-20230313   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230313   gcc  
i386                 randconfig-a002-20230313   gcc  
i386                 randconfig-a003-20230313   gcc  
i386                 randconfig-a004-20230313   gcc  
i386                 randconfig-a005-20230313   gcc  
i386                 randconfig-a006-20230313   gcc  
i386                 randconfig-a011-20230313   clang
i386                 randconfig-a012-20230313   clang
i386                 randconfig-a013-20230313   clang
i386                 randconfig-a014-20230313   clang
i386                 randconfig-a015-20230313   clang
i386                 randconfig-a016-20230313   clang
i386                 randconfig-r024-20230313   clang
i386                 randconfig-r032-20230313   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230312   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230312   gcc  
microblaze           randconfig-r011-20230312   gcc  
microblaze           randconfig-r012-20230313   gcc  
microblaze           randconfig-r015-20230313   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r003-20230312   gcc  
mips                 randconfig-r013-20230312   clang
nios2        buildonly-randconfig-r003-20230312   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230312   gcc  
nios2                randconfig-r036-20230313   gcc  
openrisc     buildonly-randconfig-r002-20230313   gcc  
openrisc     buildonly-randconfig-r004-20230312   gcc  
parisc       buildonly-randconfig-r005-20230313   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230313   gcc  
parisc               randconfig-r011-20230313   gcc  
parisc               randconfig-r021-20230313   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230313   clang
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230312   clang
riscv                randconfig-r003-20230313   gcc  
riscv                randconfig-r022-20230313   clang
riscv                randconfig-r025-20230313   clang
riscv                randconfig-r042-20230312   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r006-20230313   clang
s390                                defconfig   gcc  
s390                 randconfig-r044-20230312   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r022-20230312   gcc  
sh                   randconfig-r023-20230313   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r021-20230312   gcc  
sparc                randconfig-r023-20230312   gcc  
sparc                randconfig-r033-20230313   gcc  
sparc                randconfig-r035-20230313   gcc  
sparc64      buildonly-randconfig-r002-20230312   gcc  
sparc64              randconfig-r006-20230313   gcc  
sparc64              randconfig-r024-20230312   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230313   gcc  
x86_64               randconfig-a002-20230313   gcc  
x86_64               randconfig-a003-20230313   gcc  
x86_64               randconfig-a004-20230313   gcc  
x86_64               randconfig-a005-20230313   gcc  
x86_64               randconfig-a006-20230313   gcc  
x86_64               randconfig-a011-20230313   clang
x86_64               randconfig-a012-20230313   clang
x86_64               randconfig-a013-20230313   clang
x86_64               randconfig-a014-20230313   clang
x86_64               randconfig-a015-20230313   clang
x86_64               randconfig-a016-20230313   clang
x86_64               randconfig-r016-20230313   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230313   gcc  
xtensa               randconfig-r005-20230312   gcc  
xtensa               randconfig-r013-20230313   gcc  
xtensa               randconfig-r014-20230313   gcc  
xtensa               randconfig-r016-20230312   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
