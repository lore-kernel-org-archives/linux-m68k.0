Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4512BC32773
	for <linux-m68k@archiver.kernel.org>; Tue, 16 Aug 2022 12:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234407AbiHPMMD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 16 Aug 2022 08:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234488AbiHPMLn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 16 Aug 2022 08:11:43 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B562D1E6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Aug 2022 05:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660651437; x=1692187437;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+13tkNWBYxlbH60QS9Fg1I468LLm4LMJYgYV0HTnbW0=;
  b=PUGXMdJNmPkXytc1p6HusZfMt6/e5VvC5HkxoXkQHTw31kAdV9oQbNGs
   63c4Gj1hI6MbAQegyyjLit5zwCA4JLJdTR7EY23mKOCiOP3iJ75V6BfwZ
   YqnBTsbwhK5uQcpsVW6c7ZSzs+3OLQ1+jJpD5eiyZ6tqSerwY/HrwNjb5
   wFG6IShk4DBwsL7yUh2Ni8gYtEkShaL3VI4ZhwrqMsR71KatRMSr0hhWq
   c9aCR8fyW2iM4KrilYiitY7Y+r3MmYA616fWdqRBZLYF5L3vPlPEuU2jP
   8AkbEl5eQg+ScmhRdV3Q8viF3f4EdXnXJt10XtTYW3OUTi8d48KXS+P35
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="275254005"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="275254005"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 05:03:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="667082622"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Aug 2022 05:03:54 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oNvIY-0001l7-03;
        Tue, 16 Aug 2022 12:03:54 +0000
Date:   Tue, 16 Aug 2022 20:02:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:pending-fixes] BUILD SUCCESS WITH WARNING
 ee556793d89d0e3c4bbee8c8ad8d66fc8b390a92
Message-ID: <62fb876f.TXisXDiHXgSsxZqv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
branch HEAD: ee556793d89d0e3c4bbee8c8ad8d66fc8b390a92  Merge branch 'for-linux-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc

Warning reports:

https://lore.kernel.org/linux-mm/202208110453.zEneXTnn-lkp@intel.com

Warning: (recently discovered and may have been fixed)

arch/m68k/include/asm/string.h:64:25: warning: '__builtin_memcmp' specified bound 6 exceeds source size 0 [-Wstringop-overread]
include/linux/fortify-string.h:44:33: warning: '__builtin_memcmp' specified bound 6 exceeds source size 0 [-Wstringop-overread]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- m68k-allmodconfig
|   `-- arch-m68k-include-asm-string.h:warning:__builtin_memcmp-specified-bound-exceeds-source-size
|-- m68k-allyesconfig
|   `-- arch-m68k-include-asm-string.h:warning:__builtin_memcmp-specified-bound-exceeds-source-size
`-- mips-allyesconfig
    `-- include-linux-fortify-string.h:warning:__builtin_memcmp-specified-bound-exceeds-source-size

elapsed time: 711m

configs tested: 54
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
powerpc                          allmodconfig
x86_64               randconfig-a001-20220815
arm                                 defconfig
mips                             allyesconfig
x86_64               randconfig-a003-20220815
powerpc                           allnoconfig
i386                 randconfig-a003-20220815
arm                              allyesconfig
x86_64                              defconfig
i386                 randconfig-a004-20220815
x86_64               randconfig-a005-20220815
sh                               allmodconfig
x86_64               randconfig-a004-20220815
i386                 randconfig-a006-20220815
i386                 randconfig-a005-20220815
arm64                            allyesconfig
arc                  randconfig-r043-20220815
i386                 randconfig-a002-20220815
x86_64               randconfig-a002-20220815
i386                 randconfig-a001-20220815
x86_64                               rhel-8.3
x86_64               randconfig-a006-20220815
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
ia64                             allmodconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig

clang tested configs:
hexagon              randconfig-r045-20220815
riscv                randconfig-r042-20220815
hexagon              randconfig-r041-20220815
s390                 randconfig-r044-20220815
i386                 randconfig-a012-20220815
x86_64               randconfig-a013-20220815
i386                 randconfig-a011-20220815
i386                 randconfig-a013-20220815
x86_64               randconfig-a012-20220815
i386                 randconfig-a015-20220815
x86_64               randconfig-a011-20220815
i386                 randconfig-a016-20220815
x86_64               randconfig-a015-20220815
i386                 randconfig-a014-20220815
x86_64               randconfig-a014-20220815
x86_64               randconfig-a016-20220815
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
