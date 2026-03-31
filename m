Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872162989B7
	for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Mar 2026 09:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948418; cv=none; b=l8QRWyfbBO+ykMPDTxUOBQVbx2oZMeuJxfABjA3JkJ+SCYvn1jhVkVNvdYScICZ3rzxJZ2FKM+mDAD8VsgDqNiC9+7yXslF/0/i7o4FYijsMT1e/HlZjXqBhjHyqN7RTjdNqAL8g4nlZPj+PkyLVBVWDnIJbuZu96R2l76U7YjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948418; c=relaxed/simple;
	bh=lC63+3sUkuGmMIn3swC0ELAj/tSffr946dwqjdWyo+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isUqs7zHQ0AbyVWQ4V7uIhKgj85Dh0eF/0y4x34LT7OU2KDDGs0FMz9fNZsULvaali5apGg8GqV1nz1bzQ6Iwxzo0H//Qbl7GAAJNA/C4WKC+eHdZfixaFZjqgAUbkHVvcgdRRs1tWJfeNf3avA69qzaouO3HsPkKKG5gY941wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3SpUJpg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3SpUJpg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774948417; x=1806484417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lC63+3sUkuGmMIn3swC0ELAj/tSffr946dwqjdWyo+0=;
  b=c3SpUJpgozGrLoKfbKwRSYEraAEEC/DCh5N7AvYh5qDmkH+UyCp/LnEl
   HI1Gs58kcs2EaZnLfOYsg9D7Og/i3/0Wr+yIlFkaDDRXHwqWwF+URw9BJ
   U00js3o1dtU4KF4vk+yLr/7BWus+wBkVoJXNuKl1VSAsaLQwRzvnztWBb
   AR28Zrf7d6AsSKs1tE05apvbCng35H375Rjp8JSE6RSULVOMZimBiLGYs
   UmUzgfE0TLG0vC4QIFWliMI1860NBfdt0xLg1pnCJW4/KEzoYPcZFa6TD
   9Z5hjoDc5iWWtRy9BQBDxllYsxiMe2ZLsAbqgC96c83nLHfm4Uh3ZQfiY
   A==;
X-CSE-ConnectionGUID: XGuGXK3nRoiQtdgsjBKlDw==
X-CSE-MsgGUID: lrRwuCO6Q06GTY8OiSuScQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="93539564"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="93539564"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:13:36 -0700
X-CSE-ConnectionGUID: 0TII4xq6RO6GYZnwxFNAgA==
X-CSE-MsgGUID: u5KUgFyNTGiEUHocXIhMBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="231125849"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:13:34 -0700
Date: Tue, 31 Mar 2026 12:13:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Palmer <daniel@thingy.jp>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, sudipm.mukherjee@gmail.com,
	joerg@dorchain.net, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] parport: mfc3: Convert to a modern zorro driver
Message-ID: <acuQPP5TKLZyuiK6@ashevche-desk.local>
References: <20260227101643.473010-1-daniel@thingy.jp>
 <CAMuHMdU-A49FWv4g-RBRkz6DLM4sNOAtWus0zRq_hTZQNaN8FQ@mail.gmail.com>
 <CAFr9PXmF+311dNrFd-xmzyMuQoZV95DvZRTauoHHZCzR-5piFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXmF+311dNrFd-xmzyMuQoZV95DvZRTauoHHZCzR-5piFw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 31, 2026 at 06:09:12PM +0900, Daniel Palmer wrote:
> On Mon, 30 Mar 2026 at 19:02, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Thank you for the review. It seems like the parport maintainer isn't
> responding (Andy has some patches that haven't been reviewed or picked
> up[0] too).
> Is there a way to take this via the m68k tree because it only matters
> for m68k or something?
> 
> I have CC'd Linus, Greg K-H and Andy. After googling "LKML how to
> escalate unresponsive maintainer" and not finding much. If this is
> wrong, sorry for the spam. :)

Become a new maintainer!
But you can also send a patch changing MAINTAINERS database.

> 0 - https://lore.kernel.org/lkml/20260122090601.2380747-1-andriy.shevchenko@linux.intel.com/

-- 
With Best Regards,
Andy Shevchenko


