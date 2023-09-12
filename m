Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1582FCA0EC3
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Sep 2023 07:14:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjILHOQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 12 Sep 2023 03:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbjILHOP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 12 Sep 2023 03:14:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7918E10C4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Sep 2023 00:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694502850; x=1726038850;
  h=date:from:to:cc:subject:message-id;
  bh=OqxFnhSa/90U5YUpICRxS9Ky0BsK6PS+tKdV7gMc9aw=;
  b=BuB1YGolr5UmTb5WZaCUPNU7iL+WAbXT3B5pa6U7cJ4DgiBqzC+Wcb54
   WDHojcmGYRNkzleyCscZ2/TfsoaQ3LWe5Z2O9rjt7ccJnX2vcydzQvr4o
   k4At1ss6yUxCoeP9b4kBxwzFbtFvT+8HiZNYHmPJWI/MEdT1zBzAe96cw
   udoGNwfNYRQUrYLyPWpI79niLxbKe1f6NsnkRxctpc09o2y6LtXqZhhZ4
   a08eT8Z0YnmBAhsFCVljLaa4ZH2ZviZxKxDuTH8G/N9Y4IWF5BmGvAEWU
   iXxEaJG/4oxs6+bFq37OWxVXb4Zjkrzlkc+b+N3WqT6LssU9xN1DvdRWO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="382112555"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="382112555"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 00:14:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="1074456459"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="1074456459"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Sep 2023 00:14:09 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qfxb0-00004U-2x;
        Tue, 12 Sep 2023 07:14:04 +0000
Date:   Tue, 12 Sep 2023 15:13:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.6] BUILD SUCCESS
 87856ef9ef8955f459fb691faca921c0a688bc80
Message-ID: <202309121504.TBO6ibJa-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.6
branch HEAD: 87856ef9ef8955f459fb691faca921c0a688bc80  m68k: sun3/3x: Add and use "sun3.h"

elapsed time: 972m

configs tested: 4
configs skipped: 179

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
