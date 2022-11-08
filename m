Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5008AC4332F
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Nov 2022 01:07:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232991AbiKHBHc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Nov 2022 20:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232880AbiKHBHb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Nov 2022 20:07:31 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44353248CD
        for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Nov 2022 17:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667869651; x=1699405651;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mmrhYcTmTR1lKXtSrIdGnAw2X6qLkGFhMFTQn7sjIME=;
  b=ODPsm5rZJg7DQSbI4u2zWj2lFAK5n5jor27uUm2kOOG6zDki3KfRkOGh
   GWzLYskr7AUHURu/Jx1ZHtponosHrsrMPuKuOTAG4iLT8yAPn07ni/XsB
   3L+tu292ATXXwoTJEuTkntpYaTNGT+qUrgqsC19LXnZml4hXeL2NcX2lT
   HNTzgq+3oRakKJIlDpjoSgyan5l23gWOrFvo6N3VkzthUoqko1AHslbVW
   fWQ8q00PdSj8iTm/AcXsXPtlg7hQqJ++Lh5tEEt8FD0OPav2wgdEWWNCn
   Ky3ZuhkV6s2EB5/xjsOPX0tFJx+xH3sUDeNnFzzsUZZUIY5ZBh/7hV5BO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="396864766"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="396864766"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 17:07:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="587182324"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="587182324"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 17:07:28 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1osD5L-0001Mu-34;
        Tue, 08 Nov 2022 01:07:27 +0000
Date:   Tue, 08 Nov 2022 09:06:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 7cc2f04d1076c927f9a06b2e1ab641c3815e8d34
Message-ID: <6369ab97.pf7agEuPgR2ZcvQ5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 7cc2f04d1076c927f9a06b2e1ab641c3815e8d34  Merge tag 'v6.1-rc4'

elapsed time: 726m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                                 defconfig
s390                                defconfig
s390                             allmodconfig
alpha                               defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
x86_64                              defconfig
x86_64                           allyesconfig
arc                  randconfig-r043-20221107
ia64                             allmodconfig
i386                 randconfig-a002-20221107
i386                 randconfig-a003-20221107
i386                 randconfig-a001-20221107
i386                                defconfig
i386                 randconfig-a005-20221107
i386                 randconfig-a004-20221107
i386                 randconfig-a006-20221107
i386                             allyesconfig
x86_64               randconfig-a005-20221107
x86_64               randconfig-a001-20221107
x86_64               randconfig-a003-20221107
x86_64               randconfig-a002-20221107
x86_64               randconfig-a004-20221107
i386                          randconfig-a014
x86_64               randconfig-a006-20221107
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221107
x86_64               randconfig-a014-20221107
x86_64               randconfig-a011-20221107
x86_64               randconfig-a013-20221107
x86_64               randconfig-a012-20221107
x86_64               randconfig-a015-20221107
x86_64               randconfig-a016-20221107
s390                 randconfig-r044-20221107
riscv                randconfig-r042-20221107
hexagon              randconfig-r045-20221107
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
