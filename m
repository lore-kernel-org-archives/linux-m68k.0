Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BADDEB64DD
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jul 2023 01:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjGYBZO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jul 2023 21:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjGYBZO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jul 2023 21:25:14 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B761712
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 18:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690248312; x=1721784312;
  h=date:from:to:cc:subject:message-id;
  bh=dPIr949/JUcJ6qpzUw5HqwlJwadXB/iDGREv7LnjZTE=;
  b=EN4RvySofgzBV+o/Xm6CTn6V8rfu7nEqUsnbpfOZkZGM76lJ7Q4z5TMX
   fDM/Q4FiM6zviFMGWzLB7w5DbLgKIuNKzH5WpjHIAmLJAoQPl6xpX9kA/
   KLGXpI+PlWLrI+hCw75qSKZE9Ptoglx2FVzWLdzn1093zhVn1MylgD8Kz
   Zk09WMFYna8I45wwcHDE8Q2KfdfZxTUikmgbmiRFqHDAcqVAw+AYRKwHj
   LHhkxsdT9JJXTrsDXkXe7x4PUVU/wbgLDoLIvpX1e6ao05ljEvxLvPMRw
   GctKr8gyru+1QWZRkUYZ0896nw8nl7AbmjE1UshDPuQNdZpHRExxmjH5i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="365051183"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="365051183"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 18:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="972472916"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="972472916"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jul 2023 18:25:11 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qO6nW-000AAq-0s;
        Tue, 25 Jul 2023 01:25:10 +0000
Date:   Tue, 25 Jul 2023 09:24:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 cd76bba726300611d2add29cb025db2b42d70b41
Message-ID: <202307250924.e9R3MRoj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: cd76bba726300611d2add29cb025db2b42d70b41  m68k: Fix invalid .section syntax

elapsed time: 726m

configs tested: 135
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230724   gcc  
alpha                randconfig-r016-20230724   gcc  
alpha                randconfig-r032-20230724   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230724   gcc  
arc                  randconfig-r035-20230724   gcc  
arc                  randconfig-r043-20230724   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r011-20230724   gcc  
arm                  randconfig-r046-20230724   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230724   clang
arm64                randconfig-r031-20230724   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r036-20230724   clang
hexagon              randconfig-r041-20230724   clang
hexagon              randconfig-r045-20230724   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230723   clang
i386         buildonly-randconfig-r004-20230724   gcc  
i386         buildonly-randconfig-r005-20230723   clang
i386         buildonly-randconfig-r005-20230724   gcc  
i386         buildonly-randconfig-r006-20230723   clang
i386         buildonly-randconfig-r006-20230724   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230724   gcc  
i386                 randconfig-i002-20230724   gcc  
i386                 randconfig-i003-20230724   gcc  
i386                 randconfig-i004-20230724   gcc  
i386                 randconfig-i005-20230724   gcc  
i386                 randconfig-i006-20230724   gcc  
i386                 randconfig-i011-20230724   clang
i386                 randconfig-i012-20230724   clang
i386                 randconfig-i013-20230724   clang
i386                 randconfig-i014-20230724   clang
i386                 randconfig-i015-20230724   clang
i386                 randconfig-i016-20230724   clang
i386                 randconfig-r025-20230724   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r025-20230724   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r021-20230724   gcc  
m68k                 randconfig-r023-20230724   gcc  
m68k                 randconfig-r033-20230724   gcc  
m68k                 randconfig-r035-20230724   gcc  
microblaze           randconfig-r004-20230724   gcc  
microblaze           randconfig-r015-20230724   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230724   gcc  
nios2                randconfig-r011-20230724   gcc  
openrisc             randconfig-r012-20230724   gcc  
openrisc             randconfig-r021-20230724   gcc  
openrisc             randconfig-r026-20230724   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230724   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r004-20230724   gcc  
powerpc              randconfig-r006-20230724   gcc  
powerpc              randconfig-r014-20230724   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230724   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r026-20230724   clang
s390                 randconfig-r044-20230724   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230724   gcc  
sh                   randconfig-r004-20230724   gcc  
sh                   randconfig-r012-20230724   gcc  
sh                   randconfig-r013-20230724   gcc  
sh                   randconfig-r022-20230724   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230724   gcc  
sparc                randconfig-r005-20230724   gcc  
sparc                randconfig-r012-20230724   gcc  
sparc                randconfig-r031-20230724   gcc  
sparc64              randconfig-r003-20230724   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230723   clang
x86_64       buildonly-randconfig-r001-20230724   gcc  
x86_64       buildonly-randconfig-r002-20230723   clang
x86_64       buildonly-randconfig-r002-20230724   gcc  
x86_64       buildonly-randconfig-r003-20230723   clang
x86_64       buildonly-randconfig-r003-20230724   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r006-20230724   gcc  
x86_64               randconfig-r011-20230724   clang
x86_64               randconfig-r013-20230724   clang
x86_64               randconfig-r023-20230724   clang
x86_64               randconfig-r024-20230724   clang
x86_64               randconfig-r034-20230724   gcc  
x86_64               randconfig-x001-20230724   clang
x86_64               randconfig-x002-20230724   clang
x86_64               randconfig-x003-20230724   clang
x86_64               randconfig-x004-20230724   clang
x86_64               randconfig-x005-20230724   clang
x86_64               randconfig-x006-20230724   clang
x86_64               randconfig-x011-20230724   gcc  
x86_64               randconfig-x012-20230724   gcc  
x86_64               randconfig-x013-20230724   gcc  
x86_64               randconfig-x014-20230724   gcc  
x86_64               randconfig-x015-20230724   gcc  
x86_64               randconfig-x016-20230724   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r003-20230724   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
