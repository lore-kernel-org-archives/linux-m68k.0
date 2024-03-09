Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465A2249ED
	for <linux-m68k@lists.linux-m68k.org>; Sat,  9 Mar 2024 22:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710022640; cv=none; b=IfW6FtVOyrCvgAG5xlheoILRwZ/bXK0X8AgNvtAMwCDb6NhvbHaUK4tuUBnyF3xrAwYcpr2ilgYIkUdLAJyHMvTJfA/a/YMwZTm919EJAvUYQPjN5AkQ4DakqD38AFa794QbFx+W2l44+WlBeRupovdouoQO86qFMr+Upmpx7T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710022640; c=relaxed/simple;
	bh=gv9/LkDBfI5AKxH53ofK94owW2MO5w1Y6X5bkoTV55w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NF7Dq/f4MFUZ5d1Wyhu63mRR16LjMbqDmeLkUMc1Q5kqDehCvEhweBkGVbubjewynW3M9zztwiynLvAJz/qNGLnokj4o4TLbVOUesjmfdoKV3ytiAhAHISd1uB7piyATFQZfLZKaa7jjgK5Cdfp9wv6YhoJwkNO0y0HpuIXcxFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e3SBVtAY; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e3SBVtAY"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id 061AE138008C;
	Sat,  9 Mar 2024 17:17:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 09 Mar 2024 17:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710022636; x=1710109036; bh=imjwHXmkwFxdP18s4qIlyP1xlJsc
	6tJsGP+viwUAvp4=; b=e3SBVtAYffXCbIpNfL+cNoXsCi1LSj6zo19FLo+RurFt
	sZpA/AZlGHObQsgsdDAaQATZjyKNpBibtr+gTV06vBxGfXhdfFb5rISiyt4gXJeX
	u7Lrc8qLXjEo50GYVdU0p+C8b+AO9HBbCCoRZ0a6CRqEFZo0pZK9LWwXRLtTZKEk
	L/SnJ7YA8LP07CFJ/lojfYQ42zwU85wEpFcQHFnDBofKkISrAhLktoIcDyFw+Bpg
	+sd+9XcysWondgg1xMGziPJEc/iENyul6YcyIljMJPeQ/nMzkyL6SWwzS04nq+Mb
	hDzsbOjnnYVhz6W9EnjwFCuf9IPmzx8Af4OwOIykbQ==
X-ME-Sender: <xms:69_sZb5m02mdhmeQhPsPp1ioDUsPePCccWhr359a63W0hQ3d5Wlu7g>
    <xme:69_sZQ6Pb8DUMA-G8E9LAynWETbYIr8GJtFjJJz7wvyn_A83ZyFtnrIRLx602x0tq
    oSFHe48O52_67hstDg>
X-ME-Received: <xmr:69_sZSfVTiZ_d3ANqXyKFIT2DflbwUIG2cniOQ-KDfApGdEpcIHlitkwTLG-iK51Ukadnqq9kABE_cXHwiSv1pYIXSRYX830xCM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrieejgdduheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:69_sZcI36bnAB09JJ9apIbQHjHfjBSgGAcv5VAc8GusjSdn2YC6OKA>
    <xmx:69_sZfLNgI9KPcqLHk9fpCOn3GpgjKuRvY-nP2__HLeIhfh1SosiRg>
    <xmx:69_sZVy43QqpEejMM8jaD27IQTGlOn_dcJBULejRzz2L9rvZqiRf1Q>
    <xmx:7N_sZX1NCsuClm7STdTyeFhCSxE2hDcoPhSarUTqTwsU2uoURzhr-A>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Mar 2024 17:17:12 -0500 (EST)
Date: Sun, 10 Mar 2024 09:18:14 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Guenter Roeck <linux@roeck-us.net>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: spinlock recursion when running q800 emulation in qemu
In-Reply-To: <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com>
Message-ID: <9e5ce055-8af4-4cca-3505-a3186b86926d@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net> <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com> <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org> <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com> <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com> <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org> <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org> <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com> <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org>
 <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 10 Mar 2024, Michael Schmitz wrote:

> But I've now got this in ARAnyM:
> 
> BUG: spinlock recursion on CPU#0, pool_workqueue_/3
> ...

OK. I am unable to reproduce the BUG, unfortunately.

> 
> mfp_timer_c_hander() has a local_irq_save() / local_irq_restore() pair 
> around the legacy_timer_tick() invocation so this spinlock recursion 
> does appear to work even without reentering the scheduling timer routine 
> 

IIUC it is not spinlock usage that's at issue. IIUC the problem is either 
the implementation of the locking primitives or the tests to verify their 
properties.
