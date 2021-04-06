Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFB4C433B4
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Apr 2021 19:53:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0960861284
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Apr 2021 19:53:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245103AbhDFTxI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 6 Apr 2021 15:53:08 -0400
Received: from mga02.intel.com ([134.134.136.20]:1272 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242803AbhDFTxI (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 6 Apr 2021 15:53:08 -0400
IronPort-SDR: +/eJ4FlpKVXhdY7i0CVdJKoAstURp4HkXNnjV+pBVzvovcc7PYIlIt/plNl+FmxxT4CzRciRRi
 BlL3YIPvzuew==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="180277350"
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; 
   d="scan'208";a="180277350"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 12:52:59 -0700
IronPort-SDR: 309xTC7UCd8+kL9P+u4/a4TyZg5yFLQfWqCzObKUVn/s0D93SA/Ah3lpgGozjJvHfWKJQCNWrU
 eetyWex59BXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; 
   d="scan'208";a="612653549"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2021 12:52:57 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lTrkv-000CBp-4D; Tue, 06 Apr 2021 19:52:57 +0000
Date:   Wed, 07 Apr 2021 03:52:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 2a87461a35b76691d4e7577bf28fff7f99208719
Message-ID: <606cbc0b.mGED2q2rey3CePZn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 2a87461a35b76691d4e7577bf28fff7f99208719  m68k: fpsp040,ifpsp060: Remove meaningless EXTRA_LDFLAGS

elapsed time: 727m

configs tested: 96
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
nds32                             allnoconfig
mips                           mtx1_defconfig
arc                     nsimosci_hs_defconfig
powerpc                 mpc836x_mds_defconfig
arm                      tct_hammer_defconfig
csky                             alldefconfig
mips                           rs90_defconfig
m68k                       bvme6000_defconfig
arc                        nsimosci_defconfig
sh                           se7780_defconfig
powerpc                    amigaone_defconfig
arm64                            alldefconfig
h8300                    h8300h-sim_defconfig
sh                        sh7785lcr_defconfig
mips                       lemote2f_defconfig
openrisc                    or1ksim_defconfig
mips                      malta_kvm_defconfig
powerpc                     skiroot_defconfig
powerpc                     kmeter1_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
nios2                               defconfig
arc                              allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20210406
i386                 randconfig-a003-20210406
i386                 randconfig-a001-20210406
i386                 randconfig-a004-20210406
i386                 randconfig-a005-20210406
i386                 randconfig-a002-20210406
x86_64               randconfig-a004-20210406
x86_64               randconfig-a003-20210406
x86_64               randconfig-a005-20210406
x86_64               randconfig-a001-20210406
x86_64               randconfig-a002-20210406
x86_64               randconfig-a006-20210406
i386                 randconfig-a014-20210406
i386                 randconfig-a016-20210406
i386                 randconfig-a011-20210406
i386                 randconfig-a012-20210406
i386                 randconfig-a015-20210406
i386                 randconfig-a013-20210406
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210406
x86_64               randconfig-a015-20210406
x86_64               randconfig-a013-20210406
x86_64               randconfig-a011-20210406
x86_64               randconfig-a012-20210406
x86_64               randconfig-a016-20210406

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
