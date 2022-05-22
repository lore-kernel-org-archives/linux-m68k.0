Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3839CC433F5
	for <linux-m68k@archiver.kernel.org>; Sun, 22 May 2022 23:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240460AbiEVXjO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 22 May 2022 19:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbiEVXjO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 22 May 2022 19:39:14 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0864A35DD2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 May 2022 16:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653262751; x=1684798751;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aS1jRinFTt/W7yNMGy4iFyxXLKdkEyYduHWUnSNyp9A=;
  b=d5O//bwvWmKY8bf9uhSaJAjmwwx596q/Y5xoPIdgzMWiYa5YZNgSgB84
   pey/RUOanYlAyWFQvfkyE/1i4OZ9CD5Girdg9f8rSOUWGbA1mq5QzFHdZ
   vGf4K2nsddVTq7R7fzF7WkcHvgQcMmQs8YVh0dd0DA6Rcvn9XiDCOtd9e
   Jz69ewlTQ+z2sb2IL7iAdq8bnD5GfeSc0cmEHk7vY6Y3GNl0z350m+DX0
   L1oCtIs45WbChqGhgwQyTYocgxYhotcHNS8b8nbDOJWsnZnSGfV1ro1HZ
   rFju4Hzl2o8Db3g9moEPO2CkxXXzdVUJNPViKxC2Tc9VRMWGlSFtaCu6S
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="359451817"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; 
   d="scan'208";a="359451817"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2022 16:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; 
   d="scan'208";a="525632409"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 May 2022 16:39:06 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nsvAA-0000iM-5Z;
        Sun, 22 May 2022 23:39:06 +0000
Date:   Mon, 23 May 2022 07:39:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.19] BUILD SUCCESS
 30b5e6ef4a32ea4985b99200e06d6660a69f9246
Message-ID: <628ac998.nUpD2NGRPkqGNFZj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.19
branch HEAD: 30b5e6ef4a32ea4985b99200e06d6660a69f9246  m68k: atari: Make Atari ROM port I/O write macros return void

elapsed time: 725m

configs tested: 152
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                           stm32_defconfig
sparc                       sparc64_defconfig
sh                         ecovec24_defconfig
sh                               allmodconfig
arm                            hisi_defconfig
arc                        vdk_hs38_defconfig
sh                            shmin_defconfig
parisc                              defconfig
mips                      fuloong2e_defconfig
mips                      maltasmvp_defconfig
powerpc                      cm5200_defconfig
powerpc                    sam440ep_defconfig
arm                        shmobile_defconfig
um                               alldefconfig
um                                  defconfig
xtensa                           allyesconfig
arm                         lpc18xx_defconfig
mips                         db1xxx_defconfig
arm                        cerfcube_defconfig
powerpc                     pq2fads_defconfig
sh                          rsk7269_defconfig
arm                          simpad_defconfig
sh                            hp6xx_defconfig
powerpc                     tqm8555_defconfig
h8300                    h8300h-sim_defconfig
arc                        nsimosci_defconfig
sh                            titan_defconfig
arm                        realview_defconfig
xtensa                           alldefconfig
sh                          polaris_defconfig
powerpc                         wii_defconfig
mips                        bcm47xx_defconfig
csky                             alldefconfig
um                             i386_defconfig
arm                            lart_defconfig
um                           x86_64_defconfig
mips                            ar7_defconfig
m68k                                defconfig
m68k                         apollo_defconfig
arm                        trizeps4_defconfig
arm                            xcep_defconfig
powerpc                     tqm8548_defconfig
sh                               j2_defconfig
ia64                        generic_defconfig
powerpc                 mpc85xx_cds_defconfig
ia64                                defconfig
sh                         microdev_defconfig
h8300                            allyesconfig
mips                     decstation_defconfig
m68k                             allyesconfig
arm                           sunxi_defconfig
arm                            zeus_defconfig
arm                            qcom_defconfig
powerpc                        cell_defconfig
powerpc                      ppc6xx_defconfig
m68k                          amiga_defconfig
mips                           jazz_defconfig
xtensa                  audio_kc705_defconfig
arm                         s3c6400_defconfig
sh                        edosk7760_defconfig
mips                       bmips_be_defconfig
arm                  randconfig-c002-20220522
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                             allyesconfig
riscv                             allnoconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
s390                                defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220522
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
arm                  randconfig-c002-20220522
x86_64                        randconfig-c007
s390                 randconfig-c005-20220522
i386                          randconfig-c001
powerpc              randconfig-c003-20220522
riscv                randconfig-c006-20220522
mips                 randconfig-c004-20220522
arm                          ep93xx_defconfig
arm                        vexpress_defconfig
i386                             allyesconfig
powerpc                          g5_defconfig
powerpc                    socrates_defconfig
powerpc                          allyesconfig
powerpc                     mpc512x_defconfig
powerpc                      ppc44x_defconfig
arm                      pxa255-idp_defconfig
mips                           ip27_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                           rs90_defconfig
mips                      pic32mzda_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        mvebu_v5_defconfig
powerpc                     kmeter1_defconfig
arm                         orion5x_defconfig
arm                           omap1_defconfig
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
