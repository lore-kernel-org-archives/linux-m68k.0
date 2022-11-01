Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED02C4332F
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Nov 2022 23:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiKAXhd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 1 Nov 2022 19:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiKAXhc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 1 Nov 2022 19:37:32 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509001C427
        for <linux-m68k@lists.linux-m68k.org>; Tue,  1 Nov 2022 16:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667345852; x=1698881852;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5H/NIQgMi55TwAySUn6dqhjdGZKNr5qRdbsntraw4qM=;
  b=egvh8O5uxQPIvKBOEKTQKnk5QrZj3r0UBuX/cVePFIYKHsTvy6E3xeKX
   4G2TCmVK8LkVIOwIK0vflHdrRlSJcLiCAPV4TI5qAMSXqxHabaYnbmNzV
   TRF9fJ8VxKgqr55KsB/FNvRvXKr3eiIOJLpSyd+9M1K4zNS4Z728UagCi
   OkgqlTza8OKK5ZOPvCczaMFDHsIhwzyR445TWNLHmHn//2ZagbvSddZz8
   RFLaSQwJNc627qF5bosQy513TlJTPb4pbNEk0nLfzroP0NJzfohGpoORN
   Ax3FCP6wPmEGnUMsgLN1TxiWfKZ8pt3falmq2fvDJBGqAuHcO+Zeqrqk3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="395578620"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="395578620"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 16:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="963306568"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="963306568"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 01 Nov 2022 16:37:30 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oq0oz-000EAc-1c;
        Tue, 01 Nov 2022 23:37:29 +0000
Date:   Wed, 02 Nov 2022 07:36:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 9e2f01811575957d7355b92b8c0644cb01ba657d
Message-ID: <6361ad84.MVFLAwUyz6cub/h/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 9e2f01811575957d7355b92b8c0644cb01ba657d  m68k: mac: Reword comment using double "in"

elapsed time: 722m

configs tested: 64
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-a014-20221031
i386                 randconfig-a011-20221031
i386                 randconfig-a012-20221031
i386                 randconfig-a013-20221031
i386                 randconfig-a015-20221031
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                          rhel-8.3-func
x86_64                        randconfig-a015
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
i386                 randconfig-a016-20221031
arc                  randconfig-r043-20221101
x86_64                           rhel-8.3-kvm
i386                                defconfig
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
mips                             allyesconfig
x86_64                               rhel-8.3
arc                              allyesconfig
x86_64                         rhel-8.3-kunit
powerpc                           allnoconfig
arm                                 defconfig
x86_64                           allyesconfig
i386                          randconfig-a001
powerpc                          allmodconfig
i386                          randconfig-a003
m68k                             allyesconfig
i386                          randconfig-a005
sh                               allmodconfig
m68k                             allmodconfig
ia64                             allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
arc                                 defconfig
i386                             allyesconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002

clang tested configs:
x86_64               randconfig-a004-20221031
x86_64               randconfig-a005-20221031
x86_64               randconfig-a003-20221031
x86_64               randconfig-a002-20221031
x86_64               randconfig-a001-20221031
x86_64               randconfig-a006-20221031
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221101
hexagon              randconfig-r045-20221101
s390                 randconfig-r044-20221101
riscv                randconfig-r042-20221101
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
