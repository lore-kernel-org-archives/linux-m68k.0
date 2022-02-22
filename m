Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B80C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 22 Feb 2022 00:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237345AbiBVAGM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Feb 2022 19:06:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbiBVAGM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Feb 2022 19:06:12 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B485240A9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Feb 2022 16:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645488348; x=1677024348;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MqcKPhPKnynQZw19a2OzacMAcNx+96LU2+9p4YsQ1rU=;
  b=clHvO0IEpNivVCdURLdB9wa6yNRAHK2TW40c9rGn0wVGnXXEPlm8/9IM
   blk5cxEzRv1fKkFERqa2A3sGnTtTkfumnYWJwGcekHjPJmAD2pHggpckC
   cLWfn4m89GwJAC29xI8HYWgRMld1dEDWsWKhbaQ9Hc3hZjz3v+TJt0rAr
   16WVHdo8xndSDXfzHhzfhLz7Ny2COKh2SgZFmKNJIH24zZAJZkiJ8Xe7B
   1BxUS90jewluzbz7veBqLuqHnACcaf26oewWqSNuoOKjIVR7aGqb0IkzQ
   s9U6NU07RULQ4mrZc444yN8aN3BaIM7+qocvBEgVu8NLyiItNkASROvdi
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232202332"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="232202332"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 16:05:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="505341311"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Feb 2022 16:05:46 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMIgb-000272-KN; Tue, 22 Feb 2022 00:05:45 +0000
Date:   Tue, 22 Feb 2022 08:05:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.18] BUILD SUCCESS
 8213c61376877ead2128f2ce1b5935be58bad0da
Message-ID: <621428cf.Q5hQ6R1kj4hGGWEM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.18
branch HEAD: 8213c61376877ead2128f2ce1b5935be58bad0da  m68k: defconfig: Update defconfigs for v5.17-rc3

elapsed time: 729m

configs tested: 125
configs skipped: 125

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220221
powerpc                      chrp32_defconfig
sh                         ap325rxa_defconfig
sh                   secureedge5410_defconfig
mips                         mpc30x_defconfig
sh                 kfr2r09-romimage_defconfig
m68k                        mvme147_defconfig
alpha                            alldefconfig
sh                           se7724_defconfig
mips                             allyesconfig
arm                      jornada720_defconfig
sh                               allmodconfig
powerpc                  storcenter_defconfig
mips                         tb0226_defconfig
mips                           ip32_defconfig
sh                            hp6xx_defconfig
sh                           se7721_defconfig
m68k                        m5407c3_defconfig
s390                             allyesconfig
sh                   rts7751r2dplus_defconfig
arm                          pxa3xx_defconfig
powerpc                        warp_defconfig
sh                           sh2007_defconfig
arm                        clps711x_defconfig
arm                            pleb_defconfig
powerpc                       holly_defconfig
sh                   sh7770_generic_defconfig
xtensa                  cadence_csp_defconfig
powerpc                    amigaone_defconfig
powerpc                     redwood_defconfig
mips                         db1xxx_defconfig
sh                ecovec24-romimage_defconfig
powerpc                         ps3_defconfig
mips                        jmr3927_defconfig
sparc64                             defconfig
sh                        sh7757lcr_defconfig
arc                           tb10x_defconfig
arm                        mvebu_v7_defconfig
powerpc                        cell_defconfig
powerpc                  iss476-smp_defconfig
s390                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20220221
i386                 randconfig-a001-20220221
i386                 randconfig-a005-20220221
i386                 randconfig-a003-20220221
i386                 randconfig-a006-20220221
i386                 randconfig-a004-20220221
x86_64               randconfig-a003-20220221
x86_64               randconfig-a002-20220221
x86_64               randconfig-a005-20220221
x86_64               randconfig-a006-20220221
x86_64               randconfig-a001-20220221
x86_64               randconfig-a004-20220221
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
powerpc              randconfig-c003-20220221
x86_64               randconfig-c007-20220221
arm                  randconfig-c002-20220221
mips                 randconfig-c004-20220221
i386                 randconfig-c001-20220221
riscv                randconfig-c006-20220221
arm                          moxart_defconfig
x86_64               randconfig-a011-20220221
x86_64               randconfig-a015-20220221
x86_64               randconfig-a014-20220221
x86_64               randconfig-a016-20220221
x86_64               randconfig-a013-20220221
x86_64               randconfig-a012-20220221
i386                 randconfig-a016-20220221
i386                 randconfig-a012-20220221
i386                 randconfig-a015-20220221
i386                 randconfig-a011-20220221
i386                 randconfig-a014-20220221
i386                 randconfig-a013-20220221
hexagon              randconfig-r045-20220221
hexagon              randconfig-r041-20220221
riscv                randconfig-r042-20220221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
