Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135BBC433DB
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Feb 2021 18:06:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBDEE64EB8
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Feb 2021 18:06:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbhBRSG0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 18 Feb 2021 13:06:26 -0500
Received: from mga03.intel.com ([134.134.136.65]:24877 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231571AbhBRPRo (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 18 Feb 2021 10:17:44 -0500
IronPort-SDR: c0wsWLGcbm1cN5PG7rBAsOm7lanVe21pRJD3xz1VKbJcaqLtW4bruEOlbU/JETXhNuS60qHl4U
 5se0hA2j5j3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="183595665"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; 
   d="scan'208";a="183595665"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2021 07:15:52 -0800
IronPort-SDR: ySyCeo3hHhVVssiuUa+dRq9sIUiHvTQ7v6KnjniuxwRD5SNHv0Bk1sNKh61kvbmQF2g5rC7u+o
 ruQSlJ1pKQLw==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; 
   d="scan'208";a="419537155"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2021 07:15:47 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lCl1r-005yaq-Oq; Thu, 18 Feb 2021 17:15:43 +0200
Date:   Thu, 18 Feb 2021 17:15:43 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yury Norov <yury.norov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-arch@vger.kernel.org, linux-sh@vger.kernel.org,
        Alexey Klimov <aklimov@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, David Sterba <dsterba@suse.com>,
        Dennis Zhou <dennis@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jianpeng Ma <jianpeng.ma@intel.com>,
        Joe Perches <joe@perches.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rich Felker <dalias@libc.org>,
        Stefano Brivio <sbrivio@redhat.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH 08/14] lib/Kconfig: introduce FAST_PATH option
Message-ID: <YC6EnzFUXDuroy0+@smile.fi.intel.com>
References: <20210218040512.709186-1-yury.norov@gmail.com>
 <20210218040512.709186-9-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218040512.709186-9-yury.norov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Feb 17, 2021 at 08:05:06PM -0800, Yury Norov wrote:
> This series introduces fast paths for find_bit() routines. It is
> beneficial for typical systems, but those who limited in I-cache
> may be concerned about increasing the .text size of the Image.
> 
> To address this concern, one can disable FAST_PATH option in the config
> and some save memory.
> 
> The effect of this option on my arm64 next-20210217 build is:

(Maybe bloat-o-meter will give better view on this, i.e. more human-readable)

> Before:
> 	Sections:
> 	Idx Name          Size      VMA               LMA               File off  Algn
> 	  0 .head.text    00010000  ffff800010000000  ffff800010000000  00010000  2**16
> 			  CONTENTS, ALLOC, LOAD, READONLY, CODE
> 	  1 .text         0115e3a8  ffff800010010000  ffff800010010000  00020000  2**16
> 			  CONTENTS, ALLOC, LOAD, READONLY, CODE
> 	  2 .got.plt      00000018  ffff80001116e3a8  ffff80001116e3a8  0117e3a8  2**3
> 			  CONTENTS, ALLOC, LOAD, DATA
> 	  3 .rodata       007a72ca  ffff800011170000  ffff800011170000  01180000  2**12
> 			  CONTENTS, ALLOC, LOAD, DATA
> 	  ...
> 
> After:
> 	Sections:
> 	Idx Name          Size      VMA               LMA               File off  Algn
> 	  0 .head.text    00010000  ffff800010000000  ffff800010000000  00010000  2**16
> 			  CONTENTS, ALLOC, LOAD, READONLY, CODE
> 	  1 .text         011623a8  ffff800010010000  ffff800010010000  00020000  2**16
> 			  CONTENTS, ALLOC, LOAD, READONLY, CODE
> 	  2 .got.plt      00000018  ffff8000111723a8  ffff8000111723a8  011823a8  2**3
> 			  CONTENTS, ALLOC, LOAD, DATA
> 	  3 .rodata       007a772a  ffff800011180000  ffff800011180000  01190000  2**12
> 			  CONTENTS, ALLOC, LOAD, DATA
> 	  ...
> 
> Notice that this is the cumulive effect on already existing fast paths
> controlled by SMALL_CONST() together with ones added by this series.

...

> +config FAST_PATH

I think the name is to broad for this cases, perhaps BITS_FAST_PATH? or BITMAP?

> +	bool "Enable fast path code generation"
> +	default y
> +	help
> +	  This option enables fast path optimization with the cost of increasing
> +	  the text section.

-- 
With Best Regards,
Andy Shevchenko


