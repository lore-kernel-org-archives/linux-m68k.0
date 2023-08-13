Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06716C001B0
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Aug 2023 05:34:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjHMFem (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Aug 2023 01:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjHMFem (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Aug 2023 01:34:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345BA10FB
        for <linux-m68k@lists.linux-m68k.org>; Sat, 12 Aug 2023 22:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691904880; x=1723440880;
  h=date:from:to:cc:subject:message-id;
  bh=JvZQmPWjQn7pkjjBPzzbLxlF1HdiJ79TdYZ2Za4nY90=;
  b=HF3Zi5TMQya+/YyFIRD65IN98yV+qAExnTgOw0D/qR1ODLAoraXRrCr3
   aq1RiHzAvFGnXhoaXywPP/uwO7/8lgqtb/3GxtrUd3dAp1gXF0lO7kV97
   np5tvxEvAsg9FKcoFhmrZdCqz3EMDnyPuokhrdHJHYW9Okh9hK9UZf+GB
   7yZhstYtPbSR/mc2fVYqrP0364+qAzlH6niS6R8uvD6O4bz0ICn+G1KHe
   f+TpRwCk1ISePLwJUESl7Eg8YQGR0/tnqyDwGu/gxsT9T11A1SmfCbJeF
   ctAh5bGD2cTMyB3pLKBzb6Sf5YEp1BjdoOKCRqwcaN1k7vt8rq393cvIn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="352194751"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="352194751"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 22:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="906852486"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="906852486"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Aug 2023 22:34:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qV3kF-0008yM-1o;
        Sun, 13 Aug 2023 05:34:31 +0000
Date:   Sun, 13 Aug 2023 13:33:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 f84290f7d5265e88bf4145d5be1dbc8ea4a6b9cf
Message-ID: <202308131343.QJ9yxKtE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: f84290f7d5265e88bf4145d5be1dbc8ea4a6b9cf  Merge tag 'v6.5-rc5'

elapsed time: 720m

configs tested: 113
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230813   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                  randconfig-r046-20230813   clang
arm                       versatile_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230813   clang
hexagon              randconfig-r045-20230813   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230813   clang
i386         buildonly-randconfig-r005-20230813   clang
i386         buildonly-randconfig-r006-20230813   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230813   clang
i386                 randconfig-i002-20230813   clang
i386                 randconfig-i003-20230813   clang
i386                 randconfig-i004-20230813   clang
i386                 randconfig-i005-20230813   clang
i386                 randconfig-i006-20230813   clang
i386                 randconfig-i011-20230813   gcc  
i386                 randconfig-i012-20230813   gcc  
i386                 randconfig-i013-20230813   gcc  
i386                 randconfig-i014-20230813   gcc  
i386                 randconfig-i015-20230813   gcc  
i386                 randconfig-i016-20230813   gcc  
i386                 randconfig-r002-20230813   clang
i386                 randconfig-r012-20230813   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230813   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r032-20230813   gcc  
microblaze           randconfig-r036-20230813   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r003-20230813   gcc  
mips                 randconfig-r013-20230813   clang
mips                 randconfig-r023-20230813   clang
mips                 randconfig-r033-20230813   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r015-20230813   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r025-20230813   gcc  
parisc               randconfig-r031-20230813   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r024-20230813   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc                     tqm8560_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r016-20230813   gcc  
riscv                randconfig-r042-20230813   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r026-20230813   gcc  
s390                 randconfig-r044-20230813   gcc  
sh                               allmodconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230813   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64              randconfig-r034-20230813   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230813   gcc  
um                   randconfig-r006-20230813   gcc  
um                   randconfig-r022-20230813   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230813   clang
x86_64       buildonly-randconfig-r002-20230813   clang
x86_64       buildonly-randconfig-r003-20230813   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r005-20230813   clang
x86_64               randconfig-x001-20230813   gcc  
x86_64               randconfig-x002-20230813   gcc  
x86_64               randconfig-x003-20230813   gcc  
x86_64               randconfig-x004-20230813   gcc  
x86_64               randconfig-x005-20230813   gcc  
x86_64               randconfig-x006-20230813   gcc  
x86_64               randconfig-x011-20230813   clang
x86_64               randconfig-x012-20230813   clang
x86_64               randconfig-x013-20230813   clang
x86_64               randconfig-x014-20230813   clang
x86_64               randconfig-x015-20230813   clang
x86_64               randconfig-x016-20230813   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
