Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C603C433B4
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Apr 2021 21:39:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECAB86103E
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Apr 2021 21:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235668AbhDZVkh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Apr 2021 17:40:37 -0400
Received: from mga03.intel.com ([134.134.136.65]:3038 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234123AbhDZVkg (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Apr 2021 17:40:36 -0400
IronPort-SDR: s0GIF8HBdPIMezGBaCKAIN5Fq+r4hdRDLXNL4jLfgiG/L/6tTu5/fdmlIVGhFUCQzrEPtWD6L7
 wAnCBvpEeSUg==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="196468920"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="196468920"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 14:39:53 -0700
IronPort-SDR: m9GXTT52ddi4IaSkod0B/XPEE8B7PcOkTVoni8ey6KuKJxQwjr0dDaCzXn6DlfCPjsMyy9aSBI
 lCRZlQ0yg1ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="447400643"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Apr 2021 14:39:51 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lb8xL-00066L-1b; Mon, 26 Apr 2021 21:39:51 +0000
Date:   Tue, 27 Apr 2021 05:39:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-v5.12] BUILD SUCCESS
 52d5c056e366b87429b53dffe3875a090f6ddcbb
Message-ID: <60873314.BkxMAI4kDF6+TIMW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v5.12
branch HEAD: 52d5c056e366b87429b53dffe3875a090f6ddcbb  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 724m

configs tested: 160
configs skipped: 3

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
riscv                            allyesconfig
mips                         tb0287_defconfig
sh                          rsk7264_defconfig
mips                     decstation_defconfig
powerpc                   currituck_defconfig
powerpc                     tqm8548_defconfig
m68k                         amcore_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                            hp6xx_defconfig
mips                           ip22_defconfig
powerpc                      makalu_defconfig
nds32                               defconfig
arm                        cerfcube_defconfig
h8300                    h8300h-sim_defconfig
powerpc                 mpc834x_mds_defconfig
arm                          pxa910_defconfig
arm                         socfpga_defconfig
arc                              allyesconfig
powerpc                 mpc832x_rdb_defconfig
arm                          exynos_defconfig
mips                            gpr_defconfig
arm                         orion5x_defconfig
arm                    vt8500_v6_v7_defconfig
mips                     cu1000-neo_defconfig
powerpc                     asp8347_defconfig
arm                     am200epdkit_defconfig
mips                          ath25_defconfig
powerpc                     mpc512x_defconfig
powerpc                     akebono_defconfig
powerpc                  mpc866_ads_defconfig
arm                       cns3420vb_defconfig
mips                       rbtx49xx_defconfig
arm                        trizeps4_defconfig
parisc                              defconfig
sh                         apsh4a3a_defconfig
sh                        edosk7705_defconfig
arm                              alldefconfig
m68k                            q40_defconfig
powerpc                     skiroot_defconfig
sh                           se7206_defconfig
powerpc                    socrates_defconfig
sh                          r7780mp_defconfig
sh                           se7712_defconfig
sh                          rsk7203_defconfig
arm                          moxart_defconfig
mips                     loongson1b_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                            lart_defconfig
arm                            xcep_defconfig
sh                            migor_defconfig
x86_64                              defconfig
mips                             allmodconfig
mips                     cu1830-neo_defconfig
m68k                          amiga_defconfig
arc                         haps_hs_defconfig
mips                malta_qemu_32r6_defconfig
openrisc                    or1ksim_defconfig
sh                        apsh4ad0a_defconfig
um                                  defconfig
mips                           ci20_defconfig
m68k                          multi_defconfig
xtensa                generic_kc705_defconfig
sh                          polaris_defconfig
openrisc                            defconfig
arc                        nsimosci_defconfig
xtensa                  nommu_kc705_defconfig
arm                         at91_dt_defconfig
powerpc                         wii_defconfig
mips                            e55_defconfig
mips                         cobalt_defconfig
powerpc                    ge_imp3a_defconfig
m68k                       m5208evb_defconfig
sh                             shx3_defconfig
arm                      integrator_defconfig
arm                  colibri_pxa300_defconfig
powerpc                    klondike_defconfig
mips                          malta_defconfig
powerpc                     taishan_defconfig
powerpc                 canyonlands_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      obs600_defconfig
arm                       imx_v6_v7_defconfig
h8300                     edosk2674_defconfig
xtensa                          iss_defconfig
arm                          collie_defconfig
arm                      tct_hammer_defconfig
m68k                        m5407c3_defconfig
powerpc                    mvme5100_defconfig
sh                           se7619_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210426
i386                 randconfig-a002-20210426
i386                 randconfig-a001-20210426
i386                 randconfig-a006-20210426
i386                 randconfig-a004-20210426
i386                 randconfig-a003-20210426
x86_64               randconfig-a015-20210426
x86_64               randconfig-a016-20210426
x86_64               randconfig-a011-20210426
x86_64               randconfig-a014-20210426
x86_64               randconfig-a012-20210426
x86_64               randconfig-a013-20210426
i386                 randconfig-a014-20210426
i386                 randconfig-a012-20210426
i386                 randconfig-a011-20210426
i386                 randconfig-a013-20210426
i386                 randconfig-a015-20210426
i386                 randconfig-a016-20210426
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210426
x86_64               randconfig-a004-20210426
x86_64               randconfig-a001-20210426
x86_64               randconfig-a006-20210426
x86_64               randconfig-a005-20210426
x86_64               randconfig-a003-20210426

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
