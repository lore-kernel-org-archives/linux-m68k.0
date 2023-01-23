Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4A4C05027
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Jan 2023 05:05:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjAWFFC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Jan 2023 00:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjAWFFB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 Jan 2023 00:05:01 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476FB16AC7
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Jan 2023 21:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674450300; x=1705986300;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=V11FFQLW7YLwstvg0giAISohbVQdBC+mQiU3pZiGR18=;
  b=daWmA/G+EVieQbRbpREMx590mlE1m4YnmNX2qO5g/1BOZXB9L307JGKP
   eSS/dZHXXdlqcfy0sPRbJO1nuofFOFfvuRlsD7DAlw+tAKNol40PuiakW
   DADi/GnhpwQDaxMNva+eHl7q2P1jVmg9V5bLnAPzF3o3M1aDC0M7dpTsZ
   6lZGaecmjjw4IZra+NbWlZsB3FnQeWsENfyWp0O+jvC0ZpkC413u4yRBI
   el0vCfNSZDmxOocfKyWBlqB4hiOcqy498uPyvOUXnqw0YsMoCL+u3HF6r
   XCFhgST+a8cc/ghClvoQMXCs5nk2CufgCTwC8VYw8830U8WwdQN+DKbZA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="309547795"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="309547795"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 21:04:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="693719946"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="693719946"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Jan 2023 21:04:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pJp0r-0005R6-06;
        Mon, 23 Jan 2023 05:04:57 +0000
Date:   Mon, 23 Jan 2023 13:04:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 1815a4712498bb21a0d17239cd68ee22c774c5d4
Message-ID: <63ce154c.epRV0ahI0ePqEV0v%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 1815a4712498bb21a0d17239cd68ee22c774c5d4  Merge tag 'v6.2-rc5'

elapsed time: 722m

configs tested: 86
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
alpha                               defconfig
arm                                 defconfig
x86_64                            allnoconfig
i386                                defconfig
arm                              allyesconfig
um                             i386_defconfig
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
x86_64                         rhel-8.3-kunit
um                           x86_64_defconfig
s390                             allmodconfig
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
s390                                defconfig
x86_64                           rhel-8.3-bpf
x86_64               randconfig-a002-20230123
mips                             allyesconfig
x86_64               randconfig-a005-20230123
ia64                             allmodconfig
powerpc                          allmodconfig
x86_64               randconfig-a001-20230123
alpha                            allyesconfig
x86_64               randconfig-a006-20230123
m68k                             allyesconfig
x86_64               randconfig-a004-20230123
i386                          randconfig-a014
x86_64               randconfig-a003-20230123
i386                          randconfig-a012
s390                             allyesconfig
x86_64                              defconfig
i386                 randconfig-a003-20230123
i386                 randconfig-a002-20230123
i386                          randconfig-a016
x86_64                               rhel-8.3
i386                 randconfig-a001-20230123
i386                 randconfig-a005-20230123
m68k                             allmodconfig
i386                 randconfig-a006-20230123
i386                             allyesconfig
sh                        sh7785lcr_defconfig
powerpc                      makalu_defconfig
i386                 randconfig-a004-20230123
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
powerpc                 canyonlands_defconfig
parisc                           alldefconfig
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
sh                           se7712_defconfig
arm                        shmobile_defconfig
sh                          rsk7264_defconfig
arm                        multi_v7_defconfig
arc                  randconfig-r043-20230123
i386                          randconfig-c001
riscv                randconfig-r042-20230122
arc                  randconfig-r043-20230122
arm                  randconfig-r046-20230123
s390                 randconfig-r044-20230122
csky                                defconfig
parisc                generic-64bit_defconfig
sh                   sh7770_generic_defconfig
powerpc                 linkstation_defconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
arm                         mv78xx0_defconfig
hexagon              randconfig-r041-20230123
x86_64                          rhel-8.3-rust
hexagon              randconfig-r045-20230122
hexagon              randconfig-r045-20230123
arm                  randconfig-r046-20230122
s390                 randconfig-r044-20230123
hexagon              randconfig-r041-20230122
riscv                randconfig-r042-20230123
arm                           omap1_defconfig
mips                      maltaaprp_defconfig
x86_64               randconfig-a011-20230123
x86_64               randconfig-a013-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a016-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a015-20230123
powerpc                      ppc44x_defconfig
powerpc                   bluestone_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
