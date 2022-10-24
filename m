Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D01FC38A2D
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Oct 2022 00:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbiJYAOi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Oct 2022 20:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbiJYAOP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Oct 2022 20:14:15 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1ADB72B43
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Oct 2022 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666650789; x=1698186789;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bN0+by+kF5QskMcuTNJuUMUib7w5vVBGDAax6rDhVqo=;
  b=k7WydenOmh0L8YpiGc5C2g6TdX7EewdWpV+tmSL6VFOr+PLh4llhCk14
   LtnhZnbzZcnPOJ48Haew/xQ8bs8eakBHbaD5fDjkIc3YL5OGV3xQtISkR
   lHlkcSgW8r5YaECx+mTE40P5PkAMqBOaUNWhTFt03cOIU1YA0gpz+68MF
   UxfSwDgMdrTfgZqjLrOtwtCNJjvLu6WYdfNrFLua4y86Q5Ej6ovdJ0ebE
   i3pQIC70enCDlyf81BXvXPAtexmXGCzKGNWq01qWcP5/iPY40B09vG1O6
   8Igu43JilvGOyTTlGqgeemyXBFEHPzHoGkTE4Ys/i/pSxR+/hmvaY8hXk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287256440"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="287256440"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 15:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="720640840"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="720640840"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Oct 2022 15:32:52 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1on603-0005hl-2b;
        Mon, 24 Oct 2022 22:32:51 +0000
Date:   Tue, 25 Oct 2022 06:32:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 fb4fd5e8604286d437907b6e9903741a5e76df65
Message-ID: <6357126c.rOT7VIn+d/Ny+D97%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: fb4fd5e8604286d437907b6e9903741a5e76df65  Merge tag 'v6.1-rc2'

elapsed time: 727m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                          rhel-8.3-func
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a011-20221024
sh                               allmodconfig
i386                 randconfig-a014-20221024
i386                 randconfig-a013-20221024
i386                 randconfig-a012-20221024
i386                 randconfig-a015-20221024
i386                 randconfig-a016-20221024
s390                             allmodconfig
s390                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                                defconfig
arm                                 defconfig
m68k                             allyesconfig
x86_64                              defconfig
s390                             allyesconfig
i386                             allyesconfig
x86_64                               rhel-8.3
arm                              allyesconfig
x86_64                           rhel-8.3-syz
x86_64               randconfig-a014-20221024
ia64                             allmodconfig
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
arc                  randconfig-r043-20221024
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
arm64                            allyesconfig
riscv                randconfig-r042-20221024
x86_64               randconfig-a016-20221024
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20221023
x86_64               randconfig-a011-20221024
x86_64               randconfig-a015-20221024
s390                 randconfig-r044-20221024

clang tested configs:
x86_64               randconfig-a001-20221024
x86_64               randconfig-a003-20221024
x86_64               randconfig-a002-20221024
i386                 randconfig-a004-20221024
i386                 randconfig-a001-20221024
i386                 randconfig-a002-20221024
i386                 randconfig-a005-20221024
x86_64               randconfig-a005-20221024
i386                 randconfig-a003-20221024
x86_64               randconfig-a006-20221024
hexagon              randconfig-r045-20221023
i386                 randconfig-a006-20221024
x86_64               randconfig-a004-20221024
hexagon              randconfig-r041-20221024
riscv                randconfig-r042-20221023
hexagon              randconfig-r045-20221024
s390                 randconfig-r044-20221023
hexagon              randconfig-r041-20221023

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
