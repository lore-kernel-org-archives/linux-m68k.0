Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCBEC6FA82
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Sep 2022 03:07:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiIMDHu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Sep 2022 23:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbiIMDHs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Sep 2022 23:07:48 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C7D52FDE
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Sep 2022 20:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663038465; x=1694574465;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WnvsytuZxJ0zEdXfw2BNk2nyJAde1iboRl79UARiAC8=;
  b=mNJP3SKziOx+/aJhOJlqDt+cBYGohKmU8Kx7RdKcRc/a7g9+WRKV7RDK
   wfINObt8daUJSFtsK87G4fyK48Dxn1FhHAELWSmwFUS86mu7X09xeJfmX
   vgoBY2QJ5oC79aCdsOG66ZtBDePKN1LZM8OcHBE2tGEc36wktsWVDfMMD
   KrtWSQxDJu6YKLb9jTxN0vHAdfWQmmtWUYFJtGBmmvA1eyyiNUGGRMJ36
   WGLxCftzckpfzl2g7ulSPTHpYWT2AsjvDj6CFCz8+d5gphdSSJ6iZFj5A
   dV3h876BeEd6PdQQCRRjebjsmCV2ZJyACzN9Qg/c8Ec+Ul/cezdI/n/Rr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="298025738"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; 
   d="scan'208";a="298025738"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 20:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; 
   d="scan'208";a="567416436"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Sep 2022 20:07:42 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oXwH0-000398-0S;
        Tue, 13 Sep 2022 03:07:42 +0000
Date:   Tue, 13 Sep 2022 11:07:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 03117adc9731600da08ec84281d25c2003037979
Message-ID: <631ff3fc.YPdDB+6etmi4TpKM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 03117adc9731600da08ec84281d25c2003037979  Merge tag 'v6.0-rc5'

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
arc                              allyesconfig
powerpc                          allmodconfig
i386                                defconfig
alpha                            allyesconfig
mips                             allyesconfig
x86_64                           allyesconfig
arm                                 defconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                           rhel-8.3-kvm
i386                 randconfig-a001-20220912
x86_64                          rhel-8.3-func
i386                 randconfig-a002-20220912
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a001-20220912
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a003-20220912
riscv                randconfig-r042-20220911
x86_64                           rhel-8.3-syz
i386                 randconfig-a006-20220912
arc                  randconfig-r043-20220912
arm64                            allyesconfig
i386                 randconfig-a005-20220912
i386                 randconfig-a004-20220912
x86_64               randconfig-a004-20220912
i386                             allyesconfig
arm                              allyesconfig
x86_64               randconfig-a002-20220912
x86_64               randconfig-a005-20220912
x86_64               randconfig-a003-20220912
x86_64               randconfig-a006-20220912
arc                  randconfig-r043-20220911
s390                 randconfig-r044-20220911
ia64                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig

clang tested configs:
riscv                randconfig-r042-20220912
hexagon              randconfig-r041-20220912
i386                 randconfig-a013-20220912
hexagon              randconfig-r045-20220911
i386                 randconfig-a011-20220912
x86_64               randconfig-a011-20220912
x86_64               randconfig-a012-20220912
x86_64               randconfig-a013-20220912
i386                 randconfig-a012-20220912
x86_64               randconfig-a014-20220912
i386                 randconfig-a014-20220912
hexagon              randconfig-r041-20220911
i386                 randconfig-a015-20220912
x86_64               randconfig-a015-20220912
hexagon              randconfig-r045-20220912
i386                 randconfig-a016-20220912
x86_64               randconfig-a016-20220912
s390                 randconfig-r044-20220912

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
