Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A6D38D016
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 May 2026 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889019; cv=none; b=i+ZfO7p5POkkjrFA/+S6G9qGwlXdW676xVEjpnK0A0UBGr1BejUX3lacM8XCf/uMgVnRFOeEPTDT8vM0teosVc1JoOa4OYNN8dF10woYRkWek5B0BiXnPnUfszup268cKRhgZGocEm4t3aYVl/INPoqn4QFo0vA1sQbURnfcFj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889019; c=relaxed/simple;
	bh=pYwlRQbtoXTLc/WNhpltEoiImuA4HQaKY4NST2HL0zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qR5CAxinGdJuHzzuV8N+FEKhAMZ1jZXaEmizSL/wcqe28mb7UvfGn8t8OIseF5ELmGZxSTStHoFqTxjg2yzUvkhzV6a9UP5UgsmmzhgcZeS9rytargaKavUtaqEKndwvT05ZbUOm/tQavVLGomxjZseMo7j6wZl44TVczFO+TI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gib9peEp; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gib9peEp"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0213060121;
	Mon,  4 May 2026 10:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1A0C2BCB8;
	Mon,  4 May 2026 10:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777889016;
	bh=pYwlRQbtoXTLc/WNhpltEoiImuA4HQaKY4NST2HL0zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gib9peEpe9TLJPKti2SbUQEmP8xSC47xa4Z/IjqVE5OxA8gmLK9g+9aQnsbHMifR+
	 t8quIu4fBO7n9re2LDm1g33TrUSzeoqA0+PwfEUwDaLXlN/c0ETOmRxcPkKg2YIlIr
	 M33eeHDpndwPStZ9j6FZM6jt5sy1puynl8JAwVB7GLb05AxRkAf5tbPVLpSxbDpH/i
	 0YsDq+8tjg33snIxqfi4Vk/jFfQwM0aY0TRiNE/pQl8QWSi0f6UtIiX6cIi/q+7V3l
	 oOiA0S4X95qt4G3foI7HZJ1ORNpx9bbAPFj8CqIMBEN+3yvYxAuRJxU3vwtflr8Xhm
	 88b0T9oRZLlgA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wJq9G-00000001mc7-1lqp;
	Mon, 04 May 2026 12:03:34 +0200
Date: Mon, 4 May 2026 12:03:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nubus: switch to dynamic root device
Message-ID: <afhu9r_x40aeLgvS@hovoldconsulting.com>
References: <20260424104011.2616970-1-johan@kernel.org>
 <92e2b920-041a-78a4-e4b6-c5a7c579ade7@linux-m68k.org>
 <ae-BCxxLFkzEvw63@hovoldconsulting.com>
 <a05b0f75-87b8-5478-3480-be545c905c83@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a05b0f75-87b8-5478-3480-be545c905c83@linux-m68k.org>

On Tue, Apr 28, 2026 at 05:24:31PM +1000, Finn Thain wrote:
> On Mon, 27 Apr 2026, Johan Hovold wrote:
> > On Sat, Apr 25, 2026 at 02:07:10PM +1000, Finn Thain wrote:
> > > On Fri, 24 Apr 2026, Johan Hovold wrote:
> > > 
> > > > Driver core expects devices to be dynamically allocated and will, 
> > > > for example, complain loudly if a device that lacks a release 
> > > > function is ever freed.

> > > Yes, in drivers/base/core.c, there is a warning in device_release().
> > > 
> > > WARN(1, KERN_ERR "Device '%s' does not have a release()
> > > 	function, it is broken and must be fixed. See 
> > > 	Documentation/core-api/kobject.rst.\n",
> > > 
> > > But there's no way for the refcount for the nubus parent device to 
> > > reach zero that I can see. Did I miss something?
> > 
> > It will if registration ever fails (e.g. due to fault injection or name 
> > collision):
> > 
> > 	err = device_register(&nubus_parent);
> > 	if (err) {
> > 		put_device(&nubus_parent);
> > 		return err;
> > 	}
> > 
> 
> In that situation the kernel error message would say the device "is broken 
> and must be fixed" when it was deliberately broken by fault injection.
> I think the commit log should state that the aim of your patch is to avoid 
> that error message for that use-case.

No, the aim is to git rid of statically allocated device structures. The
error message is there to notify people that the driver model expects
dynamically allocated objects (e.g. as documented in kobject.rst) even
if you're unlikely to hit it with this particular module.

> Aside from that quibble, the patch looks fine to me.
> 
> Acked-by: Finn Thain <fthain@linux-m68k.org>

Thanks for taking a look.

Johan
