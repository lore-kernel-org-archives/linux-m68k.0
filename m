Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAF921101
	for <linux-m68k@lists.linux-m68k.org>; Fri,  8 Mar 2024 00:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709859359; cv=none; b=CPtQ+3C5WYJDv1pnOKzvfeDmdtioZVlng1jJjvIsDxNcqzEe9H4iOXzXC5qK+jFyR+mAlyKMU6sz54eU3T9Z0NsXvyv0mrP41PZAyVCAt6Lqb0sKdb6LaO/JH+GXjDHp09QJyqASfCuVp4CPepV428mRWZ+vxnwrCPZmropJgfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709859359; c=relaxed/simple;
	bh=+UzHCZaP9oil+covpwyoL0ITnfeoW1VgJAmrHu1vJ14=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QvAXuMzU3ZPQFQZlfuGPV4JB5PI396+UFIirSi0ZO0CVRfa0vVEdoY3f4kK5DDOfFRUJ17MvbTl+LqlD8750KWtUAbBi6UB2ZN/nfjEs5pW1BaSeyPQ45t0rGuo+382zvjHYniHQf2ydvARnnfMDqQYOeUXrqPA8QB4EpOQeBlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OrWbPEkc; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OrWbPEkc"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 1C82C11400F5;
	Thu,  7 Mar 2024 19:55:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 07 Mar 2024 19:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709859356; x=1709945756; bh=I9Jj1xQv05D8mUePt4PJeB/PnbuP
	+qmMRaUsI5HHeeo=; b=OrWbPEkcmE67OcOdimYZ3inVk54zcfp2dFkboBjvr5ii
	GkY7cqFBVR2cGAj6coJ+fatU93yIDKzLmINmQPxAXnXVXZWa7iXNIDgGmH6xp0Tf
	4Yw5bYul3kCJ8YjZ52gDfP3uZ3fCwgbRyY/O6BGVWiKdbWQkwFIaL+Q/uO3O3iTp
	bfawxGD4I9GBlmXeW+ApbkCE+Psd+z0mXssqEcd6FND3PFkVvN1uLyS5X16K4xlX
	OnCRMwggLGpO+Gu4S2tuZjUgxkfiMFB2n5lp7u6U/iXmiNikMrp4bhWrxV/dqOrx
	490Xo05mvnf9W3jfdRcfA8+/p0l4HgzzhU2kIYcS3g==
X-ME-Sender: <xms:G2LqZXzw7x7LvqonpSbe9I97_xXMvDCj8B0YLIo5E7N_wUF8a4sqTg>
    <xme:G2LqZfTofkA7QvI2FueZc84X_sYectBISkyVupOtORtBDqWWOMREdwrSbX-mc83SE
    abEyKGPkX6bNp9suDs>
X-ME-Received: <xmr:G2LqZRXApMvl2skUh3EsbluGG1q3UiIYRcuy2wWtto8IBzWc-sbPtaBfEtKVXDtzPKOSQ9NdSkpgdI8f8WjVbEwICXRtCPSXvhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrieeggddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:G2LqZRgT-EdPr0ORoduGBYh7B9UILNMid6-3ey13vlip-BLDDf92Jw>
    <xmx:G2LqZZB1KyxLvwK6LII4A3ExWqbVBdnch7jiYwqiXzxS_ZtSKbKo0g>
    <xmx:G2LqZaIKx5sHa_mgp1sGILSyGp5H0A6u4O5Exia6mIrCoDsJBWOklw>
    <xmx:HGLqZYNiVcFcdQtbIA5JZMDOWe_YnAFmES96m2QokGWg3VsGWWASVw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Mar 2024 19:55:52 -0500 (EST)
Date: Fri, 8 Mar 2024 11:56:55 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: Guenter Roeck <linux@roeck-us.net>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: spinlock recursion when running q800 emulation in qemu
In-Reply-To: <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com>
Message-ID: <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net> <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com> <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org> <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Mar 2024, Michael Schmitz wrote:

> > If interrupt nesting messed up its state, you won't know it by looking 
> > at the stack after the fact.
> 
> True, we may see the effect only on the next tick.
> 
> But we may not need to invoke lock checker corruption in order to 
> explain the recursion message.
> 

Right. We can explain it in other ways.

> Reentering the VIA1 timer handler would re-run scheduler_tick(). If the 
> prior run has not yet released the run queue lock, we'd get the 
> recursion message.
> 
> I realized (belatedly) that scheduler_tick() does not run the task 
> itself but just causes a reschedule if appropriate, so the probability 
> for this condition is quite low. The question is - does the VIA1 timer 
> interrupt ever get reentered?
> 
> Can you add a printk_once() warning when you see 
> arch/m68k/mac/via.c:via_timer_handler() reentered, Guenter?
> 

It's not possible for an interrupt handler to be interrupted unless by an 
hard interrupt at a higher priority level. Maybe QEMU could be so broken 
(?!) but recall that I saw this BUG on a Powerbook 180 ten years ago.

IMHO, Gueunter would do better to instrument the spinlock tests on the 
assumption that the locking in arch/m68k really is correct.
