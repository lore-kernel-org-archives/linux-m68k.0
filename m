Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D33C433DB
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Feb 2021 21:07:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1CB564ECC
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Feb 2021 21:07:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhBAVH0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Feb 2021 16:07:26 -0500
Received: from mga04.intel.com ([192.55.52.120]:13816 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229525AbhBAVHZ (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Feb 2021 16:07:25 -0500
IronPort-SDR: cgUMs2pZ2cOI0CQeqaXC3JBrhA7yCntsv2cFSCQ2yVV9eJ9ohjckM8VHZWsyjfXO336lPufkx4
 pigVNG7VY+PQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="178191851"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="178191851"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 13:06:44 -0800
IronPort-SDR: v1LbC01A+5oPnWP1P+gqUdb7rcFwxzRAJyPhgKE7BEC7ZCWYZzAU181zCCy+vqxvmk+jiYUQDP
 wfdfgK21uGGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="479294182"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2021 13:06:43 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l6gPC-0008MB-NJ; Mon, 01 Feb 2021 21:06:42 +0000
Date:   Tue, 02 Feb 2021 05:06:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 ba69143c0249902349d36552a40ac7ada0a61faf
Message-ID: <60186d60./zTBWOUimiDO6Bxs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: ba69143c0249902349d36552a40ac7ada0a61faf  Merge tag 'v5.11-rc6'

elapsed time: 720m

configs tested: 91
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7264_defconfig
sh                           se7619_defconfig
sh                            migor_defconfig
mips                 decstation_r4k_defconfig
arc                          axs103_defconfig
powerpc                      chrp32_defconfig
riscv                             allnoconfig
arm                        multi_v5_defconfig
arm                       aspeed_g4_defconfig
xtensa                         virt_defconfig
powerpc                       ebony_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          urquell_defconfig
sh                           se7712_defconfig
powerpc                mpc7448_hpc2_defconfig
c6x                              alldefconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210201
x86_64               randconfig-a001-20210201
x86_64               randconfig-a005-20210201
x86_64               randconfig-a002-20210201
x86_64               randconfig-a004-20210201
x86_64               randconfig-a003-20210201
i386                 randconfig-a001-20210201
i386                 randconfig-a005-20210201
i386                 randconfig-a003-20210201
i386                 randconfig-a006-20210201
i386                 randconfig-a002-20210201
i386                 randconfig-a004-20210201
i386                 randconfig-a013-20210201
i386                 randconfig-a016-20210201
i386                 randconfig-a014-20210201
i386                 randconfig-a012-20210201
i386                 randconfig-a015-20210201
i386                 randconfig-a011-20210201
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210201
x86_64               randconfig-a014-20210201
x86_64               randconfig-a015-20210201
x86_64               randconfig-a016-20210201
x86_64               randconfig-a011-20210201
x86_64               randconfig-a012-20210201

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
