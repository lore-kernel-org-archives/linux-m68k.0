Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BEFC433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 23 May 2022 22:14:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbiEWWOH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 May 2022 18:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiEWWOH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 May 2022 18:14:07 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75CCD6E8F7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 May 2022 15:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653344046; x=1684880046;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bNUv16OWqdaHM6iDjHJExfOikFQGYdL/36yNw56fw4w=;
  b=SBrKos6M1dnetWmK8YaOOzyKUeYvvpjN4EJ81Xt2f/AEAjPElmhH3XQL
   hWe+VJGGp080o/sOZEvFJIR5kdsK1PGYGbW0/T708xj9ItTORtO+9PP2B
   UzFAs3LpNXQobRxa3cq+MLCmRYw3hFmPd4l8CkMlgyS8dkZ2WqKvHFyYk
   eTgT1uHlOg5JJwNSI8qQSHsaRPY9DeXJ42DsbAUZwCl80oCffJB+mATgQ
   FH3HZxkhH28/3J0kxxWpXtx9RU1t5LgaUR4yh7ZizNW5Fx2umxZokp4Iw
   FbAhfr1L9LXgzqRPbjByS5Zn+2UKTHIeIIft2dFmqVvKkDH6dORPbbYRw
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273367196"
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; 
   d="scan'208";a="273367196"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 15:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; 
   d="scan'208";a="608424912"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 May 2022 15:14:04 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ntGJP-0001TY-FI;
        Mon, 23 May 2022 22:14:03 +0000
Date:   Tue, 24 May 2022 06:13:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 67e3a731eab11bc68822924b983a6a981138c47c
Message-ID: <628c0726.zJDViL/r9Zzp7UXn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 67e3a731eab11bc68822924b983a6a981138c47c  Merge tag 'v5.18'

elapsed time: 726m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
mips                     decstation_defconfig
sh                          r7785rp_defconfig
sh                          lboxre2_defconfig
um                               alldefconfig
arm                        realview_defconfig
sh                            titan_defconfig
arc                        nsimosci_defconfig
xtensa                           alldefconfig
sh                          polaris_defconfig
csky                             alldefconfig
arm                        shmobile_defconfig
ia64                                defconfig
ia64                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20220523
x86_64               randconfig-a006-20220523
x86_64               randconfig-a001-20220523
x86_64               randconfig-a004-20220523
x86_64               randconfig-a002-20220523
x86_64               randconfig-a005-20220523
i386                 randconfig-a001-20220523
i386                 randconfig-a006-20220523
i386                 randconfig-a002-20220523
i386                 randconfig-a005-20220523
i386                 randconfig-a003-20220523
i386                 randconfig-a004-20220523
arc                  randconfig-r043-20220523
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
arc                  randconfig-r043-20220522
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
arm                             mxs_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        magician_defconfig
arm                         orion5x_defconfig
arm                        mvebu_v5_defconfig
powerpc                     kmeter1_defconfig
x86_64               randconfig-a014-20220523
x86_64               randconfig-a013-20220523
x86_64               randconfig-a012-20220523
x86_64               randconfig-a015-20220523
x86_64               randconfig-a011-20220523
x86_64               randconfig-a016-20220523
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                 randconfig-a014-20220523
i386                 randconfig-a011-20220523
i386                 randconfig-a013-20220523
i386                 randconfig-a016-20220523
i386                 randconfig-a012-20220523
i386                 randconfig-a015-20220523
hexagon              randconfig-r045-20220523
hexagon              randconfig-r045-20220522
hexagon              randconfig-r041-20220523
hexagon              randconfig-r041-20220522
riscv                randconfig-r042-20220523
s390                 randconfig-r044-20220523
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
