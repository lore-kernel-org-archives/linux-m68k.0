Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FB3C433EF
	for <linux-m68k@archiver.kernel.org>; Sat, 11 Jun 2022 00:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236683AbiFKAXC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 10 Jun 2022 20:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbiFKAXB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 10 Jun 2022 20:23:01 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CEB81AA16F
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jun 2022 17:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654906979; x=1686442979;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CR9rU83z/SrUNX8KqiuKqhZMVPpC8Umm4qDbadIplM8=;
  b=KnyHroaBM0prV5LipHrpYCrjq10+OFSpSgbnlu9dW+ZsDiGCYsYHMJQp
   yj5sXy6bVAswRvTR9m3A/5hucry2LyYtPPxCY8qPmJEJCjvUmkJU1UQew
   5QrCl+0b3dCZwZReU3HnakX/JJOfHhBCqoKdhSR27jhEKSpZEvOeRiVIP
   OifuA8OaR3H1JkEEB/59O16a+6ibKyEoTJJchvnFSLu0DPnwSarzEmwMF
   uhxVEakc6GlcVLc3wvdmZxObX87/czx1TJcVTlcGGxlRwBqbaGQih+wlf
   lg/xTyDpkoZXk81/ecjffvxbxsVmgAzoJtTmwG+Hab7O6YpHeqTzZIW1N
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="275319967"
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; 
   d="scan'208";a="275319967"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 17:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; 
   d="scan'208";a="650105854"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jun 2022 17:22:57 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nzou0-000IOn-LI;
        Sat, 11 Jun 2022 00:22:56 +0000
Date:   Sat, 11 Jun 2022 08:21:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 4d2c0584c35d51a24eb79c1c170c0efd0656a87b
Message-ID: <62a3e024.7Xp252CjIQPBwYwx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 4d2c0584c35d51a24eb79c1c170c0efd0656a87b  m68k: virt: Kconfig minor fixes

elapsed time: 5292m

configs tested: 108
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
m68k                           virt_defconfig
powerpc                      mgcoge_defconfig
arm                          pxa910_defconfig
arm                            qcom_defconfig
xtensa                    smp_lx200_defconfig
arm                       omap2plus_defconfig
sh                                  defconfig
xtensa                  audio_kc705_defconfig
mips                           gcw0_defconfig
arm                            hisi_defconfig
arm                        keystone_defconfig
openrisc                  or1klitex_defconfig
sh                         apsh4a3a_defconfig
ia64                         bigsur_defconfig
arm                           viper_defconfig
h8300                            alldefconfig
arm                            zeus_defconfig
arm                            pleb_defconfig
sh                         ecovec24_defconfig
powerpc                      makalu_defconfig
mips                         tb0226_defconfig
sh                          urquell_defconfig
arc                            hsdk_defconfig
parisc                              defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nios2                            allyesconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                                 defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
powerpc                           allnoconfig
um                             i386_defconfig
powerpc                          allyesconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a013
i386                          randconfig-a001
x86_64                        randconfig-a004
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a002
riscv                            allmodconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                               rhel-8.3

clang tested configs:
powerpc                 mpc8313_rdb_defconfig
arm                       netwinder_defconfig
arm                                 defconfig
powerpc                      obs600_defconfig
mips                      bmips_stb_defconfig
arm                          moxart_defconfig
mips                          ath79_defconfig
riscv                             allnoconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a004
x86_64                        randconfig-a012
hexagon              randconfig-r045-20220609
s390                 randconfig-r044-20220609
riscv                randconfig-r042-20220609
hexagon              randconfig-r041-20220609

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
