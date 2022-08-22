Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C6CC3F6B0
	for <linux-m68k@archiver.kernel.org>; Mon, 22 Aug 2022 22:13:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238395AbiHVWNS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 22 Aug 2022 18:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238391AbiHVWNQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 22 Aug 2022 18:13:16 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC25B19
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 Aug 2022 15:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661206393; x=1692742393;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+KF37sAYlpkq3HgZSSRrOoWm/D0euXDR7YfpwkWhmVg=;
  b=evRHI4wIMPVrsgUgUOCw97cji++wfRnJgmHHOMk6bUVlKCVp16QSbN7x
   ArBXxODjGeYJu+B7NnMaVukfU/sAGVW17hs5QDFfCo+MoFccidfRJl7MG
   Jr250SXHVx4ny6UBVRg3wWeOlHF+26PxY8z5OikkRQ/KT0J4AgkWSi2gy
   tLentJDJLjZyOcYMBClCHs5GUaba4y3DOr7XTPoCq2J7/nuqjpt5McKag
   TH/XLY7nmT+W4s8kf0g9/gRqaof2b6TY8vrsjDpT7w0H/CLoJaONOBIEe
   ayqFMHGR8IdLceAm042rBe4l78S4W9GGSKF6UKVdpJluMbFOm1TeOZS6H
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="280505351"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="280505351"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 15:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="559917307"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Aug 2022 15:13:11 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQFfT-0000mz-0k;
        Mon, 22 Aug 2022 22:13:11 +0000
Date:   Tue, 23 Aug 2022 06:12:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-next] BUILD SUCCESS
 1afdc013672b70ee124e669078b0e3740db2a3f8
Message-ID: <6303ff55.mcmlQ2RC1GwXA0Xd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
branch HEAD: 1afdc013672b70ee124e669078b0e3740db2a3f8  m68k: Move from strlcpy with unused retval to strscpy

elapsed time: 727m

configs tested: 157
configs skipped: 117

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allyesconfig
m68k                             allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64               randconfig-a013-20220822
x86_64               randconfig-a014-20220822
x86_64               randconfig-a011-20220822
x86_64               randconfig-a016-20220822
x86_64               randconfig-a012-20220822
x86_64               randconfig-a015-20220822
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
i386                 randconfig-a015-20220822
i386                 randconfig-a016-20220822
i386                 randconfig-a011-20220822
i386                 randconfig-a013-20220822
i386                 randconfig-a014-20220822
i386                 randconfig-a012-20220822
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
loongarch                           defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
powerpc                    adder875_defconfig
arm                         s3c6400_defconfig
arm                        cerfcube_defconfig
powerpc                      arches_defconfig
powerpc                      ppc6xx_defconfig
riscv                randconfig-r042-20220822
s390                 randconfig-r044-20220822
arc                  randconfig-r043-20220822
arc                  randconfig-r043-20220821
arm                           sunxi_defconfig
sh                   sh7770_generic_defconfig
alpha                               defconfig
sh                         ecovec24_defconfig
sh                   sh7724_generic_defconfig
sh                            titan_defconfig
s390                             allmodconfig
sh                           se7343_defconfig
parisc                              defconfig
sparc                             allnoconfig
arm                        keystone_defconfig
mips                            ar7_defconfig
powerpc                  storcenter_defconfig
sh                 kfr2r09-romimage_defconfig
sh                                  defconfig
sh                          rsk7201_defconfig
powerpc                 canyonlands_defconfig
arm                          badge4_defconfig
i386                          randconfig-c001
loongarch                         allnoconfig
sh                            migor_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
sh                          rsk7264_defconfig
arc                     haps_hs_smp_defconfig
arm                          exynos_defconfig
xtensa                  nommu_kc705_defconfig
mips                            gpr_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
arm                         lubbock_defconfig
parisc                generic-32bit_defconfig
arm                      footbridge_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc85xx_cds_defconfig
loongarch                 loongson3_defconfig
mips                           xway_defconfig
arc                              alldefconfig
arc                                 defconfig
sparc                               defconfig
sh                          rsk7269_defconfig
ia64                            zx1_defconfig
arm                        oxnas_v6_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
powerpc                        cell_defconfig
arm                             pxa_defconfig
mips                    maltaup_xpa_defconfig
mips                          rb532_defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                               defconfig
parisc64                            defconfig
parisc                           allyesconfig
powerpc                    amigaone_defconfig
arc                           tb10x_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                          amiga_defconfig
sh                               j2_defconfig
powerpc                     taishan_defconfig
powerpc                mpc7448_hpc2_defconfig
i386                         debian-10.3-func

clang tested configs:
i386                 randconfig-a002-20220822
i386                 randconfig-a005-20220822
i386                 randconfig-a001-20220822
i386                 randconfig-a006-20220822
i386                 randconfig-a003-20220822
i386                 randconfig-a004-20220822
powerpc                      katmai_defconfig
arm                        neponset_defconfig
mips                      maltaaprp_defconfig
x86_64               randconfig-a002-20220822
x86_64               randconfig-a005-20220822
x86_64               randconfig-a006-20220822
x86_64               randconfig-a003-20220822
x86_64               randconfig-a001-20220822
x86_64               randconfig-a004-20220822
arm                         s5pv210_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                          moxart_defconfig
arm                         bcm2835_defconfig
hexagon              randconfig-r045-20220821
riscv                randconfig-r042-20220821
hexagon              randconfig-r041-20220821
s390                 randconfig-r044-20220821
x86_64                        randconfig-k001
arm                     am200epdkit_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     mpc5200_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
powerpc                        fsp2_defconfig
arm                          sp7021_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                    gamecube_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
arm                         palmz72_defconfig
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
