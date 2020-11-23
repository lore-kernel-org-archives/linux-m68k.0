Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5893BC388F9
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Nov 2020 22:39:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1072A206D8
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Nov 2020 22:39:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731007AbgKWWjN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Nov 2020 17:39:13 -0500
Received: from mga06.intel.com ([134.134.136.31]:3801 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728567AbgKWWjM (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 Nov 2020 17:39:12 -0500
IronPort-SDR: ebM9lVtirWMcbJ5Q2dowgJDcz6+p2/ktDmsYIuhxcnxJKhok8S+KAXKGS4XtF2crsKo3SUJ68R
 lgAfLv3nPI5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="233465596"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="233465596"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 14:39:10 -0800
IronPort-SDR: RBgyxscR9556x9RxzJlHTzI7Fmti+4n2l3zOG7AZY6WURTY8gpll6dsgNu1u24/1DazXazpLsW
 5a3uuHa9zJkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="534623524"
Received: from lkp-server01.sh.intel.com (HELO 1138cb5768e3) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Nov 2020 14:39:09 -0800
Received: from kbuild by 1138cb5768e3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1khKUG-0000Ep-RL; Mon, 23 Nov 2020 22:39:08 +0000
Date:   Tue, 24 Nov 2020 06:38:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:m68k-queue] BUILD SUCCESS
 e70bf0f0f9ac09b4dbeb2be5d7c1af54623b700a
Message-ID: <5fbc3a02.xAAtiecBrdUXrBbT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
branch HEAD: e70bf0f0f9ac09b4dbeb2be5d7c1af54623b700a  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 725m

configs tested: 144
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                          hp300_defconfig
arm                         bcm2835_defconfig
sh                               alldefconfig
m68k                         apollo_defconfig
sh                ecovec24-romimage_defconfig
powerpc                 mpc832x_mds_defconfig
arm                            zeus_defconfig
powerpc                   bluestone_defconfig
sh                         apsh4a3a_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
arm                         nhk8815_defconfig
xtensa                         virt_defconfig
sh                          r7780mp_defconfig
arm                       netwinder_defconfig
xtensa                              defconfig
arm                            u300_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                            pleb_defconfig
sh                        apsh4ad0a_defconfig
xtensa                          iss_defconfig
powerpc                     skiroot_defconfig
powerpc                      makalu_defconfig
powerpc                        icon_defconfig
arm                         cm_x300_defconfig
arm64                            alldefconfig
mips                         tb0226_defconfig
powerpc                  iss476-smp_defconfig
sh                           se7724_defconfig
csky                             alldefconfig
arm                            dove_defconfig
m68k                           sun3_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     akebono_defconfig
arm                         s3c6400_defconfig
sparc                            alldefconfig
mips                           ip32_defconfig
sh                           se7721_defconfig
powerpc                      ep88xc_defconfig
mips                         bigsur_defconfig
powerpc                     pseries_defconfig
arm                           tegra_defconfig
powerpc                     kmeter1_defconfig
mips                 decstation_r4k_defconfig
mips                           gcw0_defconfig
mips                      fuloong2e_defconfig
powerpc                   lite5200b_defconfig
mips                          ath79_defconfig
arm                       mainstone_defconfig
sparc64                          alldefconfig
arm                         assabet_defconfig
arm                  colibri_pxa270_defconfig
arm                     davinci_all_defconfig
sh                           se7750_defconfig
arc                     haps_hs_smp_defconfig
mips                           mtx1_defconfig
powerpc                   motionpro_defconfig
powerpc                      chrp32_defconfig
sh                          rsk7269_defconfig
mips                malta_qemu_32r6_defconfig
arm                             rpc_defconfig
powerpc                      arches_defconfig
powerpc                   currituck_defconfig
arm                          pxa168_defconfig
mips                        vocore2_defconfig
powerpc                     pq2fads_defconfig
powerpc                    socrates_defconfig
nds32                             allnoconfig
mips                         db1xxx_defconfig
arc                              alldefconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
i386                 randconfig-a004-20201123
i386                 randconfig-a003-20201123
i386                 randconfig-a002-20201123
i386                 randconfig-a005-20201123
i386                 randconfig-a001-20201123
i386                 randconfig-a006-20201123
x86_64               randconfig-a015-20201123
x86_64               randconfig-a011-20201123
x86_64               randconfig-a014-20201123
x86_64               randconfig-a016-20201123
x86_64               randconfig-a012-20201123
x86_64               randconfig-a013-20201123
i386                 randconfig-a012-20201123
i386                 randconfig-a013-20201123
i386                 randconfig-a011-20201123
i386                 randconfig-a016-20201123
i386                 randconfig-a014-20201123
i386                 randconfig-a015-20201123
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
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
x86_64               randconfig-a006-20201123
x86_64               randconfig-a003-20201123
x86_64               randconfig-a004-20201123
x86_64               randconfig-a005-20201123
x86_64               randconfig-a002-20201123
x86_64               randconfig-a001-20201123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
