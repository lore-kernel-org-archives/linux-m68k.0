Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA0AC433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 17 May 2022 01:38:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237025AbiEQBiR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 May 2022 21:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237236AbiEQBiQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 May 2022 21:38:16 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BBE40921
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 May 2022 18:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652751494; x=1684287494;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dmzROocxGTdMybEnpeoKYT1h7MTfN9N2/LwE2aEEv2A=;
  b=QeSVx8cOG+dw2RlqFdUPmtAovqqDLlhbjbaKvTUqHhYY/n0WSM1Ab51r
   yGqS2ytiigMe3Xl03yqxypW67RF3Mz71x/15cyasOkDcVl2B+jZqgsHYS
   Bic2ATM5vAypHEx729jVSvNhx0UDCOETD7XPjgWdtfgCKh4nhzMTXkwB9
   1Kht6ELn1zOyvRIpiOO9yADi9OgJj+bfFuaA/vurqFGoD00gjki89miYp
   kvI3E+s99Ohs0XCpAf7KS0fbfGnQMnAqHA+/leif7A5GkaWS8jSmxQ6nv
   46kUVSBA52QBZObMHkGZdarwbuu6apOHMtE7pxswLjakhPBCi0VWG12fA
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="357428911"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; 
   d="scan'208";a="357428911"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 18:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; 
   d="scan'208";a="522731262"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 May 2022 18:37:59 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nqm9u-0000TT-GG;
        Tue, 17 May 2022 01:37:58 +0000
Date:   Tue, 17 May 2022 09:37:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.19] BUILD SUCCESS
 ed6bc6bf0a7d75e80eb1df883c09975ebb74e590
Message-ID: <6282fc5d.KPgC39Zx8UTKHTYc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.19
branch HEAD: ed6bc6bf0a7d75e80eb1df883c09975ebb74e590  m68k: math-emu: Fix dependencies of math emulation support

elapsed time: 934m

configs tested: 132
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220516
sh                           se7724_defconfig
powerpc                     tqm8541_defconfig
powerpc                      ppc6xx_defconfig
powerpc                    klondike_defconfig
powerpc64                           defconfig
h8300                            alldefconfig
arm                           sama5_defconfig
mips                            gpr_defconfig
arm                      jornada720_defconfig
m68k                        mvme16x_defconfig
powerpc                     tqm8555_defconfig
arm                       omap2plus_defconfig
m68k                             allyesconfig
powerpc                      cm5200_defconfig
arm                             ezx_defconfig
powerpc                       maple_defconfig
mips                           xway_defconfig
mips                        vocore2_defconfig
sparc                               defconfig
powerpc                     mpc83xx_defconfig
sh                      rts7751r2d1_defconfig
powerpc                    amigaone_defconfig
sh                           se7750_defconfig
powerpc                    sam440ep_defconfig
sh                                  defconfig
m68k                       m5208evb_defconfig
arm                          simpad_defconfig
xtensa                          iss_defconfig
riscv                               defconfig
powerpc                      chrp32_defconfig
sh                             espt_defconfig
powerpc                      makalu_defconfig
powerpc                 mpc85xx_cds_defconfig
parisc                generic-64bit_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     sequoia_defconfig
sh                           se7780_defconfig
sh                           se7705_defconfig
arm                  randconfig-c002-20220516
x86_64               randconfig-c001-20220516
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
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
sparc                            allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
i386                   debian-10.3-kselftests
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a012-20220516
x86_64               randconfig-a016-20220516
x86_64               randconfig-a011-20220516
x86_64               randconfig-a014-20220516
x86_64               randconfig-a013-20220516
x86_64               randconfig-a015-20220516
i386                 randconfig-a016-20220516
i386                 randconfig-a013-20220516
i386                 randconfig-a015-20220516
i386                 randconfig-a012-20220516
i386                 randconfig-a014-20220516
i386                 randconfig-a011-20220516
s390                 randconfig-r044-20220516
riscv                randconfig-r042-20220516
arc                  randconfig-r043-20220516
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc              randconfig-c003-20220516
riscv                randconfig-c006-20220516
mips                 randconfig-c004-20220516
arm                  randconfig-c002-20220516
x86_64               randconfig-c007-20220516
i386                 randconfig-c001-20220516
powerpc                        fsp2_defconfig
mips                     loongson1c_defconfig
arm                         mv78xx0_defconfig
arm                          ep93xx_defconfig
arm                        mvebu_v5_defconfig
powerpc                       ebony_defconfig
i386                 randconfig-a001-20220516
i386                 randconfig-a003-20220516
i386                 randconfig-a005-20220516
i386                 randconfig-a004-20220516
i386                 randconfig-a006-20220516
i386                 randconfig-a002-20220516
x86_64               randconfig-a001-20220516
x86_64               randconfig-a006-20220516
x86_64               randconfig-a003-20220516
x86_64               randconfig-a005-20220516
x86_64               randconfig-a002-20220516
x86_64               randconfig-a004-20220516
hexagon              randconfig-r045-20220516
hexagon              randconfig-r041-20220516

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
