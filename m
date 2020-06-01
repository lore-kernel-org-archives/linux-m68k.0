Return-Path: <SRS0=WB/I=7O=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E70EC433E1
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 21:32:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9C262077D
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 21:32:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728653AbgFAVcZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Jun 2020 17:32:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:61811 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728182AbgFAVcZ (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Jun 2020 17:32:25 -0400
IronPort-SDR: fOUrNPu7uY0AY9fd4a0l8ywf2hWg79oH2bjThRlLcw16i1q/dVjHincaS65qlzyefhMAEIR9oP
 JuKXti+810fw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2020 14:32:24 -0700
IronPort-SDR: JH8O2FYXozlK2zJMBi/iloPePrQuZERRPo0hnzgQ6GRgQY2vvDh3MCn3PiI9KYloSANhu1io0Y
 jSAAU+ep8lPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,462,1583222400"; 
   d="scan'208";a="257387492"
Received: from lkp-server01.sh.intel.com (HELO 78d03bb9d680) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Jun 2020 14:32:23 -0700
Received: from kbuild by 78d03bb9d680 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jfs2g-0000BX-9j; Mon, 01 Jun 2020 21:32:22 +0000
Date:   Tue, 02 Jun 2020 05:32:04 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 2271836fdaaba1997ebb89b7ff061fcf68b472a8
Message-ID: <5ed573d4.p5dI10k/SvwSfthd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: 2271836fdaaba1997ebb89b7ff061fcf68b472a8  Merge tag 'v5.7'

elapsed time: 514m

configs tested: 111
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
x86_64                              defconfig
sh                            hp6xx_defconfig
s390                                defconfig
sh                           cayman_defconfig
nds32                            alldefconfig
mips                         tb0287_defconfig
sh                         microdev_defconfig
powerpc                       holly_defconfig
powerpc                mpc7448_hpc2_defconfig
nios2                            alldefconfig
mips                      pic32mzda_defconfig
xtensa                          iss_defconfig
powerpc                     mpc83xx_defconfig
h8300                       h8s-sim_defconfig
arm                       imx_v4_v5_defconfig
mips                     decstation_defconfig
arm                          collie_defconfig
powerpc                       maple_defconfig
powerpc                      chrp32_defconfig
arm                      footbridge_defconfig
arm                          ixp4xx_defconfig
i386                              allnoconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200601
i386                 randconfig-a006-20200601
i386                 randconfig-a002-20200601
i386                 randconfig-a005-20200601
i386                 randconfig-a003-20200601
i386                 randconfig-a004-20200601
x86_64               randconfig-a002-20200601
x86_64               randconfig-a006-20200601
x86_64               randconfig-a001-20200601
x86_64               randconfig-a003-20200601
x86_64               randconfig-a004-20200601
x86_64               randconfig-a005-20200601
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc                            allyesconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
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
