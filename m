Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF79C3DA79
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Dec 2022 23:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbiLZXJH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Dec 2022 18:09:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbiLZXJG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Dec 2022 18:09:06 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54EA310A4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Dec 2022 15:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672096145; x=1703632145;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=g/4koqDQMv7H31aYa2IjATcy0NuNxsCqjmg4rUpD/3k=;
  b=HGtT8yyXkUclWE3QbT/nmq8wpX2XHP8I3hbftN/KlCe5PiqGYuvr7rgI
   /jWNPvxeaM7ImBYWn/o2bbPx7y/Np+SuBecdEu3/SYkP5+mUuPdCCootk
   yjremmlgwwD6UHf5U2N1rHsCpwq7sDC1gvpXj8xl8Alky7Zgf8pklrNjy
   Sh5z4Hw6Tj1k/3DPupc41pEngf8nly9+eGoEXsZhvCJ/7cnxsUnhFLOj2
   UHHHMTtnlUBWqUpD/v+rXLB0/H8dqGlhA51uBaPhBoJ1FSjZJ8+VcbG5W
   jwoJ0uwIzu1zRz5zRGB+/yoqAOYD2vVNl8jjvEgQGLVxjYzt/HEob44UO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="347808778"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="347808778"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2022 15:09:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="630519068"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="630519068"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Dec 2022 15:09:02 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p9wab-000Ehq-3D;
        Mon, 26 Dec 2022 23:09:01 +0000
Date:   Tue, 27 Dec 2022 07:08:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 9e459eb6dfb0d6dfd2a869bf442c4a7aae0f04db
Message-ID: <63aa2979.V2w8oA2ugrVeVewu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 9e459eb6dfb0d6dfd2a869bf442c4a7aae0f04db  Merge tag 'v6.2-rc1'

elapsed time: 723m

configs tested: 83
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
mips                             allyesconfig
sh                               allmodconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
arc                                 defconfig
ia64                             allmodconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a012-20221226
x86_64               randconfig-a014-20221226
i386                 randconfig-a016-20221226
x86_64               randconfig-a013-20221226
i386                 randconfig-a011-20221226
x86_64               randconfig-a011-20221226
x86_64               randconfig-a012-20221226
x86_64               randconfig-a015-20221226
x86_64               randconfig-a016-20221226
i386                 randconfig-a015-20221226
i386                 randconfig-a013-20221226
um                             i386_defconfig
x86_64                              defconfig
i386                 randconfig-a014-20221226
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
um                           x86_64_defconfig
arc                  randconfig-r043-20221226
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
x86_64                           rhel-8.3-kvm
riscv                randconfig-r042-20221226
arm                                 defconfig
s390                 randconfig-r044-20221226
x86_64                    rhel-8.3-kselftests
arm64                            allyesconfig
x86_64                            allnoconfig
i386                                defconfig
mips                         rt305x_defconfig
arm64                            alldefconfig
arm                              allyesconfig
i386                             allyesconfig
parisc                           alldefconfig
arm                          badge4_defconfig
powerpc                     mpc83xx_defconfig
sh                          rsk7201_defconfig
arm                            zeus_defconfig
arc                               allnoconfig
powerpc                      ppc40x_defconfig
arm                           corgi_defconfig
sh                          rsk7203_defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
arc                      axs103_smp_defconfig

clang tested configs:
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
hexagon              randconfig-r045-20221226
x86_64                          rhel-8.3-rust
i386                 randconfig-a004-20221226
i386                 randconfig-a001-20221226
x86_64               randconfig-a002-20221226
x86_64               randconfig-a003-20221226
i386                 randconfig-a003-20221226
i386                 randconfig-a002-20221226
x86_64               randconfig-a006-20221226
i386                 randconfig-a006-20221226
x86_64               randconfig-a001-20221226
i386                 randconfig-a005-20221226
x86_64               randconfig-a004-20221226
x86_64               randconfig-a005-20221226
arm                          pcm027_defconfig
powerpc                     ppa8548_defconfig
riscv                             allnoconfig
arm                         orion5x_defconfig
arm                        spear3xx_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                      obs600_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
