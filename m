Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897EFC636D7
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Feb 2023 04:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbjBUEFI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Feb 2023 23:05:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233161AbjBUEEq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Feb 2023 23:04:46 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14750233E9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Feb 2023 20:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676952285; x=1708488285;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xTSHxq/pQJwkZIBJg+OFFXM8PfuY2eKfBDg/Efihz/Y=;
  b=dVjn18rf2MtrBebmjdmisDH+ISnmTHNWXEZJAoYTTm3q5ZOQHtADjEfC
   YtXQCgv9pxQLNJQ3GgPYeiW4nog9L//DlsULzlL2W1uMGYzthwv9ZulDl
   6CSvl+IxosqQXQC59ku9GI6wQUbyOnAQ2FueuTLRWprK+C83scr1v1yn+
   JqL6S23iPWIl5olq0sfA47eHu/6RaJwrGc8zdlXmfY/VwtPxXVqBAyetd
   mnx5hYC+dRw8In+FDKUMDgxUZvJFf/oG+9/fNjciPiq7ATDROskGv5Od8
   m4T+hexWUOg+x+uKm+c9C1/TgCLv97LPn78ZOmQPYBoV8usOQVvH3mVs7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="312167011"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="312167011"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 20:04:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="1000455981"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="1000455981"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Feb 2023 20:04:43 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pUJtS-000EQP-1F;
        Tue, 21 Feb 2023 04:04:42 +0000
Date:   Tue, 21 Feb 2023 12:03:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 0fcf6b2d92cbb554127e342ca27adefa569ff63f
Message-ID: <63f442ac.0JNX9fC/vcqT4xLn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 0fcf6b2d92cbb554127e342ca27adefa569ff63f  Merge tag 'v6.2'

elapsed time: 877m

configs tested: 100
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arc                  randconfig-r043-20230219
arc                  randconfig-r043-20230220
arm                              allmodconfig
arm                              allyesconfig
arm                         axm55xx_defconfig
arm                                 defconfig
arm                            mps2_defconfig
arm                  randconfig-r046-20230220
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                 randconfig-a001-20230220
i386                 randconfig-a002-20230220
i386                 randconfig-a003-20230220
i386                 randconfig-a004-20230220
i386                 randconfig-a005-20230220
i386                 randconfig-a006-20230220
i386                          randconfig-c001
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                           sun3_defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                            gpr_defconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                     ep8248e_defconfig
powerpc                  iss476-smp_defconfig
powerpc                     redwood_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                randconfig-r042-20230219
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
s390                 randconfig-r044-20230219
sh                               allmodconfig
sh                        dreamcast_defconfig
sh                          polaris_defconfig
sh                          sdk7780_defconfig
sparc                               defconfig
sparc64                             defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64               randconfig-a001-20230220
x86_64               randconfig-a002-20230220
x86_64               randconfig-a003-20230220
x86_64               randconfig-a004-20230220
x86_64               randconfig-a005-20230220
x86_64               randconfig-a006-20230220
x86_64                               rhel-8.3
xtensa                           allyesconfig
xtensa                  cadence_csp_defconfig

clang tested configs:
arm                  colibri_pxa270_defconfig
arm                  randconfig-r046-20230219
arm                        spear3xx_defconfig
hexagon              randconfig-r041-20230219
hexagon              randconfig-r041-20230220
hexagon              randconfig-r045-20230219
hexagon              randconfig-r045-20230220
i386                 randconfig-a011-20230220
i386                 randconfig-a012-20230220
i386                 randconfig-a013-20230220
i386                 randconfig-a014-20230220
i386                 randconfig-a015-20230220
i386                 randconfig-a016-20230220
mips                       lemote2f_defconfig
mips                        omega2p_defconfig
powerpc                      katmai_defconfig
powerpc                   microwatt_defconfig
powerpc                     skiroot_defconfig
riscv                randconfig-r042-20230220
s390                 randconfig-r044-20230220
x86_64               randconfig-a011-20230220
x86_64               randconfig-a012-20230220
x86_64               randconfig-a013-20230220
x86_64               randconfig-a014-20230220
x86_64               randconfig-a015-20230220
x86_64               randconfig-a016-20230220

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
