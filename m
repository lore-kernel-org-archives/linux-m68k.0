Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8984DC76196
	for <linux-m68k@archiver.kernel.org>; Mon, 10 Apr 2023 22:14:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjDJWOq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 10 Apr 2023 18:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjDJWOo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 10 Apr 2023 18:14:44 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D50E6C
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Apr 2023 15:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681164883; x=1712700883;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZfsicBcIdCqcDg9fSg4y/PaXlA9ozKubSgFAREqFfW0=;
  b=O6pQkl+nYSkW0z5AZAmPWeHyDk1mTnL5A1JfcE9n88pVg44RNDVLkJyJ
   sxm54y4rLKGV0NfQCMEzQ72Jkmzkp0FkS8hsLSLO6Uh2hDHMrhswc6grB
   dTfpl6jbBdaGtAmhiDJgxnrPTgKnkeydasrcPYOXAvK/qNnVCM6UDvSVU
   ZurhHIlmm3hSx8DpJAYt9d79NGWQqyqdS8Dv7Oexis7RV7wycmdmXGGw+
   JjY+4rB7tErKzFIzg2LZxhWtWnLUSDQ+aJyn7vSFXveoPNKQbbhpKsTa0
   3jAPcbd7JKyB4wRj1J/Nbs5GVaySew5Z3KzckMwpcJ2GiocHU+fs8HxrW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="408604662"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="408604662"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 15:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="638595671"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="638595671"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Apr 2023 15:14:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1plzmZ-000Vgv-2L;
        Mon, 10 Apr 2023 22:14:39 +0000
Date:   Tue, 11 Apr 2023 06:14:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 ca3e36cc6eed6c195a39cdcd740c9d46349bc78b
Message-ID: <64348a3f.QcXXwsY5PaJIwY2O%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: ca3e36cc6eed6c195a39cdcd740c9d46349bc78b  Merge tag 'v6.3-rc6'

elapsed time: 726m

configs tested: 137
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230409   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230410   gcc  
alpha                randconfig-r013-20230410   gcc  
alpha                randconfig-r016-20230409   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230409   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r032-20230410   gcc  
arc                  randconfig-r033-20230409   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r003-20230409   clang
arm64                               defconfig   gcc  
arm64                randconfig-r022-20230409   gcc  
csky         buildonly-randconfig-r004-20230410   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230409   gcc  
csky                 randconfig-r015-20230409   gcc  
csky                 randconfig-r024-20230409   gcc  
hexagon      buildonly-randconfig-r006-20230409   clang
hexagon              randconfig-r006-20230409   clang
hexagon              randconfig-r033-20230410   clang
hexagon              randconfig-r034-20230409   clang
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r041-20230410   clang
hexagon              randconfig-r045-20230409   clang
hexagon              randconfig-r045-20230410   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230410   clang
i386                 randconfig-a002-20230410   clang
i386                 randconfig-a003-20230410   clang
i386                 randconfig-a004-20230410   clang
i386                 randconfig-a005-20230410   clang
i386                 randconfig-a006-20230410   clang
i386                 randconfig-a011-20230410   gcc  
i386                 randconfig-a012-20230410   gcc  
i386                 randconfig-a013-20230410   gcc  
i386                 randconfig-a014-20230410   gcc  
i386                 randconfig-a015-20230410   gcc  
i386                 randconfig-a016-20230410   gcc  
i386                 randconfig-r002-20230410   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r034-20230410   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230410   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230409   gcc  
loongarch            randconfig-r011-20230410   gcc  
loongarch            randconfig-r012-20230409   gcc  
loongarch            randconfig-r015-20230410   gcc  
loongarch            randconfig-r024-20230410   gcc  
loongarch            randconfig-r025-20230409   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r002-20230409   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r016-20230410   gcc  
m68k                 randconfig-r036-20230409   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230410   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230410   gcc  
nios2                randconfig-r021-20230409   gcc  
nios2                randconfig-r035-20230409   gcc  
openrisc     buildonly-randconfig-r005-20230409   gcc  
openrisc     buildonly-randconfig-r006-20230410   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230409   gcc  
parisc               randconfig-r025-20230410   gcc  
parisc               randconfig-r032-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r022-20230410   gcc  
powerpc              randconfig-r031-20230410   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230409   clang
riscv                randconfig-r012-20230410   gcc  
riscv                randconfig-r026-20230410   gcc  
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230410   gcc  
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230410   gcc  
sh                   randconfig-r004-20230409   gcc  
sh                   randconfig-r005-20230409   gcc  
sh                   randconfig-r013-20230409   gcc  
sh                   randconfig-r026-20230409   gcc  
sparc        buildonly-randconfig-r002-20230410   gcc  
sparc        buildonly-randconfig-r005-20230410   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r031-20230409   gcc  
sparc64              randconfig-r005-20230410   gcc  
sparc64              randconfig-r011-20230409   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230410   clang
x86_64               randconfig-a002-20230410   clang
x86_64               randconfig-a003-20230410   clang
x86_64               randconfig-a004-20230410   clang
x86_64               randconfig-a005-20230410   clang
x86_64               randconfig-a006-20230410   clang
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64               randconfig-r006-20230410   clang
x86_64               randconfig-r036-20230410   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r021-20230410   gcc  
xtensa               randconfig-r035-20230410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
