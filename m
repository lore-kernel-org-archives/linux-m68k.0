Return-Path: <SRS0=oGM/=4T=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622B6C3F2D1
	for <linux-m68k@archiver.kernel.org>; Mon,  2 Mar 2020 19:31:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 368032084E
	for <linux-m68k@archiver.kernel.org>; Mon,  2 Mar 2020 19:31:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgCBTbC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 2 Mar 2020 14:31:02 -0500
Received: from mga01.intel.com ([192.55.52.88]:16294 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727126AbgCBTbB (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 2 Mar 2020 14:31:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Mar 2020 11:31:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,508,1574150400"; 
   d="scan'208";a="412419385"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Mar 2020 11:30:59 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j8qmI-000InL-R5; Tue, 03 Mar 2020 03:30:58 +0800
Date:   Tue, 03 Mar 2020 03:30:10 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-queue] BUILD SUCCESS
 195a8edd63f3ff04ab13468f4cf55e4ff2e7cd48
Message-ID: <5e5d5ec2.oBeAaa2f1BI+P3EC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
branch HEAD: 195a8edd63f3ff04ab13468f4cf55e4ff2e7cd48  fat: Use correct logical sector size for Atari GEMDOS FAT

elapsed time: 596m

configs tested: 170
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
i386                              allnoconfig
s390                             alldefconfig
s390                          debug_defconfig
parisc                            allnoconfig
sparc64                          allyesconfig
parisc                generic-32bit_defconfig
s390                             allyesconfig
sparc64                             defconfig
um                             i386_defconfig
i386                             allyesconfig
riscv                            allmodconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                          iss_defconfig
i386                             alldefconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
xtensa                       common_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                           allyesconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200302
x86_64               randconfig-a003-20200302
i386                 randconfig-a002-20200302
i386                 randconfig-a003-20200302
x86_64               randconfig-a002-20200302
i386                 randconfig-a001-20200302
alpha                randconfig-a001-20200302
m68k                 randconfig-a001-20200302
mips                 randconfig-a001-20200302
nds32                randconfig-a001-20200302
parisc               randconfig-a001-20200302
riscv                randconfig-a001-20200302
c6x                  randconfig-a001-20200302
h8300                randconfig-a001-20200302
microblaze           randconfig-a001-20200302
nios2                randconfig-a001-20200302
sparc64              randconfig-a001-20200302
csky                 randconfig-a001-20200302
s390                 randconfig-a001-20200302
sh                   randconfig-a001-20200302
xtensa               randconfig-a001-20200302
openrisc             randconfig-a001-20200302
x86_64               randconfig-b001-20200302
x86_64               randconfig-b002-20200302
x86_64               randconfig-b003-20200302
i386                 randconfig-b001-20200302
i386                 randconfig-b002-20200302
i386                 randconfig-b003-20200302
x86_64               randconfig-c001-20200302
x86_64               randconfig-c002-20200302
x86_64               randconfig-c003-20200302
i386                 randconfig-c001-20200302
i386                 randconfig-c002-20200302
i386                 randconfig-c003-20200302
x86_64               randconfig-d001-20200302
i386                 randconfig-d001-20200302
x86_64               randconfig-d002-20200302
x86_64               randconfig-d003-20200302
i386                 randconfig-d002-20200302
i386                 randconfig-d003-20200302
x86_64               randconfig-e001-20200302
x86_64               randconfig-e002-20200302
x86_64               randconfig-e003-20200302
i386                 randconfig-e003-20200302
i386                 randconfig-e001-20200302
i386                 randconfig-e002-20200302
x86_64               randconfig-f001-20200302
x86_64               randconfig-f002-20200302
x86_64               randconfig-f003-20200302
i386                 randconfig-f001-20200302
i386                 randconfig-f002-20200302
i386                 randconfig-f003-20200302
i386                 randconfig-g003-20200302
i386                 randconfig-g001-20200302
x86_64               randconfig-g003-20200302
x86_64               randconfig-g001-20200302
x86_64               randconfig-g002-20200302
i386                 randconfig-g002-20200302
x86_64               randconfig-g001-20200301
x86_64               randconfig-g002-20200301
x86_64               randconfig-g003-20200301
i386                 randconfig-g001-20200301
i386                 randconfig-g002-20200301
i386                 randconfig-g003-20200301
i386                 randconfig-h001-20200302
x86_64               randconfig-h002-20200302
x86_64               randconfig-h001-20200302
x86_64               randconfig-h003-20200302
i386                 randconfig-h003-20200302
i386                 randconfig-h002-20200302
arc                  randconfig-a001-20200302
sparc                randconfig-a001-20200302
ia64                 randconfig-a001-20200302
arm                  randconfig-a001-20200302
arm64                randconfig-a001-20200302
powerpc              randconfig-a001-20200302
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                              allnoconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                                allnoconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allmodconfig
um                           x86_64_defconfig
um                                  defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
