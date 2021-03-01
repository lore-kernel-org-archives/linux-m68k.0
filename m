Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B58C433DB
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Mar 2021 22:11:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D85B1601FF
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Mar 2021 22:11:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240350AbhCAWLS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Mar 2021 17:11:18 -0500
Received: from mga06.intel.com ([134.134.136.31]:64579 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244962AbhCAWIm (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Mar 2021 17:08:42 -0500
IronPort-SDR: nZNb4mw+pqo8zodyN+gosfFJo85eel6yHT3iq3IaQVWSBSFHf+aV7nBYbNFxzcdyoeyuhBT62b
 fbFCfiQACbFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248021683"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="248021683"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 14:07:59 -0800
IronPort-SDR: K6U7F4YY0GVzPCvG1n8jE5BUMHXsDyxZ1fzbkkWWnSn9IblKwzicVPoqLjRDapoWGckYwiGNWs
 5Mk67UBHhAbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="397947310"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2021 14:07:58 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lGqhp-0004l9-D9; Mon, 01 Mar 2021 22:07:57 +0000
Date:   Tue, 02 Mar 2021 06:07:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:for-next] BUILD SUCCESS
 5d2b62832c2ef88d0baa9d99d06b481cd3bace18
Message-ID: <603d6588.zKVhKi7rP7MsqKqs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
branch HEAD: 5d2b62832c2ef88d0baa9d99d06b481cd3bace18  m68k: Fix virt_addr_valid() W=1 compiler warnings

elapsed time: 730m

configs tested: 88
configs skipped: 81

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5475evb_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      walnut_defconfig
m68k                        mvme16x_defconfig
arm                        vexpress_defconfig
m68k                        m5272c3_defconfig
arm                           sama5_defconfig
riscv                            alldefconfig
arm                           spitz_defconfig
powerpc                        warp_defconfig
xtensa                       common_defconfig
arm                        neponset_defconfig
sh                     magicpanelr2_defconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210301
i386                 randconfig-a003-20210301
i386                 randconfig-a002-20210301
i386                 randconfig-a004-20210301
i386                 randconfig-a006-20210301
i386                 randconfig-a001-20210301
x86_64               randconfig-a013-20210301
x86_64               randconfig-a016-20210301
x86_64               randconfig-a015-20210301
x86_64               randconfig-a014-20210301
x86_64               randconfig-a012-20210301
x86_64               randconfig-a011-20210301
i386                 randconfig-a016-20210301
i386                 randconfig-a012-20210301
i386                 randconfig-a014-20210301
i386                 randconfig-a013-20210301
i386                 randconfig-a011-20210301
i386                 randconfig-a015-20210301
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210301
x86_64               randconfig-a001-20210301
x86_64               randconfig-a004-20210301
x86_64               randconfig-a002-20210301
x86_64               randconfig-a005-20210301
x86_64               randconfig-a003-20210301

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
