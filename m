Return-Path: <SRS0=8h3E=EC=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD470C2D0A3
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Oct 2020 00:28:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 836D920882
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Oct 2020 00:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410913AbgJ0A2G (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Oct 2020 20:28:06 -0400
Received: from mga14.intel.com ([192.55.52.115]:2665 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2410354AbgJ0A2F (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Oct 2020 20:28:05 -0400
IronPort-SDR: ZN+mz5+sDOixiyFPgAw6AmLSYfpqjJmy8vzoNboXgVifyeuqaz9aCkeeD1a/xI2CjBSXWNFOY7
 bdiiZshNtLPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="167225560"
X-IronPort-AV: E=Sophos;i="5.77,421,1596524400"; 
   d="scan'208";a="167225560"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2020 17:28:03 -0700
IronPort-SDR: +UuotkyLr3vzX67NeK8eKAhr6XxN5/srNXLtpjchltzhJgCKT4Xr2nfgvC8j/opbVV2bDtDhbW
 jvCkAptJncWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,421,1596524400"; 
   d="scan'208";a="535573032"
Received: from lkp-server01.sh.intel.com (HELO ca9e3ad0a302) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Oct 2020 17:28:01 -0700
Received: from kbuild by ca9e3ad0a302 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kXCqG-0000EJ-SI; Tue, 27 Oct 2020 00:28:00 +0000
Date:   Tue, 27 Oct 2020 08:27:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 95a01298967383a5c2f0ce48d6541ed9ecf40e85
Message-ID: <5f976985.kQVHi6UtpUpFeZJX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: 95a01298967383a5c2f0ce48d6541ed9ecf40e85  Merge tag 'v5.10-rc1'

elapsed time: 724m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                       h8s-sim_defconfig
csky                                defconfig
x86_64                              defconfig
mips                        nlm_xlr_defconfig
riscv                          rv32_defconfig
sh                           se7705_defconfig
arm                        spear6xx_defconfig
arm                              zx_defconfig
mips                          malta_defconfig
arm                         mv78xx0_defconfig
nios2                               defconfig
mips                         tb0287_defconfig
mips                         db1xxx_defconfig
mips                       bmips_be_defconfig
h8300                    h8300h-sim_defconfig
powerpc                      pmac32_defconfig
sh                      rts7751r2d1_defconfig
mips                      malta_kvm_defconfig
arm                         assabet_defconfig
arc                              alldefconfig
sh                           se7343_defconfig
nios2                            alldefconfig
arm                            lart_defconfig
mips                            e55_defconfig
microblaze                          defconfig
arc                          axs103_defconfig
xtensa                generic_kc705_defconfig
sh                   sh7724_generic_defconfig
powerpc                 linkstation_defconfig
arm                          collie_defconfig
sh                          r7780mp_defconfig
m68k                        m5407c3_defconfig
riscv                            alldefconfig
xtensa                          iss_defconfig
mips                           ip22_defconfig
sh                        edosk7705_defconfig
arm                         cm_x300_defconfig
powerpc                     rainier_defconfig
powerpc                     pseries_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
i386                 randconfig-a002-20201026
i386                 randconfig-a003-20201026
i386                 randconfig-a005-20201026
i386                 randconfig-a001-20201026
i386                 randconfig-a006-20201026
i386                 randconfig-a004-20201026
x86_64               randconfig-a011-20201026
x86_64               randconfig-a013-20201026
x86_64               randconfig-a016-20201026
x86_64               randconfig-a015-20201026
x86_64               randconfig-a012-20201026
x86_64               randconfig-a014-20201026
i386                 randconfig-a016-20201026
i386                 randconfig-a015-20201026
i386                 randconfig-a014-20201026
i386                 randconfig-a012-20201026
i386                 randconfig-a013-20201026
i386                 randconfig-a011-20201026
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20201026
x86_64               randconfig-a003-20201026
x86_64               randconfig-a002-20201026
x86_64               randconfig-a006-20201026
x86_64               randconfig-a004-20201026
x86_64               randconfig-a005-20201026

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
