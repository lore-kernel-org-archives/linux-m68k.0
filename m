Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D89C433B4
	for <linux-m68k@archiver.kernel.org>; Tue, 11 May 2021 07:29:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DDD061278
	for <linux-m68k@archiver.kernel.org>; Tue, 11 May 2021 07:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhEKHaK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 May 2021 03:30:10 -0400
Received: from mga06.intel.com ([134.134.136.31]:50778 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229637AbhEKHaJ (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 May 2021 03:30:09 -0400
IronPort-SDR: Lj6mwswLSu43Rd7u0HVGbhXmV0fjIGT3zhN6D2E0y5i52mjSZ8BQliv+y3rwyx1V/I1PS5mFOC
 uRnH/vj/+4cQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260640695"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="260640695"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 00:29:01 -0700
IronPort-SDR: C7OJU3FJBXjmJjf42PenthZldjvEx+Zg3fDBLwRehBrErTcGWOYpmfYxyezuSaufd/62hw6QOP
 TN732OV4sUpw==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="392204982"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 00:28:54 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lgMp0-00BNQ4-HI; Tue, 11 May 2021 10:28:50 +0300
Date:   Tue, 11 May 2021 10:28:50 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Yury Norov <yury.norov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux-SH <linux-sh@vger.kernel.org>,
        Alexey Klimov <aklimov@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, David Sterba <dsterba@suse.com>,
        Dennis Zhou <dennis@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jianpeng Ma <jianpeng.ma@intel.com>,
        Joe Perches <joe@perches.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rich Felker <dalias@libc.org>,
        Stefano Brivio <sbrivio@redhat.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH 11/12] tools: sync lib/find_bit implementation
Message-ID: <YJoyMrqRtB3GSAny@smile.fi.intel.com>
References: <20210401003153.97325-1-yury.norov@gmail.com>
 <20210401003153.97325-12-yury.norov@gmail.com>
 <1ac7bbc2-45d9-26ed-0b33-bf382b8d858b@I-love.SAKURA.ne.jp>
 <CAHp75Vea0Y_LfWC7LNDoDZqO4t+SVHV5HZMzErfyMPoBAjjk1g@mail.gmail.com>
 <YJm5Dpo+RspbAtye@rikard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJm5Dpo+RspbAtye@rikard>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, May 11, 2021 at 12:51:58AM +0200, Rikard Falkeborn wrote:
> On Mon, May 10, 2021 at 06:44:44PM +0300, Andy Shevchenko wrote:

...

> Does the following work for you? For simplicity, I copied__is_constexpr from
> include/linux/minmax.h (which isn't available in tools/). A proper patch
> would reuse __is_constexpr (possibly refactoring it to a separate
> header since bits.h including minmax.h for that only seems smelly)

I think we need to have it in something like compiler.h (top level). Under
'top level' I meant something with the function as of compiler.h but with
Linuxisms rather than compiler attributes or so.

Separate header for the (single) macro is too much...

> and fix
> bits.h in the kernel header as well, to keep the files in sync.

Right.

-- 
With Best Regards,
Andy Shevchenko


