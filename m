Return-Path: <SRS0=RMM9=4W=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2BEC3F2D1
	for <linux-m68k@archiver.kernel.org>; Thu,  5 Mar 2020 05:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E70072146E
	for <linux-m68k@archiver.kernel.org>; Thu,  5 Mar 2020 05:46:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgCEFqG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 5 Mar 2020 00:46:06 -0500
Received: from mga14.intel.com ([192.55.52.115]:30997 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbgCEFqG (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 5 Mar 2020 00:46:06 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Mar 2020 21:46:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,516,1574150400"; 
   d="scan'208";a="229578302"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Mar 2020 21:46:03 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j9jKc-000HZ2-UQ; Thu, 05 Mar 2020 13:46:02 +0800
Date:   Thu, 05 Mar 2020 13:45:00 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 e64dab7d50487ce4ca6b68635d3a83d2dca26cd4
Message-ID: <5e6091dc.vyQcPmy8q5Z33yBy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: e64dab7d50487ce4ca6b68635d3a83d2dca26cd4  Merge tag 'v5.6-rc4'

elapsed time: 4087m

configs tested: 173
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
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
xtensa                          iss_defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
openrisc                 simple_smp_defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                       common_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                           sun3_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
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
openrisc             randconfig-a001-20200302
xtensa               randconfig-a001-20200302
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
x86_64               randconfig-d002-20200302
x86_64               randconfig-d003-20200302
i386                 randconfig-d001-20200302
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
arc                  randconfig-a001-20200301
sparc                randconfig-a001-20200301
ia64                 randconfig-a001-20200301
arm                  randconfig-a001-20200301
arm64                randconfig-a001-20200301
arc                  randconfig-a001-20200302
arm                  randconfig-a001-20200302
arm64                randconfig-a001-20200302
ia64                 randconfig-a001-20200302
powerpc              randconfig-a001-20200302
sparc                randconfig-a001-20200302
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                              allnoconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                                allnoconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sh                               allmodconfig
sh                          rsk7269_defconfig
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
