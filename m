Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D64C77B75
	for <linux-m68k@archiver.kernel.org>; Tue, 23 May 2023 01:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbjEWBMm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 22 May 2023 21:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234035AbjEWBMk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 22 May 2023 21:12:40 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C384D95
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 18:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684804358; x=1716340358;
  h=date:from:to:cc:subject:message-id;
  bh=EtkAgaBKTT4sMEuC2ULwbk6yrhvhIhJL/mo2Jk+6Q6U=;
  b=U+OGLkCMO+BjLseWsvtNcyb6AIiaFEtq9s0ButaewrmXSvJ0nE8kei2P
   U37tHBJUWX7bwJTAdsxn/QHYCJf99vzKbrRKzz3YkatZS4miLc8h33+BR
   roLEDl/0iVYoLCBRikvkjamTF/FCJ2hj9hirXPV6ejVlR97j0Cserow0m
   vU11CBfErit9pRG8x2fcrHjI2omIbe1pJZy/R8wXriOBvavgUayeTVbZp
   7+XlH1GY0+VHf+zVPDjGIzSiGaTG94INZivVk+CKM51yMzkIV8tkQghPd
   mkVbVXN8bAWSJ0XKrBM/cCTkH2Rfdx0uRPU30hehva23fEJJT/fzfjt+f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="342546118"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="342546118"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 18:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="950330429"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="950330429"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 May 2023 18:12:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q1GZm-000DOH-1a;
        Tue, 23 May 2023 01:12:34 +0000
Date:   Tue, 23 May 2023 09:11:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.4] BUILD SUCCESS
 b845b574f86dcb6a70dfa698aa87a237b0878d2a
Message-ID: <20230523011156.rIeIU%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: INFO setup_repo_specs: /db/releases/20230522162832/lkp-src/repo/*/geert-m68k
https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.4
branch HEAD: b845b574f86dcb6a70dfa698aa87a237b0878d2a  m68k: Move signal frame following exception on 68020/030

elapsed time: 722m

configs tested: 138
configs skipped: 185

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r006-20230521   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230522   gcc  
alpha                randconfig-r013-20230521   gcc  
alpha                randconfig-r036-20230522   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230522   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230521   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                  randconfig-r003-20230521   gcc  
arm                  randconfig-r046-20230522   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230521   gcc  
csky                 randconfig-r012-20230521   gcc  
csky                 randconfig-r035-20230521   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230522   gcc  
i386                 randconfig-a002-20230522   gcc  
i386                 randconfig-a003-20230522   gcc  
i386                 randconfig-a004-20230522   gcc  
i386                 randconfig-a005-20230522   gcc  
i386                 randconfig-a006-20230522   gcc  
i386                 randconfig-a011-20230522   clang
i386                 randconfig-a012-20230522   clang
i386                 randconfig-a013-20230522   clang
i386                 randconfig-a014-20230522   clang
i386                 randconfig-a015-20230522   clang
i386                 randconfig-a016-20230522   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230521   gcc  
ia64                 randconfig-r016-20230521   gcc  
ia64                          tiger_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230521   gcc  
loongarch            randconfig-r012-20230522   gcc  
loongarch            randconfig-r034-20230521   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
microblaze   buildonly-randconfig-r006-20230522   gcc  
mips                             allmodconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                 randconfig-r036-20230521   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r015-20230522   gcc  
openrisc             randconfig-r032-20230521   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc      buildonly-randconfig-r002-20230521   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc                      ppc40x_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc              randconfig-r004-20230522   gcc  
powerpc              randconfig-r032-20230522   gcc  
powerpc                         wii_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230521   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230521   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230521   gcc  
sh                               allmodconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                   randconfig-r003-20230522   gcc  
sh                   randconfig-r006-20230521   gcc  
sh                   randconfig-r034-20230522   gcc  
sh                          sdk7786_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r033-20230521   gcc  
sparc                randconfig-r035-20230522   gcc  
sparc64      buildonly-randconfig-r003-20230522   gcc  
sparc64      buildonly-randconfig-r005-20230521   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r005-20230522   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230522   gcc  
x86_64               randconfig-a002-20230522   gcc  
x86_64               randconfig-a003-20230522   gcc  
x86_64               randconfig-a004-20230522   gcc  
x86_64               randconfig-a005-20230522   gcc  
x86_64               randconfig-a006-20230522   gcc  
x86_64               randconfig-a011-20230522   clang
x86_64               randconfig-a012-20230522   clang
x86_64               randconfig-a013-20230522   clang
x86_64               randconfig-a014-20230522   clang
x86_64               randconfig-a015-20230522   clang
x86_64               randconfig-a016-20230522   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-x051-20230522   clang
x86_64               randconfig-x052-20230522   clang
x86_64               randconfig-x053-20230522   clang
x86_64               randconfig-x054-20230522   clang
x86_64               randconfig-x055-20230522   clang
x86_64               randconfig-x056-20230522   clang
x86_64               randconfig-x061-20230522   clang
x86_64               randconfig-x062-20230522   clang
x86_64               randconfig-x063-20230522   clang
x86_64               randconfig-x064-20230522   clang
x86_64               randconfig-x065-20230522   clang
x86_64               randconfig-x066-20230522   clang
x86_64               randconfig-x071-20230522   gcc  
x86_64               randconfig-x072-20230522   gcc  
x86_64               randconfig-x073-20230522   gcc  
x86_64               randconfig-x074-20230522   gcc  
x86_64               randconfig-x075-20230522   gcc  
x86_64               randconfig-x076-20230522   gcc  
x86_64               randconfig-x081-20230522   gcc  
x86_64               randconfig-x082-20230522   gcc  
x86_64               randconfig-x083-20230522   gcc  
x86_64               randconfig-x084-20230522   gcc  
x86_64               randconfig-x085-20230522   gcc  
x86_64               randconfig-x086-20230522   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r031-20230522   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
