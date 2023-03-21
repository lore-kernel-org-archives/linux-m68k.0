Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC41C6FD1D
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Mar 2023 02:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjCUC5O (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Mar 2023 22:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjCUC5N (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Mar 2023 22:57:13 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7ED51CF4A
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 19:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679367432; x=1710903432;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qd+bkvAevVVTfJfW0585PaP9vYxlmhZ3YEQoZwrcVyU=;
  b=Sxq8ED3N9fi8ZbjofOKfFoodEM+dVwiy1d45Wm93zFbiEWkBrztCAEsD
   FQRy059h7yBTx/Kwv9z8if7VAvCexoztpREKKyP06bhlvl4jsDzvzkTXM
   3pvpqZNop9L+jy9ODI0TLdX7yXqqvXJRyA84Qki8ts4NZlFc1Tq8ui0aG
   LRo9dmteJ+iuwXfOMWDSYYRw+FXjit7EGVKO8sF9aIvLLdavPWo1jhGpy
   r/Yq96d7kF12OaDYiXeylZV77sK21OrU2mtZu8r8tNhvTU9itAVbt0Zcg
   MG25O0Ej0rAZe9mfLGJJWL18DilmnaPFRQ+wHZwDvsWEXj08uPpI5CivX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318484097"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="318484097"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 19:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="658617276"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="658617276"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Mar 2023 19:57:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1peSBQ-000BX0-0i;
        Tue, 21 Mar 2023 02:57:08 +0000
Date:   Tue, 21 Mar 2023 10:57:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 b55f773e598a93232307dc61278cdf081adad7fa
Message-ID: <64191d00.HxX38M13K1+bBKRE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: b55f773e598a93232307dc61278cdf081adad7fa  m68k: Remove obsolete config NO_KERNEL_MSG

elapsed time: 732m

configs tested: 98
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r021-20230319   gcc  
alpha                randconfig-r031-20230319   gcc  
alpha                randconfig-r033-20230319   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r025-20230319   gcc  
arc                  randconfig-r043-20230319   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230319   gcc  
arm          buildonly-randconfig-r004-20230319   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r024-20230319   gcc  
arm                  randconfig-r046-20230319   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230320   gcc  
arm64                randconfig-r016-20230320   gcc  
csky         buildonly-randconfig-r003-20230319   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230319   gcc  
csky                 randconfig-r035-20230319   gcc  
hexagon              randconfig-r041-20230319   clang
hexagon              randconfig-r045-20230319   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230320   gcc  
i386                 randconfig-a012-20230320   gcc  
i386                 randconfig-a013-20230320   gcc  
i386                 randconfig-a014-20230320   gcc  
i386                 randconfig-a015-20230320   gcc  
i386                 randconfig-a016-20230320   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r036-20230319   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r022-20230319   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230320   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230319   clang
nios2                               defconfig   gcc  
nios2                randconfig-r034-20230319   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r002-20230319   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230319   gcc  
riscv                randconfig-r042-20230319   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230319   clang
sh                               allmodconfig   gcc  
sparc        buildonly-randconfig-r006-20230319   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r015-20230320   gcc  
sparc                randconfig-r032-20230319   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230320   clang
x86_64               randconfig-a002-20230320   clang
x86_64               randconfig-a003-20230320   clang
x86_64               randconfig-a004-20230320   clang
x86_64               randconfig-a005-20230320   clang
x86_64               randconfig-a006-20230320   clang
x86_64               randconfig-a011-20230320   gcc  
x86_64               randconfig-a012-20230320   gcc  
x86_64               randconfig-a013-20230320   gcc  
x86_64               randconfig-a014-20230320   gcc  
x86_64               randconfig-a015-20230320   gcc  
x86_64               randconfig-a016-20230320   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r012-20230320   gcc  
xtensa               randconfig-r023-20230319   gcc  
xtensa               randconfig-r026-20230319   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
