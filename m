Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1B911CA0
	for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Mar 2024 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710146098; cv=none; b=inij0M9KodzmF9s2oWN+Lu83rJEooDjDA4E0b9n4+vcEayWW5LpRZkxPcHVWcNnAWuR37hnq947BWsKx1R9Y4pcbGMB2VK3T8PG3rtjZm/qSdtJnal2tj4EfO2ZaoVM/a4f6EhVjuxZbuOd0jR4ilm78kkS8fXLsDZdXyrRNzek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710146098; c=relaxed/simple;
	bh=7Y+18AMli0qKALA/WVxQ4qA0KGneTuX5a9kMTXs21x0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MzwI+oeYfIkboWM6gk+SNroqOQYf6TQfqAj63ReaxFuVTUo/n+peC+Ns7w/3dt5PFr7GsaYMRtm3T7Z7grfrGPVFzcej4/zc4ASkp0ZmIx4xwWBitfDTV9ZUDqfYEwR6Bz+A73J6Yos7kQts3ud527KrD0VRI8WhLXDzBgpuXms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M5kMvnsQ; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M5kMvnsQ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 084321800099;
	Mon, 11 Mar 2024 04:34:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 11 Mar 2024 04:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710146094; x=1710232494; bh=Q37xKfSwqX8eaQ1FUb9lEYzohVcJ
	XmBOY8PqY12Bht8=; b=M5kMvnsQ91aUXzQVocV4JdB0ahfVYAcRiQFPUZA8mT5i
	65g2zmI4Gw6A+dwAHujpV+hfdRUe3gvYlqIhOs6FNvbLhrozYTNmTsUztWAPq8r9
	kE0nOe9qgQvC+WZBbo+t7v8bAdEjWqVjb8hzKM4hd2VgjocjwvQuzQf3NEiQ2BLO
	BPKgiT7QLcavD2nf9vfqdc3hZTQk0C5gkyOQlFINZWyRki/MUYpeY/St2mVI9o38
	ZkUzcNMATrN5c1W4I/JluAxslnvNGzPsdhMrF50Zbj4km4kMUq3Xb9vGX5UHkdOs
	5A21MrCWGY0UBAzlTwLQ0e3DxjcgYS2F4kf6DeXXSw==
X-ME-Sender: <xms:LcLuZQ0VgeZhl6VjN6hrL5hyvkvx3WhMn0kuapIznU75NEqjHCy9gA>
    <xme:LcLuZbHA0RPejjeos-X_eR_hpnOnW4Uf8bShHUnhtqJoUSW3JgsbgDfi_7641MYSy
    YIGwrhjvfdKs4WzFOs>
X-ME-Received: <xmr:LcLuZY5p-vvyTXTZsyYnZfe533QjTpy7K2ABe4-njAVMw8SfrAOVqCuDvC3y_vfOnrFQki-_PQpLqiZLx-BnD7HIsicJUBxTGAM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjedtgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:LcLuZZ3xP_zQQN8AnAOKGgCvfDjqIlHnNDR3xYbm_qLqqzL9yAXs3g>
    <xmx:LcLuZTGyTPlNbFZz14dGkAaxuOFVEazp-AuZ8jNYhYyn8vw6N0G_ww>
    <xmx:LcLuZS-B0lED1fjIAg1FIxjmfnxsEX0lsbogyS_91fwJO3E-8g2QWg>
    <xmx:LsLuZbA90gwv3ts58kzNFVMxTM0OPTCXihElzzm33zw0qPAnO8ODAwRF6BA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Mar 2024 04:34:51 -0400 (EDT)
Date: Mon, 11 Mar 2024 19:35:57 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Guenter Roeck <linux@roeck-us.net>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: spinlock recursion when running q800 emulation in qemu
In-Reply-To: <ad9a7be6-e2f4-f17b-04fe-393a409e523d@gmail.com>
Message-ID: <745f844f-a100-5f38-99b3-97ace157b2a2@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net> <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com> <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org> <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com> <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com> <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org> <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org> <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com> <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org>
 <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com> <9e5ce055-8af4-4cca-3505-a3186b86926d@linux-m68k.org> <ad9a7be6-e2f4-f17b-04fe-393a409e523d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Mon, 11 Mar 2024, Michael Schmitz wrote:
 
> 
> Looping over 178 boots (using init=/sbin/reboot), I see eight of the 
> spinlock recursion messages in ARAnyM on my old PowerBook G4:
> 
> BUG: spinlock recursion on CPU#0, swapper/1
> BUG: spinlock recursion on CPU#0, swapper/1
> BUG: spinlock recursion on CPU#0, pool_workqueue_/3
> BUG: spinlock recursion on CPU#0, swapper/2
> BUG: spinlock recursion on CPU#0, pool_workqueue_/3
> BUG: spinlock recursion on CPU#0, pool_workqueue_/3
> BUG: spinlock recursion on CPU#0, swapper/2
> BUG: spinlock recursion on CPU#0, pool_workqueue_/3
> 

Not the reliable reproducer I was hoping for but it is progress. We now 
know the problem shows up in both Aranym and Qemu.

> Trying the same on a much faster Intel system, no messages are seen. 
> I'll try locking the PowerBook on half CPU clock rate next.
> 
> ...
> 
> The tests on unlocking certainly aren't atomic, but those are not the 
> ones we see in the messages. The test on locking use READ_ONCE() so 
> ought to be safe.
> 
> The locking primitives are not atomic at all, by design ('No atomicity 
> anywhere, we are on UP'. While not debugging, spinlocks are NOPs on UP.)
> 

I think spin_lock() reduces to preempt_disable() on UP.
In include/linux/spinlock_api_up.h it says,

/*
 * In the UP-nondebug case there's no real locking going on, so the
 * only thing we have to do is to keep the preempt counts and irq
 * flags straight, to suppress compiler warnings of unused lock
 * variables, and to add the proper checker annotations:
 */

> I wonder whether CONFIG_DEBUG_SPINLOCK was ever meant to work at all on UP?
> 

I've no idea, sorry. The people who would be able to help would be found 
in MAINTAINERS in the "LOCKING PRIMITIVES" section.
