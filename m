Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC74A26980F
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 May 2026 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777969908; cv=none; b=PbFkVGcHsWafQnKSlwh+eTiqPIPlgLVu66Q2Png0ixoouL3YihEDc2vAgeGji/DFptLNlY8rxoCsjw0gEufZwEs66jw7NKMQBcoGEoBnMtA5zX49U7rHGWtNAhinCkZ+k0tLJZHYmp3AyZqjaHrsbGfYz9uR10B3phXRz59FGLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777969908; c=relaxed/simple;
	bh=hwDIJ7pMtHCCustNvs0AAaepY8/PftFzyLYey8zGy4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7D4OtWlSaYEyBiRU/L42kNTOA1VxSx/DwGZ1ebGCDR6C0j4zOZTreDB6LVBU925+FfxqaEMm7Te+y4g7EuCQaD/vK9crPQD1lotAE42Y/fE3W2PyGWCczcI8N0zaqP/y98jHXU9RFGNFboFntYNYA6d7RsqQX+x+Py4WUjsCsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Abur1n2K; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Abur1n2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777969907; x=1809505907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hwDIJ7pMtHCCustNvs0AAaepY8/PftFzyLYey8zGy4c=;
  b=Abur1n2K7pL8BqFs2Ca8hvZqqu1GKFCrDCHGf1iad+/gnTFFIqWyhQc8
   ZMEM/e7CVRF2CKCHsp7RbkkqD6724q9h/v3cU75gp20cLGrLS1ah7w+lv
   7i6T22j/sv08HJyloQAtZsu6tFhU2BcsZ075dQamtZP1kLAplL59iMUdG
   8/dtyLP+Ez4YpGNRdhR162TRsimkTGgbRpR0ebqrHjDQf9FiQpI/ZFqes
   2nJBlk72fPwVS18IKmePSiX1Fc5V+rXAiJzsUWEYkr5ELP92aCcPxS5Hq
   xv0Siw1lQtbADROSoALkTbS2cub4QJlz9IMq7QhtkoRuNxmnni3giRjz3
   w==;
X-CSE-ConnectionGUID: gmhenF18TSqbJndWlulMtw==
X-CSE-MsgGUID: 7FuGctPkSIqb0dYQ0CsWjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78933489"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78933489"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:31:45 -0700
X-CSE-ConnectionGUID: tuc2W5dZQyOeHu5cjmszog==
X-CSE-MsgGUID: S21AuqnmTmuWUCuhw4jPkA==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:31:41 -0700
Date: Tue, 5 May 2026 11:31:39 +0300
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
Subject: Re: [PATCH 08/10] m68k: stmark2: add mcf5441x DAC platform devices
Message-ID: <afmq6-AfomfKtX7c@ashevche-desk.local>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, May 04, 2026 at 07:16:46PM +0200, Angelo Dureghello wrote:

> Add mcf5441x DAC platform devices.

...

> +static struct resource dspi_dac0_resource[] = {
> +	[0] = {
> +		.start = MCFDAC_BASE0,
> +		.end   = MCFDAC_BASE0 + 0xFF,
> +		.flags = IORESOURCE_MEM,
> +	},
> +};

ioport.h has a lot of DEFINE_RES() macros. Please, choose the best fit in each
case and use them.

-- 
With Best Regards,
Andy Shevchenko


