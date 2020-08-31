Return-Path: <SRS0=I5t9=CJ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F54C43461
	for <linux-m68k@archiver.kernel.org>; Mon, 31 Aug 2020 21:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EDC221527
	for <linux-m68k@archiver.kernel.org>; Mon, 31 Aug 2020 21:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730280AbgHaVke (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 31 Aug 2020 17:40:34 -0400
Received: from mga05.intel.com ([192.55.52.43]:2496 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbgHaVkc (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 31 Aug 2020 17:40:32 -0400
IronPort-SDR: PnuICkQge7oCJhC89HpsOYU9P1hb8sheJgP7KpDFYlHj52Cg824MIG4kHFtqCxoWQFPdAn9NnO
 C13nqPpcpG0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="241877075"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="241877075"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 14:40:25 -0700
IronPort-SDR: iP1daiyCOW/1jJRNpJDeLvi89F332N2FGLT+1CDYTbZCL/dIK54QMZEf2JsamWBfgSeuOZIXmQ
 rv1DuG+EH07A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="338350375"
Received: from lkp-server02.sh.intel.com (HELO 713faec3b0e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2020 14:40:24 -0700
Received: from kbuild by 713faec3b0e5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kCrXM-0000Cy-8r; Mon, 31 Aug 2020 21:40:24 +0000
Date:   Tue, 01 Sep 2020 05:39:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-queue] BUILD SUCCESS
 11df6eddc50b8f1e60cdccef97a90908457a68ce
Message-ID: <5f4d6e23.YY4Lb6FR2yM3dOcc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
branch HEAD: 11df6eddc50b8f1e60cdccef97a90908457a68ce  fat: Use correct logical sector size for Atari GEMDOS FAT

elapsed time: 720m

configs tested: 103
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      tqm8xx_defconfig
m68k                          amiga_defconfig
arm                        mini2440_defconfig
m68k                            q40_defconfig
arm                       cns3420vb_defconfig
m68k                       m5208evb_defconfig
mips                          rm200_defconfig
mips                     cu1000-neo_defconfig
riscv                               defconfig
arm                             pxa_defconfig
sh                                  defconfig
mips                  maltasmvp_eva_defconfig
mips                        omega2p_defconfig
arc                             nps_defconfig
ia64                         bigsur_defconfig
mips                      pic32mzda_defconfig
sh                          sdk7780_defconfig
mips                  decstation_64_defconfig
arm                        trizeps4_defconfig
mips                         tb0287_defconfig
arm                         socfpga_defconfig
sh                           se7751_defconfig
um                             i386_defconfig
m68k                        stmark2_defconfig
m68k                             allyesconfig
mips                        jmr3927_defconfig
arm                          ixp4xx_defconfig
ia64                             alldefconfig
arm                         nhk8815_defconfig
sh                          rsk7269_defconfig
powerpc                     powernv_defconfig
h8300                    h8300h-sim_defconfig
mips                        nlm_xlp_defconfig
arm                        clps711x_defconfig
nds32                             allnoconfig
parisc                generic-64bit_defconfig
xtensa                              defconfig
arm                              alldefconfig
arc                 nsimosci_hs_smp_defconfig
arm                          simpad_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
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
arc                              allyesconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200831
i386                 randconfig-a002-20200831
i386                 randconfig-a004-20200831
i386                 randconfig-a006-20200831
i386                 randconfig-a005-20200831
i386                 randconfig-a003-20200831
x86_64               randconfig-a012-20200831
x86_64               randconfig-a015-20200831
x86_64               randconfig-a014-20200831
x86_64               randconfig-a011-20200831
x86_64               randconfig-a016-20200831
x86_64               randconfig-a013-20200831
i386                 randconfig-a013-20200831
i386                 randconfig-a011-20200831
i386                 randconfig-a012-20200831
i386                 randconfig-a015-20200831
i386                 randconfig-a016-20200831
i386                 randconfig-a014-20200831
riscv                            allyesconfig
riscv                             allnoconfig
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
