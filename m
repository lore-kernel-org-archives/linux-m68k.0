Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817648;
	b=ngqZVK25SoVB69RzRf6CRcRMhC7NNO4nGR0y3Go+PYgdmSQ9rZsqa+yjG0jTJoJ6+38g
	 JPd+L7TSyrGPT793e35LBUXkqzodBEThv8+InZvXSCXAeit4ot5gi0p32bHnusoiWesME
	 OoBFib+gOsJqMFNIaQvBFhdcgw1dqarDKo6JHMSgWA1W4KwCdSZigNvY+yBZwlhq+1TBN
	 wnenTyZwbVhes//hS108Jl35qz81+dzhiRI4sfBNCD7rao1qIcUlqdVE8biXoShY/mAyf
	 dq8uB28vwSJhrgOvUmt2ZEGtogVUHmYlTYx3xqdRx5qk3p1yrSq7kGHXh6uRcsHC+jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817648;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QZrg0qNWaXbTo0/xGfjrSEZ0b4f34qk5jOb+FqN16uE=;
	b=lw6SNJHkA4j/fZZcvwtEw5xUMQ4f96orrWDGl3d/l86tMMYdhUvyMgYw6VOWqKU4ZWsE
	 FpgkUctT2rNYLmkqL83N4b/UGt+UfbldFzXLHkwiaZmOLoov9YlrAvbYarLWl40MDsltc
	 DttYgiJ3eHxAZ1sVvSiekL6RDP7Xhf93EiZmUTLjBPzP1muQzuuAfOOGbHmR8fQlq2JuL
	 pnL/b5zPBJ9ERrLaD5tHABdoJFyhULXirxYEykqeGh+TM38rMzEW6UjdksPp8MSdsNOEO
	 7VFp5nYrUVzm1MPwNt06E27g9IL37K1Z5eK2WA35u4BmBCWBZokhPp0vMEa6BSHHo3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kJoHVIVR;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A966082BC9
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 18:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A966082BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kJoHVIVR
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E54560AA6;
	Wed,  4 Nov 2026 18:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B5D1F0093A;
	Wed,  4 Nov 2026 18:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793817647;
	bh=QZrg0qNWaXbTo0/xGfjrSEZ0b4f34qk5jOb+FqN16uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kJoHVIVRMDhMBnXEsnAe5u7zpLjzd7+MCZ16TzVPzknEMkH+SygeGbLr1cB1EuFHJ
	 xRsFziB7AYKd6Mhhpn+XaIqvh4Cx6oR0IF5YD5hTWVK9qdGzZGqDtB09vA04e4GNIh
	 gmvf+qmzc//ytZnlzvHO/6/uft/CaHdB0hsuAjqYwVhLfB3Ks7yJAR1O6zCQCoILM7
	 7FSNmR//3JsJPL/FoNc85lYWK2E4ao7D0Q2RNB19ZXpttBP2DbzKEnPZ+uDd2qb6Jz
	 UP+h4VZmlPCoaJVRtTyuBLxhzxSpg0j7ZPL1vwlCOQ73t7T4+hY/7Q5mBk/u31yY6C
	 vajKYZo3usCaQ==
Date: Wed, 4 Nov 2026 19:40:33 +0100
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, 
	Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, 
	Eric Dumazet <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, 
	Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados <joel.granados@kernel.org>, 
	Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>, 
	linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	netdev@vger.kernel.org, ntfs3@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
	coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	ibm-acpi-devel@lists.sourceforge.net, jfs-discussion@lists.sourceforge.net, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, 
	sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Chuck Lever <chuck.lever@oracle.com>, Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org
Subject: Re: [PATCH v2 00/51] proc: fix a few old bugs in /proc handlers
 (Part 1/7)
Message-ID: <20261104-zermalmen-pechschwarz-hafen-b8a1cb79bac4@brauner>
References: <20261104-work-procfs-bugfixes-v2-0-bbf7d5546809@kernel.org>
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-0-bbf7d5546809@kernel.org>

Please ignore this. Network dropped halfway through and the umbrella
went out under a broken message-id and so this doesn't reference the
actual complete series.

I'll resend.

-- 
