Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E12C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Apr 2022 02:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242379AbiDLCKS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Apr 2022 22:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343690AbiDLCKM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Apr 2022 22:10:12 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68AE340C5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Apr 2022 19:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649729274; x=1681265274;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=C2Nj3T17mUYuatl1qS6xBEwHEgJKci804zLj7x75NqM=;
  b=gQRTPY9eKlnvPbhk5+EPSwM1lysqG7ANZHchZn90dOg0Rz1LuO4LkjXK
   UhQ6QEbeqZSWzzRjOODO6odcfnf3d1B4XJTJDy8sMN59xHyOdJl0/EPl6
   pb+KKl40c+DSE6DS7fwrAvq1zDtDg32YhWOT/9rzr1ZzVHLjLkY2Xjsje
   3wJKBrqoElh/jpZ/Hsu+tVaynEofAqiR2f8/5Suzw30Yo/OUHbd4L0Day
   jCtoNhtsGG18H4x8NKalUc1A7v8gQxEqccatkBea4Hp1w87wEbMwuJwF/
   +KeJpJBLAZuhiCPL0ZhDqzKaZju1wYpjgOYppOV2sKtApJgsA65SIX5qc
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="262438047"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="262438047"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 19:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="660286662"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 11 Apr 2022 19:07:51 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ne5wc-0002Qo-UV;
        Tue, 12 Apr 2022 02:07:50 +0000
Date:   Tue, 12 Apr 2022 10:07:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 8841e027aa6b5d10b98b5cf67bf705e363917c00
Message-ID: <6254dec8.oOx89gedPch3AXjG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 8841e027aa6b5d10b98b5cf67bf705e363917c00  m68k: Introduce a virtual m68k machine

elapsed time: 866m

configs tested: 122
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm                              allmodconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220411
arm                            lart_defconfig
arc                           tb10x_defconfig
arm                          gemini_defconfig
sh                               alldefconfig
i386                                defconfig
arm                      footbridge_defconfig
powerpc                     tqm8548_defconfig
sh                          rsk7269_defconfig
mips                        vocore2_defconfig
um                             i386_defconfig
arm                     eseries_pxa_defconfig
powerpc                      mgcoge_defconfig
mips                  decstation_64_defconfig
arm                       imx_v6_v7_defconfig
arm                          pxa3xx_defconfig
m68k                       m5475evb_defconfig
sh                 kfr2r09-romimage_defconfig
xtensa                          iss_defconfig
arm                      jornada720_defconfig
powerpc                      makalu_defconfig
arc                          axs103_defconfig
arm                         lpc18xx_defconfig
arm                         nhk8815_defconfig
arm                          simpad_defconfig
powerpc                      ppc40x_defconfig
ia64                      gensparse_defconfig
powerpc                 mpc837x_rdb_defconfig
openrisc                         alldefconfig
arm                  randconfig-c002-20220411
x86_64               randconfig-c001-20220411
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
alpha                            allyesconfig
csky                                defconfig
nios2                            allyesconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a016-20220411
x86_64               randconfig-a012-20220411
x86_64               randconfig-a013-20220411
x86_64               randconfig-a014-20220411
x86_64               randconfig-a015-20220411
x86_64               randconfig-a011-20220411
i386                 randconfig-a015-20220411
i386                 randconfig-a011-20220411
i386                 randconfig-a014-20220411
i386                 randconfig-a016-20220411
i386                 randconfig-a012-20220411
i386                 randconfig-a013-20220411
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220411
s390                 randconfig-r044-20220411
riscv                randconfig-r042-20220411
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                       ebony_defconfig
powerpc                     akebono_defconfig
arm                              alldefconfig
powerpc                 mpc832x_rdb_defconfig
arm                          imote2_defconfig
arm                          pxa168_defconfig
arm                           sama7_defconfig
i386                 randconfig-a004-20220411
i386                 randconfig-a001-20220411
i386                 randconfig-a003-20220411
i386                 randconfig-a005-20220411
i386                 randconfig-a006-20220411
i386                 randconfig-a002-20220411
x86_64               randconfig-a003-20220411
x86_64               randconfig-a001-20220411
x86_64               randconfig-a002-20220411
x86_64               randconfig-a005-20220411
x86_64               randconfig-a004-20220411
x86_64               randconfig-a006-20220411
hexagon              randconfig-r041-20220411
hexagon              randconfig-r045-20220411

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
