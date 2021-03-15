Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0434C433DB
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Mar 2021 23:42:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7928964F5E
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Mar 2021 23:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbhCOXl6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Mar 2021 19:41:58 -0400
Received: from mga07.intel.com ([134.134.136.100]:60627 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230118AbhCOXly (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 15 Mar 2021 19:41:54 -0400
IronPort-SDR: p6ORd+gm/DOdW/bLfe4SWSHt7v8nkvsTQUhLGvFeSkN18sFxuFHDrIpE92uDbCyuY0orNRP87u
 2uNDsPMS8JCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="253186429"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="253186429"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 16:41:52 -0700
IronPort-SDR: kP6pjHDtJ5TLClkFRQOt/tyPLroVtbPToeK72DgnZ0y0zIzNPkTIcRJ2zDKJ3+a4/RWdUbuEgb
 qQstfuCOmqjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="410833055"
Received: from lkp-server02.sh.intel.com (HELO 1dc5e1a854f4) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Mar 2021 16:41:51 -0700
Received: from kbuild by 1dc5e1a854f4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lLwqM-0000hY-Tk; Mon, 15 Mar 2021 23:41:50 +0000
Date:   Tue, 16 Mar 2021 07:41:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 d9921dce1f1f3279e8a422b8e43ce815f0c84ee1
Message-ID: <604ff09a.efY+6Q7UsiuEbBh3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: d9921dce1f1f3279e8a422b8e43ce815f0c84ee1  Merge tag 'v5.12-rc3'

elapsed time: 727m

configs tested: 136
configs skipped: 2

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
powerpc                 mpc834x_itx_defconfig
sh                          rsk7203_defconfig
mips                           ip27_defconfig
sh                        edosk7760_defconfig
sh                            migor_defconfig
powerpc                      pcm030_defconfig
arm                      pxa255-idp_defconfig
arm                           spitz_defconfig
arm                          iop32x_defconfig
ia64                            zx1_defconfig
mips                      loongson3_defconfig
nds32                            alldefconfig
arm                             rpc_defconfig
mips                       lemote2f_defconfig
mips                           ip28_defconfig
arm                       mainstone_defconfig
arm64                            alldefconfig
mips                           ip32_defconfig
xtensa                         virt_defconfig
ia64                                defconfig
mips                     cu1000-neo_defconfig
sparc                            alldefconfig
mips                           rs90_defconfig
arm                         shannon_defconfig
arc                        vdk_hs38_defconfig
powerpc                     sequoia_defconfig
mips                            e55_defconfig
parisc                           allyesconfig
powerpc                 mpc8540_ads_defconfig
mips                         db1xxx_defconfig
mips                malta_qemu_32r6_defconfig
um                             i386_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                        shmobile_defconfig
m68k                       m5208evb_defconfig
arc                            hsdk_defconfig
arm                        cerfcube_defconfig
mips                        vocore2_defconfig
arm                       omap2plus_defconfig
sh                          urquell_defconfig
xtensa                           alldefconfig
sh                        sh7757lcr_defconfig
s390                                defconfig
sh                           se7705_defconfig
sh                            titan_defconfig
ia64                        generic_defconfig
x86_64                           alldefconfig
arm                       netwinder_defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                       m5475evb_defconfig
ia64                         bigsur_defconfig
arm                          pxa910_defconfig
s390                       zfcpdump_defconfig
sh                          sdk7786_defconfig
arm                           u8500_defconfig
mips                         cobalt_defconfig
m68k                                defconfig
arm                  colibri_pxa300_defconfig
sh                           se7751_defconfig
arm                       aspeed_g5_defconfig
sh                           se7722_defconfig
sh                         ap325rxa_defconfig
arm                           corgi_defconfig
powerpc                       ebony_defconfig
csky                             alldefconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210315
x86_64               randconfig-a001-20210315
x86_64               randconfig-a005-20210315
x86_64               randconfig-a004-20210315
x86_64               randconfig-a002-20210315
x86_64               randconfig-a003-20210315
i386                 randconfig-a001-20210315
i386                 randconfig-a005-20210315
i386                 randconfig-a003-20210315
i386                 randconfig-a002-20210315
i386                 randconfig-a004-20210315
i386                 randconfig-a006-20210315
i386                 randconfig-a013-20210315
i386                 randconfig-a016-20210315
i386                 randconfig-a011-20210315
i386                 randconfig-a012-20210315
i386                 randconfig-a014-20210315
i386                 randconfig-a015-20210315
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20210315
x86_64               randconfig-a016-20210315
x86_64               randconfig-a013-20210315
x86_64               randconfig-a015-20210315
x86_64               randconfig-a014-20210315
x86_64               randconfig-a012-20210315

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
