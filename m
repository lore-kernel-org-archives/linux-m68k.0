Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CF3C77B76
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Apr 2023 22:22:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbjDXWWH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Apr 2023 18:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbjDXWWG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Apr 2023 18:22:06 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3745B83E4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Apr 2023 15:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682374925; x=1713910925;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eksbXcG4S7TuCHBMlayY0SbFdB1Sh4IRSS2njb4fthE=;
  b=loxAOHwqtb1R7rRqtfKPuipg1UX9Su22P3sz+N6MBnv1ueh26GkSKFpZ
   LxAV3IQtVxPwZNl49qSLEzPjW7+ztHq5riNqxXiP60e1/9Endev/ShW36
   W+tzOfKUtLbdT6arTQK40i7O28rfDnsSssZIe/T9YAlEyEuFMueKfBsJl
   gk/Jv1K9WcI8luakdbl1vMApKtSPKVkVydNJWCwfsS3CND+04Du6hS4eH
   XJMj8qMxxd/8CwXh3CrrLHZmJwYXzctJk8x9/aVh3zkfN/5YvZZvHj/tO
   OBA3Cl6yhl76aKwxbHROo/bah5xuYInSteOxE0tFmTzZo5y24bvAGwe02
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="374525211"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="374525211"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 15:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="695921227"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="695921227"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Apr 2023 15:22:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pr4ZO-000igX-0T;
        Mon, 24 Apr 2023 22:22:02 +0000
Date:   Tue, 25 Apr 2023 06:21:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v6.3] BUILD SUCCESS
 cb5ba378fb518c884bd3d2a197be340d88851629
Message-ID: <644700ea.9zBMgZq5SzzCLcGS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v6.3
branch HEAD: cb5ba378fb518c884bd3d2a197be340d88851629  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 729m

configs tested: 123
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230423   gcc  
alpha                randconfig-r013-20230424   gcc  
alpha                randconfig-r034-20230423   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230423   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230423   gcc  
arc                  randconfig-r016-20230424   gcc  
arc                  randconfig-r024-20230423   gcc  
arc                  randconfig-r043-20230423   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230424   gcc  
arm                  randconfig-r021-20230424   clang
arm                  randconfig-r025-20230424   clang
arm                  randconfig-r035-20230424   gcc  
arm                  randconfig-r046-20230423   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230424   clang
arm64                randconfig-r015-20230423   clang
arm64                randconfig-r022-20230423   clang
csky                                defconfig   gcc  
csky                 randconfig-r003-20230423   gcc  
csky                 randconfig-r033-20230424   gcc  
hexagon      buildonly-randconfig-r006-20230423   clang
hexagon              randconfig-r025-20230423   clang
hexagon              randconfig-r035-20230423   clang
hexagon              randconfig-r041-20230423   clang
hexagon              randconfig-r045-20230423   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230424   clang
i386                 randconfig-a002-20230424   clang
i386                 randconfig-a003-20230424   clang
i386                 randconfig-a004-20230424   clang
i386                 randconfig-a005-20230424   clang
i386                 randconfig-a006-20230424   clang
i386                 randconfig-a011-20230424   gcc  
i386                 randconfig-a012-20230424   gcc  
i386                 randconfig-a013-20230424   gcc  
i386                 randconfig-a014-20230424   gcc  
i386                 randconfig-a015-20230424   gcc  
i386                 randconfig-a016-20230424   gcc  
i386                 randconfig-r032-20230424   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230424   gcc  
ia64         buildonly-randconfig-r004-20230423   gcc  
ia64         buildonly-randconfig-r005-20230423   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230423   gcc  
ia64                 randconfig-r014-20230423   gcc  
ia64                 randconfig-r032-20230423   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230424   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r034-20230424   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230424   gcc  
m68k                 randconfig-r016-20230423   gcc  
microblaze           randconfig-r011-20230423   gcc  
microblaze           randconfig-r011-20230424   gcc  
microblaze           randconfig-r015-20230424   gcc  
microblaze           randconfig-r022-20230424   gcc  
microblaze           randconfig-r026-20230423   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r003-20230423   clang
mips         buildonly-randconfig-r004-20230424   gcc  
mips                 randconfig-r036-20230424   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r006-20230424   gcc  
parisc       buildonly-randconfig-r005-20230424   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230423   gcc  
parisc               randconfig-r036-20230423   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230423   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230424   clang
s390                 randconfig-r044-20230423   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230424   gcc  
sh                   randconfig-r012-20230424   gcc  
sh                   randconfig-r024-20230424   gcc  
sh                   randconfig-r031-20230423   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r013-20230423   gcc  
sparc64              randconfig-r021-20230423   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
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
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230424   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
