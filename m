Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82469C77B76
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Apr 2023 22:22:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbjDXWW1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Apr 2023 18:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233207AbjDXWW0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Apr 2023 18:22:26 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716678A4E
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Apr 2023 15:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682374940; x=1713910940;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TgWwozo9iueQIwSPq9ZR5SeoBww7Bjdy+YBRnvxa3w8=;
  b=N2Lqw1hHHtXFJpGeJEVVhobh61BTFrLx51ws8NEUnyGgrfchA5JPamg9
   maNjYWOaisJHTVCLoZdeNdd7mLFTRXR/Q5ZhRhpGFMyfaUQix2JL2MneN
   TJH7+r54D6dNW6IT3lqxiyg5NbdaAa+fzXp6Tpmx1x6s2ISEhpDx8Aeas
   qie4mbPsB4V37VWHl14WWck3stXEOX9RxqVM6bOGDd3GXJikUevtumb+x
   wHWqEqOUrCRhsFYrCLM/hM6jaBxK+pj8N4YrkHNgaMt2bk5Sw80GtIJcr
   PxthsHnLsomsNIlQ5yoVRrnjRwN+3JXKYlYcFe7Mitda3DuqFxrWkq6nB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="326889345"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="326889345"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 15:22:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="867645776"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="867645776"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Apr 2023 15:22:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pr4ZO-000iga-0W;
        Mon, 24 Apr 2023 22:22:02 +0000
Date:   Tue, 25 Apr 2023 06:21:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 007a571e344357e5f43093d21099a831060088fc
Message-ID: <644700e2.ZHxpfHdlJkIfaGOq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 007a571e344357e5f43093d21099a831060088fc  Merge tag 'v6.3'

elapsed time: 728m

configs tested: 158
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230423   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r021-20230423   gcc  
alpha                randconfig-r031-20230424   gcc  
alpha                randconfig-r033-20230424   gcc  
alpha                randconfig-r035-20230423   gcc  
alpha                randconfig-r035-20230424   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230423   gcc  
arc                  randconfig-r043-20230423   gcc  
arc                  randconfig-r043-20230424   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230424   gcc  
arm                  randconfig-r013-20230424   clang
arm                  randconfig-r025-20230423   gcc  
arm                  randconfig-r046-20230423   gcc  
arm                  randconfig-r046-20230424   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r006-20230424   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r021-20230423   gcc  
csky                 randconfig-r022-20230424   gcc  
csky                 randconfig-r023-20230423   gcc  
csky                 randconfig-r033-20230423   gcc  
hexagon      buildonly-randconfig-r004-20230424   clang
hexagon      buildonly-randconfig-r005-20230423   clang
hexagon              randconfig-r041-20230423   clang
hexagon              randconfig-r041-20230424   clang
hexagon              randconfig-r045-20230423   clang
hexagon              randconfig-r045-20230424   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230424   clang
i386                 randconfig-a002-20230424   clang
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230424   clang
i386                 randconfig-a004-20230424   clang
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230424   clang
i386                 randconfig-a006-20230424   clang
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230424   gcc  
i386                 randconfig-a012-20230424   gcc  
i386                 randconfig-a013-20230424   gcc  
i386                 randconfig-a014-20230424   gcc  
i386                 randconfig-a015-20230424   gcc  
i386                 randconfig-a016-20230424   gcc  
i386                 randconfig-r001-20230424   clang
i386                 randconfig-r004-20230424   clang
i386                 randconfig-r015-20230424   gcc  
i386                 randconfig-r016-20230424   gcc  
i386                 randconfig-r026-20230424   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r032-20230423   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230423   gcc  
loongarch    buildonly-randconfig-r005-20230423   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230424   gcc  
loongarch            randconfig-r013-20230423   gcc  
loongarch            randconfig-r022-20230424   gcc  
loongarch            randconfig-r033-20230424   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r021-20230424   gcc  
m68k                 randconfig-r032-20230424   gcc  
m68k                 randconfig-r036-20230424   gcc  
microblaze           randconfig-r014-20230423   gcc  
microblaze           randconfig-r016-20230423   gcc  
microblaze           randconfig-r025-20230423   gcc  
microblaze           randconfig-r025-20230424   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r003-20230423   clang
mips                 randconfig-r014-20230424   clang
mips                 randconfig-r022-20230423   gcc  
mips                 randconfig-r025-20230424   clang
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230424   gcc  
nios2                randconfig-r023-20230423   gcc  
nios2                randconfig-r023-20230424   gcc  
nios2                randconfig-r031-20230423   gcc  
openrisc     buildonly-randconfig-r006-20230423   gcc  
openrisc             randconfig-r035-20230424   gcc  
parisc       buildonly-randconfig-r006-20230423   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r006-20230424   gcc  
parisc               randconfig-r024-20230423   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r015-20230423   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230423   gcc  
riscv                randconfig-r036-20230424   clang
riscv                randconfig-r042-20230423   clang
riscv                randconfig-r042-20230424   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230423   clang
s390                                defconfig   gcc  
s390                 randconfig-r044-20230423   clang
s390                 randconfig-r044-20230424   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230423   gcc  
sparc        buildonly-randconfig-r002-20230423   gcc  
sparc        buildonly-randconfig-r005-20230424   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230423   gcc  
sparc                randconfig-r022-20230423   gcc  
sparc                randconfig-r024-20230423   gcc  
sparc                randconfig-r036-20230423   gcc  
sparc64      buildonly-randconfig-r004-20230423   gcc  
sparc64              randconfig-r002-20230424   gcc  
sparc64              randconfig-r023-20230424   gcc  
sparc64              randconfig-r024-20230424   gcc  
sparc64              randconfig-r026-20230423   gcc  
sparc64              randconfig-r026-20230424   gcc  
sparc64              randconfig-r034-20230424   gcc  
sparc64              randconfig-r035-20230423   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230424   clang
x86_64       buildonly-randconfig-r002-20230424   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230424   clang
x86_64               randconfig-a002-20230424   clang
x86_64               randconfig-a003-20230424   clang
x86_64               randconfig-a004-20230424   clang
x86_64               randconfig-a005-20230424   clang
x86_64               randconfig-a006-20230424   clang
x86_64               randconfig-a011-20230424   gcc  
x86_64               randconfig-a012-20230424   gcc  
x86_64               randconfig-a013-20230424   gcc  
x86_64               randconfig-a014-20230424   gcc  
x86_64               randconfig-a015-20230424   gcc  
x86_64               randconfig-a016-20230424   gcc  
x86_64               randconfig-r024-20230424   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r011-20230423   gcc  
xtensa               randconfig-r021-20230424   gcc  
xtensa               randconfig-r026-20230423   gcc  
xtensa               randconfig-r033-20230423   gcc  
xtensa               randconfig-r034-20230423   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
