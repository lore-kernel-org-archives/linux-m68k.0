Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81913F44EF
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 12:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782476327; cv=none; b=a4dJdvAf0cj4dRoJLMRBh+Jb2Hk0SufjXrXN+O3ShWX3RBeqR5VSh+5OE16WFUqiOF89QfD9iv52ZfYGpAWA0uoRRP62aku/w3xUPu2q0ibzqnfrNmkAkCtZvM6UvXC6RZdtiF2Vl+mONzJfUJwhVfuYtIoctdnHjUxCCbZd1/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782476327; c=relaxed/simple;
	bh=GQdkiFYQJIel4Gg360i3/xZux3oAYTuuUHnkPqH4GqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTkJcXeGjDe5fAZYYNN/+cle23ICFMiI5WN8QN7rR6B+A56HmcsM4AmyGxGhTqpvQZpRPJa7b0IBUREqvpFUzNLCcs3Jgd7svw4kV3Ov0rlvoESTakCoTz9g66JX3zk0qPik5t4dw6pM5N8HjtNWvTjm278NviAR4AZmn476ihQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLU0C6zi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLU0C6zi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782476326; x=1814012326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GQdkiFYQJIel4Gg360i3/xZux3oAYTuuUHnkPqH4GqA=;
  b=jLU0C6zijklb4nFVoJxwe2j4aeeP5BF9jyZx88itnQVXJRv8xgon032t
   +UzVgmnAHlY4Swo5dX+2p+oUWnHIPA+S3udXXnzD0+mano1/Ly3r9wtCk
   uthK9kXK2Lx+HG8CL+Z8MC8H7JQMx2Jm80yUZMCdXYBYfJUNJMKE3mEj/
   rSvZVg9Rd8sDaCcqkDSTyEf5ehqdOrUgXYosxf58Ldl5oJ4EJimErmeAm
   Ehh43CYwnIZWlSb+48P74hRh/uyQrNXvJK1gre1qaec5xz8WHq7OCOoZm
   pQ5bR0kCS7YUfN6rMAKIUzO9/yOCef7EmIhH1hV3OweQmEXTmf1ZUConU
   w==;
X-CSE-ConnectionGUID: eVscWeoITaC+Oyimx1IbkQ==
X-CSE-MsgGUID: H4VfH+EbS5aBIWlJrImPoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83037503"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="83037503"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 05:18:44 -0700
X-CSE-ConnectionGUID: ili9L0J/Sr6VR/zo02vtpg==
X-CSE-MsgGUID: NKlMMr9hSSaFez4psVLROA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="251468981"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.1])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 05:18:42 -0700
Date: Fri, 26 Jun 2026 15:18:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-m68k <linux-m68k@lists.linux-m68k.org>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH 2/3] mtd: maps: remove uclinux map driver
Message-ID: <aj5uH-7WfM4BPXbc@ashevche-desk.local>
References: <20260526103227.3152003-1-arnd@kernel.org>
 <20260526103227.3152003-2-arnd@kernel.org>
 <b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
 <f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com>
 <5dd8cf26-533f-4a32-8885-3eaad7c57ed6@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dd8cf26-533f-4a32-8885-3eaad7c57ed6@linux-m68k.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 26, 2026 at 08:15:42AM +1000, Greg Ungerer wrote:
> On 26/6/26 00:10, Arnd Bergmann wrote:
> > On Thu, Jun 25, 2026, at 14:07, Greg Ungerer wrote:
> > > On 26/5/26 20:32, Arnd Bergmann wrote:

...

> > > No out of tree code is required. Most of the ColdFire defconfigs have
> > > CONFIG_MTD_UCLINUX enabled, since it is commonly used.
> > 
> > I see, this is surprising from reading the source and
> > git history, but I can see exactly how it got there.
> 
> The early, and probably more interesting history, predates git.
> It has always "just worked" on ColdFire platforms, so it really hasn't
> needed alot of change over the years for this use case.

If connect history.git and use `git replace`, one can get a history till
to the very begin of Linux kernel (yeah, some as tags and patch bombs, but...).

-- 
With Best Regards,
Andy Shevchenko


