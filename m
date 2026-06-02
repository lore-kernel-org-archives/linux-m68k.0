Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A745D3BD63A
	for <linux-m68k@lists.linux-m68k.org>; Tue,  2 Jun 2026 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392452; cv=none; b=LzYCXMYPACMLF2a+31elC7Cq/+jUFsDb7DOXeQavowBZdiMO7C37rXMsDd6Ahuf5gHNkmr/J2hCCRfkDUk783DMuqCVnHUNyq2PgXYLV8NckokyPwKUUeDs95AHc0/EF5PhJVDSjAt06Hc0aTiXmCWAcDnHJCWVEGu5IshbeQ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392452; c=relaxed/simple;
	bh=ItblxYpNb+2Ay97S4QWuJOOupifreuKenS9xKDaH38Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7SJoBbJIsxHjQRMhNDICa7rDs+Q7XN+yl7HGSJ10+1+9bfaHjyL7Xb5WTVSLVKgSRaef7M/1UqcpfZuK8eHEjLyZAJiSZts9+4DURZKkkZ/ZcJY1RGnP4HHh/QOII/i/Wnm+NiYLbcVorWwWU3N6284qVo2piiJHPL45agRiPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I7Qq0PIp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I7Qq0PIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780392452; x=1811928452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ItblxYpNb+2Ay97S4QWuJOOupifreuKenS9xKDaH38Q=;
  b=I7Qq0PIprKsX460df0GaMUY4tE/9iHYYZENL/BMlW3DskozOBsdtz6RK
   EziX1HrD/4a3ha9g8YaonGZSOEVdxoV0G+c2fEq75cLNLUi0+pCI3QnPU
   xZ7W8sxAkW7LEsobptSsf46M/p+tXQD5TIAx1tj6iKMXqd6uN0CkGRHSD
   sxYaNyJESwbSF+JD248cmTjMkV9TVhb0tcK/7kJa1O2h2qBdEFgnRzY/i
   hFXkWrl+vBmI0+lfbS0Rg5mmt8vMgl98+X7hBPGZ7dzyMzx0EjCQbzrT9
   kUAPiOsi0mzhY7Nl/Kh1Xw+PNGJdHuhNwWQauVl3Y/kymC/gN27hNw+Nr
   Q==;
X-CSE-ConnectionGUID: hS1zuCzfRSebzlokUH2GWQ==
X-CSE-MsgGUID: ppFkyxZWQnm88kjUnZD03w==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81072423"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81072423"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:27:31 -0700
X-CSE-ConnectionGUID: LFPp70urSQm5UUL05sBrfA==
X-CSE-MsgGUID: 6O4Zj6lvSPe1U7nQPoyqcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="239414468"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:27:27 -0700
Date: Tue, 2 Jun 2026 12:27:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v4 09/11] m68k: stmark2: add mcf5441x DAC platform devices
Message-ID: <ah6h_XW2wvgEYXKd@ashevche-desk.local>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
 <20260531-wip-stmark2-dac-v4-9-7e65ab4215dd@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531-wip-stmark2-dac-v4-9-7e65ab4215dd@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, May 31, 2026 at 05:26:02PM +0200, Angelo Dureghello wrote:

> Add mcf5441x DAC platform devices.

...

> --- a/arch/m68k/coldfire/stmark2.c
> +++ b/arch/m68k/coldfire/stmark2.c
> @@ -8,6 +8,7 @@
>   * for more details.
>   */
>  
> +#include <linux/ioport.h>

If I'm not mistaken this part has to be done in the previous patch?

-- 
With Best Regards,
Andy Shevchenko


