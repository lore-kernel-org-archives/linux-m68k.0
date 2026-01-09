Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB69221282
	for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jan 2026 01:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.242.82.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767921492; cv=none; b=q9kkZwV94cAPO6+ujvXGgRRVy054p7gx/tIN2Nmf4dwGgpdSqGqgZsmEB69NQtwCYLvLmyZ2uNmAyPUPp7iOQu5MfH8uP4TqWNicV5dXD477j/3OX8CucLPfcxx/jGNnV5MgihLuXcJ2Uw0NV16v8nnk0mqQhzmTDleqo7M2ccY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767921492; c=relaxed/simple;
	bh=Yjwu69m5k9dCpDgS2pP/soy5dRhiF2QH3GR2w6TutyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXeVf0zfUfTc600bwZ6Nt6ap/r5QaLsAcoD14U+7g8ZxvU719j6pFjnu7YSklw+hosyBvt6UexTHj8Tj2H8NpGiiDTD5ypqHcOIa3oPSHw7V/wCPlyI8DTj6SooDfgpHvFJL+P00n1I6xtubrCit/pcpN624UaX0gB1lIDe4aCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pants.nu; spf=none smtp.mailfrom=allandria.com; arc=none smtp.client-ip=50.242.82.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pants.nu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=allandria.com
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
	(envelope-from <flar@allandria.com>)
	id 1ve0hN-0007DL-1s; Thu, 08 Jan 2026 16:49:53 -0800
Date: Thu, 8 Jan 2026 16:49:53 -0800
From: Brad Boyer <flar@pants.nu>
To: Stefan <stefan.reinauer@coreboot.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH 3/5] m68k/mac: Hook VIA timer into vDSO for userspace
 clock_gettime()
Message-ID: <20260109004952.GA27149@allandria.com>
References: <20260108060533.3891380-1-stefan.reinauer@coreboot.org>
 <20260108060533.3891380-4-stefan.reinauer@coreboot.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108060533.3891380-4-stefan.reinauer@coreboot.org>
User-Agent: Mutt/1.5.23 (2014-03-12)

On Wed, Jan 07, 2026 at 10:05:31PM -0800, Stefan wrote:
> Integrate the Mac VIA timer with the vDSO clock_gettime() infrastructure
> to enable fast userspace time queries without syscall overhead.

>  - Maps the VIA1 timer register page for direct userspace access,
>    allowing the vDSO to read the hardware counter

I would be concerned about the potential problems this could cause. A
misbehaving program could cause a lot of mischief if it has even
read-only access to the VIA1 registers. A read from the shift register
could easily cause data loss on that channel which could be fatal
on some models. I seem to recall that Egret (IIsi and similar) in
particular is quite sensitive to communication failures, and while we
don't actually have a Caboose driver (Q900/Q950) it does appear to
have a watchdog timer when it is running properly. Since those are
the controllers for the soft power (among other things), they can turn
off the power to the whole system if they get confused. In some cases,
reading registers can clear interrupts as well. That might cause
missed interrupts.

I'm not sure if this is enough to counteract the potential benefit
of the performance improvement, but it is something to consider.

	Brad Boyer

