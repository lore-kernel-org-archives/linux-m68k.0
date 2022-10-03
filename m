Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B2AC433FE
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Oct 2022 23:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbiJCXzQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Oct 2022 19:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiJCXzO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 3 Oct 2022 19:55:14 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7873F1C12C
        for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Oct 2022 16:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664841313; x=1696377313;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=786n8V7hHpmnpB37xembt94czcO0VCsn/PVUqGByEwg=;
  b=TUnNkt5XJkX0CPWBko5ndBMxpsFlOKS4T+jPxoYm9rARXE9/tPKYQVvb
   xNusEgusBdLZA68OaB8/Vx9DMxA9hnJanJAv3jKcLdvPpAoQLq0pfvDg8
   MmgWY8nVOtbde37ZUdTljVMtHdURQkNJr0KzWfGdpTpjGbleJdVgbmlNT
   Xue2OKc9hwAhes8BRm08DoHt90COL1qtsrERhLEae5+Rg47gG7SYeGech
   o+ZRN5JGVoV4spteRnpvT82h0DEMJipo8yGdY4AIjmDvU/L6JtaWFmeCm
   I/2hmwl15TdHrTPYGvyVRX+ku+OBRRiCQzJN3CjkVGw7Q1TND6/olciIb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="389079759"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="389079759"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 16:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="574839159"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="574839159"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Oct 2022 16:55:07 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ofVH8-00053b-2j;
        Mon, 03 Oct 2022 23:55:06 +0000
Date:   Tue, 04 Oct 2022 07:54:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 180671f0f5e2b6e27de37291dffe99f5798a82fb
Message-ID: <633b7640.lxMdvh3ORKXtN+l7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 180671f0f5e2b6e27de37291dffe99f5798a82fb  Merge tag 'v6.0'

elapsed time: 727m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                              defconfig
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                               rhel-8.3
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                           allyesconfig
arc                                 defconfig
i386                                defconfig
sh                               allmodconfig
s390                             allmodconfig
arm                                 defconfig
alpha                               defconfig
x86_64               randconfig-a011-20221003
m68k                             allmodconfig
i386                 randconfig-a015-20221003
i386                 randconfig-a014-20221003
x86_64               randconfig-a014-20221003
i386                 randconfig-a011-20221003
s390                                defconfig
x86_64               randconfig-a012-20221003
i386                 randconfig-a012-20221003
x86_64               randconfig-a013-20221003
arc                              allyesconfig
i386                 randconfig-a013-20221003
i386                 randconfig-a016-20221003
x86_64               randconfig-a016-20221003
alpha                            allyesconfig
s390                             allyesconfig
x86_64               randconfig-a015-20221003
m68k                             allyesconfig
arm                              allyesconfig
i386                             allyesconfig
arm64                            allyesconfig
riscv                randconfig-r042-20221003
arc                  randconfig-r043-20221003
arc                  randconfig-r043-20221002
s390                 randconfig-r044-20221003
ia64                             allmodconfig

clang tested configs:
i386                 randconfig-a004-20221003
hexagon              randconfig-r041-20221003
riscv                randconfig-r042-20221002
i386                 randconfig-a005-20221003
hexagon              randconfig-r041-20221002
i386                 randconfig-a003-20221003
s390                 randconfig-r044-20221002
i386                 randconfig-a002-20221003
i386                 randconfig-a001-20221003
i386                 randconfig-a006-20221003
hexagon              randconfig-r045-20221002
hexagon              randconfig-r045-20221003
x86_64               randconfig-a003-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
x86_64               randconfig-a005-20221003
x86_64               randconfig-a006-20221003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
