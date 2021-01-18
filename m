Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DF2C4332E
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Jan 2021 21:44:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB532229C7
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Jan 2021 21:44:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388625AbhARVoQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 18 Jan 2021 16:44:16 -0500
Received: from mga04.intel.com ([192.55.52.120]:40284 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394693AbhARVoN (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 18 Jan 2021 16:44:13 -0500
IronPort-SDR: /BkIhuVZKmDxh6l+cVNxIj0xjHH90eB9QVbVGdNSQoVDb+9aoLqWjLzWstWR2h2Y/5zoroHGZy
 atZ46hrZ1RQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="176279939"
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="176279939"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 13:43:12 -0800
IronPort-SDR: czVLH6zuziQkxff1nqa9Riasa21jvBHSM3GRJ1Vv5AqiLEtoy5cs7LveltdbMXNpwGLGRbT74G
 2pnfGj/cunTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="365448077"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Jan 2021 13:43:10 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l1cIo-0004TA-27; Mon, 18 Jan 2021 21:43:10 +0000
Date:   Tue, 19 Jan 2021 05:43:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [m68k:master] BUILD SUCCESS
 abe70ee4912bda1466e67ba689712bc529e8114b
Message-ID: <600600e4.wwlBauXU6J3wnctS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: abe70ee4912bda1466e67ba689712bc529e8114b  Merge tag 'v5.11-rc4'

elapsed time: 721m

configs tested: 110
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                generic_kc705_defconfig
m68k                             alldefconfig
sh                           se7712_defconfig
m68k                       bvme6000_defconfig
m68k                          multi_defconfig
powerpc                 mpc836x_mds_defconfig
sh                        sh7763rdp_defconfig
xtensa                         virt_defconfig
m68k                        m5307c3_defconfig
arm                           h3600_defconfig
powerpc                 mpc8560_ads_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                      bmips_stb_defconfig
powerpc                 mpc834x_itx_defconfig
mips                        jmr3927_defconfig
arc                           tb10x_defconfig
powerpc                   motionpro_defconfig
arm                         at91_dt_defconfig
c6x                                 defconfig
arm                            hisi_defconfig
mips                       bmips_be_defconfig
arm                  colibri_pxa300_defconfig
powerpc                     redwood_defconfig
m68k                          hp300_defconfig
sh                          landisk_defconfig
mips                           jazz_defconfig
powerpc                      ppc40x_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                        dreamcast_defconfig
arm                         axm55xx_defconfig
powerpc                     tqm8560_defconfig
sparc64                             defconfig
arm                          ep93xx_defconfig
mips                        nlm_xlr_defconfig
powerpc                        cell_defconfig
mips                        workpad_defconfig
powerpc                    amigaone_defconfig
sh                         apsh4a3a_defconfig
mips                           ip32_defconfig
microblaze                      mmu_defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20210118
x86_64               randconfig-a016-20210118
x86_64               randconfig-a014-20210118
i386                 randconfig-a011-20210118
i386                 randconfig-a012-20210118
i386                 randconfig-a016-20210118
i386                 randconfig-a015-20210118
i386                 randconfig-a013-20210118
i386                 randconfig-a014-20210118
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                              defconfig

clang tested configs:
x86_64               randconfig-a004-20210118
x86_64               randconfig-a006-20210118
x86_64               randconfig-a001-20210118
x86_64               randconfig-a003-20210118
x86_64               randconfig-a005-20210118
x86_64               randconfig-a002-20210118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
