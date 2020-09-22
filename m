Return-Path: <SRS0=3fPC=C7=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E07C4727C
	for <linux-m68k@archiver.kernel.org>; Tue, 22 Sep 2020 00:36:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3DFE23A79
	for <linux-m68k@archiver.kernel.org>; Tue, 22 Sep 2020 00:36:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbgIVAgo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Sep 2020 20:36:44 -0400
Received: from mga09.intel.com ([134.134.136.24]:28958 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728960AbgIVAgo (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Sep 2020 20:36:44 -0400
IronPort-SDR: S3gKs+XdlnYct4NniTRPL7oh9z3Ia0lcsOAI2H43kAXuBq27Su0xfhaYm37Xvk/F337OD3h3fb
 q6BX/ATpcGWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="161426037"
X-IronPort-AV: E=Sophos;i="5.77,288,1596524400"; 
   d="scan'208";a="161426037"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2020 17:36:42 -0700
IronPort-SDR: zmp6oA+bSbEcP6ZSzfeTi2gk4uXzw8oiJo2FzzbJ/ImwWcA5TtozRtSH2T3C4Rwpdk0kSQ5Uv4
 5Z0CaCF3rr0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,288,1596524400"; 
   d="scan'208";a="346745182"
Received: from lkp-server01.sh.intel.com (HELO 928d8e596b58) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Sep 2020 17:36:41 -0700
Received: from kbuild by 928d8e596b58 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kKWIS-0000G5-Cp; Tue, 22 Sep 2020 00:36:40 +0000
Date:   Tue, 22 Sep 2020 08:36:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 8249fa45a1bcd9c9b7f7dc28d736ca4099f786a7
Message-ID: <5f694710.LuGo8VMIDKlys+aq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: 8249fa45a1bcd9c9b7f7dc28d736ca4099f786a7  dax: Fix compilation for CONFIG_DAX && !CONFIG_FS_DAX

elapsed time: 720m

configs tested: 140
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                     eseries_pxa_defconfig
arm                            xcep_defconfig
powerpc                      acadia_defconfig
mips                 decstation_r4k_defconfig
arc                     nsimosci_hs_defconfig
powerpc                      ep88xc_defconfig
powerpc                          g5_defconfig
sh                        apsh4ad0a_defconfig
arm                         orion5x_defconfig
c6x                        evmc6474_defconfig
xtensa                  cadence_csp_defconfig
powerpc                     pq2fads_defconfig
m68k                            q40_defconfig
arm                      tct_hammer_defconfig
arc                            hsdk_defconfig
xtensa                          iss_defconfig
powerpc                    adder875_defconfig
powerpc                    klondike_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                  mpc866_ads_defconfig
arm                        clps711x_defconfig
ia64                            zx1_defconfig
nios2                            alldefconfig
arm                            lart_defconfig
arm                         vf610m4_defconfig
sh                            shmin_defconfig
mips                        nlm_xlr_defconfig
arm                            mps2_defconfig
arm                          gemini_defconfig
sh                        sh7763rdp_defconfig
arm                            pleb_defconfig
arm                           sunxi_defconfig
arm                          exynos_defconfig
sh                           se7343_defconfig
powerpc                     tqm8540_defconfig
arm                          pxa910_defconfig
m68k                         apollo_defconfig
sparc                       sparc64_defconfig
i386                                defconfig
arm                        trizeps4_defconfig
powerpc                 mpc836x_mds_defconfig
mips                           gcw0_defconfig
powerpc                    socrates_defconfig
h8300                               defconfig
m68k                          atari_defconfig
powerpc                     ep8248e_defconfig
sh                          sdk7786_defconfig
arm                         palmz72_defconfig
mips                          ath79_defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20200920
x86_64               randconfig-a003-20200920
x86_64               randconfig-a004-20200920
x86_64               randconfig-a002-20200920
x86_64               randconfig-a006-20200920
x86_64               randconfig-a001-20200920
i386                 randconfig-a002-20200921
i386                 randconfig-a006-20200921
i386                 randconfig-a003-20200921
i386                 randconfig-a004-20200921
i386                 randconfig-a005-20200921
i386                 randconfig-a001-20200921
x86_64               randconfig-a011-20200921
x86_64               randconfig-a013-20200921
x86_64               randconfig-a014-20200921
x86_64               randconfig-a015-20200921
x86_64               randconfig-a012-20200921
x86_64               randconfig-a016-20200921
i386                 randconfig-a012-20200921
i386                 randconfig-a014-20200921
i386                 randconfig-a016-20200921
i386                 randconfig-a013-20200921
i386                 randconfig-a011-20200921
i386                 randconfig-a015-20200921
i386                 randconfig-a012-20200920
i386                 randconfig-a014-20200920
i386                 randconfig-a016-20200920
i386                 randconfig-a013-20200920
i386                 randconfig-a011-20200920
i386                 randconfig-a015-20200920
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
x86_64               randconfig-a011-20200920
x86_64               randconfig-a013-20200920
x86_64               randconfig-a014-20200920
x86_64               randconfig-a015-20200920
x86_64               randconfig-a012-20200920
x86_64               randconfig-a016-20200920
x86_64               randconfig-a005-20200921
x86_64               randconfig-a003-20200921
x86_64               randconfig-a004-20200921
x86_64               randconfig-a002-20200921
x86_64               randconfig-a006-20200921
x86_64               randconfig-a001-20200921

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
