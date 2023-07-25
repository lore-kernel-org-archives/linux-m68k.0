Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3193BC001B0
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jul 2023 01:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjGYBZP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jul 2023 21:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjGYBZO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jul 2023 21:25:14 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AEEB171E
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 18:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690248313; x=1721784313;
  h=date:from:to:cc:subject:message-id;
  bh=kpntpA/D1y2UKT1bkol9SkDmcQayX50zIL0KCAXyo2w=;
  b=lUP8gLaqnPE24uz60UP0EHZulKU+Dg3Ay8gMqtYvEj+CGfn0ra0AAx7b
   SI6uM/zEQrPnmYr/+HOIk9sk1ksfRbQPTbyzx0KvckPUtiFYr3RkIBSQK
   19TVy08OUDfINYV6c8osFCZ665yAIoLY/tmUiKzsQuiK9qBiOhWOE+ayB
   AfmQXFlJoqaLd/svClk/UuS2Mxre5I34w5ZVyvM1AsAsGVBIVXzINMHAS
   eEqtWuwJ5ucjT3OvLXSCRJCEReuoLmaBe7SecgkuJMc9Gp8262R0drJer
   dZgaUc2KX7vhZ1f00PKNApK26fDHIUgWLA1XVuGfE6b705KYwJMzQtpCr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="433841477"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="433841477"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 18:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="839671669"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="839671669"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2023 18:25:10 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qO6nW-000AAZ-0J;
        Tue, 25 Jul 2023 01:25:10 +0000
Date:   Tue, 25 Jul 2023 09:25:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.6] BUILD SUCCESS
 922a9bd138101e3e5718f0f4d40dba68ef89bb43
Message-ID: <202307250958.zlxc15JU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.6
branch HEAD: 922a9bd138101e3e5718f0f4d40dba68ef89bb43  m68k: Fix invalid .section syntax

elapsed time: 727m

configs tested: 141
configs skipped: 136

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230724   gcc  
alpha                randconfig-r016-20230724   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                  randconfig-r002-20230724   clang
arm                  randconfig-r011-20230724   gcc  
arm                           stm32_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r031-20230724   gcc  
csky                                defconfig   gcc  
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
loongarch                 loongson3_defconfig   gcc  
loongarch            randconfig-r016-20230724   gcc  
loongarch            randconfig-r025-20230724   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                 randconfig-r023-20230724   gcc  
m68k                 randconfig-r035-20230724   gcc  
microblaze           randconfig-r001-20230724   gcc  
microblaze           randconfig-r004-20230724   gcc  
microblaze           randconfig-r015-20230724   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                 randconfig-r004-20230724   clang
nios2                         3c120_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230724   gcc  
openrisc             randconfig-r012-20230724   gcc  
openrisc             randconfig-r021-20230724   gcc  
openrisc             randconfig-r026-20230724   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230724   gcc  
parisc               randconfig-r005-20230724   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc              randconfig-r006-20230724   gcc  
powerpc              randconfig-r023-20230724   clang
powerpc                     stx_gp3_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230724   gcc  
riscv                randconfig-r042-20230724   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230724   clang
sh                               allmodconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                   randconfig-r004-20230724   gcc  
sh                   randconfig-r013-20230724   gcc  
sh                             sh03_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230724   gcc  
sparc                randconfig-r005-20230724   gcc  
sparc                randconfig-r012-20230724   gcc  
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
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa               randconfig-r003-20230724   gcc  
xtensa               randconfig-r012-20230724   gcc  
xtensa               randconfig-r015-20230724   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
