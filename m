Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CA5C433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Jun 2022 13:46:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiFJNqt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 10 Jun 2022 09:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235991AbiFJNqh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 10 Jun 2022 09:46:37 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C254322B35
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jun 2022 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654868796; x=1686404796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ravTgUnKG4C+bKIq95tFE0q0c60bszYzURjmYJ4owCY=;
  b=aXFFy4KaTV9n2ELpb/WSVwadfOu9wW+go8zNzDnnSqJSaA37cY7grOpT
   AO0MHolpp3fsjZ0CO+CdnmmKi3MoII04/5WBRch10dzzvDqG+Urqf7fwZ
   8n7Rf7gv3ZhL/346Gr6AvnRCSF+Jn7gaoUGInuDTCdP+Q5xGh/rQrR0u7
   XlWidW0F/0rK4N6RiFHnpilwllAuwtl/uTUtO4V4lkUbEgTOxyfdz+vK0
   TzqzRitLXKi9cVdYIvsmpYDx5Ay2ohbag2DXpKzB4SpgpOZfQFKH+T/Hj
   Hjp/NNYt2XyY2t4nYCRpg4BluQ8FX8J/dIyeZeXABccuKfNmoRy1aSBsb
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="341693412"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="341693412"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 06:46:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="649839598"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 06:46:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nzexy-000YpF-0z;
        Fri, 10 Jun 2022 16:46:22 +0300
Date:   Fri, 10 Jun 2022 16:46:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Alexander Lobakin <alexandr.lobakin@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-alpha@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/6] ia64, processor: fix -Wincompatible-pointer-types
 in ia64_get_irr()
Message-ID: <YqNLLTAY0t62Jxq4@smile.fi.intel.com>
References: <20220610113427.908751-1-alexandr.lobakin@intel.com>
 <20220610113427.908751-2-alexandr.lobakin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610113427.908751-2-alexandr.lobakin@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jun 10, 2022 at 01:34:22PM +0200, Alexander Lobakin wrote:
> test_bit(), as any other bitmap op, takes `unsigned long *` as a
> second argument (pointer to the actual bitmap), as any bitmap
> itself is an array of unsigned longs. However, the ia64_get_irr()
> code passes a ref to `u64` as a second argument.
> This works with the ia64 bitops implementation due to that they
> have `void *` as the second argument and then cast it later on.
> This works with the bitmap API itself due to that `unsigned long`
> has the same size on ia64 as `u64` (`unsigned long long`), but
> from the compiler PoV those two are different.
> Define @irr as `unsigned long` to fix that. That implies no
> functional changes. Has been hidden for 16 years!

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: a58786917ce2 ("[IA64] avoid broken SAL_CACHE_FLUSH implementations")
> Cc: stable@vger.kernel.org # 2.6.16+
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> ---
>  arch/ia64/include/asm/processor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/ia64/include/asm/processor.h b/arch/ia64/include/asm/processor.h
> index 7cbce290f4e5..757c2f6d8d4b 100644
> --- a/arch/ia64/include/asm/processor.h
> +++ b/arch/ia64/include/asm/processor.h
> @@ -538,7 +538,7 @@ ia64_get_irr(unsigned int vector)
>  {
>  	unsigned int reg = vector / 64;
>  	unsigned int bit = vector % 64;
> -	u64 irr;
> +	unsigned long irr;
>  
>  	switch (reg) {
>  	case 0: irr = ia64_getreg(_IA64_REG_CR_IRR0); break;
> -- 
> 2.36.1
> 

-- 
With Best Regards,
Andy Shevchenko


