Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BEBC54EBE
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Jan 2023 14:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbjAPO70 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Jan 2023 09:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbjAPO6k (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Jan 2023 09:58:40 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF4529E32
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Jan 2023 06:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673880535; x=1705416535;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IowLRTrmj1QCkTR6QZMUeM5tRZL+Vs0HrUWMp1qNfQY=;
  b=Y6dlzLB0fToOIQjJ0R95egiXQHfoSmHca5iZF3TCE+zp6VdGtkQqOtj5
   S0PW0Eg2UxNlkgabCIa7S8AgtUWYVYj7QXfSRGKLdn2NVIA3Akx+Z1u1U
   dtvplMqyHnJdBDY/IeXPe4GD25h8GLXpEccrEQk0EwAAKqihLRyhyVhpH
   6AIk/8/4DfR/8XvCYGtVBEBusnchfurOPYE9OmUaoWQrsxpIPwVvU+JOO
   EmsjSyvXho3hVo00tA6nqNfrh2LSZbLJAzVse9eiGkl2N8h14EUod/AJf
   BKoAvm2L24Ahhv8abxnyKWWwYwMUBOnYvK6UBjVG6Ls+MF/yIA8mmm6ac
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="304174814"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="304174814"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 06:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="801401181"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="801401181"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Jan 2023 06:48:33 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pHQmn-0000WT-0Q;
        Mon, 16 Jan 2023 14:48:33 +0000
Date:   Mon, 16 Jan 2023 22:48:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 c8a567e12e9205f360f5f33dbf94cef6ad184ca4
Message-ID: <63c563a7.yPkZsxrH/A5JqRer%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: c8a567e12e9205f360f5f33dbf94cef6ad184ca4  Merge tag 'v6.2-rc4'

elapsed time: 727m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
arc                                 defconfig
alpha                               defconfig
sh                               allmodconfig
alpha                            allyesconfig
arm                                 defconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
mips                             allyesconfig
i386                                defconfig
arc                  randconfig-r043-20230116
s390                 randconfig-r044-20230116
riscv                randconfig-r042-20230116
x86_64                           rhel-8.3-bpf
ia64                             allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arm                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
s390                                defconfig
s390                             allmodconfig
powerpc                          allmodconfig
s390                             allyesconfig
i386                 randconfig-a013-20230116
i386                 randconfig-a012-20230116
i386                             allyesconfig
i386                 randconfig-a011-20230116
i386                 randconfig-a014-20230116
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                 randconfig-a016-20230116
i386                 randconfig-a015-20230116
x86_64               randconfig-a011-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a012-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a016-20230116
x86_64               randconfig-a015-20230116
um                           x86_64_defconfig
um                             i386_defconfig

clang tested configs:
arm                  randconfig-r046-20230116
hexagon              randconfig-r045-20230116
x86_64               randconfig-a001-20230116
hexagon              randconfig-r041-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a002-20230116
x86_64                          rhel-8.3-rust
x86_64               randconfig-a004-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a006-20230116
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a006-20230116

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
