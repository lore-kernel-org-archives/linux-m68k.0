Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1C7C4332D
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Dec 2020 23:12:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1BED22B3B
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Dec 2020 23:12:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730868AbgL1Wz4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Dec 2020 17:55:56 -0500
Received: from mga05.intel.com ([192.55.52.43]:61005 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729687AbgL1Wvu (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 28 Dec 2020 17:51:50 -0500
IronPort-SDR: N3D/tjIqeVU1PCM1g0gueMMe7syteNakaXCRzfOkNA6elExhRWMg2IuAARwvkDVKIElz6cU2Se
 xLJmD5YTFOGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="261182764"
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="261182764"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 14:51:07 -0800
IronPort-SDR: jqVw1Q8wzTdnTSDLj3CkQ2TDGyDVqG05yPlN8M4ELttX4FGgaaups9CFry0zdjE0Pxjw3XgJkx
 rZ3fKgF5U31w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="562961553"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Dec 2020 14:51:06 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ku1M1-00039h-TZ; Mon, 28 Dec 2020 22:51:05 +0000
Date:   Tue, 29 Dec 2020 06:50:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 7ad3b1ea2375da6fdd5f9e4c902fd4660fd419ed
Message-ID: <5fea6148.WxSVkVH88mcLc9Di%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: 7ad3b1ea2375da6fdd5f9e4c902fd4660fd419ed  Merge tag 'v5.11-rc1'

elapsed time: 723m

configs tested: 104
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         tb0287_defconfig
arc                        nsim_700_defconfig
sh                   sh7770_generic_defconfig
mips                            e55_defconfig
arm                          imote2_defconfig
x86_64                           allyesconfig
sh                         apsh4a3a_defconfig
arc                         haps_hs_defconfig
powerpc                  storcenter_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc8540_ads_defconfig
um                           x86_64_defconfig
powerpc                     taishan_defconfig
mips                          ath25_defconfig
arm                          lpd270_defconfig
arm                         bcm2835_defconfig
sh                           se7751_defconfig
mips                        bcm47xx_defconfig
m68k                           sun3_defconfig
powerpc                        icon_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                      arches_defconfig
mips                  decstation_64_defconfig
ia64                             alldefconfig
arm                         shannon_defconfig
powerpc                      walnut_defconfig
sh                        sh7763rdp_defconfig
mips                             allmodconfig
m68k                        stmark2_defconfig
arm                           sunxi_defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20201228
i386                 randconfig-a002-20201228
i386                 randconfig-a004-20201228
i386                 randconfig-a006-20201228
i386                 randconfig-a003-20201228
i386                 randconfig-a001-20201228
x86_64               randconfig-a014-20201228
x86_64               randconfig-a015-20201228
x86_64               randconfig-a016-20201228
x86_64               randconfig-a012-20201228
x86_64               randconfig-a011-20201228
x86_64               randconfig-a013-20201228
i386                 randconfig-a014-20201228
i386                 randconfig-a012-20201228
i386                 randconfig-a016-20201228
i386                 randconfig-a011-20201228
i386                 randconfig-a015-20201228
i386                 randconfig-a013-20201228
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20201228
x86_64               randconfig-a006-20201228
x86_64               randconfig-a002-20201228
x86_64               randconfig-a004-20201228
x86_64               randconfig-a003-20201228
x86_64               randconfig-a005-20201228

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
