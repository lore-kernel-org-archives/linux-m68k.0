Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14131C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 25 Jul 2022 21:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237339AbiGYV1a (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 25 Jul 2022 17:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237338AbiGYV1O (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 25 Jul 2022 17:27:14 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D590248EF
        for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Jul 2022 14:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658784430; x=1690320430;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gb6DRhVRDg1J0Tx6sRoB1pbO51tahyIzpH8o1gug+PA=;
  b=L7k+bokxwx6+LekAriCNs7nU2jUmYyAqrV4VtZ0p//1XtXxRnocm8wHG
   IVPvU+l6TevlelozX+SnPoUoyjgTiu7VI5TX6l1+VEd/STrS0/YRPSDWQ
   j1VQuoACnBKQz4E9J6MR7RdWRvEsp0slcbQzWnlqABJUnVkufJqkhfMEL
   hEeFCRlKuw7qJK6TPv0FQUzMVBysPK7ZdUriulHKWc/57ctIE92o+SqVn
   wi6TtD7npGdayXKTNu17ofXsa0tlq5C5/KVIyyEYoi/s5ortd3S3hfoPq
   fbqhgpiWOLDymXsT8F9jC9CZgHurJvm0EJOMP13iCsisjPwU8kSYun/o1
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="267569421"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="267569421"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 14:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="550143353"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Jul 2022 14:27:07 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oG5bW-0005ZQ-37;
        Mon, 25 Jul 2022 21:27:06 +0000
Date:   Tue, 26 Jul 2022 05:26:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 503e5c2d112afc7ba1293f9b2a2b0af413828b28
Message-ID: <62df0a94.WWhxNzj5FWh/oGuk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 503e5c2d112afc7ba1293f9b2a2b0af413828b28  Merge tag 'v5.19-rc8'

elapsed time: 726m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
sh                        sh7763rdp_defconfig
mips                     loongson1b_defconfig
powerpc                     ep8248e_defconfig
ia64                             allmodconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a005
i386                          randconfig-a003
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
s390                 randconfig-r044-20220724
arc                  randconfig-r043-20220724
riscv                randconfig-r042-20220724
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                         tb0287_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220724
hexagon              randconfig-r045-20220724

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
