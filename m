Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A296CC433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Nov 2021 01:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EDB760EDF
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Nov 2021 01:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhKBBpx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Nov 2021 21:45:53 -0400
Received: from mga05.intel.com ([192.55.52.43]:35847 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229479AbhKBBpx (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Nov 2021 21:45:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="317362657"
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; 
   d="scan'208";a="317362657"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 18:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; 
   d="scan'208";a="500296728"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 01 Nov 2021 18:43:17 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mhipY-0003tC-Dy; Tue, 02 Nov 2021 01:43:16 +0000
Date:   Tue, 02 Nov 2021 09:42:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v5.15] BUILD SUCCESS
 89a4f1ec7be37b80e863c124ae2b90aa195a3eec
Message-ID: <6180979a.+PcOldQlvXxuloEk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v5.15
branch HEAD: 89a4f1ec7be37b80e863c124ae2b90aa195a3eec  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 721m

configs tested: 132
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211101
arm                       aspeed_g5_defconfig
sh                           se7712_defconfig
arm                       netwinder_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                   sb1250_swarm_defconfig
m68k                        m5307c3_defconfig
mips                           mtx1_defconfig
mips                malta_qemu_32r6_defconfig
arm                        mvebu_v7_defconfig
mips                      loongson3_defconfig
mips                      maltasmvp_defconfig
m68k                        stmark2_defconfig
arc                          axs103_defconfig
powerpc                         ps3_defconfig
m68k                         apollo_defconfig
mips                     decstation_defconfig
arc                              alldefconfig
sh                     sh7710voipgw_defconfig
arm                          collie_defconfig
arc                        vdk_hs38_defconfig
powerpc                 mpc8272_ads_defconfig
mips                           xway_defconfig
sh                        apsh4ad0a_defconfig
xtensa                  audio_kc705_defconfig
mips                           gcw0_defconfig
arm                           corgi_defconfig
sh                            shmin_defconfig
arm                         s3c2410_defconfig
arm                         cm_x300_defconfig
powerpc                 linkstation_defconfig
mips                          ath79_defconfig
powerpc                      ep88xc_defconfig
arm                           spitz_defconfig
arm                      jornada720_defconfig
h8300                     edosk2674_defconfig
arm                            lart_defconfig
powerpc                     asp8347_defconfig
arm                        vexpress_defconfig
powerpc                     skiroot_defconfig
openrisc                         alldefconfig
arm                         s3c6400_defconfig
powerpc                     ep8248e_defconfig
sh                            migor_defconfig
arm                  randconfig-c002-20211101
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a012-20211101
x86_64               randconfig-a015-20211101
x86_64               randconfig-a016-20211101
x86_64               randconfig-a013-20211101
x86_64               randconfig-a011-20211101
x86_64               randconfig-a014-20211101
i386                 randconfig-a016-20211101
i386                 randconfig-a014-20211101
i386                 randconfig-a015-20211101
i386                 randconfig-a013-20211101
i386                 randconfig-a011-20211101
i386                 randconfig-a012-20211101
arc                  randconfig-r043-20211101
riscv                randconfig-r042-20211101
s390                 randconfig-r044-20211101
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20211101
arm                  randconfig-c002-20211101
i386                 randconfig-c001-20211101
s390                 randconfig-c005-20211101
powerpc              randconfig-c003-20211101
riscv                randconfig-c006-20211101
x86_64               randconfig-c007-20211101
x86_64               randconfig-a004-20211101
x86_64               randconfig-a006-20211101
x86_64               randconfig-a001-20211101
x86_64               randconfig-a002-20211101
x86_64               randconfig-a003-20211101
x86_64               randconfig-a005-20211101
i386                 randconfig-a005-20211101
i386                 randconfig-a001-20211101
i386                 randconfig-a003-20211101
i386                 randconfig-a004-20211101
i386                 randconfig-a006-20211101
i386                 randconfig-a002-20211101
hexagon              randconfig-r041-20211101
hexagon              randconfig-r045-20211101

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
