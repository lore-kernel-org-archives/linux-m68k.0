Return-Path: <SRS0=dLdR=4N=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDF8C35DEE
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Feb 2020 00:40:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 427772072D
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Feb 2020 00:40:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgBYAka (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Feb 2020 19:40:30 -0500
Received: from mga07.intel.com ([134.134.136.100]:20400 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728011AbgBYAk3 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Feb 2020 19:40:29 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 16:40:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,482,1574150400"; 
   d="scan'208";a="350036558"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2020 16:40:27 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j6OGw-000491-KV; Tue, 25 Feb 2020 08:40:26 +0800
Date:   Tue, 25 Feb 2020 08:39:45 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-queue] BUILD SUCCESS
 0ff0384f9fdb2193372e7fed837aa7962160cdb4
Message-ID: <5e546cd1.XHU6EI4yb1nq6kLb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
branch HEAD: 0ff0384f9fdb2193372e7fed837aa7962160cdb4  fat: Use correct logical sector size for Atari GEMDOS FAT

elapsed time: 604m

configs tested: 217
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
sh                  sh7785lcr_32bit_defconfig
h8300                     edosk2674_defconfig
s390                             allyesconfig
riscv                    nommu_virt_defconfig
ia64                                defconfig
i386                                defconfig
powerpc                           allnoconfig
xtensa                          iss_defconfig
sh                                allnoconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200225
x86_64               randconfig-a002-20200225
x86_64               randconfig-a003-20200225
i386                 randconfig-a001-20200225
i386                 randconfig-a002-20200225
i386                 randconfig-a003-20200225
x86_64               randconfig-a001-20200224
x86_64               randconfig-a002-20200224
x86_64               randconfig-a003-20200224
i386                 randconfig-a001-20200224
i386                 randconfig-a002-20200224
i386                 randconfig-a003-20200224
alpha                randconfig-a001-20200225
m68k                 randconfig-a001-20200225
mips                 randconfig-a001-20200225
nds32                randconfig-a001-20200225
parisc               randconfig-a001-20200225
riscv                randconfig-a001-20200225
nds32                randconfig-a001-20200224
mips                 randconfig-a001-20200224
riscv                randconfig-a001-20200224
parisc               randconfig-a001-20200224
alpha                randconfig-a001-20200224
m68k                 randconfig-a001-20200224
c6x                  randconfig-a001-20200225
h8300                randconfig-a001-20200225
microblaze           randconfig-a001-20200225
nios2                randconfig-a001-20200225
sparc64              randconfig-a001-20200225
nios2                randconfig-a001-20200224
c6x                  randconfig-a001-20200224
sparc64              randconfig-a001-20200224
microblaze           randconfig-a001-20200224
h8300                randconfig-a001-20200224
openrisc             randconfig-a001-20200224
sh                   randconfig-a001-20200224
s390                 randconfig-a001-20200224
xtensa               randconfig-a001-20200224
csky                 randconfig-a001-20200224
x86_64               randconfig-b001-20200225
x86_64               randconfig-b002-20200225
x86_64               randconfig-b003-20200225
i386                 randconfig-b001-20200225
i386                 randconfig-b002-20200225
i386                 randconfig-b003-20200225
x86_64               randconfig-b001-20200224
i386                 randconfig-b002-20200224
x86_64               randconfig-b003-20200224
i386                 randconfig-b003-20200224
i386                 randconfig-b001-20200224
x86_64               randconfig-b002-20200224
x86_64               randconfig-c001-20200225
x86_64               randconfig-c002-20200225
x86_64               randconfig-c003-20200225
i386                 randconfig-c001-20200225
i386                 randconfig-c002-20200225
i386                 randconfig-c003-20200225
x86_64               randconfig-c001-20200224
x86_64               randconfig-c002-20200224
x86_64               randconfig-c003-20200224
i386                 randconfig-c001-20200224
i386                 randconfig-c002-20200224
i386                 randconfig-c003-20200224
i386                 randconfig-d002-20200224
x86_64               randconfig-d002-20200224
x86_64               randconfig-d003-20200224
i386                 randconfig-d001-20200224
x86_64               randconfig-d001-20200224
i386                 randconfig-d003-20200224
x86_64               randconfig-d001-20200225
x86_64               randconfig-d002-20200225
x86_64               randconfig-d003-20200225
i386                 randconfig-d001-20200225
i386                 randconfig-d002-20200225
i386                 randconfig-d003-20200225
x86_64               randconfig-e002-20200224
i386                 randconfig-e001-20200224
x86_64               randconfig-e003-20200224
x86_64               randconfig-e001-20200224
i386                 randconfig-e003-20200224
i386                 randconfig-e002-20200224
x86_64               randconfig-e001-20200225
x86_64               randconfig-e002-20200225
x86_64               randconfig-e003-20200225
i386                 randconfig-e001-20200225
i386                 randconfig-e002-20200225
i386                 randconfig-e003-20200225
x86_64               randconfig-f001-20200224
x86_64               randconfig-f002-20200224
x86_64               randconfig-f003-20200224
i386                 randconfig-f001-20200224
i386                 randconfig-f002-20200224
i386                 randconfig-f003-20200224
x86_64               randconfig-g001-20200225
x86_64               randconfig-g002-20200225
x86_64               randconfig-g003-20200225
i386                 randconfig-g001-20200225
i386                 randconfig-g002-20200225
i386                 randconfig-g003-20200225
x86_64               randconfig-h001-20200225
x86_64               randconfig-h002-20200225
x86_64               randconfig-h003-20200225
i386                 randconfig-h001-20200225
i386                 randconfig-h002-20200225
i386                 randconfig-h003-20200225
i386                 randconfig-h003-20200224
i386                 randconfig-h002-20200224
x86_64               randconfig-h002-20200224
x86_64               randconfig-h003-20200224
i386                 randconfig-h001-20200224
x86_64               randconfig-h001-20200224
arm64                randconfig-a001-20200224
ia64                 randconfig-a001-20200224
powerpc              randconfig-a001-20200224
arm                  randconfig-a001-20200224
arc                  randconfig-a001-20200224
sparc                randconfig-a001-20200224
arc                  randconfig-a001-20200225
arm                  randconfig-a001-20200225
arm64                randconfig-a001-20200225
ia64                 randconfig-a001-20200225
powerpc              randconfig-a001-20200225
sparc                randconfig-a001-20200225
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
