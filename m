Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77E2C4332F
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Dec 2022 05:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbiLMFbI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Dec 2022 00:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbiLMFbH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Dec 2022 00:31:07 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F33E120BF
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Dec 2022 21:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670909462; x=1702445462;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NroyejHTWtu2m6NQJXMA7nbzzQN0K4f/6Hha7KwaKpM=;
  b=ZHIw3wzteRWH+v8Hu8K8nB0rjZDu9PjqeX9aUPioQ6jfHGxMep4QEUOa
   QojMWQ7kiVS3rjX7kTiAOto16dvegMKUxlgPz2X/gOnyUKvxv0IBWnA06
   TAYx+NvxuoldTITp2y+JkZTlAAW/Z1RdRt7sDHR6spb1G1RtjX65oIM9r
   Mx60fpYoHH8hppjjcOIGJNSIXCuP2NLGV0pV/5utxAOPy0owEq26OP26j
   8z1DWjVi3vFWXJo7WAxtgjyk3SKzfD29wOYdYDE1tSPt4HfrJxBvCKQ2T
   mKCThf+gUnTzz+WleiD1kikMboxkHPEJxTYnxENDxh4/5D4s+nE60/Qzk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="301460637"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="301460637"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 21:31:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="755246491"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="755246491"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2022 21:30:59 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p4xsY-00047P-38;
        Tue, 13 Dec 2022 05:30:58 +0000
Date:   Tue, 13 Dec 2022 13:30:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 53a4892af05f72e14e935234e8fbf34fa7e04521
Message-ID: <63980e06.NaU5vnwYp85xXbwj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 53a4892af05f72e14e935234e8fbf34fa7e04521  Merge tag 'v6.1'

elapsed time: 723m

configs tested: 69
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                 randconfig-a013-20221212
s390                                defconfig
i386                 randconfig-a014-20221212
i386                 randconfig-a012-20221212
i386                 randconfig-a011-20221212
sh                               allmodconfig
i386                 randconfig-a015-20221212
i386                 randconfig-a016-20221212
x86_64                              defconfig
x86_64                          rhel-8.3-rust
s390                             allyesconfig
mips                             allyesconfig
x86_64                          rhel-8.3-func
i386                                defconfig
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64               randconfig-a011-20221212
x86_64                               rhel-8.3
x86_64               randconfig-a012-20221212
arm                                 defconfig
x86_64               randconfig-a014-20221212
ia64                             allmodconfig
x86_64               randconfig-a013-20221212
x86_64               randconfig-a015-20221212
x86_64                           rhel-8.3-bpf
x86_64               randconfig-a016-20221212
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
riscv                randconfig-r042-20221212
arc                  randconfig-r043-20221211
arc                  randconfig-r043-20221212
arm                  randconfig-r046-20221211
s390                 randconfig-r044-20221212
x86_64                            allnoconfig
i386                          randconfig-c001

clang tested configs:
i386                 randconfig-a002-20221212
i386                 randconfig-a003-20221212
i386                 randconfig-a001-20221212
x86_64               randconfig-a002-20221212
i386                 randconfig-a004-20221212
x86_64               randconfig-a001-20221212
i386                 randconfig-a006-20221212
i386                 randconfig-a005-20221212
x86_64               randconfig-a003-20221212
x86_64               randconfig-a006-20221212
x86_64               randconfig-a005-20221212
x86_64               randconfig-a004-20221212
arm                  randconfig-r046-20221212
riscv                randconfig-r042-20221211
hexagon              randconfig-r045-20221211
hexagon              randconfig-r041-20221211
hexagon              randconfig-r045-20221212
s390                 randconfig-r044-20221211
hexagon              randconfig-r041-20221212

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
