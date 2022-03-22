Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F20C433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 22 Mar 2022 01:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbiCVCBJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Mar 2022 22:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235242AbiCVCBG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Mar 2022 22:01:06 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DD15E74A
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Mar 2022 18:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647914379; x=1679450379;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CRMIeAYYMXkRbSn+FOqw853trazKslCu9iK9cAct+o4=;
  b=QNjd5hoOstgRLs/zMlyogMa49bea19emy6Gttvjjs/XEoFK/TNCmFAHs
   1jDAN02bA8any9CO/YqmeFGN3LMlX63y+7Rd4l5haufl7yluQ7GeHwlEr
   4vckJZOdv7y+gkPWTb4BX4Djhwamm/sDeYlRcl0/rca1Uhmw/EjNu7VMI
   CTZQQkYBut3r0KxPDTWIJCuQk0+nhB4siRiOPKaPaK1lNjb6fLoGaNfaO
   bjEAOCapIABLAHcEBfT0b2bXLElXr8O6HSrpR/yhx5jhXdzZOIwK3dJlN
   +3irkdWc4OORrtpAiHcEyNQyt+TjjB1VFTJcsQfsUh0o6JrDUsHbjLZhF
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="239855611"
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; 
   d="scan'208";a="239855611"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 18:59:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; 
   d="scan'208";a="583077978"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Mar 2022 18:59:37 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nWTo8-000ILZ-Oa; Tue, 22 Mar 2022 01:59:36 +0000
Date:   Tue, 22 Mar 2022 09:58:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 f0c73906b869c57ed9f74fd5add86581e457d13c
Message-ID: <62392d55.lqzF02i23dQGFp5e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: f0c73906b869c57ed9f74fd5add86581e457d13c  Merge tag 'v5.17'

elapsed time: 925m

configs tested: 118
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220321
arm                        trizeps4_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                           ip32_defconfig
xtensa                  cadence_csp_defconfig
sh                            migor_defconfig
powerpc                mpc7448_hpc2_defconfig
arc                         haps_hs_defconfig
mips                         db1xxx_defconfig
sh                         ecovec24_defconfig
arm                             rpc_defconfig
powerpc                       maple_defconfig
openrisc                    or1ksim_defconfig
arm                         vf610m4_defconfig
arm                  randconfig-c002-20220320
arm                  randconfig-c002-20220321
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a013-20220321
x86_64               randconfig-a012-20220321
x86_64               randconfig-a014-20220321
x86_64               randconfig-a011-20220321
x86_64               randconfig-a016-20220321
x86_64               randconfig-a015-20220321
i386                 randconfig-a013-20220321
i386                 randconfig-a016-20220321
i386                 randconfig-a015-20220321
i386                 randconfig-a011-20220321
i386                 randconfig-a012-20220321
i386                 randconfig-a014-20220321
arc                  randconfig-r043-20220320
riscv                randconfig-r042-20220321
s390                 randconfig-r044-20220321
arc                  randconfig-r043-20220321
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64                        randconfig-c007
mips                 randconfig-c004-20220320
powerpc              randconfig-c003-20220320
i386                          randconfig-c001
arm                  randconfig-c002-20220320
s390                 randconfig-c005-20220320
riscv                randconfig-c006-20220320
arm                  colibri_pxa270_defconfig
arm                          ixp4xx_defconfig
powerpc                    gamecube_defconfig
arm                          collie_defconfig
powerpc                     mpc512x_defconfig
arm                          imote2_defconfig
i386                 randconfig-a003-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a002-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a006-20220321
x86_64               randconfig-a002-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a004-20220321
x86_64               randconfig-a001-20220321
x86_64               randconfig-a005-20220321
x86_64               randconfig-a006-20220321
hexagon              randconfig-r041-20220321
hexagon              randconfig-r045-20220321
hexagon              randconfig-r045-20220320
hexagon              randconfig-r041-20220320
s390                 randconfig-r044-20220320
riscv                randconfig-r042-20220320

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
