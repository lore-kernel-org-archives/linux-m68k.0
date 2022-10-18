Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4331FC433FE
	for <linux-m68k@archiver.kernel.org>; Tue, 18 Oct 2022 14:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbiJROVm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 18 Oct 2022 10:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbiJROVK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 18 Oct 2022 10:21:10 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9EC5D73F9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Oct 2022 07:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666102846; x=1697638846;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Y9dxeqHb0eKKco/WxjylE4hfic+uXL21dNPpPaOrQY8=;
  b=S9drzVE1Tk9JgnAbs6EMnUV70G+D4cKiSk0JaiePmSXM5ltEmxIENk/u
   Bk23sfJfeua3X0gCfezOHsWhc7OjnS29y0L8K5QcQ+CbAZQ8B1t4gizBU
   8Fcp3kcXET1rdD0lwL3boxEgOuuydw03MaaJMYLfP1Mcre/Cg5Uy9c9sw
   vV7j+XYD2uJ2Ifeh5E/jgVDS8WE5lOW7U/pLTI8VdkxkFcy+vXNJ1+Bzt
   or/IbJvF8CWCrk8BVx1z2fTAW2Ixewi8JtZVRR+a2WM7WFxB3GPaG41/O
   09RnJdP3UPldhRGMVipu+9T9QibUF8cTGvlHGtDdnfJ7JdAd/6YHECtuM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="392421432"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="392421432"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 07:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="771222694"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="771222694"
Received: from lkp-server01.sh.intel.com (HELO 8381f64adc98) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Oct 2022 07:20:42 -0700
Received: from kbuild by 8381f64adc98 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oknSU-0001ke-0n;
        Tue, 18 Oct 2022 14:20:42 +0000
Date:   Tue, 18 Oct 2022 22:20:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 4397b755b31b878449aa00da1afe8c127b189cf1
Message-ID: <634eb62d.RQDuij2cROq9Nbsa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 4397b755b31b878449aa00da1afe8c127b189cf1  Merge tag 'v6.1-rc1'

elapsed time: 1205m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
arc                  randconfig-r043-20221018
x86_64               randconfig-a002-20221017
s390                             allmodconfig
riscv                randconfig-r042-20221018
s390                                defconfig
s390                 randconfig-r044-20221018
x86_64               randconfig-a003-20221017
s390                             allyesconfig
x86_64               randconfig-a004-20221017
x86_64               randconfig-a001-20221017
x86_64               randconfig-a006-20221017
x86_64               randconfig-a005-20221017
i386                 randconfig-a001-20221017
i386                 randconfig-a002-20221017
i386                 randconfig-a003-20221017
i386                 randconfig-a004-20221017
i386                 randconfig-a006-20221017
powerpc                          allmodconfig
i386                 randconfig-a005-20221017
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                                defconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
i386                             allyesconfig
arm                                 defconfig
arc                  randconfig-r043-20221017
ia64                             allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221018
hexagon              randconfig-r045-20221018
i386                 randconfig-a011-20221017
i386                 randconfig-a013-20221017
i386                 randconfig-a012-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a016-20221017
i386                 randconfig-a015-20221017
x86_64               randconfig-a013-20221017
x86_64               randconfig-a012-20221017
x86_64               randconfig-a011-20221017
x86_64               randconfig-a014-20221017
x86_64               randconfig-a015-20221017
x86_64               randconfig-a016-20221017
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
