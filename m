Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29481C43334
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Jun 2022 18:41:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232821AbiFUSlN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Jun 2022 14:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232708AbiFUSlN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Jun 2022 14:41:13 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC0510FDF
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Jun 2022 11:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655836872; x=1687372872;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rEcE1RKOt1j2cBg8YsRdmh0iTdU4hI+CEzR5j4msALA=;
  b=K2yiYIUs12SJsqsHA14J6LpuMKfabGKgi4iBaRXXV2pTd7Yv1+jEX6e8
   eQnsDPLnu12x4Yvj895c+HZ9LWq9qzVDrkuvWTSdLAnucps7yTSAml02k
   2G0yvNp0yWaI/O2UV9pC3ONvU+hSS4ZauTQuoh1tMe/lpTuJQ8T2QdC81
   sip/p3DGMiYEioQYZbNjJn3RrefYs45FP76Uh4az3N9dZYStAJCZI25Fj
   1PjMIlWV/M44GJMVj29AUgL6UmEYL4kDhds9YGjMZNljuEP90kcFRmTv2
   S8it4T5+PGMS9kqJ7jeloR60LWY+3ieLKTw0rNt21uIMhQg6TEcMoZwVs
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="260027956"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="260027956"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 11:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="833711571"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Jun 2022 11:41:10 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o3ioH-0000Ht-M0;
        Tue, 21 Jun 2022 18:41:09 +0000
Date:   Wed, 22 Jun 2022 02:40:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 eef88bc9476168e519fe7e9514b8be3f1cda787f
Message-ID: <62b210a0.LJxMr2rIVfwlT4On%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: eef88bc9476168e519fe7e9514b8be3f1cda787f  m68k: sun3: Use __func__ to get function's name in an output message

elapsed time: 853m

configs tested: 96
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
mips                       capcella_defconfig
powerpc                      cm5200_defconfig
csky                             alldefconfig
openrisc                            defconfig
xtensa                         virt_defconfig
um                               alldefconfig
ia64                                defconfig
ia64                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
nios2                               defconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
parisc                              defconfig
parisc                           allyesconfig
parisc64                            defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
i386                 randconfig-a003-20220620
i386                 randconfig-a001-20220620
i386                 randconfig-a004-20220620
i386                 randconfig-a002-20220620
i386                 randconfig-a005-20220620
i386                 randconfig-a006-20220620
x86_64               randconfig-a003-20220620
x86_64               randconfig-a004-20220620
x86_64               randconfig-a002-20220620
x86_64               randconfig-a001-20220620
x86_64               randconfig-a005-20220620
x86_64               randconfig-a006-20220620
arc                  randconfig-r043-20220619
riscv                randconfig-r042-20220619
arc                  randconfig-r043-20220620
s390                 randconfig-r044-20220619
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
mips                       rbtx49xx_defconfig
powerpc                     mpc512x_defconfig
riscv                          rv32_defconfig
arm                         s3c2410_defconfig
x86_64               randconfig-a013-20220620
x86_64               randconfig-a012-20220620
x86_64               randconfig-a011-20220620
x86_64               randconfig-a014-20220620
x86_64               randconfig-a015-20220620
x86_64               randconfig-a016-20220620
i386                 randconfig-a012-20220620
i386                 randconfig-a016-20220620
i386                 randconfig-a014-20220620
i386                 randconfig-a015-20220620
i386                 randconfig-a013-20220620
i386                 randconfig-a011-20220620
s390                 randconfig-r044-20220620
hexagon              randconfig-r045-20220619
hexagon              randconfig-r045-20220620
riscv                randconfig-r042-20220620
hexagon              randconfig-r041-20220619
hexagon              randconfig-r041-20220620

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
