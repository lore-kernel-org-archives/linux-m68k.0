Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51EAAC433F5
	for <linux-m68k@archiver.kernel.org>; Thu,  5 May 2022 14:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378188AbiEEOcJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 5 May 2022 10:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiEEOcH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 5 May 2022 10:32:07 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01F019C25
        for <linux-m68k@lists.linux-m68k.org>; Thu,  5 May 2022 07:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651760907; x=1683296907;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BELR3Oo3IIG8k3OryeAW3XQv9I2nq2kRq5YVGFFW2DQ=;
  b=Eg+XzFIErT+Hifg1nBE3GpRw+M+LXk0B0cHg0I92WoXOCxZXcPqTvW4X
   uEL3rXOfWDfgTGSCrCbMKiAK8V1QbUNOBR4ZzotEl761Eh5HMZlNEnzXm
   Q7v2sgadMaFYhHD6kLnmrQ5yZtctiT4FyvLvVMwW8w0akLwp/wD6oxe5B
   toK4UrbTXDqo8MsPhcKMdKwG6aDl+M2aA89AWC6wmqzGKNZu5jaAr3Gdy
   FgoEFRRD2Vri50YPHe55xFssiukbvYH1QhjyZAHmQ0m3ytLCVS2Hsekvh
   isuVvYVaqChhRIlgpqO0JShyUb2yrDty8oHNPaSyxpeCIFxceR/OViUWp
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268272916"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="268272916"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 07:28:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="600060170"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 May 2022 07:28:23 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nmcSs-000CTH-RI;
        Thu, 05 May 2022 14:28:22 +0000
Date:   Thu, 05 May 2022 22:28:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 f3f50e32949fa00ca6517073ebaabe47eb23ed3a
Message-ID: <6273defb.kZTZFLBqA1+xqdWz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: f3f50e32949fa00ca6517073ebaabe47eb23ed3a  Merge tag 'v5.18-rc5'

elapsed time: 4611m

configs tested: 147
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                            shmin_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                         ps3_defconfig
arc                     haps_hs_smp_defconfig
arc                            hsdk_defconfig
arm                         vf610m4_defconfig
sh                        sh7763rdp_defconfig
h8300                    h8300h-sim_defconfig
arm                        oxnas_v6_defconfig
powerpc                     redwood_defconfig
parisc                generic-64bit_defconfig
alpha                            alldefconfig
arc                     nsimosci_hs_defconfig
powerpc                       ppc64_defconfig
sh                           sh2007_defconfig
mips                         cobalt_defconfig
sh                             sh03_defconfig
powerpc                    sam440ep_defconfig
powerpc                           allnoconfig
m68k                          amiga_defconfig
mips                         db1xxx_defconfig
xtensa                    xip_kc705_defconfig
mips                     decstation_defconfig
powerpc                         wii_defconfig
powerpc                 mpc8540_ads_defconfig
s390                             allyesconfig
h8300                            alldefconfig
m68k                          atari_defconfig
arm                            zeus_defconfig
arm                            mps2_defconfig
xtensa                  audio_kc705_defconfig
sh                   sh7770_generic_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                         ecovec24_defconfig
xtensa                         virt_defconfig
powerpc                    amigaone_defconfig
sh                        sh7785lcr_defconfig
sh                           se7721_defconfig
sh                           se7705_defconfig
arm                  randconfig-c002-20220501
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a004-20220502
i386                 randconfig-a006-20220502
i386                 randconfig-a002-20220502
i386                 randconfig-a003-20220502
i386                 randconfig-a001-20220502
i386                 randconfig-a005-20220502
x86_64               randconfig-a006-20220502
x86_64               randconfig-a002-20220502
x86_64               randconfig-a001-20220502
x86_64               randconfig-a004-20220502
x86_64               randconfig-a005-20220502
x86_64               randconfig-a003-20220502
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220501
arc                  randconfig-r043-20220502
s390                 randconfig-r044-20220501
riscv                randconfig-r042-20220501
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc              randconfig-c003-20220501
x86_64                        randconfig-c007
mips                 randconfig-c004-20220501
i386                          randconfig-c001
arm                  randconfig-c002-20220501
riscv                randconfig-c006-20220501
s390                 randconfig-c005-20220501
arm                           spitz_defconfig
mips                      maltaaprp_defconfig
arm                         palmz72_defconfig
arm                         socfpga_defconfig
riscv                    nommu_virt_defconfig
powerpc                  mpc866_ads_defconfig
mips                           mtx1_defconfig
powerpc                     kilauea_defconfig
arm                       aspeed_g4_defconfig
powerpc                     ksi8560_defconfig
arm                            dove_defconfig
riscv                          rv32_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a011-20220502
x86_64               randconfig-a014-20220502
x86_64               randconfig-a012-20220502
x86_64               randconfig-a013-20220502
x86_64               randconfig-a016-20220502
x86_64               randconfig-a015-20220502
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
