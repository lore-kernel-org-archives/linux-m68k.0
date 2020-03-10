Return-Path: <SRS0=jzol=43=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B787C10F25
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Mar 2020 03:39:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 387FC24649
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Mar 2020 03:39:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbgCJDjh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Mar 2020 23:39:37 -0400
Received: from mga02.intel.com ([134.134.136.20]:29240 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726170AbgCJDjh (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Mar 2020 23:39:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Mar 2020 20:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; 
   d="scan'208";a="242180021"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Mar 2020 20:39:35 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jBVjy-000I6S-S9; Tue, 10 Mar 2020 11:39:34 +0800
Date:   Tue, 10 Mar 2020 11:39:15 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 30dc72d2b3fe2285ec14c9bf08e1983deb0ea235
Message-ID: <5e670be3.GGPI53orGdM4elMr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: 30dc72d2b3fe2285ec14c9bf08e1983deb0ea235  Merge tag 'v5.6-rc5'

elapsed time: 1043m

configs tested: 146
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
ia64                                defconfig
powerpc                             defconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              allnoconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
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
alpha                randconfig-a001-20200309
m68k                 randconfig-a001-20200309
mips                 randconfig-a001-20200309
nds32                randconfig-a001-20200309
parisc               randconfig-a001-20200309
riscv                randconfig-a001-20200309
c6x                  randconfig-a001-20200309
h8300                randconfig-a001-20200309
microblaze           randconfig-a001-20200309
nios2                randconfig-a001-20200309
sparc64              randconfig-a001-20200309
csky                 randconfig-a001-20200309
openrisc             randconfig-a001-20200309
s390                 randconfig-a001-20200309
sh                   randconfig-a001-20200309
xtensa               randconfig-a001-20200309
x86_64               randconfig-b001-20200309
x86_64               randconfig-b002-20200309
x86_64               randconfig-b003-20200309
i386                 randconfig-b001-20200309
i386                 randconfig-b002-20200309
i386                 randconfig-b003-20200309
x86_64               randconfig-c001-20200309
x86_64               randconfig-c002-20200309
x86_64               randconfig-c003-20200309
i386                 randconfig-c001-20200309
i386                 randconfig-c002-20200309
i386                 randconfig-c003-20200309
x86_64               randconfig-d001-20200309
x86_64               randconfig-d002-20200309
x86_64               randconfig-d003-20200309
i386                 randconfig-d001-20200309
i386                 randconfig-d002-20200309
i386                 randconfig-d003-20200309
x86_64               randconfig-f001-20200309
x86_64               randconfig-f002-20200309
x86_64               randconfig-f003-20200309
i386                 randconfig-f001-20200309
i386                 randconfig-f002-20200309
i386                 randconfig-f003-20200309
x86_64               randconfig-g001-20200309
x86_64               randconfig-g002-20200309
x86_64               randconfig-g003-20200309
i386                 randconfig-g001-20200309
i386                 randconfig-g002-20200309
i386                 randconfig-g003-20200309
x86_64               randconfig-h001-20200309
x86_64               randconfig-h002-20200309
x86_64               randconfig-h003-20200309
i386                 randconfig-h001-20200309
i386                 randconfig-h002-20200309
i386                 randconfig-h003-20200309
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                       zfcpdump_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                            allyesconfig
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
