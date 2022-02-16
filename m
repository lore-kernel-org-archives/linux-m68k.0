Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF35EC433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Feb 2022 22:45:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237390AbiBPWqI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Feb 2022 17:46:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236257AbiBPWqH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Feb 2022 17:46:07 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5DE28ADA8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 14:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645051555; x=1676587555;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=34BfO53nIOj0XPO4FW7n5gMQOywdbfWxiaXDnwpTmVk=;
  b=Pk0kxu7z+K7UG+Yj/oeJwJrJQISe0w6XfW/N51f+U28g7YT3oFey5Aqe
   d9PK5AlX/Gc/zLqUWctKBKAwAJ4FQct0BW5hiEa9VaDzsocXajsGsEdUK
   U9ir8UM8OMjp/xYk2JTmAQ7N/2ANsmmgetpM5bZoYQ0YwjUk8BKb/tlMF
   REzyFUJ8XMkOuKH/J9SQEtVhOzuWy9+rnPT27WnuqnN7mu3VPkQXuE11J
   P2rago+yus92VSUkUt5uxBIXzyNGs1EKkrLSmGvVW4/g10+XSIv4d9hQI
   /fl0soFLqL6o3A9FVyxjKh/6G45NnsJmBPDbU9Sn8oaWmVgI0v1GZI0f2
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250475905"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="250475905"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 14:45:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="545212431"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Feb 2022 14:45:53 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nKT3Y-000BCW-NU; Wed, 16 Feb 2022 22:45:52 +0000
Date:   Thu, 17 Feb 2022 06:45:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:atari-drm-wip] BUILD SUCCESS
 f0907bb2a3f9206987a419b3e97d88438954ee55
Message-ID: <620d7e74.V3CMz8GR2XziPWAR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git atari-drm-wip
branch HEAD: f0907bb2a3f9206987a419b3e97d88438954ee55  [WIP] drm: Add Atari driver

elapsed time: 721m

configs tested: 104
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
arm                         lpc18xx_defconfig
arm                        oxnas_v6_defconfig
mips                           ci20_defconfig
m68k                          multi_defconfig
sparc64                          alldefconfig
xtensa                              defconfig
arm                          gemini_defconfig
powerpc                     pq2fads_defconfig
m68k                       m5208evb_defconfig
sh                 kfr2r09-romimage_defconfig
sh                                  defconfig
arm                       aspeed_g5_defconfig
m68k                             alldefconfig
xtensa                  nommu_kc705_defconfig
arm                  randconfig-c002-20220216
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220216
arc                  randconfig-r043-20220216
s390                 randconfig-r044-20220216
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc               mpc834x_itxgp_defconfig
powerpc                          allmodconfig
powerpc                 mpc8315_rdb_defconfig
arm                         bcm2835_defconfig
arm                           omap1_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220216
hexagon              randconfig-r041-20220216

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
