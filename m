Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B73BC05027
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Feb 2023 02:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjBGCYm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Feb 2023 21:24:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBGCYl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Feb 2023 21:24:41 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF8133449
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Feb 2023 18:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675736680; x=1707272680;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=A/2vKRXyuXWflNhGzJFbQczMCa+CvnQ5u1HUWYgsNZw=;
  b=acqybeFsMelo1Hezlvo58B8FKAqAeFkK5ZcUkTTvpy8YjYVhFiC3R1/P
   w9PHjiTguuGj5zStysdo6m6UpWr7JlSmcYe5v3JAH5dTOZ91NMtLSB/Z1
   nRBum/lBVNSGPqijRMIJiUUrdzLOJ4co6TzuE6D/g1/+jlBpFRNdN3fu1
   f+N2Vwh5GEY6D0rAvHLibsO9F4ykfvDbjrmMMzP0v+mglc4+6VRu2kn7O
   p5S9hgA6or3johxubku9GUYXylFRjDvXjYXSnK8ZfYWPzjp4WauVGDgWh
   +Ua8ViYNxIwe5ekPeHRpNQEwisZHXT0YO2qtMF4ThUNvp5QoXsltFBU/U
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="391779138"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="391779138"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 18:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="840594574"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="840594574"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Feb 2023 18:22:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPDco-0002x4-2X;
        Tue, 07 Feb 2023 02:22:26 +0000
Date:   Tue, 07 Feb 2023 10:21:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 29f28f8b826d7684e6b05df0f5de38dfcceb77c4
Message-ID: <63e1b5ac.w078Fp2Y6lQjotTk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 29f28f8b826d7684e6b05df0f5de38dfcceb77c4  m68k: fix livelock in uaccess

elapsed time: 829m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
i386                 randconfig-a013-20230206
arm                                 defconfig
i386                 randconfig-a011-20230206
x86_64                           allyesconfig
i386                 randconfig-a014-20230206
i386                 randconfig-a012-20230206
sh                               allmodconfig
i386                 randconfig-a016-20230206
x86_64               randconfig-a013-20230206
i386                 randconfig-a015-20230206
x86_64               randconfig-a011-20230206
ia64                             allmodconfig
x86_64               randconfig-a012-20230206
arm                              allyesconfig
arm64                            allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
i386                          randconfig-a001
alpha                            allyesconfig
x86_64                           rhel-8.3-kvm
arc                                 defconfig
arc                              allyesconfig
x86_64               randconfig-a014-20230206
mips                             allyesconfig
s390                             allmodconfig
powerpc                          allmodconfig
alpha                               defconfig
x86_64                           rhel-8.3-bpf
x86_64               randconfig-a015-20230206
i386                          randconfig-a003
s390                                defconfig
x86_64               randconfig-a016-20230206
i386                          randconfig-a005
s390                 randconfig-r044-20230206
i386                                defconfig
arc                  randconfig-r043-20230205
arm                  randconfig-r046-20230205
arc                  randconfig-r043-20230206
riscv                randconfig-r042-20230206
s390                             allyesconfig
i386                             allyesconfig
m68k                             allmodconfig

clang tested configs:
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230205
riscv                randconfig-r042-20230205
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
arm                  randconfig-r046-20230206
s390                 randconfig-r044-20230205
hexagon              randconfig-r045-20230205
x86_64               randconfig-a001-20230206
x86_64               randconfig-a002-20230206
x86_64               randconfig-a004-20230206
x86_64               randconfig-a003-20230206
x86_64               randconfig-a005-20230206
x86_64               randconfig-a006-20230206

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
