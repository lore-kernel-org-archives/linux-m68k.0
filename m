Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3EAD53F
	for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Mar 2024 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.242.82.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709715313; cv=none; b=oqDvgDx2idx0UDlmTqKccOSn9lUmI7CooN9QVuJrUHEvdH6sMgn7Ania3hrZ25qdn9QQPCs4y7oab59rXK692JnGfVoRxzZFAgaL7NBPDQ26xx9iN83qw5bBY/nhFj1uza5uJZeZx8BOJrx8bPk0srQp4XrUEuyUcRx4glQJ6iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709715313; c=relaxed/simple;
	bh=5UIMRSPgm2tMwM5kSqUGN0TaFynBQz2/jAr13EeQv0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVprvmAAwnU/ncUbUBtnaicQD1NNkYSe6qtzWEOu6HVUDDtkqDFscx5iHJ0m5lekZk9imvlNKQr9AWUdeWruh8ZIqw6+yNJoe3PfH+N/ZkcDKaYQO5mPuSRqzVnuMsgmGIWHKvb7Hs0z5Q65pN7HwnNbRTNpw32j2J0jpGsKcBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allandria.com; spf=none smtp.mailfrom=allandria.com; arc=none smtp.client-ip=50.242.82.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allandria.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=allandria.com
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
	(envelope-from <flar@allandria.com>)
	id 1rhmfu-0005fW-PH; Wed, 06 Mar 2024 00:30:54 -0800
Date: Wed, 6 Mar 2024 00:30:54 -0800
From: Brad Boyer <flar@allandria.com>
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org
Subject: Re: spinlock recursion when running q800 emulation in qemu
Message-ID: <20240306083054.GA20607@allandria.com>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)

On Wed, Mar 06, 2024 at 08:14:31PM +1300, Michael Schmitz wrote:
> Looking at the backtraces some more, I think what happens here is that the
> swapper kernel task is stalled for long enough here that on the next
> scheduler tick, it is still running. With no other tasks scheduled to run in
> the meantime, it may still be the current task.
> 
> The stalled swapper task still holds the run queue lock, hence the recursion
> message.
> 
> I do not think this is a bug, just a reflection of a slow system with
> nothing much to do.
> 
> There does not appear to be any interrupt nesting here. I cannot recall the
> interrupt level assignment on the Q800, in particular as regards disk
> interrupts and whether both VIAs are using the same interrupt level. I'd
> suppose they would, as these chips date back a long time and probably cannot
> place a vector number on the bus as part of the interrupt stack frame?

No, a Mac with 2 VIA chips should always have them on separate interrupt
levels. The exact mapping varies by model, but every model supported
by Linux uses at least three different hardware IRQ levels.

On most Mac models, VIA1 is IRQ1, VIA2 is IRQ2, and the SCC is IRQ4.
VIA1 would handle the timer and ADB while VIA2 handles NuBus and SCSI.
It looks like the Q800 supports switching VIA1 to IRQ6 through the
alternate IRQ mapping. Most models also are using various other chips
emulating a real VIA for VIA2 with varying levels of compatibility.

Apple always used autovectoring and the three IPL pins to determine
the interrupt vector. Older models just have three external IRQ
sources, one matching each pin (thus the 1, 2, 4 pattern). I presume
they had some external circuit to make sure only one line is being
pulled low at a time since we never get other IRQ levels by accident.

The AV macs and the IIfx are the only models with more complex
interrupt controllers as separate chips (PSC or OSS).

	Brad Boyer
	flar@allandria.com

