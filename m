Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B165BC433DB
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Mar 2021 22:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8062160230
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Mar 2021 22:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236452AbhCAWNh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Mar 2021 17:13:37 -0500
Received: from mga06.intel.com ([134.134.136.31]:64579 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238013AbhCAWLJ (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Mar 2021 17:11:09 -0500
IronPort-SDR: +UA6ZUFAgUOSI5nbm9E3tvY4OvzDtnOP76DQIp0O7CWeLtq2OxV/rO5PI20M5GS/IkHTv0431L
 xQyu4+1Nb+MA==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248021682"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="248021682"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 14:07:59 -0800
IronPort-SDR: hItGHx3BIIC2M2q8spTNc1NXAgU30ZfsXSFriFM8PkrSOrmnKcO9G39UkDYJ1B70eB3iaF9TSX
 5Kmlu04vTfdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="368745258"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Mar 2021 14:07:58 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lGqhp-0004l4-BY; Mon, 01 Mar 2021 22:07:57 +0000
Date:   Tue, 02 Mar 2021 06:06:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 e6ff6d209f2106e9f7fd5d0c4f4ef3e45996888c
Message-ID: <603d6581.8PGMSEV3nJcyESpG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: e6ff6d209f2106e9f7fd5d0c4f4ef3e45996888c  m68k: Fix virt_addr_valid() W=1 compiler warnings

elapsed time: 726m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      walnut_defconfig
m68k                        mvme16x_defconfig
arm                        vexpress_defconfig
m68k                       m5249evb_defconfig
arm                             ezx_defconfig
powerpc                     kmeter1_defconfig
sh                           se7721_defconfig
powerpc                 linkstation_defconfig
m68k                        m5272c3_defconfig
sh                        sh7785lcr_defconfig
arm                           sama5_defconfig
riscv                            alldefconfig
arm                           spitz_defconfig
powerpc                        warp_defconfig
xtensa                       common_defconfig
arm                        neponset_defconfig
sh                     magicpanelr2_defconfig
nios2                            alldefconfig
powerpc                       ebony_defconfig
powerpc                 mpc8313_rdb_defconfig
riscv                    nommu_virt_defconfig
powerpc                 mpc834x_mds_defconfig
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
s390                             allmodconfig
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
