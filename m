Return-Path: <SRS0=kwK6=CQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E141BC43461
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 23:15:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C365207DE
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Sep 2020 23:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgIGXPc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Sep 2020 19:15:32 -0400
Received: from mga18.intel.com ([134.134.136.126]:15592 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727119AbgIGXPb (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Sep 2020 19:15:31 -0400
IronPort-SDR: Zt9537AgUc6L7pFyvy6Hf2vjdpU+KAyr25ZMlCQrx+www98bU2RdqJnByJAAwALfEqVcL3McuI
 srNC0liCFfsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="145761841"
X-IronPort-AV: E=Sophos;i="5.76,403,1592895600"; 
   d="scan'208";a="145761841"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 16:15:28 -0700
IronPort-SDR: /G7VZP+Rkr6Z7PhHGrpOH20MfByKw06RrmjSaccxzR7HgCYiilihTzXahPGVBJGm8gAD9qJ6PL
 LTgr2VFTOiZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,403,1592895600"; 
   d="scan'208";a="285691720"
Received: from lkp-server02.sh.intel.com (HELO a98deea729ba) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 07 Sep 2020 16:15:27 -0700
Received: from kbuild by a98deea729ba with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kFQMA-0000J4-OJ; Mon, 07 Sep 2020 23:15:26 +0000
Date:   Tue, 08 Sep 2020 07:15:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:for-v5.10] BUILD SUCCESS
 352e04291115af2a74c271e0cd3643a632af6b7a
Message-ID: <5f56bf03.YdOsLVQsdy3yWkQv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  for-v5.10
branch HEAD: 352e04291115af2a74c271e0cd3643a632af6b7a  m68k: Replace HTTP links with HTTPS ones

elapsed time: 722m

configs tested: 152
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
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
mips                           ip27_defconfig
arm                   milbeaut_m10v_defconfig
arc                              alldefconfig
m68k                        m5272c3_defconfig
mips                 decstation_r4k_defconfig
powerpc                       maple_defconfig
parisc                           alldefconfig
c6x                         dsk6455_defconfig
mips                           ci20_defconfig
arm                       omap2plus_defconfig
nios2                         3c120_defconfig
sh                         apsh4a3a_defconfig
m68k                          atari_defconfig
powerpc                     pseries_defconfig
arc                        nsimosci_defconfig
mips                      pic32mzda_defconfig
arc                 nsimosci_hs_smp_defconfig
s390                             alldefconfig
powerpc                      tqm8xx_defconfig
mips                           rs90_defconfig
xtensa                       common_defconfig
arm                            u300_defconfig
sh                          landisk_defconfig
powerpc                         wii_defconfig
h8300                    h8300h-sim_defconfig
xtensa                              defconfig
h8300                               defconfig
riscv                    nommu_k210_defconfig
arm                            mmp2_defconfig
powerpc                      ppc64e_defconfig
powerpc                    gamecube_defconfig
c6x                              allyesconfig
powerpc                  mpc885_ads_defconfig
mips                           ip28_defconfig
mips                        omega2p_defconfig
c6x                        evmc6457_defconfig
arc                              allyesconfig
sh                   sh7724_generic_defconfig
mips                          ath79_defconfig
openrisc                    or1ksim_defconfig
sh                          lboxre2_defconfig
powerpc                      chrp32_defconfig
sh                          urquell_defconfig
mips                 pnx8335_stb225_defconfig
mips                         bigsur_defconfig
m68k                           sun3_defconfig
powerpc                    amigaone_defconfig
arm                         bcm2835_defconfig
powerpc                     ep8248e_defconfig
arm                  colibri_pxa270_defconfig
arm                        neponset_defconfig
arc                                 defconfig
powerpc                    mvme5100_defconfig
openrisc                            defconfig
ia64                             alldefconfig
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
mips                malta_kvm_guest_defconfig
s390                          debug_defconfig
c6x                        evmc6678_defconfig
arm                     eseries_pxa_defconfig
arm                        mini2440_defconfig
sh                           se7343_defconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                             defconfig
x86_64               randconfig-a006-20200907
x86_64               randconfig-a004-20200907
x86_64               randconfig-a005-20200907
x86_64               randconfig-a003-20200907
x86_64               randconfig-a001-20200907
x86_64               randconfig-a002-20200907
i386                 randconfig-a004-20200907
i386                 randconfig-a005-20200907
i386                 randconfig-a006-20200907
i386                 randconfig-a002-20200907
i386                 randconfig-a003-20200907
i386                 randconfig-a001-20200907
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
