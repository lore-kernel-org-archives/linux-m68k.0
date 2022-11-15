Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC3AC433FE
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Nov 2022 04:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236873AbiKOEEQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Nov 2022 23:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237398AbiKOED7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Nov 2022 23:03:59 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCB31263C
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Nov 2022 20:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668485037; x=1700021037;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=S/k8xMYj9f421OlM3V8I+VXyWj0UyGC3FYBVm9YSWU8=;
  b=caItoUzhCrMRHH/b0+W8V3ed1oq1zs2xhsnyU+hErCTohP6bzC+P6Wd5
   rKAtxX6Bl0mP+FIPDRBYuPilnwDwYeiwzEWgQX8K1JWTQebMzJg39Bqny
   J8q3JukQ4kUe9vRVTehA8HRE9EvuCTlvWF00DgGnqbip9aWS/XqnSGlDy
   IJKoLIbB4htBFEI4KpqFUE3mf8NPpkgMVNdy1WUJRRnYh+1NnhuCqyqns
   iUqdAAhuanO3kKhH+P0vaxXiEXY6qLRz7vFMJsKcLRhXXwzGO8GTfsphm
   EJ0pBThtNyc5ntvDahrtibatB6FzCm543JtFuAb0xH918tNQGfYy4Os2y
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="374286750"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="374286750"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 20:03:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="883802321"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="883802321"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Nov 2022 20:03:54 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ounAv-00011L-1y;
        Tue, 15 Nov 2022 04:03:53 +0000
Date:   Tue, 15 Nov 2022 12:03:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-next] BUILD SUCCESS
 553b20b211c4153f8af6096fd52069bbdf955e23
Message-ID: <63730f97.lvoEMsX18yaWGuPy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
branch HEAD: 553b20b211c4153f8af6096fd52069bbdf955e23  m68k: defconfig: Update defconfigs for v6.1-rc1

elapsed time: 725m

configs tested: 83
configs skipped: 117

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
m68k                             allyesconfig
i386                             allyesconfig
i386                                defconfig
m68k                             allmodconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                 randconfig-a002-20221114
i386                 randconfig-a004-20221114
i386                 randconfig-a003-20221114
i386                 randconfig-a005-20221114
i386                 randconfig-a006-20221114
i386                 randconfig-a001-20221114
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arc                              allyesconfig
alpha                            allyesconfig
xtensa                         virt_defconfig
sh                            shmin_defconfig
xtensa                              defconfig
mips                        vocore2_defconfig
x86_64               randconfig-a003-20221114
x86_64               randconfig-a005-20221114
x86_64               randconfig-a004-20221114
x86_64               randconfig-a002-20221114
x86_64               randconfig-a001-20221114
x86_64               randconfig-a006-20221114
powerpc                     stx_gp3_defconfig
sh                           sh2007_defconfig
loongarch                        allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
arm                          pxa3xx_defconfig
m68k                       m5475evb_defconfig
sh                            hp6xx_defconfig
sparc64                             defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
parisc                generic-32bit_defconfig
sh                     magicpanelr2_defconfig
mips                           gcw0_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
i386                 randconfig-a015-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a016-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a014-20221114
s390                 randconfig-r044-20221114
riscv                randconfig-r042-20221114
hexagon              randconfig-r041-20221114
hexagon              randconfig-r045-20221114
x86_64               randconfig-a012-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a016-20221114
x86_64               randconfig-a014-20221114
x86_64               randconfig-a015-20221114
x86_64               randconfig-a011-20221114
hexagon              randconfig-r041-20221115
hexagon              randconfig-r045-20221115
arm                        magician_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
