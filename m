Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E02DECAAA1
	for <linux-m68k@archiver.kernel.org>; Mon, 19 Sep 2022 21:33:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiISVdS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 19 Sep 2022 17:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiISVdR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 19 Sep 2022 17:33:17 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761FE4D4E3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Sep 2022 14:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663623196; x=1695159196;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oLGWvKd3FTPDGrVmb71PfioXT0i/8uTeRVQ0+lhqdIc=;
  b=Mmdy1VlDf/OB/yVCjD1c19T4DcvZv7p2H7TIzJCbg39Ncpei3j0Z2rH8
   YlJGlH7zG6NtyFxObhiqibmoGIpfkhfd5jGuIrIJtz3Eeks33TfJaprW+
   3Fm4jwVrUuQkAlNx/gIenhPbL5Z7hz5gMOVvVKXioOh7NzrJvLkoRDrVn
   LZ/iVXLTMHhXFhc2i/anjhe875q5bsBIgMloM+NGYkUaH+u0wwGlakAI2
   kBy8IaK3cX5Z1ZgQn/AvUVOt1jHTkLJKkK6thar/oMMR9MzaCznU1I9X4
   05P+hLqjvnD6wn0UWHgJejLW7eUkfyZSXwg4xipMF5FBUjbgY9ydSD07F
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="298254637"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="298254637"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 14:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="761039659"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Sep 2022 14:33:14 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oaOO9-0002Eh-2F;
        Mon, 19 Sep 2022 21:33:13 +0000
Date:   Tue, 20 Sep 2022 05:32:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.1] BUILD SUCCESS
 15f9042311b0ab9c2904d50428f304a6229d6a02
Message-ID: <6328dff9.3LgsNkDVX4gtor2N%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.1
branch HEAD: 15f9042311b0ab9c2904d50428f304a6229d6a02  m68k: defconfig: Update defconfigs for v6.0-rc2

elapsed time: 723m

configs tested: 93
configs skipped: 115

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allyesconfig
m68k                             allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
i386                                defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                 randconfig-a012-20220919
i386                 randconfig-a014-20220919
i386                 randconfig-a013-20220919
i386                 randconfig-a016-20220919
i386                 randconfig-a011-20220919
i386                 randconfig-a015-20220919
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
ia64                             allmodconfig
x86_64               randconfig-a015-20220919
x86_64               randconfig-a016-20220919
x86_64               randconfig-a012-20220919
x86_64               randconfig-a013-20220919
x86_64               randconfig-a014-20220919
x86_64               randconfig-a011-20220919
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
s390                 randconfig-r044-20220919
arc                  randconfig-r043-20220919
riscv                randconfig-r042-20220919
i386                 randconfig-c001-20220919
xtensa                  cadence_csp_defconfig
sh                        edosk7705_defconfig
sparc64                             defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 canyonlands_defconfig
loongarch                        allmodconfig
i386                             alldefconfig
arm                         s3c6400_defconfig
arm                         lpc18xx_defconfig
sh                          r7785rp_defconfig
powerpc                      chrp32_defconfig
powerpc              randconfig-c003-20220919
x86_64               randconfig-c001-20220919
arm                  randconfig-c002-20220919
sh                          sdk7786_defconfig
powerpc                   motionpro_defconfig
powerpc                     pq2fads_defconfig
powerpc                 linkstation_defconfig
sparc64                          alldefconfig
sh                        sh7757lcr_defconfig
sh                             shx3_defconfig
sh                          kfr2r09_defconfig
arm                          exynos_defconfig
powerpc                       holly_defconfig

clang tested configs:
powerpc                      walnut_defconfig
arm                    vt8500_v6_v7_defconfig
x86_64               randconfig-a004-20220919
x86_64               randconfig-a003-20220919
x86_64               randconfig-a002-20220919
x86_64               randconfig-a005-20220919
x86_64               randconfig-a006-20220919
x86_64               randconfig-a001-20220919
i386                 randconfig-a002-20220919
i386                 randconfig-a004-20220919
i386                 randconfig-a003-20220919
i386                 randconfig-a005-20220919
i386                 randconfig-a006-20220919
i386                 randconfig-a001-20220919
hexagon              randconfig-r045-20220919
hexagon              randconfig-r041-20220919
powerpc                          g5_defconfig
mips                        qi_lb60_defconfig
arm                         palmz72_defconfig
mips                     loongson1c_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
