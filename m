Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14BCC77B76
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Apr 2023 20:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjDUUqg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Apr 2023 16:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjDUUqb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Apr 2023 16:46:31 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B611FD9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Apr 2023 13:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682109989; x=1713645989;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XL8HXAsI4nxqT+xpygeaIthp99RbDnAE+W94Ddf+ZUE=;
  b=Wd2xtBOTmObYESlOh+z/YGkcvdquEWDg9SY684rrYfzzjOyIJ2Y1l3iO
   y01kQ1fxR8oB+ta1XR8BPZZVCujUz1+wvIoq1BpYouDXxVBl6Re7w0oyS
   SmSMrHZoQw92yK745dqNVjBipaFnQjdEhTMlegjoUH/EV68RhdQA0hH6d
   9Z2N+M86VXdZL/ODRI6Lm4vDxX1DZTZpzjNxJRGjNe1jTHIO37qtjUqfI
   f/nof6isUmX6yLeRzQF79EyrJB7hYhJkw07Sr3EF3H1yihJ/KFnRVc7ev
   Cx1ttTyNFPbigsGH8ONd3meQq9sUaB8ptDm6FMnKxNiCNwYFUA5MmaSZ3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="347988154"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="347988154"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 13:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="761698196"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="761698196"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2023 13:46:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ppxeA-000gnL-1L;
        Fri, 21 Apr 2023 20:46:22 +0000
Date:   Sat, 22 Apr 2023 04:46:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.4] BUILD SUCCESS
 aaee8c7f2a17d2dd015dc97c113c9ea0cc97272a
Message-ID: <6442f612.mksmWFbXmtnfYlmD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.4
branch HEAD: aaee8c7f2a17d2dd015dc97c113c9ea0cc97272a  m68k: kexec: Include <linux/reboot.h>

elapsed time: 724m

configs tested: 248
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230417   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230416   gcc  
alpha                randconfig-r014-20230416   gcc  
alpha                randconfig-r015-20230416   gcc  
alpha                randconfig-r021-20230416   gcc  
alpha                randconfig-r022-20230416   gcc  
alpha                randconfig-r023-20230421   gcc  
alpha                randconfig-r025-20230417   gcc  
alpha                randconfig-r033-20230416   gcc  
alpha                randconfig-r033-20230420   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230416   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230417   gcc  
arc                  randconfig-r013-20230417   gcc  
arc                  randconfig-r031-20230421   gcc  
arc                  randconfig-r032-20230416   gcc  
arc                  randconfig-r033-20230421   gcc  
arc                  randconfig-r043-20230419   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230416   gcc  
arm                  randconfig-r002-20230417   clang
arm                  randconfig-r005-20230421   clang
arm                  randconfig-r011-20230416   clang
arm                  randconfig-r022-20230417   gcc  
arm                  randconfig-r031-20230418   gcc  
arm                  randconfig-r032-20230416   gcc  
arm                  randconfig-r046-20230419   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230418   clang
arm64                randconfig-r004-20230417   gcc  
arm64                randconfig-r006-20230416   clang
arm64                randconfig-r035-20230417   gcc  
arm64                randconfig-r036-20230417   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230416   gcc  
csky                 randconfig-r012-20230421   gcc  
csky                 randconfig-r021-20230420   gcc  
csky                 randconfig-r024-20230420   gcc  
csky                 randconfig-r025-20230416   gcc  
csky                 randconfig-r025-20230421   gcc  
csky                 randconfig-r026-20230420   gcc  
csky                 randconfig-r032-20230417   gcc  
csky                 randconfig-r032-20230420   gcc  
csky                 randconfig-r036-20230420   gcc  
csky                 randconfig-r036-20230421   gcc  
hexagon      buildonly-randconfig-r003-20230417   clang
hexagon              randconfig-r005-20230416   clang
hexagon              randconfig-r006-20230418   clang
hexagon              randconfig-r014-20230417   clang
hexagon              randconfig-r021-20230417   clang
hexagon              randconfig-r024-20230416   clang
hexagon              randconfig-r036-20230418   clang
hexagon              randconfig-r041-20230419   clang
hexagon              randconfig-r041-20230421   clang
hexagon              randconfig-r045-20230419   clang
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
ia64         buildonly-randconfig-r002-20230417   gcc  
ia64         buildonly-randconfig-r005-20230416   gcc  
ia64         buildonly-randconfig-r005-20230421   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230417   gcc  
ia64                 randconfig-r021-20230416   gcc  
ia64                 randconfig-r022-20230416   gcc  
ia64                 randconfig-r022-20230421   gcc  
ia64                 randconfig-r024-20230417   gcc  
ia64                 randconfig-r036-20230418   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230418   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230421   gcc  
loongarch            randconfig-r022-20230420   gcc  
loongarch            randconfig-r031-20230420   gcc  
loongarch            randconfig-r034-20230420   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r005-20230418   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230416   gcc  
m68k                 randconfig-r014-20230421   gcc  
m68k                 randconfig-r015-20230417   gcc  
m68k                 randconfig-r016-20230416   gcc  
m68k                 randconfig-r025-20230420   gcc  
m68k                 randconfig-r033-20230418   gcc  
m68k                 randconfig-r034-20230417   gcc  
microblaze   buildonly-randconfig-r003-20230418   gcc  
microblaze           randconfig-r001-20230417   gcc  
microblaze           randconfig-r004-20230418   gcc  
microblaze           randconfig-r006-20230417   gcc  
microblaze           randconfig-r012-20230417   gcc  
microblaze           randconfig-r013-20230421   gcc  
microblaze           randconfig-r026-20230416   gcc  
microblaze           randconfig-r026-20230417   gcc  
microblaze           randconfig-r034-20230418   gcc  
microblaze           randconfig-r036-20230416   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230416   gcc  
mips                 randconfig-r003-20230417   clang
mips                 randconfig-r013-20230416   clang
mips                 randconfig-r022-20230417   gcc  
mips                 randconfig-r031-20230417   clang
mips                 randconfig-r031-20230418   gcc  
mips                 randconfig-r033-20230416   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230416   gcc  
nios2                randconfig-r003-20230418   gcc  
openrisc     buildonly-randconfig-r003-20230421   gcc  
openrisc     buildonly-randconfig-r006-20230417   gcc  
openrisc             randconfig-r005-20230418   gcc  
openrisc             randconfig-r011-20230416   gcc  
openrisc             randconfig-r015-20230417   gcc  
openrisc             randconfig-r016-20230416   gcc  
openrisc             randconfig-r024-20230416   gcc  
openrisc             randconfig-r024-20230420   gcc  
openrisc             randconfig-r033-20230420   gcc  
openrisc             randconfig-r035-20230420   gcc  
parisc       buildonly-randconfig-r002-20230421   gcc  
parisc       buildonly-randconfig-r004-20230416   gcc  
parisc       buildonly-randconfig-r004-20230417   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230417   gcc  
parisc               randconfig-r024-20230421   gcc  
parisc               randconfig-r026-20230416   gcc  
parisc               randconfig-r031-20230417   gcc  
parisc               randconfig-r032-20230418   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230417   clang
powerpc              randconfig-r002-20230416   clang
powerpc              randconfig-r003-20230416   clang
powerpc              randconfig-r005-20230417   gcc  
powerpc              randconfig-r023-20230420   gcc  
powerpc              randconfig-r025-20230420   gcc  
powerpc              randconfig-r031-20230416   clang
powerpc              randconfig-r032-20230418   clang
powerpc              randconfig-r032-20230421   gcc  
powerpc              randconfig-r033-20230417   gcc  
powerpc              randconfig-r036-20230416   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230418   clang
riscv                randconfig-r016-20230417   clang
riscv                randconfig-r023-20230416   gcc  
riscv                randconfig-r035-20230421   gcc  
riscv                randconfig-r042-20230419   clang
riscv                randconfig-r042-20230421   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230416   gcc  
s390                 randconfig-r025-20230416   gcc  
s390                 randconfig-r034-20230417   gcc  
s390                 randconfig-r034-20230418   clang
s390                 randconfig-r044-20230419   clang
s390                 randconfig-r044-20230421   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230416   gcc  
sh                   randconfig-r013-20230416   gcc  
sh                   randconfig-r023-20230417   gcc  
sh                   randconfig-r035-20230416   gcc  
sparc        buildonly-randconfig-r001-20230416   gcc  
sparc        buildonly-randconfig-r002-20230418   gcc  
sparc        buildonly-randconfig-r004-20230421   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230417   gcc  
sparc                randconfig-r011-20230417   gcc  
sparc                randconfig-r012-20230416   gcc  
sparc                randconfig-r013-20230417   gcc  
sparc                randconfig-r032-20230420   gcc  
sparc                randconfig-r034-20230421   gcc  
sparc64      buildonly-randconfig-r001-20230421   gcc  
sparc64      buildonly-randconfig-r002-20230416   gcc  
sparc64              randconfig-r003-20230416   gcc  
sparc64              randconfig-r003-20230417   gcc  
sparc64              randconfig-r005-20230416   gcc  
sparc64              randconfig-r021-20230420   gcc  
sparc64              randconfig-r025-20230417   gcc  
sparc64              randconfig-r033-20230417   gcc  
sparc64              randconfig-r035-20230420   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
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
x86_64                        randconfig-k001   clang
x86_64               randconfig-r012-20230417   clang
x86_64               randconfig-r021-20230417   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230418   gcc  
xtensa               randconfig-r014-20230417   gcc  
xtensa               randconfig-r021-20230421   gcc  
xtensa               randconfig-r023-20230416   gcc  
xtensa               randconfig-r024-20230417   gcc  
xtensa               randconfig-r034-20230416   gcc  
xtensa               randconfig-r035-20230417   gcc  
xtensa               randconfig-r035-20230418   gcc  
xtensa               randconfig-r036-20230417   gcc  
xtensa               randconfig-r036-20230420   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
