Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077E7C4743C
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Jun 2021 22:47:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4F156128A
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Jun 2021 22:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbhFUWuB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Jun 2021 18:50:01 -0400
Received: from mga07.intel.com ([134.134.136.100]:27737 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230438AbhFUWuB (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Jun 2021 18:50:01 -0400
IronPort-SDR: tGMGFfXJicTCnEE90gEAXb03imhuL+kOfQ3qHPUh0KT8dGwUkYTf3Rk0PckyqUoCbRpHZasef/
 L75lZDuksmGA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="270792696"
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; 
   d="scan'208";a="270792696"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 15:47:38 -0700
IronPort-SDR: TtrRCRiIkco4lmH2c6IQ1EZhXgXIlev6YWe6F74d2EJwRbFryY3cO4JmKKYtxszNtTi/LWan8E
 jmSG5oD5Nieg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,290,1616482800"; 
   d="scan'208";a="423102168"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Jun 2021 15:47:37 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lvShc-0004pC-UH; Mon, 21 Jun 2021 22:47:36 +0000
Date:   Tue, 22 Jun 2021 06:46:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 496c768d46ebc427721b85431055fdd0f5b13c24
Message-ID: <60d116e3.VzLSgZuxdsatCJ3y%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 496c768d46ebc427721b85431055fdd0f5b13c24  Merge tag 'v5.13-rc7'

elapsed time: 724m

configs tested: 128
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                    klondike_defconfig
powerpc                     ep8248e_defconfig
arm                        vexpress_defconfig
arm                              alldefconfig
powerpc                    sam440ep_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                    socrates_defconfig
m68k                            mac_defconfig
riscv                               defconfig
um                               alldefconfig
arc                              allyesconfig
nios2                         10m50_defconfig
arm                             mxs_defconfig
powerpc                     sequoia_defconfig
arm                          badge4_defconfig
mips                          ath79_defconfig
arm                       mainstone_defconfig
mips                        maltaup_defconfig
m68k                         amcore_defconfig
arm                         palmz72_defconfig
arm                        cerfcube_defconfig
powerpc                  mpc866_ads_defconfig
sh                          landisk_defconfig
powerpc                      ep88xc_defconfig
mips                  maltasmvp_eva_defconfig
s390                             alldefconfig
m68k                          multi_defconfig
powerpc                     tqm5200_defconfig
m68k                        mvme16x_defconfig
h8300                    h8300h-sim_defconfig
mips                       lemote2f_defconfig
powerpc                       holly_defconfig
parisc                generic-32bit_defconfig
arm                          pxa168_defconfig
mips                           ip22_defconfig
mips                           gcw0_defconfig
openrisc                  or1klitex_defconfig
mips                           ip27_defconfig
arm                             rpc_defconfig
riscv                          rv32_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      katmai_defconfig
mips                  decstation_64_defconfig
m68k                        m5272c3_defconfig
sh                         ecovec24_defconfig
arm                          collie_defconfig
arm                  colibri_pxa300_defconfig
mips                         tb0287_defconfig
arc                     haps_hs_smp_defconfig
microblaze                          defconfig
um                                  defconfig
x86_64                            allnoconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210621
i386                 randconfig-a001-20210621
i386                 randconfig-a003-20210621
i386                 randconfig-a006-20210621
i386                 randconfig-a005-20210621
i386                 randconfig-a004-20210621
i386                 randconfig-a011-20210621
i386                 randconfig-a014-20210621
i386                 randconfig-a013-20210621
i386                 randconfig-a015-20210621
i386                 randconfig-a012-20210621
i386                 randconfig-a016-20210621
x86_64               randconfig-a002-20210621
x86_64               randconfig-a001-20210621
x86_64               randconfig-a005-20210621
x86_64               randconfig-a003-20210621
x86_64               randconfig-a004-20210621
x86_64               randconfig-a006-20210621
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210621
x86_64               randconfig-a012-20210621
x86_64               randconfig-a016-20210621
x86_64               randconfig-a015-20210621
x86_64               randconfig-a014-20210621
x86_64               randconfig-a013-20210621
x86_64               randconfig-a011-20210621

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
