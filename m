Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784489;
	b=M8NLkultCWTstxGeYboudN85xzOr4Z0sFqO5eddYqQ35eed13JX0Lcsua4s4SDt084wy
	 9kXsxOvZm/FaASsV9RZIh2PxcEnWUQmrABsYME+P0C06mmUGrv3BamKNLYiLQOnPqs9PN
	 Qs5NkGt7Q3wYSuR1D0vCBY/dWnlTUPQ8YHbr4ksWRQkSiMtPh1dbKPxxguwFf+vzIq5dO
	 fOf5vwMsKZxzjPYI/nt+r4Izu+KDQIaF+jSdhyn55VkO5KE6rFNImP4miutfGI+hFJ0oH
	 fK81dilj3snBpNXEZtVtYU2kz2WcT4t5cDTDqyO2rm1Ev0auKNcQsBJueRy1yga4tJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784489;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Gr7svhS/YSc9d7laFr7PXJQ2SsJ994DEnu6A9NyzDrI=;
	b=jHyfGAu7r8H9VzKdZUmKC5Bmti9qODZgsOciTbiriqoskTUGb1AquLSCvGFPx1YVXknd
	 io517Pg7xn2StcQ0bkc9sk/M26t/P7yr60S84QsUh6zrAU/fbXNkUSUxa7QPiF2HF9tU3
	 EOF9sLbcAl5uXYr4UAAYsQRW2eVGe4A7jTtapMQ42IAXwKvsP6fHMAAFo2o/NDMVFFbRP
	 8CdznMQlbs2Auy3fR6gydewMyi2CdgzWOgRdxLbn0jiy/KWbuIByYrGW+XIhGoSAZWkmu
	 c4E7gNz1qy8rJuJiYhgKphtJn2TZiRGwVk0vvCPs+Y+C+7gc+4b6Uqs8XWR6qOmFzxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X1jgy3lG;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC62606D808
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 09:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABC62606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X1jgy3lG
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C108060098;
	Wed,  4 Nov 2026 09:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4001F00A17;
	Wed,  4 Nov 2026 09:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793784487;
	bh=Gr7svhS/YSc9d7laFr7PXJQ2SsJ994DEnu6A9NyzDrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X1jgy3lGK+B8wHnMJmPUlW00+DythG+u8ZdEslw9l+mYGsCluF0yALGaeLj7ksrDg
	 EcNjCUMoKMdxcyD0WsxPb4Cp4iKUAxNR9okqjQhF+09x5q+3kuYpexwXQlXsHIw+os
	 TkFeMF2FhQ5UjzAqNfBp6xMNGmn825VDWt1gtK+nxiDDItHSDAD0XUEkYDsawNyiA7
	 /4Xh7LGcOgeD7u3hApqggi+GDOh8nhBNcBO0pFhjuZykmUExXJEtisP76hRDnMqyNT
	 NxfQEUBzADkSfaq0PsDOx4woXNhrClwQtQmsRawkfviLN+SXF+cZMarB1vamQDxvXp
	 LI66cNBmM2ktw==
Date: Wed, 4 Nov 2026 10:27:55 +0100
From: Christian Brauner <brauner@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, 
	Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, 
	Eric Dumazet <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, 
	Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados <joel.granados@kernel.org>, 
	Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
	linux-input@vger.kernel.org, linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-modules@vger.kernel.org, Chuck Lever <cel@kernel.org>, tytso@mit.edu, 
	dmitry.torokhov@gmail.com, Petr Pavlu <petr.pavlu@suse.com>, 
	Anna Schumaker <anna@kernel.org>, yukuai@fygo.io, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [PATCH RFC 15/16] proc: let procfs copy ioctl arguments in and
 out
Message-ID: <20261104-muskel-filmabend-parklandschaft-f02c910a4fb4@brauner>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-15-75df35e4f8b8@kernel.org>
 <sashiko-outbox-195542@kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-195542@kernel.org>

On Tue, Nov 03, 2026 at 03:01:36PM +0000, sashiko-bot@kernel.org wrote:
> - [Medium] proc: unguarded zero-length user copies in pde_ioctl_buf()

Hm, a zero-length copy isn't a nop on every arch. Adventurous. It's
skipped now.

> - [Low] proc: split declaration and initialization of __free() variable in pde_ioctl_buf()

Intentional.

-- 
