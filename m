Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40E9C43334
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Jun 2022 22:35:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbiFMWfI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Jun 2022 18:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiFMWfH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Jun 2022 18:35:07 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC93205C9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Jun 2022 15:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655159707; x=1686695707;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=u9MzGfX62Wm5dV4XbvAkNc1adtEyAvwLOoFDZ8BlUKQ=;
  b=Md3NG1Sr4oEpgxD8fC6yyphDce4KVSH2NPMajoejGnoHd9cYKixdK0ji
   LLnfhyuZ9yCvfUh1wT07tYnHMq2F6Pbzkuz7j4NXdUQA3fvRinvEMJaei
   zHWlhzB+1uc/oNZp2cHivt3+Y+l+IkGrXaa7u+Pxtb8LE0qmt8d9yMvTl
   45U30Dh2M2aRZ4qODx03T6JRXaHxGtZ+0n7TMWMpiKd8xtq9FZis4nl+C
   cAQ9HbmR/IxigyXP9iD4xuFqeSefGwyREQdiQeRVq3L64AA5zDNgxWStS
   sHNDkNZLI7CoRrAmm8OTYhsYhVLH8lAdeNW4R/5XOhKHcC4FYRScQ0Vf+
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="261467826"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; 
   d="scan'208";a="261467826"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 15:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; 
   d="scan'208";a="673537295"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Jun 2022 15:35:03 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o0seF-000LDV-0K;
        Mon, 13 Jun 2022 22:35:03 +0000
Date:   Tue, 14 Jun 2022 06:34:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.20] BUILD SUCCESS
 a02227d13bb82addd0efc1fefc5c6946453f0a0d
Message-ID: <62a7bb5b.4cXTIiJzaA5kSiwj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.20
branch HEAD: a02227d13bb82addd0efc1fefc5c6946453f0a0d  m68k: mac: Fix typos in comments

elapsed time: 727m

configs tested: 102
configs skipped: 113

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220613
arm                        trizeps4_defconfig
arm                       aspeed_g5_defconfig
arm                            mps2_defconfig
sh                        edosk7705_defconfig
sh                         apsh4a3a_defconfig
arm                           h3600_defconfig
powerpc                     mpc83xx_defconfig
mips                          rb532_defconfig
powerpc                         ps3_defconfig
sh                   rts7751r2dplus_defconfig
sh                          rsk7203_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     tqm8555_defconfig
powerpc                      cm5200_defconfig
xtensa                    smp_lx200_defconfig
ia64                      gensparse_defconfig
mips                     loongson1b_defconfig
openrisc                         alldefconfig
x86_64               randconfig-k001-20220613
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20220613
x86_64               randconfig-a014-20220613
x86_64               randconfig-a011-20220613
x86_64               randconfig-a016-20220613
x86_64               randconfig-a012-20220613
x86_64               randconfig-a013-20220613
i386                 randconfig-a012-20220613
i386                 randconfig-a011-20220613
i386                 randconfig-a013-20220613
i386                 randconfig-a014-20220613
i386                 randconfig-a016-20220613
i386                 randconfig-a015-20220613
riscv                randconfig-r042-20220613
arc                  randconfig-r043-20220613
s390                 randconfig-r044-20220613
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                        mvebu_v5_defconfig
arm                         lpc32xx_defconfig
mips                           mtx1_defconfig
x86_64               randconfig-a003-20220613
x86_64               randconfig-a006-20220613
x86_64               randconfig-a001-20220613
x86_64               randconfig-a005-20220613
x86_64               randconfig-a002-20220613
x86_64               randconfig-a004-20220613
i386                 randconfig-a001-20220613
i386                 randconfig-a004-20220613
i386                 randconfig-a002-20220613
i386                 randconfig-a003-20220613
i386                 randconfig-a006-20220613
i386                 randconfig-a005-20220613

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
