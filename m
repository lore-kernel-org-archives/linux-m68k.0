Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57902C433F5
	for <linux-m68k@archiver.kernel.org>; Sun,  1 May 2022 11:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346549AbiEALjT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 1 May 2022 07:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346668AbiEALjE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 1 May 2022 07:39:04 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD8D10D0
        for <linux-m68k@lists.linux-m68k.org>; Sun,  1 May 2022 04:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651404938; x=1682940938;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VYcgJmOyQa3F4h5WV3vUZpQxsZsNqVuo4XqrM+i77fw=;
  b=gVng8C85J5dDwo9xXwWI/OjYT5uZeSQiKYqyELCKxVq2S7HO1U8O3fJS
   UTZKycNzxl1GSD7r1IiKonpsXCuuzeZWd+jfAc4zJkN4q+ZSqqol0iapq
   iPLy6NOWUuu/dVsvbRMmDLk/VhtRa7k+kGU5zP8niYDlD0cluDxl+Wi/4
   MfWi1m6NUcDIxXSe76ruUmy8h2XGYTN5Ik9rmj7VB9523rdPWPSWOzYvU
   9hEwFQUahzdq/l4BGv6q4fefMObNyyibaAcB9affvtbTJ39gqXloVEMfa
   mJFy8CBamQcRfNnB8BcZaS/TVfV23yxEjxG8mqNLmcHp+JFPQleTdrZVS
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10333"; a="292179266"
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; 
   d="scan'208";a="292179266"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 04:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; 
   d="scan'208";a="688612757"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 May 2022 04:35:35 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nl7rS-0008j8-L5;
        Sun, 01 May 2022 11:35:34 +0000
Date:   Sun, 01 May 2022 19:35:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 138d673f12ac7e33ef4c54a4e104675bcadc1aaa
Message-ID: <626e707e.5sdu+fM4eO1GV37r%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 138d673f12ac7e33ef4c54a4e104675bcadc1aaa  Merge tag 'v5.18-rc4'

elapsed time: 8590m

configs tested: 104
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220425
arm                      integrator_defconfig
m68k                            q40_defconfig
arc                              alldefconfig
arm                           sunxi_defconfig
arc                           tb10x_defconfig
xtensa                          iss_defconfig
openrisc                  or1klitex_defconfig
mips                            gpr_defconfig
sh                              ul2_defconfig
sh                          sdk7786_defconfig
arm                           viper_defconfig
m68k                        mvme147_defconfig
h8300                       h8s-sim_defconfig
sparc64                             defconfig
powerpc                  storcenter_defconfig
riscv                            allmodconfig
arc                      axs103_smp_defconfig
x86_64               randconfig-c001-20220425
arm                  randconfig-c002-20220425
x86_64                        randconfig-c001
i386                          randconfig-c001
arm                  randconfig-c002-20220426
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
x86_64               randconfig-a015-20220425
x86_64               randconfig-a014-20220425
x86_64               randconfig-a011-20220425
x86_64               randconfig-a013-20220425
x86_64               randconfig-a012-20220425
x86_64               randconfig-a016-20220425
i386                 randconfig-a014-20220425
i386                 randconfig-a012-20220425
i386                 randconfig-a011-20220425
i386                 randconfig-a015-20220425
i386                 randconfig-a013-20220425
i386                 randconfig-a016-20220425
arc                  randconfig-r043-20220425
s390                 randconfig-r044-20220425
riscv                randconfig-r042-20220425
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
i386                 randconfig-a006-20220425
i386                 randconfig-a002-20220425
i386                 randconfig-a005-20220425
i386                 randconfig-a003-20220425
i386                 randconfig-a001-20220425
i386                 randconfig-a004-20220425
x86_64               randconfig-a002-20220425
x86_64               randconfig-a004-20220425
x86_64               randconfig-a003-20220425
x86_64               randconfig-a001-20220425
x86_64               randconfig-a005-20220425
x86_64               randconfig-a006-20220425

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
