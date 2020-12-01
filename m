Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA946C71155
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Dec 2020 02:10:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 762A3207FF
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Dec 2020 02:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgLACKc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Nov 2020 21:10:32 -0500
Received: from mga04.intel.com ([192.55.52.120]:27280 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726780AbgLACKc (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Nov 2020 21:10:32 -0500
IronPort-SDR: a1e0mSvQQtTZ+6cZMtppfeCbf8/RDE0R13TiKR8Ic9mjWqSgGmPW8VXn25RrrTlbEI+4JLNX1z
 7Hwd09gqMi0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="170182885"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="170182885"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 18:09:50 -0800
IronPort-SDR: HViWC4GDbbszTneCPLLDEd8yeEQJGHPjhFOu+WwHMk3NwcV5I1yKgk7GO7sWnTqXG965J4vYbG
 gTkAGNG9VsWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="364496207"
Received: from lkp-server01.sh.intel.com (HELO 70b44b587200) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Nov 2020 18:09:49 -0800
Received: from kbuild by 70b44b587200 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kjv6y-00003O-TT; Tue, 01 Dec 2020 02:09:48 +0000
Date:   Tue, 01 Dec 2020 10:09:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 759fc5bd9fce95e30e6ef512d4d0a3506167f96e
Message-ID: <5fc5a5d0.Tz8Yq2n9Ezvpkk4j%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
branch HEAD: 759fc5bd9fce95e30e6ef512d4d0a3506167f96e  Merge tag 'v5.10-rc6'

elapsed time: 723m

configs tested: 105
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                        sh7763rdp_defconfig
sh                          sdk7786_defconfig
mips                           xway_defconfig
mips                        jmr3927_defconfig
powerpc                     tqm8555_defconfig
arc                     haps_hs_smp_defconfig
powerpc                      ppc64e_defconfig
sparc                       sparc32_defconfig
powerpc                     tqm8541_defconfig
m68k                       m5475evb_defconfig
sh                           se7712_defconfig
mips                        qi_lb60_defconfig
arm                       multi_v4t_defconfig
sh                          rsk7269_defconfig
sh                          r7780mp_defconfig
arm                          pxa910_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                             pxa_defconfig
microblaze                      mmu_defconfig
powerpc                 mpc834x_mds_defconfig
microblaze                    nommu_defconfig
powerpc                       ebony_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                      malta_kvm_defconfig
arm                       netwinder_defconfig
mips                        nlm_xlp_defconfig
arc                              allyesconfig
xtensa                    xip_kc705_defconfig
m68k                        mvme16x_defconfig
arm                       imx_v6_v7_defconfig
mips                          rm200_defconfig
m68k                       bvme6000_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
i386                 randconfig-a004-20201130
i386                 randconfig-a002-20201130
i386                 randconfig-a003-20201130
i386                 randconfig-a005-20201130
i386                 randconfig-a006-20201130
i386                 randconfig-a001-20201130
x86_64               randconfig-a014-20201130
x86_64               randconfig-a015-20201130
x86_64               randconfig-a016-20201130
x86_64               randconfig-a011-20201130
x86_64               randconfig-a012-20201130
x86_64               randconfig-a013-20201130
i386                 randconfig-a013-20201130
i386                 randconfig-a012-20201130
i386                 randconfig-a011-20201130
i386                 randconfig-a016-20201130
i386                 randconfig-a015-20201130
i386                 randconfig-a014-20201130
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
x86_64               randconfig-a002-20201130
x86_64               randconfig-a006-20201130
x86_64               randconfig-a005-20201130
x86_64               randconfig-a004-20201130
x86_64               randconfig-a001-20201130
x86_64               randconfig-a003-20201130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
