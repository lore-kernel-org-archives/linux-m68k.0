Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB35C43334
	for <linux-m68k@archiver.kernel.org>; Thu,  7 Jul 2022 06:09:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbiGGGJb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Jul 2022 02:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbiGGGJ2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Jul 2022 02:09:28 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FCC167DF
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 23:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657174168; x=1688710168;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dcHXCK3eiAvh6k9SdQ6wkOMHaX/jN1VJYGA3M6RwR7M=;
  b=Cb6rxgeFHR5IqwUk/YFmJEzZqf5hViR85LoPv5xIjN9g9FAgIcNKqyyC
   VQq7sgvjMQhaWBW3GLd23al0OvUqlHumzz7Tk5yuCwZzEa96F16AQ3AUT
   GR07z6o4PtAjylbHZE7cJ7KMHdB67KIyCoItOHtML/0udMO7plSvD9F7o
   mFfuBV3+YvP5l0So9Ly7JQG6Ub3qG45sojRIBXtzvMI9ilFytPRBfYPfF
   ESorODYmE0QlUC4bXQio5lc5wtoftIPyok4L5w7Gngj2oM2Bq1fPgfI+k
   cAvwA9FQEMxuYMFBIrnJyFWKVESHcFo4sNKGcDNTsFh9s8l0OqBOBeFI4
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="309497604"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
   d="scan'208";a="309497604"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 23:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
   d="scan'208";a="683196091"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2022 23:09:26 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o9Kha-000Ldy-0r;
        Thu, 07 Jul 2022 06:09:26 +0000
Date:   Thu, 07 Jul 2022 14:09:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.20] BUILD SUCCESS
 c2a6236024b786232e5247789a4c7acdabd1ffb1
Message-ID: <62c6787c.7+cOXKfk6vKFKEwp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.20
branch HEAD: c2a6236024b786232e5247789a4c7acdabd1ffb1  m68k: sun3: Fix spelling mistake

elapsed time: 1057m

configs tested: 119
configs skipped: 106

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                          rsk7269_defconfig
arm                          iop32x_defconfig
sh                         ecovec24_defconfig
powerpc                         wii_defconfig
m68k                       m5249evb_defconfig
sh                        apsh4ad0a_defconfig
arm                          lpd270_defconfig
arm                           viper_defconfig
arc                     nsimosci_hs_defconfig
powerpc                    amigaone_defconfig
openrisc                  or1klitex_defconfig
xtensa                         virt_defconfig
mips                         mpc30x_defconfig
arc                        nsimosci_defconfig
arm                          exynos_defconfig
powerpc                      cm5200_defconfig
s390                          debug_defconfig
arm                          simpad_defconfig
xtensa                           allyesconfig
sh                           se7721_defconfig
mips                           ip32_defconfig
sh                          lboxre2_defconfig
sh                           se7722_defconfig
um                             i386_defconfig
riscv                            allyesconfig
xtensa                  audio_kc705_defconfig
sh                            titan_defconfig
mips                  decstation_64_defconfig
powerpc                     mpc83xx_defconfig
m68k                        m5407c3_defconfig
arm                        spear6xx_defconfig
powerpc                    adder875_defconfig
xtensa                generic_kc705_defconfig
sh                          kfr2r09_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                 mpc834x_itx_defconfig
sh                         microdev_defconfig
nios2                         3c120_defconfig
powerpc                      pasemi_defconfig
arm                      jornada720_defconfig
arm                        mini2440_defconfig
arm                             rpc_defconfig
sh                           se7705_defconfig
sparc64                             defconfig
um                               alldefconfig
mips                       capcella_defconfig
powerpc                       eiger_defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
nios2                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20220706
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220706
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                      maltaaprp_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                        icon_defconfig
powerpc                      walnut_defconfig
arm                            dove_defconfig
mips                malta_qemu_32r6_defconfig
arm                       spear13xx_defconfig
mips                           ip27_defconfig
powerpc                     mpc5200_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220706
hexagon              randconfig-r045-20220706
hexagon              randconfig-r041-20220706
s390                 randconfig-r044-20220706

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
