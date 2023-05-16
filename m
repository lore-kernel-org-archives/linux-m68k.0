Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7757C77B75
	for <linux-m68k@archiver.kernel.org>; Tue, 16 May 2023 02:47:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjEPCrz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 May 2023 22:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjEPCry (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 15 May 2023 22:47:54 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4B0E48
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 May 2023 19:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684205272; x=1715741272;
  h=date:from:to:cc:subject:message-id;
  bh=f2Co/bwhSvleZZg5ABlNo8eNKxx/pwaQoOuvSDJs5MA=;
  b=LHq9o/rOOCwxe+GpjZ91+ISzjTA1+8dYrTFcJ33XpkuUn+e608mp2ffx
   zFh6Q4g15RSE0hsjEqSRWmM/rKKRPLJ/fM95R7TOZWZu5BG+oP5QUy/nd
   B1RuPjqvGckxC1z4uePMFpLC5JiRZjNMsAWH/Q3VeAQPtU3bfJvgMNmXD
   PaALplx+rKzHEdSRwJa/TGjm5RIYTSzFW0VWfK96zbsx92N34S0mprUfd
   q1QG2YRsTuJDob5oomek52kHFJqiUXjPxSGL6SwPCE4NK0ZEinS8QAPIK
   cpY79gpNZPArlSYvOZr3s81/du6yl+wCc2mKXEWXCXdW0b7VelJQ2Focf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="350201451"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="350201451"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 19:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="695265325"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="695265325"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 May 2023 19:47:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pykj7-0006tw-3D;
        Tue, 16 May 2023 02:47:49 +0000
Date:   Tue, 16 May 2023 10:47:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.5] BUILD SUCCESS
 4decdb267a4712b4cb56f9bd8cdcd6d9af1c3352
Message-ID: <20230516024741.Koxwz%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: INFO setup_repo_specs: /db/releases/20230516094411/lkp-src/repo/*/geert-m68k
https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.5
branch HEAD: 4decdb267a4712b4cb56f9bd8cdcd6d9af1c3352  nubus: Remove proc entries before adding them

elapsed time: 931m

configs tested: 218
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230515   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230515   gcc  
alpha                randconfig-r033-20230515   gcc  
alpha                randconfig-r034-20230515   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230515   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                  randconfig-r001-20230515   gcc  
arc                  randconfig-r023-20230515   gcc  
arc                  randconfig-r043-20230515   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                  randconfig-r002-20230515   gcc  
arm                  randconfig-r004-20230515   gcc  
arm                  randconfig-r046-20230515   clang
arm                       versatile_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230515   gcc  
arm64                randconfig-r014-20230515   gcc  
arm64                randconfig-r015-20230515   gcc  
arm64                randconfig-r022-20230515   gcc  
csky         buildonly-randconfig-r001-20230515   gcc  
csky         buildonly-randconfig-r002-20230515   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230515   gcc  
csky                 randconfig-r022-20230515   gcc  
csky                 randconfig-r031-20230515   gcc  
hexagon              randconfig-r006-20230515   clang
hexagon              randconfig-r041-20230515   clang
hexagon              randconfig-r045-20230515   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230515   clang
i386                 randconfig-a002-20230515   clang
i386                 randconfig-a003-20230515   clang
i386                 randconfig-a004-20230515   clang
i386                 randconfig-a005-20230515   clang
i386                 randconfig-a006-20230515   clang
i386                 randconfig-a011-20230515   gcc  
i386                 randconfig-a012-20230515   gcc  
i386                 randconfig-a013-20230515   gcc  
i386                 randconfig-a014-20230515   gcc  
i386                 randconfig-a015-20230515   gcc  
i386                 randconfig-a016-20230515   gcc  
i386                 randconfig-i051-20230515   clang
i386                 randconfig-i052-20230515   clang
i386                 randconfig-i053-20230515   clang
i386                 randconfig-i054-20230515   clang
i386                 randconfig-i055-20230515   clang
i386                 randconfig-i056-20230515   clang
i386                 randconfig-i061-20230515   clang
i386                 randconfig-i062-20230515   clang
i386                 randconfig-i063-20230515   clang
i386                 randconfig-i064-20230515   clang
i386                 randconfig-i065-20230515   clang
i386                 randconfig-i066-20230515   clang
i386                 randconfig-i071-20230515   gcc  
i386                          randconfig-i071   clang
i386                 randconfig-i072-20230515   gcc  
i386                 randconfig-i073-20230515   gcc  
i386                          randconfig-i073   clang
i386                 randconfig-i074-20230515   gcc  
i386                 randconfig-i075-20230515   gcc  
i386                          randconfig-i075   clang
i386                 randconfig-i076-20230515   gcc  
i386                 randconfig-i081-20230515   gcc  
i386                 randconfig-i082-20230515   gcc  
i386                 randconfig-i083-20230515   gcc  
i386                 randconfig-i084-20230515   gcc  
i386                 randconfig-i085-20230515   gcc  
i386                 randconfig-i086-20230515   gcc  
i386                 randconfig-i091-20230515   clang
i386                 randconfig-i092-20230515   clang
i386                 randconfig-i093-20230515   clang
i386                 randconfig-i094-20230515   clang
i386                 randconfig-i095-20230515   clang
i386                 randconfig-i096-20230515   clang
i386                 randconfig-r006-20230515   clang
i386                 randconfig-r014-20230515   gcc  
i386                 randconfig-r016-20230515   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r004-20230515   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r005-20230515   gcc  
ia64                 randconfig-r013-20230515   gcc  
ia64                 randconfig-r032-20230515   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r016-20230515   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230515   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230515   gcc  
m68k                 randconfig-r014-20230515   gcc  
m68k                 randconfig-r016-20230515   gcc  
m68k                 randconfig-r034-20230515   gcc  
microblaze           randconfig-r012-20230515   gcc  
microblaze           randconfig-r026-20230515   gcc  
microblaze           randconfig-r036-20230515   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips         buildonly-randconfig-r005-20230515   gcc  
mips                 randconfig-r006-20230515   gcc  
mips                 randconfig-r035-20230515   gcc  
mips                           rs90_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r023-20230515   gcc  
nios2                randconfig-r026-20230515   gcc  
nios2                randconfig-r033-20230515   gcc  
openrisc     buildonly-randconfig-r006-20230515   gcc  
openrisc             randconfig-r015-20230515   gcc  
openrisc             randconfig-r036-20230515   gcc  
parisc       buildonly-randconfig-r005-20230515   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230515   gcc  
parisc               randconfig-r015-20230515   gcc  
parisc               randconfig-r021-20230515   gcc  
parisc               randconfig-r023-20230515   gcc  
parisc               randconfig-r024-20230515   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                   microwatt_defconfig   clang
powerpc              randconfig-r025-20230515   gcc  
powerpc                     tqm8560_defconfig   clang
powerpc                      tqm8xx_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230515   gcc  
riscv        buildonly-randconfig-r006-20230515   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230515   clang
riscv                randconfig-r012-20230515   gcc  
riscv                randconfig-r013-20230515   gcc  
riscv                randconfig-r031-20230515   clang
riscv                randconfig-r042-20230515   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230515   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230515   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230515   gcc  
sh                   randconfig-r001-20230515   gcc  
sh                   randconfig-r033-20230515   gcc  
sparc        buildonly-randconfig-r004-20230515   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r025-20230515   gcc  
sparc                randconfig-r032-20230515   gcc  
sparc                randconfig-r034-20230515   gcc  
sparc64              randconfig-r024-20230515   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230515   clang
x86_64               randconfig-a002-20230515   clang
x86_64               randconfig-a003-20230515   clang
x86_64               randconfig-a004-20230515   clang
x86_64               randconfig-a005-20230515   clang
x86_64               randconfig-a006-20230515   clang
x86_64               randconfig-a011-20230515   gcc  
x86_64               randconfig-a012-20230515   gcc  
x86_64               randconfig-a013-20230515   gcc  
x86_64               randconfig-a014-20230515   gcc  
x86_64               randconfig-a015-20230515   gcc  
x86_64               randconfig-a016-20230515   gcc  
x86_64               randconfig-k001-20230515   gcc  
x86_64               randconfig-x051-20230515   gcc  
x86_64               randconfig-x052-20230515   gcc  
x86_64               randconfig-x053-20230515   gcc  
x86_64               randconfig-x054-20230515   gcc  
x86_64               randconfig-x055-20230515   gcc  
x86_64               randconfig-x056-20230515   gcc  
x86_64               randconfig-x061-20230515   gcc  
x86_64               randconfig-x062-20230515   gcc  
x86_64               randconfig-x063-20230515   gcc  
x86_64               randconfig-x064-20230515   gcc  
x86_64               randconfig-x065-20230515   gcc  
x86_64               randconfig-x066-20230515   gcc  
x86_64               randconfig-x071-20230515   clang
x86_64               randconfig-x072-20230515   clang
x86_64               randconfig-x073-20230515   clang
x86_64               randconfig-x074-20230515   clang
x86_64               randconfig-x075-20230515   clang
x86_64               randconfig-x076-20230515   clang
x86_64               randconfig-x081-20230515   clang
x86_64               randconfig-x082-20230515   clang
x86_64               randconfig-x083-20230515   clang
x86_64               randconfig-x084-20230515   clang
x86_64               randconfig-x085-20230515   clang
x86_64               randconfig-x086-20230515   clang
x86_64               randconfig-x091-20230515   gcc  
x86_64               randconfig-x092-20230515   gcc  
x86_64               randconfig-x093-20230515   gcc  
x86_64               randconfig-x094-20230515   gcc  
x86_64               randconfig-x095-20230515   gcc  
x86_64               randconfig-x096-20230515   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230515   gcc  
xtensa               randconfig-r003-20230515   gcc  
xtensa               randconfig-r025-20230515   gcc  
xtensa               randconfig-r026-20230515   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
