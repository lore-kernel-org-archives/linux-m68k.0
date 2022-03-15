Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEE4C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Mar 2022 03:21:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239070AbiCODWv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Mar 2022 23:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbiCODWu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Mar 2022 23:22:50 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F0E43EC1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Mar 2022 20:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647314498; x=1678850498;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3ZnzD3L+82CpwDDOyW335vUBvOx3eA4MOGSV9Q1YYPk=;
  b=H+0Z9htMcgK+pUKxBXVg6xZUCgS9l0I+bgyTmH28Bdbrc297S3DhqAi+
   1H7ODzXduD6NBL3yMAc7oeIQ9KyqWHZLMaKI4BrzqokHEMij+2DaVLcX+
   r0AI7sbTflaFHU2L2o3ABtGW22ALK6GGTU+QWhPkhSmYQTnqnAn2rtna1
   /iCHQ7XqZ9XiMNfbakxIK6L1kYnP/Toh+d6tSGl6MITqyea0AyyoWHrjc
   qc7Udjicwh4WAglTjQMyJ65w8tiTru5pDY3JHvsVVLK0CkKxUXTPrvxYw
   dPh4dbfj0EWBwGUVULmG9dAq/Ox+BfHgTckH8r6rQ2ke8lXYvnYsf42Ty
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256152244"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; 
   d="scan'208";a="256152244"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 20:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; 
   d="scan'208";a="713993189"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Mar 2022 20:21:36 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nTxkd-000AUo-PT; Tue, 15 Mar 2022 03:21:35 +0000
Date:   Tue, 15 Mar 2022 11:21:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 dcb13717dcd512bc7fdd7a3c98b3438b2feae250
Message-ID: <62300639.cnBC3C9fWxGaGni/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: dcb13717dcd512bc7fdd7a3c98b3438b2feae250  Merge tag 'v5.17-rc8'

elapsed time: 722m

configs tested: 143
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220314
mips                 randconfig-c004-20220314
i386                          randconfig-c001
arm                         nhk8815_defconfig
powerpc                      pasemi_defconfig
xtensa                              defconfig
arm                         lpc18xx_defconfig
arm                       aspeed_g5_defconfig
m68k                        stmark2_defconfig
parisc                           alldefconfig
arm                         vf610m4_defconfig
powerpc                    klondike_defconfig
mips                       capcella_defconfig
powerpc                      ppc40x_defconfig
sh                             sh03_defconfig
m68k                           sun3_defconfig
m68k                        m5272c3_defconfig
powerpc                        cell_defconfig
arm                        mini2440_defconfig
arm                       imx_v6_v7_defconfig
sh                        sh7785lcr_defconfig
sh                          lboxre2_defconfig
arm                           stm32_defconfig
arm                            mps2_defconfig
powerpc                       ppc64_defconfig
arc                     haps_hs_smp_defconfig
m68k                       m5475evb_defconfig
arm                         axm55xx_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                  decstation_64_defconfig
arm                  randconfig-c002-20220313
arm                  randconfig-c002-20220314
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20220314
x86_64               randconfig-a001-20220314
x86_64               randconfig-a003-20220314
x86_64               randconfig-a004-20220314
x86_64               randconfig-a005-20220314
x86_64               randconfig-a006-20220314
i386                 randconfig-a003-20220314
i386                 randconfig-a004-20220314
i386                 randconfig-a001-20220314
i386                 randconfig-a006-20220314
i386                 randconfig-a002-20220314
i386                 randconfig-a005-20220314
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20220313
arc                  randconfig-r043-20220314
riscv                randconfig-r042-20220313
s390                 randconfig-r044-20220313
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
powerpc                     tqm8560_defconfig
powerpc                       ebony_defconfig
mips                      bmips_stb_defconfig
arm                       cns3420vb_defconfig
arm                      pxa255-idp_defconfig
arm                        magician_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                          imote2_defconfig
arm                       aspeed_g4_defconfig
powerpc                     kmeter1_defconfig
mips                           mtx1_defconfig
arm                         lpc32xx_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a011-20220314
x86_64               randconfig-a014-20220314
x86_64               randconfig-a013-20220314
x86_64               randconfig-a012-20220314
x86_64               randconfig-a015-20220314
x86_64               randconfig-a016-20220314
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                 randconfig-a013-20220314
i386                 randconfig-a015-20220314
i386                 randconfig-a014-20220314
i386                 randconfig-a011-20220314
i386                 randconfig-a016-20220314
i386                 randconfig-a012-20220314
hexagon              randconfig-r045-20220314
hexagon              randconfig-r045-20220313
riscv                randconfig-r042-20220314
hexagon              randconfig-r041-20220313
hexagon              randconfig-r041-20220314
s390                 randconfig-r044-20220314

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
