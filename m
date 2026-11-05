Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908654;
	b=OrNglvHl0HTKTSRz+0eU1+Q5fy6BZ+WIZra04diyxLgHL1reFEUYiUx9G7O/Rmvngjjs
	 XQzwmGcemq7ea6fzlQNz2cchZVT4ddc7HCwZRKbkN8Lx0jUWU4KMriLIv8huTw21SR0T2
	 uAZYC0bMj5WUrGhpfrJzntSfBkWDL8mDvzIe5En9A8aFDq5bLUkZT5EkTDbJxhDzVyW07
	 zndlitjhi1sKIDjTuLSXe23RCjQ3wYGuoAmeO/mRLo8VwHmqonvWUGr3apPze3aZXBPt8
	 7vA1IJ0BZ/UvHkU08TR3vXpTZm4nv/dMV0lD/kkM8ymZ36YIpmEfLr6XXyZt3dfk4PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908654;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=xFHbGVRg6yrT3KlueEhkmvkVUBCbD/lh7sbmFSVtLTQ=;
	b=GwDkbMO2ARGUIJjY2egKw0AWobQkSMvSicGFFQmpRiB4biBwrPHez8LxoWwsQhrM5CBx
	 zj6Pk6VbLvIOvsBV0ZQcM6hyVsyAjlAfLAeIsT6A3gEdUlapLrnb6MiawkeHwrrPRnMF4
	 ihTraVKALKr12omcvXVIVUioy2FLzajFmgSYnICTY7dyfcw+2U+OVHFYEdqzWtG15DU5B
	 lM+/CPyLOoz+UYthmwKh6rJoUIb+60zwdDSNuBxbQpnHIWX2jdupeEMWR/6mkCXB9i3/E
	 lWYAAjvwJIV4paRuZNhZqFmrnfiSVCviV0XhLOMk4N6D7w25L57WsreOR16x7gTfGHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MH+i2+6U;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D7B606A6D3
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D7B606A6D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MH+i2+6U
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AB53D42A7D;
	Thu,  5 Nov 2026 19:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066011F008BE;
	Thu,  5 Nov 2026 19:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908653;
	bh=xFHbGVRg6yrT3KlueEhkmvkVUBCbD/lh7sbmFSVtLTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MH+i2+6U9jE27VRxSnmwAC1I+KZsyQYelc+SI0/arXlN1acPqvYicclIueaGmnw0S
	 7Vufmku32aU/0LTS0ZsEhPWcfV/nyEAphelMqVOOOUXzL7KizWCwGblpTFLBfRVOQ+
	 aRw3Xd1lLfS6Zlieesl7Sd7dG27m8Iqdo392aGzfQpYi9FKD9imCBtAkWRVDGlQ5yL
	 tyCoPN0YxGIGINh+RaRkYpaUWkADRL5JES4DnfjVlT3zfh7STaEF5tXVV/1aeg93IZ
	 vbsnaVOjzd37+164Zegh13k1Ov7WlOlHKfVz6T+tPlvgwuvjMPOhmpOl2Tm3RCKXke
	 hwokiwRFkoaZQ==
Message-ID: <sashiko-outbox-200037@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 03/30] lockd: let procfs copy in writes to
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
In-Reply-To: <20261104-work-procfs-fs-v2-3-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-3-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:57:31 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() so procfs copies in what is written before
> it pins the entry. simple_transaction_get() was only used to get a copy
> of what was written, so look at procfs' copy instead and drop the
> transaction. A second write to the same file doesn't fail with -EBUSY
> anymore. Writes larger than PAGE_SIZE - 1 bytes fail with -EINVAL from
> procfs instead of -EFBIG from simple_transaction_get(), which refused a
> few bytes less.
>=20
> Acked-by: Chuck Lever <cel@kernel.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D3

