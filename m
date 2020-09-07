Return-Path: <SRS0=kwK6=CQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62487C43461
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 23:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12720207DE
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 23:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgIGXPg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Sep 2020 19:15:36 -0400
Received: from mga05.intel.com ([192.55.52.43]:47700 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727927AbgIGXPd (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Sep 2020 19:15:33 -0400
IronPort-SDR: wnXu1a/zuS3Zd1uCP8AELDV4XM5xHidQkgEI9KsbGndh2YT2CiHhvqGLQusG0yIrqd2brueCRD
 QddIgN0s8rxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="242865100"
X-IronPort-AV: E=Sophos;i="5.76,403,1592895600"; 
   d="scan'208";a="242865100"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 16:15:28 -0700
IronPort-SDR: 9FTo0sCRp/5p4Ppf7TV8/bCY21OMblwj14+UwqXnFWc4LF3A4nVimTpvHaPzQH0vqHS7e8kumr
 HNM939JiJTrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,403,1592895600"; 
   d="scan'208";a="336207657"
Received: from lkp-server02.sh.intel.com (HELO a98deea729ba) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 07 Sep 2020 16:15:27 -0700
Received: from kbuild by a98deea729ba with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kFQMA-0000J2-Nw; Mon, 07 Sep 2020 23:15:26 +0000
Date:   Tue, 08 Sep 2020 07:15:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-queue] BUILD SUCCESS
 5f5de4b2bf04575c501ea7315730fb167931aa45
Message-ID: <5f56bf0a.Pp1DY4QRJIynJphE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
branch HEAD: 5f5de4b2bf04575c501ea7315730fb167931aa45  fat: Use correct logical sector size for Atari GEMDOS FAT

elapsed time: 722m

configs tested: 120
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                            alldefconfig
mips                        workpad_defconfig
mips                     cu1000-neo_defconfig
powerpc                          g5_defconfig
mips                          ath25_defconfig
arm                          pcm027_defconfig
powerpc                      ppc40x_defconfig
mips                        nlm_xlp_defconfig
sh                           se7780_defconfig
powerpc                           allnoconfig
arm                       omap2plus_defconfig
nios2                         3c120_defconfig
sh                         apsh4a3a_defconfig
m68k                          atari_defconfig
powerpc                     pseries_defconfig
arc                        nsimosci_defconfig
mips                      pic32mzda_defconfig
arc                 nsimosci_hs_smp_defconfig
s390                             alldefconfig
riscv                    nommu_k210_defconfig
arm                            mmp2_defconfig
powerpc                      ppc64e_defconfig
powerpc                    gamecube_defconfig
c6x                              allyesconfig
powerpc                  mpc885_ads_defconfig
mips                           ip28_defconfig
mips                        omega2p_defconfig
arc                                 defconfig
powerpc                    amigaone_defconfig
arm                         bcm2835_defconfig
powerpc                     ep8248e_defconfig
arm                  colibri_pxa270_defconfig
arm                        neponset_defconfig
arm                         socfpga_defconfig
openrisc                            defconfig
sh                           se7343_defconfig
arm                          pxa168_defconfig
sh                         ecovec24_defconfig
xtensa                           allyesconfig
sh                             sh03_defconfig
mips                       bmips_be_defconfig
c6x                        evmc6472_defconfig
mips                             allyesconfig
sh                          sdk7786_defconfig
arm                             ezx_defconfig
mips                       lemote2f_defconfig
m68k                         apollo_defconfig
arm                            zeus_defconfig
powerpc                     powernv_defconfig
sh                        edosk7760_defconfig
m68k                            mac_defconfig
sparc                               defconfig
sparc64                          alldefconfig
sh                          rsk7201_defconfig
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
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a004-20200907
i386                 randconfig-a005-20200907
i386                 randconfig-a006-20200907
i386                 randconfig-a002-20200907
i386                 randconfig-a003-20200907
i386                 randconfig-a001-20200907
x86_64               randconfig-a006-20200907
x86_64               randconfig-a004-20200907
x86_64               randconfig-a003-20200907
x86_64               randconfig-a005-20200907
x86_64               randconfig-a001-20200907
x86_64               randconfig-a002-20200907
i386                 randconfig-a016-20200907
i386                 randconfig-a015-20200907
i386                 randconfig-a011-20200907
i386                 randconfig-a013-20200907
i386                 randconfig-a014-20200907
i386                 randconfig-a012-20200907
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20200907
x86_64               randconfig-a011-20200907
x86_64               randconfig-a016-20200907
x86_64               randconfig-a012-20200907
x86_64               randconfig-a015-20200907
x86_64               randconfig-a014-20200907

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
