Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A6EC433E0
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Jan 2021 04:08:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D6B2206B9
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Jan 2021 04:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233519AbhA0EH7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Jan 2021 23:07:59 -0500
Received: from mga01.intel.com ([192.55.52.88]:5505 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729397AbhAZFVt (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Jan 2021 00:21:49 -0500
IronPort-SDR: VoatA8iNhBRuLeo92/kpOgZkAf1ycsBN7TddABGQucW7Ow3wLlGHA/gjpO11iJZpf3rHfQVrdZ
 W97RcjkFjhfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="198634715"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="198634715"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 21:21:03 -0800
IronPort-SDR: uvrSkFAZBjke2VTE71rYz+aY4tDzJjLbuCd3Z6Acb9ocymh23MHrSfTbAVlcCtGqkSA9O6HJUY
 ncxPQzzhFg7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="406580209"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 25 Jan 2021 21:21:02 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l4Gmj-0000Yj-PB; Tue, 26 Jan 2021 05:21:01 +0000
Date:   Tue, 26 Jan 2021 13:20:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:for-next] BUILD SUCCESS
 c396dd2ec5bbd1cb80eafe32a72ab6bd6b17cb5a
Message-ID: <600fa690.EmfpsDybGVqCDWeX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
branch HEAD: c396dd2ec5bbd1cb80eafe32a72ab6bd6b17cb5a  macintosh/adb-iop: Use big-endian autopoll mask

elapsed time: 723m

configs tested: 153
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    adder875_defconfig
powerpc                      obs600_defconfig
mips                     decstation_defconfig
mips                          rm200_defconfig
mips                  decstation_64_defconfig
arm                       mainstone_defconfig
sh                           se7712_defconfig
arm                        keystone_defconfig
powerpc                     ksi8560_defconfig
sh                          rsk7201_defconfig
powerpc                   bluestone_defconfig
arm                  colibri_pxa270_defconfig
riscv                             allnoconfig
sh                           se7722_defconfig
mips                         db1xxx_defconfig
m68k                       m5249evb_defconfig
powerpc                          g5_defconfig
sh                           se7343_defconfig
powerpc                    klondike_defconfig
arm                         palmz72_defconfig
arm                          badge4_defconfig
m68k                        stmark2_defconfig
mips                         rt305x_defconfig
powerpc                      arches_defconfig
mips                        omega2p_defconfig
mips                          ath25_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     rainier_defconfig
arc                    vdk_hs38_smp_defconfig
mips                       capcella_defconfig
mips                            gpr_defconfig
s390                             allyesconfig
powerpc                       holly_defconfig
arm                            u300_defconfig
powerpc                     ppa8548_defconfig
powerpc                   motionpro_defconfig
i386                             alldefconfig
mips                  maltasmvp_eva_defconfig
sh                   sh7770_generic_defconfig
sh                           se7705_defconfig
mips                  cavium_octeon_defconfig
powerpc                     tqm5200_defconfig
arm                          lpd270_defconfig
sh                 kfr2r09-romimage_defconfig
arm                            mmp2_defconfig
ia64                      gensparse_defconfig
arm                              alldefconfig
mips                   sb1250_swarm_defconfig
arm                         lpc18xx_defconfig
sh                        sh7763rdp_defconfig
powerpc                     tqm8555_defconfig
sh                               alldefconfig
sh                               j2_defconfig
mips                      pistachio_defconfig
openrisc                    or1ksim_defconfig
sh                          polaris_defconfig
arm                           corgi_defconfig
powerpc                      walnut_defconfig
arm                        mvebu_v7_defconfig
mips                         mpc30x_defconfig
powerpc                         ps3_defconfig
arm                  colibri_pxa300_defconfig
arm                     eseries_pxa_defconfig
sparc64                          alldefconfig
sh                        dreamcast_defconfig
xtensa                  cadence_csp_defconfig
arc                            hsdk_defconfig
powerpc                     mpc83xx_defconfig
arm                          imote2_defconfig
m68k                            q40_defconfig
mips                malta_qemu_32r6_defconfig
arm                        multi_v7_defconfig
m68k                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                             allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210125
x86_64               randconfig-a002-20210125
x86_64               randconfig-a001-20210125
x86_64               randconfig-a005-20210125
x86_64               randconfig-a006-20210125
x86_64               randconfig-a004-20210125
i386                 randconfig-a002-20210125
i386                 randconfig-a004-20210125
i386                 randconfig-a005-20210125
i386                 randconfig-a003-20210125
i386                 randconfig-a001-20210125
i386                 randconfig-a006-20210125
x86_64               randconfig-a012-20210126
x86_64               randconfig-a016-20210126
x86_64               randconfig-a015-20210126
x86_64               randconfig-a011-20210126
x86_64               randconfig-a013-20210126
x86_64               randconfig-a014-20210126
i386                 randconfig-a013-20210125
i386                 randconfig-a011-20210125
i386                 randconfig-a012-20210125
i386                 randconfig-a015-20210125
i386                 randconfig-a014-20210125
i386                 randconfig-a016-20210125
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
x86_64               randconfig-a012-20210125
x86_64               randconfig-a016-20210125
x86_64               randconfig-a015-20210125
x86_64               randconfig-a011-20210125
x86_64               randconfig-a013-20210125
x86_64               randconfig-a014-20210125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
