Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B92EC433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Feb 2022 00:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiBOA0i (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Feb 2022 19:26:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiBOA0h (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Feb 2022 19:26:37 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3433FDB8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 16:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644884788; x=1676420788;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JMjVUVKnt7thFF6KPMfdmGTkOreA7ub3klFs16no23c=;
  b=f2RpAVKt+kgkxtT1xwi1AOpqVq4qw2/A3YNSVCFM3SETM7WtOrfA1IWN
   2yE+HNA5QGucjBwqa1+h5i/vZ/3hIXqQWxQvuCyLWWhouEmix2Xv7YmnL
   wGlcSDGhPXQXB9mhHZ+8ZK/+oAV2eQjIQZF2B8iDEo+5spieWSkRsEAtK
   v72SBoxcFkpK+2E7sTPJM9yLhth27hVc4x8TLyGvhecg+NFe/ykeIk5RC
   63sNWOVbXYoW6iFVjI5Hdstj+Nqml4dYzavp72CpuRpj5TMob6kBXNQ6H
   Jlq5IJKebhoNLvE5xthmPx8ryMy04qDtJ7IA5w4ai9evYpkK/6daZXgVZ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="247810373"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="247810373"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 16:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="773289127"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Feb 2022 16:26:26 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nJlfl-00095X-N3; Tue, 15 Feb 2022 00:26:25 +0000
Date:   Tue, 15 Feb 2022 08:26:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 b71f1c5991da14ccfa9cbf5d08f009737d3afcb0
Message-ID: <620af318.WXfYwn8eNzprX+Sj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: b71f1c5991da14ccfa9cbf5d08f009737d3afcb0  Merge tag 'v5.17-rc4'

elapsed time: 728m

configs tested: 159
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220214
mips                 randconfig-c004-20220214
powerpc              randconfig-c003-20220214
sh                           se7206_defconfig
powerpc                     ep8248e_defconfig
arc                            hsdk_defconfig
arm                          lpd270_defconfig
nios2                            alldefconfig
sh                          r7780mp_defconfig
sh                            titan_defconfig
ia64                         bigsur_defconfig
m68k                       m5249evb_defconfig
mips                         cobalt_defconfig
powerpc                       maple_defconfig
powerpc64                           defconfig
arm                        mvebu_v7_defconfig
m68k                       m5475evb_defconfig
m68k                          atari_defconfig
sparc                            alldefconfig
sparc                       sparc32_defconfig
m68k                            mac_defconfig
mips                         tb0226_defconfig
x86_64                           alldefconfig
ia64                            zx1_defconfig
sh                           se7705_defconfig
arm                      integrator_defconfig
sh                           se7780_defconfig
sh                         ap325rxa_defconfig
arm                         at91_dt_defconfig
arm                           u8500_defconfig
mips                    maltaup_xpa_defconfig
arm                         lpc18xx_defconfig
powerpc                      bamboo_defconfig
arc                        nsimosci_defconfig
arm                  randconfig-c002-20220214
arm                  randconfig-c002-20220213
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
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                          randconfig-a003
i386                          randconfig-a001
x86_64               randconfig-a013-20220214
x86_64               randconfig-a014-20220214
x86_64               randconfig-a012-20220214
x86_64               randconfig-a015-20220214
x86_64               randconfig-a011-20220214
x86_64               randconfig-a016-20220214
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                 randconfig-a013-20220214
i386                 randconfig-a016-20220214
i386                 randconfig-a012-20220214
i386                 randconfig-a015-20220214
i386                 randconfig-a011-20220214
i386                 randconfig-a014-20220214
i386                          randconfig-a012
i386                          randconfig-a014
riscv                randconfig-r042-20220214
arc                  randconfig-r043-20220214
s390                 randconfig-r044-20220214
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20220214
x86_64               randconfig-c007-20220214
powerpc              randconfig-c003-20220214
arm                  randconfig-c002-20220214
s390                 randconfig-c005-20220214
mips                 randconfig-c004-20220214
riscv                randconfig-c006-20220214
mips                         tb0287_defconfig
arm                         lpc32xx_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     tqm8560_defconfig
mips                       lemote2f_defconfig
mips                      malta_kvm_defconfig
mips                        workpad_defconfig
arm                         s3c2410_defconfig
powerpc                     ppa8548_defconfig
arm64                            allyesconfig
arm                            dove_defconfig
mips                          ath25_defconfig
arm                       mainstone_defconfig
mips                     cu1830-neo_defconfig
arm                       spear13xx_defconfig
powerpc                     mpc512x_defconfig
arm                          imote2_defconfig
arm                          moxart_defconfig
mips                         tb0219_defconfig
mips                     cu1000-neo_defconfig
x86_64               randconfig-a002-20220214
x86_64               randconfig-a006-20220214
x86_64               randconfig-a005-20220214
x86_64               randconfig-a004-20220214
x86_64               randconfig-a003-20220214
x86_64               randconfig-a001-20220214
i386                 randconfig-a004-20220214
i386                 randconfig-a005-20220214
i386                 randconfig-a006-20220214
i386                 randconfig-a002-20220214
i386                 randconfig-a003-20220214
i386                 randconfig-a001-20220214
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220213
hexagon              randconfig-r045-20220214
hexagon              randconfig-r041-20220214
hexagon              randconfig-r041-20220213
riscv                randconfig-r042-20220213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
