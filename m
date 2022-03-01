Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99C8C433EF
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Mar 2022 05:06:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbiCAFHZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 1 Mar 2022 00:07:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232538AbiCAFHL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 1 Mar 2022 00:07:11 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E3A7561F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Feb 2022 21:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646111159; x=1677647159;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+UmYMWsYQvqPWLdWfmHoWcRo8fieBlj38jg3KmYyxRY=;
  b=Sc8tvsW9Od36KLCX7sAo5UrI8ya+tevJ2tp0bj+Fp6mb8ZycfIBM4Emb
   VfdaRaH8OdKO3CChmsDHJXU9yFd/iXruBRN9Rhrx9CcT0dMtysAWwkN04
   8Gmic5GfDYawsxZB1iCFhdun93lO4Sd8WxI6rUR1EvkKTIJXG2L8juhlK
   N6+FW2FWwBddlKTslqk87r1sXEPFMCz5BwzAOkdtcI7oLbetkaiUpwWFO
   Y2RuzNL0pI3cRbFA1pTR7Xobg7qzm7AxQoJjhxvUn/42jF8bk2j+nV1/j
   WxNNs1xHqrstqvTCqZfcqXGW/iwksv4eR6B9dqOHrNExDYrjU+881sQNV
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="236565606"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="236565606"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 21:05:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="708923005"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Feb 2022 21:05:48 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nOuhn-000892-La; Tue, 01 Mar 2022 05:05:47 +0000
Date:   Tue, 01 Mar 2022 13:05:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.18] BUILD SUCCESS
 0d52a01a266ba21840c7cb02e1de39c503759dda
Message-ID: <621da982.OIeyB98g4HaQ3QOt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.18
branch HEAD: 0d52a01a266ba21840c7cb02e1de39c503759dda  m68k: defconfig: Disable fbdev on Sun3/3x

elapsed time: 733m

configs tested: 182
configs skipped: 123

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220228
arm                            lart_defconfig
arm                         assabet_defconfig
arm                          simpad_defconfig
sh                           se7780_defconfig
powerpc                        cell_defconfig
s390                                defconfig
mips                         db1xxx_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                ecovec24-romimage_defconfig
m68k                            mac_defconfig
sh                     sh7710voipgw_defconfig
powerpc                      tqm8xx_defconfig
xtensa                    xip_kc705_defconfig
sh                               alldefconfig
mips                         tb0226_defconfig
powerpc                  iss476-smp_defconfig
m68k                          atari_defconfig
s390                             allyesconfig
arm                       omap2plus_defconfig
powerpc                     tqm8555_defconfig
mips                         mpc30x_defconfig
arm                        cerfcube_defconfig
mips                       bmips_be_defconfig
arc                              allyesconfig
arm                          badge4_defconfig
arc                     nsimosci_hs_defconfig
sh                          r7780mp_defconfig
sh                           se7724_defconfig
sh                          sdk7780_defconfig
arm                            pleb_defconfig
microblaze                      mmu_defconfig
arm                          pxa3xx_defconfig
m68k                        m5307c3_defconfig
m68k                          multi_defconfig
arm                          gemini_defconfig
sh                          rsk7269_defconfig
powerpc                      makalu_defconfig
m68k                        mvme16x_defconfig
sh                           se7619_defconfig
sh                        sh7757lcr_defconfig
s390                       zfcpdump_defconfig
ia64                                defconfig
powerpc                     taishan_defconfig
openrisc                    or1ksim_defconfig
arm                         axm55xx_defconfig
powerpc                     sequoia_defconfig
m68k                       m5275evb_defconfig
arm                        mini2440_defconfig
sparc64                          alldefconfig
openrisc                         alldefconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
arm                            qcom_defconfig
mips                     loongson1b_defconfig
arm                       aspeed_g5_defconfig
arc                        nsimosci_defconfig
ia64                             allmodconfig
arc                        vdk_hs38_defconfig
m68k                         apollo_defconfig
arm                        spear6xx_defconfig
m68k                          amiga_defconfig
arm                           viper_defconfig
arm                  randconfig-c002-20220228
arm                  randconfig-c002-20220227
arm                  randconfig-c002-20220301
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
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20220228
x86_64               randconfig-a015-20220228
x86_64               randconfig-a014-20220228
x86_64               randconfig-a013-20220228
x86_64               randconfig-a016-20220228
x86_64               randconfig-a012-20220228
i386                 randconfig-a016-20220228
i386                 randconfig-a012-20220228
i386                 randconfig-a015-20220228
i386                 randconfig-a011-20220228
i386                 randconfig-a013-20220228
i386                 randconfig-a014-20220228
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
s390                 randconfig-r044-20220228
arc                  randconfig-r043-20220228
arc                  randconfig-r043-20220227
riscv                randconfig-r042-20220228
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220227
x86_64                        randconfig-c007
arm                  randconfig-c002-20220227
mips                 randconfig-c004-20220227
s390                 randconfig-c005-20220227
i386                          randconfig-c001
riscv                randconfig-c006-20220227
powerpc                    ge_imp3a_defconfig
powerpc                     powernv_defconfig
mips                           rs90_defconfig
arm                         hackkit_defconfig
arm                      pxa255-idp_defconfig
powerpc                     tqm8540_defconfig
mips                           mtx1_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8560_defconfig
arm                       cns3420vb_defconfig
arm                        neponset_defconfig
arm                       imx_v4_v5_defconfig
mips                      bmips_stb_defconfig
powerpc                      pmac32_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     mpc5200_defconfig
arm                           sama7_defconfig
mips                           ip28_defconfig
arm                        mvebu_v5_defconfig
arm                          imote2_defconfig
x86_64               randconfig-a003-20220228
x86_64               randconfig-a005-20220228
x86_64               randconfig-a002-20220228
x86_64               randconfig-a006-20220228
x86_64               randconfig-a001-20220228
x86_64               randconfig-a004-20220228
i386                 randconfig-a002-20220228
i386                 randconfig-a001-20220228
i386                 randconfig-a005-20220228
i386                 randconfig-a003-20220228
i386                 randconfig-a006-20220228
i386                 randconfig-a004-20220228
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220227
hexagon              randconfig-r041-20220227
riscv                randconfig-r042-20220227

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
