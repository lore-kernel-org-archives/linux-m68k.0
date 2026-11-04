Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784290;
	b=Vpdo3UjJo202+mKcSuTiGZGuPbH9qCSeW7DCaBNk2YsmtBfTslp6MeK2aKt3qkkO5m6u
	 py3oA1+a7TawQ0lhpskpL5Z46t0RWsUgKsW6T8zi0LdGmpsD90eiTzQkASETuv27EBrQp
	 6QboYYK3kutpR8l/wRs1xWxZ+9Bh8Drwvf6mZAt1zIW4QhU+m8fhMnVTgLG5IXKu2thrM
	 ZvREJzn8KeJG3zi/3U2qyiLgAa2vSxWu+DgfiPfMbo0PuRH1jlB5XOHmbnpYbQU5Qr7s8
	 fUIKhAqfrhXnmxR38aS5w+IJqQSx5hZoVMOwvDUH2Bih6cPSHpotFoL7nnXz0CLFW1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784290;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=DU2HnGr13UrjNFDLaLn3EdWjpZutHhABvL9XsGqx5jQ=;
	b=aG4llcsw8mP5y34WFyTasgcAqNyjI7hBpnHxAIXfltJ0yDnr8doIkiB9R1HoWRMoLBfl
	 hWKIwZye8gC9cLqOps9cJ/8/Bv9qTlgM8uoh2qFyEJZnVLcAox4+VrHZN9vPjvMTgncD7
	 J4AQBMtXpptKr4GDta6ehDWKnzWuUyP/Jd6I36aB69QHQQO/apfaKX5q79UviQ7nizYvd
	 uQDzjXhorqsct9cor/gQqYkl91c+ooxG7ukkSZUOvdBdd6xt7xEVSpqPoul5O58LDYSUe
	 xzR7X74T2KluFS6FnzWxdkMUh1lBLgNaQ6TecAuhNFDDZ7dPtRgp61/0sVsBqbIdkIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WsZRN4mS;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B76606D801
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 09:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B76606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WsZRN4mS
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D056360611;
	Wed,  4 Nov 2026 09:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6391F000C1;
	Wed,  4 Nov 2026 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793784288;
	bh=DU2HnGr13UrjNFDLaLn3EdWjpZutHhABvL9XsGqx5jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WsZRN4mSiXyNqyPQ2abkla1s08ffMgQM7KLDjLi06P+TT7ab4JbGTgUVRFTqM57p4
	 KtZN+GZbXH5rHBUm61AhQwhDhVpBREBAZXFUjjZwHt8GkhBIFsti2bgsNX4+XQ7hjQ
	 cXpndaUS1eroH/oJVNBJ+Sg56kvdzoMsNnB1THlx9+UhoGdloEsTqTqtrrUok0Vt/q
	 ruKuPDXwVqcZXMIny8nZN4Uca5yxXlYGPJItgjFJ5wO+ybOGurlQmQ1RBi6ccxL0qZ
	 AEyV8CG8Z7QBzwnTCkd8HDyv1seLZcOyLurYeXFpg9fCMOjPk9E0UUS16THupapVJJ
	 /V41KUFcG1/jw==
Date: Wed, 4 Nov 2026 10:24:36 +0100
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
Subject: Re: [PATCH RFC 08/16] selftests/proc: check that a faulting reader
 doesn't hold up removal
Message-ID: <20261104-aufsagen-unermesslich-kehrt-9fbdcf7932fe@brauner>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-8-75df35e4f8b8@kernel.org>
 <sashiko-outbox-195535@kernel.org>
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
In-Reply-To: <sashiko-outbox-195535@kernel.org>

On Tue, Nov 03, 2026 at 03:01:17PM +0000, sashiko-bot@kernel.org wrote:
> - [Low] selftests/proc: Makefile and .gitignore entries in wrong commit

Fixed.
