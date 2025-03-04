Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBC61EDA1E
	for <linux-m68k@vger.kernel.org>; Tue,  4 Mar 2025 05:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.242.82.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741067320; cv=none; b=bHV2biD1t3Ab4UZZ9VKrLXR7nOj3upUeABi3dlOeRy8T3bzjN7Kyh4bcugALJw+xFV9jHkhDp3eFv6dXZlN+RWmpmcG2pmEzSxvFs5jPLTEX/D8Qo6SiPYQIGBNLI9f/NHrnXj5WClqKBeuklbf2+ldc2467NfqQNLSxF3/+lkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741067320; c=relaxed/simple;
	bh=ojl6uD3+w0YbXcjGIcPYIGg8kvHs2WYVMD3fZDJ7poU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSowJNniXu0mwk7sfNi/RYP262eI6N1H4472TvuWVU6IzEAzK41Xi3X3BudQkE4V5TOohxMjt9Lbe+RKw66a52RV7wL1kKYdxUCphD2puYRuUDtJUhVM8SbY1xOzzVm+BXvf+rcp9XpNfm5c1BKhxGoeURPzO98dAO5MWyCjoXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allandria.com; spf=none smtp.mailfrom=allandria.com; arc=none smtp.client-ip=50.242.82.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allandria.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=allandria.com
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
	(envelope-from <flar@allandria.com>)
	id 1tpL8t-0003Xl-Mf; Mon, 03 Mar 2025 21:48:35 -0800
Date: Mon, 3 Mar 2025 21:48:35 -0800
From: Brad Boyer <flar@allandria.com>
To: Thorsten Otto <admin@tho-otto.de>
Cc: linux-m68k@vger.kernel.org
Subject: Re: Software FPU emulation in linux kernel
Message-ID: <20250304054835.GA13449@allandria.com>
References: <3374772.VqM8IeB0Os@earendil>
 <20250303221012.GA7422@allandria.com>
 <49758471.MN2xkq1pzW@earendil>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49758471.MN2xkq1pzW@earendil>
User-Agent: Mutt/1.5.23 (2014-03-12)

On Tue, Mar 04, 2025 at 06:24:30AM +0100, Thorsten Otto wrote:
> On Montag, 3. M?rz 2025 23:10:12 CET Brad Boyer wrote:
> > Well, most programs that use FPU instructions aren't going to use anything
> > beyond the basics.
> 
> Thats true. But if they do, wouldn't it be better to just abort the
> program so the user will notice it, rather than continuing with
> totally bogus values? Currently, uprint will just use the kernels
> printk. I guess that will just end up in the syslog for most cases,
> and not even seen by the user.

Yes, it should cause an unimplemented instruction trap or something like
that. I was just pointing out that there aren't likely to be a lot of
programs anyone is using on an m68k Linux system that would notice.

> > In practice, no. There's a lot of other issues as well. I seem to
> > recall that it only supports the 020/030 and not the versions of
> > the 040/060 without FPU.
> 
> Thats mostly a matter how it is integrated in the system. That will obviously 
> be totally different in my case.

True, but it is further evidence that it doesn't actually get used.

> > Most existing 68LC040 chips also have the bug that causes missed
> > page faults after software-emulated instructions as well
> 
> Oh, i didn't know that. But handling pagefaults is another thing. But
> freemint does not manage virtual memory, so that should not be a
> problem here.

If you're curious, it's #10 in this list:

https://www.nxp.com/docs/en/errata/MC68040DE_D.txt

A lack of virtual memory should prevent it, as you pointed out.
Interestingly, it's not actually specific to FPU emulation even
though it was normally known for causing issues with FPU. Apple
had a generic workaround in their OS for everything other than
the floating point exceptions (they use a different frame type).

	Brad Boyer
	flar@allandria.com

