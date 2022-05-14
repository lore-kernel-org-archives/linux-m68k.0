Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF65C433EF
	for <linux-m68k@archiver.kernel.org>; Sat, 14 May 2022 10:08:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbiENKIm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 14 May 2022 06:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbiENKIl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 14 May 2022 06:08:41 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82831FB
        for <linux-m68k@lists.linux-m68k.org>; Sat, 14 May 2022 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652522917; x=1684058917;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8VYhejuWodT/pqZLKCHcq8fw79R1Ajd5hY5uYx+mXok=;
  b=lObgroaDanntJhIkRKWPE9OVqIENiphsno4CZMVraA74crysqMyxdcLK
   EDbFxiZMaRMxEGV1OhhFToCn8H5+J2RgfIPN628s2dV8HOZWP+wDIfNvG
   ggpLj79GBTAhsYDGPGAM8yyH0eGl8YnPffYDvFnKshbeVHetvrysem/vc
   BAyMAhljNlVXQlHNGco8uFIRyY1ubGAH34LJt5GG6uDRKhVNaYZJ0+AMD
   JkvDP4kb3/kNVXrSKfOTJ8+oRuAIow4GypXwGm/1xsS8I010Hr2tY8lOZ
   9xNHY++EgrPMYd7JWpGLHvMY34uz8l9XZx+nkqbia4wZEgWJBUKo8Fqv+
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="258050043"
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="258050043"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2022 03:08:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="740519964"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 May 2022 03:08:33 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1npohM-0000Sn-8P;
        Sat, 14 May 2022 10:08:32 +0000
Date:   Sat, 14 May 2022 18:07:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 5ce775425058ddf42f6fc7e493de72603fd2c667
Message-ID: <627f7f66.8BTvhDtswznaBNUf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 5ce775425058ddf42f6fc7e493de72603fd2c667  Merge tag 'v5.18-rc6'

elapsed time: 7088m

configs tested: 107
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220509
i386                          randconfig-c001
arm                        oxnas_v6_defconfig
powerpc                   currituck_defconfig
sh                   secureedge5410_defconfig
sh                           se7343_defconfig
arm                      integrator_defconfig
arm                          badge4_defconfig
arc                     nsimosci_hs_defconfig
mips                        vocore2_defconfig
arm                            qcom_defconfig
powerpc                      ppc40x_defconfig
powerpc                    klondike_defconfig
arm                            hisi_defconfig
powerpc                      makalu_defconfig
sh                             espt_defconfig
s390                       zfcpdump_defconfig
x86_64               randconfig-c001-20220509
arm                  randconfig-c002-20220509
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
arc                                 defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
parisc64                            defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a012-20220509
x86_64               randconfig-a013-20220509
x86_64               randconfig-a011-20220509
x86_64               randconfig-a014-20220509
x86_64               randconfig-a016-20220509
x86_64               randconfig-a015-20220509
i386                 randconfig-a015-20220509
i386                 randconfig-a011-20220509
i386                 randconfig-a013-20220509
i386                 randconfig-a012-20220509
i386                 randconfig-a014-20220509
i386                 randconfig-a016-20220509
arc                  randconfig-r043-20220509
s390                 randconfig-r044-20220509
riscv                randconfig-r042-20220509
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
arm                  randconfig-c002-20220510
powerpc              randconfig-c003-20220510
x86_64                        randconfig-c007
mips                 randconfig-c004-20220510
i386                          randconfig-c001
s390                 randconfig-c005-20220510
riscv                randconfig-c006-20220510
mips                          ath79_defconfig
mips                      malta_kvm_defconfig
x86_64               randconfig-a006-20220509
x86_64               randconfig-a002-20220509
x86_64               randconfig-a001-20220509
x86_64               randconfig-a004-20220509
x86_64               randconfig-a005-20220509
x86_64               randconfig-a003-20220509
i386                 randconfig-a003-20220509
i386                 randconfig-a002-20220509
hexagon              randconfig-r041-20220509
hexagon              randconfig-r045-20220509

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
