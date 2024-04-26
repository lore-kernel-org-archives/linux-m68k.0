Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F341494B2
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145583; cv=none; b=LYg8dGa5SWAvqsfcWalW2XYfJDfzG+AfpPQYsGyR9YqFTdNHkGOKLRolFeZwHVwIOSz+YqMYryhOqfM0oPVHbsb397oNj8d/ryrnaMym0KsLiCj4QB5NO+7E6aLg4MG7LuX5umqeiS/pubhw+9wlNu2bc+Q/kyZ2XoBXxYiQP/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145583; c=relaxed/simple;
	bh=FdFyAy+Lc3AW17l4hjIe7vpeGF/fDdSgqBqn2A0oq+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8xa4HJEjKZnweTWtAh3mV/Ag0sQdPyTkF5VgjcM+2ivvlnClJp7ZGY85uO0Rg8iM4hmKTo7JHYiIt2liRwtB8wZXNcrxfLXJzeihq7kKs9bcfX/V5Y+fcSI4ErmhbTsi9uYqR2XTJL5XpFleWoWvuhxFIih/tZxPISP7PEzAUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U92YHaTe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U92YHaTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145582; x=1745681582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FdFyAy+Lc3AW17l4hjIe7vpeGF/fDdSgqBqn2A0oq+k=;
  b=U92YHaTeaxOcUoPHp4eeauuhVrrTwTdsM63KeUtoKX1kEsULZJ/fOW26
   voHfe+z0lRoIlWoMSNXCEVkICuq2xqt66BDdP0Y6CjwOOeikXgG1YSUT2
   gwTxHWLNNtGNDc/Q2Uefm+kKNwYGBpiV+BqJdZpO83i+L54byD7ImGAZc
   mvBrYOP+y/cez6KRjP5O1S5J2EuRyAXTaCZyXJ87Lp2YprxV0BGUUoewM
   vPREWHqqnsx4cyntpno8VBz78El2JjV0MjrN683BILz/s0PIrr+6wJtvZ
   nbILWVrBGozXlMSQ1z0rFE4YqpsJFqkyPNB5RyOkAEeMEVVkqlNS+dUzi
   A==;
X-CSE-ConnectionGUID: BuucjTTCRCy59KADuCyW4w==
X-CSE-MsgGUID: tV0el6q5QO29CwSpq0TcHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21033203"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="21033203"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:33:01 -0700
X-CSE-ConnectionGUID: 3d3eCfRrSqeiVTn64WbOxg==
X-CSE-MsgGUID: FguJ49pjTyGQzMbgFTvw1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="30103272"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:33:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s0NZJ-00000001MbR-3bgP;
	Fri, 26 Apr 2024 18:32:57 +0300
Date: Fri, 26 Apr 2024 18:32:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] zorro: Use helpers from ioport.h
Message-ID: <ZivJKZ8Pp_bfLcvO@smile.fi.intel.com>
References: <20230831121623.36293-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdVoDDV-VgPJL75u_t3KeAPhb1xEFX2VigVC3oS51pG6wA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVoDDV-VgPJL75u_t3KeAPhb1xEFX2VigVC3oS51pG6wA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 04, 2023 at 11:31:03AM +0200, Geert Uytterhoeven wrote:
> On Thu, Aug 31, 2023 at 2:16 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > We can use the DEFINE_RES_MEM_NAMED() macro and resource_contains() helper
> > instead of reimplementing them in the code. No functional change intended.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/zorro/zorro.c
> > +++ b/drivers/zorro/zorro.c
> > @@ -117,17 +117,13 @@ static struct resource __init *zorro_find_parent_resource(
> >         int i;
> >
> >         for (i = 0; i < bridge->num_resources; i++) {
> > -               struct resource *r = &bridge->resource[i];
> > -
> > -               if (zorro_resource_start(z) >= r->start &&
> > -                   zorro_resource_end(z) <= r->end)
> > -                       return r;
> > +               if (resource_contains(&bridge->resource[i], &z->resource)
> 
> Missing closing parenthesis. What happened to your cross-compiler?
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> i.e. will queue in the m68k for-v6.7 branch, with the above fixed.

Seems never got queued, should I send a v2 with the above fixed?

-- 
With Best Regards,
Andy Shevchenko


