Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D632E5B2A
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 May 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777969960; cv=none; b=qpTbS71ktOqUyYgxkwqzv/r9OSwG3kzyKdCUv3rVL/wCZbv2QBN2XOUvCw95DXi8fw5+DF3MIQvZHJLC1mUHXqoVgfHJxmOi6Grs3s4eRByCxx+5FzBNipELTuOr9wBx5r2R/IQz+vPWusyjEW51QI76VWQspV8zigH5O+LjSuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777969960; c=relaxed/simple;
	bh=lPBVBaJ1RuXmNHoSGWo5sczbzS6rH0e5GCDlSBKixvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTDrFUSoEmlWyBc4EnMjiwERQChfh9fwlJw5h4+1JAg1fZQ1BE0kXgsxEtSriAGg+f7WzHZao45YPYjOA1rJ8QT0+eJrai7P2lTK0LvvSJLlU/k+NZU94q1yFfDHt37Ri8J+d95jD9vNB6Mzkf9IPFdGls2NgI9QxeW6/cfXOHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ga8zLbG6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ga8zLbG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777969960; x=1809505960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lPBVBaJ1RuXmNHoSGWo5sczbzS6rH0e5GCDlSBKixvQ=;
  b=Ga8zLbG6MWEndYCxmHOuzRSvVwkldPlzOyuSynFmrEjgXRUxKvY5Hqd7
   zHyW1TqyvDxUv8dUj79GyXnMmAnbivqi5xX+QBWs+VqcKJGSg2T+bgbrb
   XEhBEdqhUW8FWMwauUa67szC8JVlAqPsz27QS5Aopgu6kTzE9EwbhTnet
   TP/LS/rc2c4DfUetEwg9xo9v3mw6LbP+KerPfnU+umh8cygyy6V9UhR0B
   0wnjEizomp8frUlxK5Fp4C++laYGQckRps89kWAyHYERckHJ1f5yuJsvs
   jIDACadqhRJg7eKeXb/GxC9J6wxBXUJv3gs0sLXOM6kg+aCdyUYOxXjeq
   w==;
X-CSE-ConnectionGUID: diWUrt+ySnafdvq75QrCQw==
X-CSE-MsgGUID: QEh5cuX/SUqLzFrKcuL64Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66362997"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="66362997"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:32:38 -0700
X-CSE-ConnectionGUID: DeJWMtcvSsOE7r+U9VuFsw==
X-CSE-MsgGUID: D5txDQIUSHOL8ZPb5COYyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="232613705"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:32:34 -0700
Date: Tue, 5 May 2026 11:32:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <angelo@kernel-space.org>
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
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	Angelo Dureghello <adureghello@baylibre.com>
Subject: Re: [PATCH 09/10] m68k: stmark2: enable DACs outputs
Message-ID: <afmrIFscjnn9yaxN@ashevche-desk.local>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-9-874c36a4910d@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-wip-stmark2-dac-v1-9-874c36a4910d@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, May 04, 2026 at 07:16:47PM +0200, Angelo Dureghello wrote:

> Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.

...

> +	uint16_t val;

Why not proper kernel type?

-- 
With Best Regards,
Andy Shevchenko


