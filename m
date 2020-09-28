Return-Path: <SRS0=jiH+=DF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6302EC2D0A8
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Sep 2020 21:27:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 102272083B
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Sep 2020 21:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgI1V1R (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Sep 2020 17:27:17 -0400
Received: from mga09.intel.com ([134.134.136.24]:47977 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726582AbgI1V1R (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 28 Sep 2020 17:27:17 -0400
IronPort-SDR: EbOLQwzgcgLCCvRR81Bz76fBTqBBMd9VmkuvYvrd7O/W4XuP1+7jHHuOOINJ9tesj9PVtqLKgA
 6K+B0exvT9mQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="162946102"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="162946102"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 14:27:15 -0700
IronPort-SDR: 57OUY5fBSwD2P4TLmXeifxbZ+WBp5E4ZVK2Cb6MmxsO5gcfibiqPj51noOPJFC0WOVLRtVw9JU
 +Q0lvHGAoW0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="294034972"
Received: from lkp-server01.sh.intel.com (HELO 0e0978ea3297) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Sep 2020 14:27:14 -0700
Received: from kbuild by 0e0978ea3297 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kN0fy-0000PE-0F; Mon, 28 Sep 2020 21:27:14 +0000
Date:   Tue, 29 Sep 2020 05:27:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-queue] BUILD SUCCESS
 acf4becdad7e6fe614dfe4ca4a12c834ac77fd5e
Message-ID: <5f725525./81nG+rz1eIy0hhZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
branch HEAD: acf4becdad7e6fe614dfe4ca4a12c834ac77fd5e  fat: Use correct logical sector size for Atari GEMDOS FAT

elapsed time: 725m

configs tested: 102
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                    vt8500_v6_v7_defconfig
xtensa                generic_kc705_defconfig
openrisc                         alldefconfig
arm                     eseries_pxa_defconfig
mips                      bmips_stb_defconfig
m68k                          sun3x_defconfig
nios2                         3c120_defconfig
powerpc                     rainier_defconfig
powerpc                     mpc512x_defconfig
mips                       lemote2f_defconfig
riscv                          rv32_defconfig
powerpc                     akebono_defconfig
arc                          axs101_defconfig
arm                          prima2_defconfig
sh                        sh7763rdp_defconfig
sh                           se7619_defconfig
ia64                      gensparse_defconfig
arm                         ebsa110_defconfig
m68k                            q40_defconfig
um                           x86_64_defconfig
sh                        edosk7760_defconfig
sparc64                          alldefconfig
sh                           se7780_defconfig
sh                           se7750_defconfig
mips                           xway_defconfig
arm                        cerfcube_defconfig
arm                  colibri_pxa270_defconfig
sh                          rsk7201_defconfig
mips                      maltaaprp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20200928
x86_64               randconfig-a003-20200928
x86_64               randconfig-a004-20200928
x86_64               randconfig-a002-20200928
x86_64               randconfig-a006-20200928
x86_64               randconfig-a001-20200928
i386                 randconfig-a006-20200928
i386                 randconfig-a002-20200928
i386                 randconfig-a003-20200928
i386                 randconfig-a004-20200928
i386                 randconfig-a005-20200928
i386                 randconfig-a001-20200928
x86_64               randconfig-a011-20200927
x86_64               randconfig-a013-20200927
x86_64               randconfig-a014-20200927
x86_64               randconfig-a015-20200927
x86_64               randconfig-a012-20200927
x86_64               randconfig-a016-20200927
i386                 randconfig-a012-20200928
i386                 randconfig-a016-20200928
i386                 randconfig-a014-20200928
i386                 randconfig-a013-20200928
i386                 randconfig-a015-20200928
i386                 randconfig-a011-20200928
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
