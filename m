Return-Path: <SRS0=0yiB=55=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E55C2BA19
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 17:46:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 813142063A
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 17:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387433AbgDMRqf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Apr 2020 13:46:35 -0400
Received: from mga12.intel.com ([192.55.52.136]:11347 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387424AbgDMRqf (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Apr 2020 13:46:35 -0400
IronPort-SDR: XfNCXreSd2tkSwGbHCis5pS7z4yyVLE1lAhEa5MJ3octPBMBOds9GRmPufa6CaZSMQMPE7esgG
 Gof9rz9hRnag==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 10:46:33 -0700
IronPort-SDR: Ln2kvejo7xKOmXYcSRe0U0JzOhWQC5fszU/PCSn2GHXm+aga+jluDutZNIBBqe8Jf9z9OSOKeR
 mhYDRknPeCIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; 
   d="scan'208";a="243592957"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Apr 2020 10:46:32 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jO3AF-0003qC-LZ; Tue, 14 Apr 2020 01:46:31 +0800
Date:   Tue, 14 Apr 2020 01:46:23 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 bea488eeaee148fa94178bc45938c8e733ff20df
Message-ID: <5e94a56f.ZoUMw3qDKia6kAW4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: bea488eeaee148fa94178bc45938c8e733ff20df  Merge tag 'v5.7-rc1'

elapsed time: 499m

configs tested: 146
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
h8300                    h8300h-sim_defconfig
sparc64                          allmodconfig
s390                             allyesconfig
ia64                              allnoconfig
parisc                generic-32bit_defconfig
sparc                               defconfig
arc                                 defconfig
m68k                          multi_defconfig
parisc                generic-64bit_defconfig
ia64                             alldefconfig
sh                               allmodconfig
ia64                                defconfig
powerpc                             defconfig
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
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
h8300                     edosk2674_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
powerpc                       ppc64_defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
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
x86_64               randconfig-a001-20200413
x86_64               randconfig-a002-20200413
x86_64               randconfig-a003-20200413
i386                 randconfig-a001-20200413
i386                 randconfig-a002-20200413
i386                 randconfig-a003-20200413
h8300                randconfig-a001-20200413
nios2                randconfig-a001-20200413
c6x                  randconfig-a001-20200413
microblaze           randconfig-a001-20200413
sparc64              randconfig-a001-20200413
csky                 randconfig-a001-20200413
openrisc             randconfig-a001-20200413
s390                 randconfig-a001-20200413
sh                   randconfig-a001-20200413
xtensa               randconfig-a001-20200413
x86_64               randconfig-b002-20200413
i386                 randconfig-b001-20200413
x86_64               randconfig-b001-20200413
x86_64               randconfig-b003-20200413
i386                 randconfig-b003-20200413
i386                 randconfig-b002-20200413
x86_64               randconfig-c001-20200413
x86_64               randconfig-c002-20200413
x86_64               randconfig-c003-20200413
i386                 randconfig-c001-20200413
i386                 randconfig-c002-20200413
i386                 randconfig-c003-20200413
x86_64               randconfig-d001-20200413
x86_64               randconfig-d002-20200413
x86_64               randconfig-d003-20200413
i386                 randconfig-d001-20200413
i386                 randconfig-d002-20200413
i386                 randconfig-d003-20200413
x86_64               randconfig-e001-20200413
i386                 randconfig-e002-20200413
i386                 randconfig-e001-20200413
x86_64               randconfig-e002-20200413
i386                 randconfig-e003-20200413
x86_64               randconfig-e003-20200413
x86_64               randconfig-g001-20200413
x86_64               randconfig-g002-20200413
x86_64               randconfig-g003-20200413
i386                 randconfig-g001-20200413
i386                 randconfig-g002-20200413
i386                 randconfig-g003-20200413
ia64                 randconfig-a001-20200413
arc                  randconfig-a001-20200413
arm                  randconfig-a001-20200413
sparc                randconfig-a001-20200413
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
