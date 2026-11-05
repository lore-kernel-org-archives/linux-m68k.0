Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908657;
	b=m5dVMjFY/vAb/NGNBtku/YrOS8i/l5AwRYLtGpiDK2rsbdTRkXuhn5qNnuAKlxw+EWOS
	 EBZpoWZIwx3B+PhHYsILxMSYjxHbG/dtp7lXfddurGF4O8xE+ciqixCZ/fBEjzN1oc0Uj
	 RwDJ4Hgxxc6tV3B8wuHL7SecJYmfSFrwNsVFRFN9P32/GmS/IVf0WjxX/PvmN79UZisnj
	 hc5jOOSQ/kHeO96lTT0RyYE7FDJUrDQg4UB5A7efNWe0UqaNei4r8tvy9m+GsthwBdogR
	 oAuhV9I44Dq1S+2QKViSyT46MXHs0mHrUcc1ABaDNlr/fo8GWWpgTbwqtoWh49Yadvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908657;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=LfOG7svnGFtdX6knEZABTuLf6E1euR3ull/6ykf8/Zc=;
	b=koqnp7A65A5Af0M5/80rS0xGCrX6iJm2aHGj4Y4iHr8j6MwRwOMrb/Rn0zfa8UiFmhbX
	 vK9Mdgxw/VGuff5VP6vz79f9yINGkiHYy47uRlSneweJTDeS7qZp0Ae3T+LW5zTo4MjOL
	 /o+ZRmXb4lfoHlUtS7zJbxY75vaCGbNEnqS1RDfA+B5McBVg8qykzFKVz4SOp2ZvvKtQT
	 /VT9Gkjn74WV5Q0BJSlh9meeKzxyCSZu3pjRUvOQZNnmsgzEtrdweyPqDtmVGZmgcMayo
	 u/smbilsTXw/0L1U30EEUDl6d/Kn+ib/wU4RgAAfh7FLaVJcDGz2UTG9857vYua5p5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EulWIzEC;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09BC606B051
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D09BC606B051
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EulWIzEC
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01B306020B;
	Thu,  5 Nov 2026 19:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1CC1F008A1;
	Thu,  5 Nov 2026 19:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908655;
	bh=LfOG7svnGFtdX6knEZABTuLf6E1euR3ull/6ykf8/Zc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EulWIzEC3SwXjb3B/OGCFh1MGAp35llwaSI3zx1zPGSvxB2PueDuPAvRNuIW0oJPn
	 sjdbz20ANDZUpqqqNJYWRjooqSctGjOkY5GPimFTLBQppqUjZSkfBsiaFLcG7vSn7h
	 Ts71xzrZSBBrmI2NeunInw5b4lKrvgqFMJRcufe2yj1uC3V8a9g97CNltEdygplXMc
	 aKctYwgVWKI5yzILnPhQD3EkW3RyhqbXB7x7wBd2I4LGE7O5ksfO29Yi5oMsyxb1/O
	 M2aME1C02nxMYCD8PWTczeUF2/O+CeyEc4TLdS2QpIOb0o3Ay/ztLB6JY5TLiU73AS
	 kIm0/Y+VRxonA==
Message-ID: <sashiko-outbox-200038@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 04/30] lockd: let procfs copy out reads of
 nlm_end_grace
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Jann Horn" <jannh@google.com>, "Josef
 Bacik" <josef@toxicpanda.com>, "Chris Mason" <mason@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, NeilBrown <neil@brown.name>, "Eric Dumazet" <edumazet@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Al Viro" <viro@zeniv.linux.org.uk>, "Jonathan
 Corbet" <corbet@lwn.net>, "Christoph Hellwig" <hch@lst.de>, "Greg
 Kroah-Hartman" <gregkh@suse.de>, "Joel Granados" <joel.granados@kernel.org>, "Kees
 Cook" <kees@kernel.org>, "Jan Kara" <jack@suse.cz>, "Jan Kara" <jack@suse.com>, linux-s390@vger.kernel.org, coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, "Takashi
 Iwai" <tiwai@suse.de>, linux-ext4@vger.kernel.org, "Chuck Lever" <cel@kernel.org>, tytso@mit.edu, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>
In-Reply-To: <20261104-work-procfs-fs-v2-4-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-4-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:57:33 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_read_buf() so procfs copies what is read to userspace
> after it unpinned the entry.
>=20
> Acked-by: Chuck Lever <cel@kernel.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D4

