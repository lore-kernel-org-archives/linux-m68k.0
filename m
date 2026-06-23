Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540B8395AE9
	for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Jun 2026 21:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782249526; cv=none; b=gSQ39P2AmiSe+qZw0jrc7QYTS1ui+BBzvvqdM1Z0mQqIW9dFX+OdETHUhEjJltgg3JVkRh9UIN3WIpMJl0BaNegLHm4ketKM+qaHBw7obQxE4H4owc5+YIO95oSJtOgEWKSm/+uAePTUlW1guMTN4jnx47vtMEn7iqk1zVHbHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782249526; c=relaxed/simple;
	bh=PXOMq887K9FXPyqsb4vi8gGbLEYnXMywB+78wZBK9dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8swN5pOdP9IY8yd8h8FV3TEEaJjHiEB67JYm3J1RDQsyP4AEUpGTDNMvIWCm8IwfBAD/0E8KxBxuIZfdMf6U9Xvt3Y5WU37Kxd54qsLwxvxS4bxhB49qh2zDNVlRN3JItINPTOnCV3uTgy2X8x4bvKxyNsifc2p+SFcgvTqjmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3LPt/ej; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3LPt/ej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782249524; x=1813785524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PXOMq887K9FXPyqsb4vi8gGbLEYnXMywB+78wZBK9dY=;
  b=W3LPt/ejLwv5D0uC+4Tfetl/hBdc0bOPFIMXsh4jZhladsl2gBd8SF7A
   eS+3DPC9jCMPOKSzxYOVVfdXtR2exhJQe1GYZBARkQIZVqbE+ixvwOT2n
   q8UET7WhIwIoDQ/X4d7fnSV+23oqT+gBtR3dY5ZalOTLO2+0rNYVws5C1
   U4bJDoValdhJmR7leUZJfo7t2pKuVNP33BojMgCJcL0TA50VSyGVLFbJf
   VCV16CjVhKj8nmAJ3tXnisIJXcNqRrRqq5Zur/rydnipOo7kVkWbIFtyy
   feC5L5vj5ocCXsYZHSwa7hPOzvptr+PZbO5PhETCRx3V1pRTHwWOOpQYK
   w==;
X-CSE-ConnectionGUID: Y1jrULJHSwuVG7nEqbw9Mg==
X-CSE-MsgGUID: FCpyJl64QrmrKbqS+8z5vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94121912"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="94121912"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 14:18:43 -0700
X-CSE-ConnectionGUID: NKkjQdtURQ+vCzlz1PrRGg==
X-CSE-MsgGUID: 1QLw5JC5RqmGz1M/tKJ1sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="247287657"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 14:18:40 -0700
Date: Wed, 24 Jun 2026 00:18:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/2] add mcf54415 DAC driver
Message-ID: <ajr4LvdPZKHrqDVp@ashevche-desk.local>
References: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 18, 2026 at 11:04:14PM +0200, Angelo Dureghello wrote:
> This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
> builtin DACs.
> 
> Currently the driver enables the raw write only. Feature as dma, sync, or
> format are not supoprted for this version.
> 
> Additional options suppoerted by the DAC module will be added to the driver
> later on, as needed.
> 
> The same patchset prepares the m68k/coldfire architecture to support
> the driver.
> 
> Below some basic tests done on stmark2 mcf54415-based board, voltage check
> on DAC0 and DAC1:
> 
> ~ # cd /sys/bus/iio/devices/iio:device0/
> /sys/bus/iio/devices/iio:device0 # ls
> name               out_voltage_scale  uevent
> out_voltage_raw    subsystem
> /sys/bus/iio/devices/iio:device0 # cat name
> mcf54415
> /sys/bus/iio/devices/iio:device0 # echo 4095 > out_voltage_raw 
> /sys/bus/iio/devices/iio:device0 # echo 2048 > out_voltage_raw 
> /sys/bus/iio/devices/iio:device0 # echo 4096 > out_voltage_raw 
> sh: write error: Invalid argument
> /sys/bus/iio/devices/iio:device0 # cat out_voltage_raw 
> 2048
> /sys/bus/iio/devices/iio:device0 # 
> 
> Same behavior for /sys/bus/iio/devices/iio:device1.
> 
> Generated a sine wave by shell script, sine shape is good.

Heard a presentation (Embedded Recipes IIRC) where one tried sine and real
sound (it was about sound DAC) was really awful. So, Can you try a bit more
sophisticated signal?

-- 
With Best Regards,
Andy Shevchenko


