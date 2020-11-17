Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE42C5519F
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Nov 2020 00:42:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8D2924682
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Nov 2020 00:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbgKQAm0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Nov 2020 19:42:26 -0500
Received: from mga11.intel.com ([192.55.52.93]:55874 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbgKQAm0 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Nov 2020 19:42:26 -0500
IronPort-SDR: RpdXBX4/vNU3hSXfGZkDuDJYu/xVtLlkm8PbgdMnAf9frWOwxLR6wFZ7OQ4pOGzHAVke5r876y
 ZxMPyTUK+fMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="167329559"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
   d="scan'208";a="167329559"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 16:42:19 -0800
IronPort-SDR: owp19HI5wBnO8WjHJmxYw49mkWsaaFtDJt5Iva8u1KTu2AxIKTIV0EcokPcXcNlj3iwZt8vz6b
 dR28prQGOVJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
   d="scan'208";a="475725072"
Received: from lkp-server01.sh.intel.com (HELO fb398427a497) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Nov 2020 16:42:16 -0800
Received: from kbuild by fb398427a497 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kep4Z-0000GT-Lk; Tue, 17 Nov 2020 00:42:15 +0000
Date:   Tue, 17 Nov 2020 08:42:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 9006915d53a2cbba04b1b440a0a42009131b7451
Message-ID: <5fb31c66.bZauGfvU7zn3DBv4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: 9006915d53a2cbba04b1b440a0a42009131b7451  Merge tag 'v5.10-rc4'

elapsed time: 721m

configs tested: 159
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7203_defconfig
arm                       netwinder_defconfig
arm                     am200epdkit_defconfig
mips                           ip27_defconfig
sh                          r7780mp_defconfig
s390                             alldefconfig
powerpc                      pmac32_defconfig
arc                        nsimosci_defconfig
arm                        shmobile_defconfig
openrisc                            defconfig
sh                         microdev_defconfig
sh                             espt_defconfig
powerpc                     tqm8555_defconfig
arc                          axs101_defconfig
powerpc                     ep8248e_defconfig
powerpc                     sbc8548_defconfig
nios2                               defconfig
nds32                            alldefconfig
powerpc                      ppc40x_defconfig
arm                          badge4_defconfig
um                            kunit_defconfig
mips                         tb0219_defconfig
arc                      axs103_smp_defconfig
mips                        qi_lb60_defconfig
m68k                            mac_defconfig
mips                          ath79_defconfig
sh                         ecovec24_defconfig
mips                  cavium_octeon_defconfig
mips                           ip28_defconfig
x86_64                           alldefconfig
sh                           se7721_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                           xway_defconfig
powerpc                     mpc512x_defconfig
riscv                             allnoconfig
m68k                          hp300_defconfig
arm                          gemini_defconfig
arm                      tct_hammer_defconfig
mips                        bcm47xx_defconfig
arm                            zeus_defconfig
arm                     eseries_pxa_defconfig
sh                               alldefconfig
arm                           h3600_defconfig
arm                        neponset_defconfig
xtensa                  nommu_kc705_defconfig
mips                      bmips_stb_defconfig
powerpc                   lite5200b_defconfig
sh                        apsh4ad0a_defconfig
arm                           sunxi_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     powernv_defconfig
arm                            mmp2_defconfig
arm                       cns3420vb_defconfig
arm                         lpc32xx_defconfig
ia64                      gensparse_defconfig
arm                           h5000_defconfig
arm                          simpad_defconfig
powerpc                     ppa8548_defconfig
sh                          rsk7264_defconfig
powerpc                     tqm5200_defconfig
mips                            e55_defconfig
powerpc                     tqm8560_defconfig
sh                     sh7710voipgw_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
x86_64               randconfig-a003-20201116
x86_64               randconfig-a005-20201116
x86_64               randconfig-a004-20201116
x86_64               randconfig-a002-20201116
x86_64               randconfig-a001-20201116
x86_64               randconfig-a006-20201116
i386                 randconfig-a006-20201116
i386                 randconfig-a005-20201116
i386                 randconfig-a001-20201116
i386                 randconfig-a002-20201116
i386                 randconfig-a004-20201116
i386                 randconfig-a003-20201116
i386                 randconfig-a006-20201115
i386                 randconfig-a005-20201115
i386                 randconfig-a001-20201115
i386                 randconfig-a002-20201115
i386                 randconfig-a004-20201115
i386                 randconfig-a003-20201115
x86_64               randconfig-a015-20201115
x86_64               randconfig-a011-20201115
x86_64               randconfig-a014-20201115
x86_64               randconfig-a013-20201115
x86_64               randconfig-a016-20201115
x86_64               randconfig-a012-20201115
i386                 randconfig-a012-20201116
i386                 randconfig-a014-20201116
i386                 randconfig-a016-20201116
i386                 randconfig-a011-20201116
i386                 randconfig-a015-20201116
i386                 randconfig-a013-20201116
i386                 randconfig-a012-20201115
i386                 randconfig-a014-20201115
i386                 randconfig-a016-20201115
i386                 randconfig-a011-20201115
i386                 randconfig-a015-20201115
i386                 randconfig-a013-20201115
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201115
x86_64               randconfig-a005-20201115
x86_64               randconfig-a004-20201115
x86_64               randconfig-a002-20201115
x86_64               randconfig-a001-20201115
x86_64               randconfig-a006-20201115
x86_64               randconfig-a015-20201116
x86_64               randconfig-a011-20201116
x86_64               randconfig-a014-20201116
x86_64               randconfig-a013-20201116
x86_64               randconfig-a016-20201116
x86_64               randconfig-a012-20201116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
