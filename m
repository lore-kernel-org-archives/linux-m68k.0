Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5B73DEAC0
	for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303824; cv=none; b=q6zzfCz6A3dxeMObm7wCyYcSek1xh3Y1JxZraH/g2SNoNsnQAGlvXFm2HwyVPPJNRsha2sDjjD+KFzmp8nXZpQEbF5TnplNjmJHla2ZWPsvB/MlQ3zEAp66vHuDrfZC/aOtp1hSN3Yr3dWllBx85OT7M2ZkhPFU8ZgmglUIhRns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303824; c=relaxed/simple;
	bh=x2gsD/7vjDMlAPu2Z+o87th3qmqHXJ08CwGiP50qAOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpbfaMyHVXA94U+Herg3cEJ7jx6LOt82LmrNtZSQEHYksQkBfQLBZFDp44vtgvGs0+4ikx0pZNHUHTsAPYYC+Lhsy/TLcl6i/Bb24yaKVTr1rFDziKbXCM67Rb5U0t3B2qfg8iSSpWV2ieOZM8hQKingUo1Owg6u9ghEAQU41io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkTxiIFv; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkTxiIFv"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 227BC40D86;
	Mon, 27 Apr 2026 15:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014F2C19425;
	Mon, 27 Apr 2026 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777303823;
	bh=x2gsD/7vjDMlAPu2Z+o87th3qmqHXJ08CwGiP50qAOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GkTxiIFvWfN0lmHwAMDsy3edjKrIhV6N392laA+hd80IqTlMx5aTKr/5Mf37qaZMC
	 7nnQbR1yyDhuCMVG1ajcnuOH46EzgrBl7XC3Xwo3lFrM9SsRzkP39RDJU8alNIDd0J
	 ZFGdEej6zO55Kb2XJJNfMgng68krbKvvX4NlK/bwwoBfnHwhZ3oVrnORgGo9XKc0Fy
	 /94ZMVHEnXTbK9v/4BcB0woZ+dCqVDu6oo+DhpIWohekbIlsOneZO8mOg5FUlj8wx3
	 O5yXzdxFgUzCL3O4YeIzz8DfWEvO0erCMqVdUJViT6Gq1hZYeqouJ1l5Jq9ivmqmKt
	 +LuORzJ0IIoUw==
Received: from johan by theta with local (Exim 4.99.1)
	(envelope-from <johan@kernel.org>)
	id 1wHNud-0000000056f-0UNe;
	Mon, 27 Apr 2026 17:30:19 +0200
Date: Mon, 27 Apr 2026 17:30:19 +0200
From: Johan Hovold <johan@kernel.org>
To: Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nubus: switch to dynamic root device
Message-ID: <ae-BCxxLFkzEvw63@hovoldconsulting.com>
References: <20260424104011.2616970-1-johan@kernel.org>
 <92e2b920-041a-78a4-e4b6-c5a7c579ade7@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92e2b920-041a-78a4-e4b6-c5a7c579ade7@linux-m68k.org>

On Sat, Apr 25, 2026 at 02:07:10PM +1000, Finn Thain wrote:
> On Fri, 24 Apr 2026, Johan Hovold wrote:
> 
> > Driver core expects devices to be dynamically allocated and will, for
> > example, complain loudly if a device that lacks a release function is
> > ever freed.
> > 
> 
> Yes, in drivers/base/core.c, there is a warning in device_release().
> 
> WARN(1, KERN_ERR "Device '%s' does not have a release() 
> 	function, it is broken and must be fixed. See 
> 	Documentation/core-api/kobject.rst.\n",
> 
> But there's no way for the refcount for the nubus parent device to reach 
> zero that I can see. Did I miss something?

It will if registration ever fails (e.g. due to fault injection or name
collision):

	err = device_register(&nubus_parent);
	if (err) {
		put_device(&nubus_parent);
		return err;
	}

Johan
