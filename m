Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0337C1DC9B8;
	Mon,  6 Jan 2025 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.242.82.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736165189; cv=none; b=VZHYmAr+N/OtuEWMykEa+2qtYbbBuuKdJthiBpMrt3VBl264fBDhQvPsxDUXLzMnCE5/iLI9/uni3yrtiYcQEKhXqdNi131KWaT3St3s/gwPn2P1gwIYJ1SfUjSf5QvH3abMSulHTO0weQQ/1hmUT3A7KSUJqCprc9zU45RDUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736165189; c=relaxed/simple;
	bh=iJ8+j0jbHGpal1c3V0yHY7/aDlFw/fqX42G5Xbps/+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zw9/6M1WoPKKiQ6e0v13918/ZQpdfhwHOUusPsEcIxugWY2U19eh5EY4/lJ2HizOxPvrjr+GTY/ypM/gWzPMi+h14zbht6wt9OiD4fYmrbasPv9nMp8osiFe+SrqTPOQoAUHArfdU1nJDt0/f0uijSRIeCrGwvHmn6HrZaOsGdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allandria.com; spf=none smtp.mailfrom=allandria.com; arc=none smtp.client-ip=50.242.82.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allandria.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=allandria.com
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
	(envelope-from <flar@allandria.com>)
	id 1tUlQb-0000Hi-HI; Mon, 06 Jan 2025 03:37:49 -0800
Date: Mon, 6 Jan 2025 03:37:49 -0800
From: Brad Boyer <flar@allandria.com>
To: Greg Ungerer <gerg@kernel.org>
Cc: Daniel Palmer <daniel@0x0f.com>, geert@linux-m68k.org,
	fthain@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] m68k goes DT
Message-ID: <20250106113749.GA32654@allandria.com>
References: <20250105071433.3943289-1-daniel@0x0f.com>
 <c0428d69-2f18-45d3-8024-a9fe4170b23e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0428d69-2f18-45d3-8024-a9fe4170b23e@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)

On Mon, Jan 06, 2025 at 12:59:04AM +1000, Greg Ungerer wrote:
> On 5/1/25 17:14, Daniel Palmer wrote:
> >Short version:
> >I want to start converting m68k (including nommu) to use DT for booting
> >so I can add few cool boards I have (e.g. dual 040/060 VME board..).
> >I need ideas, help etc. Maybe if someone converted an m68k machine they
> >are using to DT alongside me this would have some hope of actually happening?
> 
> I have been thinking about this for a while for the ColdFire targets.
> In a few cases the drivers its uses are already devicetree enabled,
> since they are used on some of the NXP/Freescale ARM SoC devices.
> So this is interesting work to me.

The m68k mac platform is similar in this due to sharing some drivers
with ppc macs using Open Firmware. There are a few drivers where we
could eliminate complexity and #ifdef trickery if it was all
device tree based. For example, pmac_zilog.c relies on the data from
OF on a powermac but is getting platform data from the tables in
config.c on m68k. The code in via-cuda.c similarly looks up the
hardware info from OF on a powermac but has hard-coded data on m68k.

	Brad Boyer
	flar@allandria.com

