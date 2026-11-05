Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908686;
	b=INiVCjyXP+nUyiXesDSJKCHD+9Z3Tr1v70ZWyhqoZlXBR4897tf0M5odM43GJ7OZ/nZQ
	 22KP0LQQRWqqm+R2ClmTnrmtswGgMmbBjWEgMm2K2HyIme9jXuJ3bj8EqAqDqzNvToXB7
	 ItxUlfKFxp2NeefgstsAEUqFDB9peBuG6uREMQnoikaUg6dQURMLb9J0RSis9ygl10P7A
	 wT2R+W60s2RwUkPpr8a4sjIPmM0B9O58zIvFeKKl7uZax+yzh1qoW3MJoeIEN/KyR41hy
	 i1KjI+8eVAHgkrP7Gb4NviXTw0PSdFaFJajMF4+/a2wpKGNGsDQtaFfgNcReMEEI+xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908686;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=BB5sJR9C7Zx/9Pk3o44DtUSAxu92dNwmvstpQumGNJA=;
	b=2BqC5U+eV3Yb+O3m8iI8VbW5DwEuKYjnni5srYNImhSRz92bmBUS8XBwiz4HiZjYNE5B
	 M7AZzoDz2k/kZqlaF5vCTPFBCeaHTNaqs42B500GIrGc5mzj1ruort/2RbmEuFD98l6tJ
	 pc5cM7Jg3GOdZBjkhV6MZTQmkDxMk8Ru0wcGjMqERtUMD3/qILTbaS2JS+LzqUvm3kx9T
	 ctngRG3yZYU8oeurs4f5xvvFJtbgHdY21i4RQ5OIzO5wLYfc8ZS+7Ehuvbye7yfImc6T2
	 y+ot8joc3IZaF6cxhBsnl5cI+VdmWDppwLRh3HOXLt7Jqj5N1dSTYGpaCGWmUTFH3vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddZWhmtY;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170B4606B050
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170B4606B050
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddZWhmtY
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA24A414E1;
	Thu,  5 Nov 2026 19:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A401F008A1;
	Thu,  5 Nov 2026 19:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908685;
	bh=BB5sJR9C7Zx/9Pk3o44DtUSAxu92dNwmvstpQumGNJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ddZWhmtYBTIjf16jcYyGuxkBHMP752cDre+YlbjE8K+pVsumLJ8cuoV8TN+HdBxjY
	 0HL/wMxsPD9cDiEJ8ml8GmDV8iXPn1Ljx0/Mbh4eTVFT4Ps/yYu4X08RdE9yor95Xm
	 NuoqE+Twd9eWDq17omIHGvd8uduh6YXldarMHP0FxHZ49T3VqEGy9CjMVJiLafNZ4q
	 crkTm3bGTJeqOEjZuZhyTPgE93yIG7wSXYRHJTke0ePJIwoq11jQIi8x0dAUWr1jPU
	 6dWitI2BDr+qt4m712CrJfv0OpT4tmwX9rbzOOpgVyVyJTCJ6SFDofjIfM0DhjSDjJ
	 fhaCI95uj6cEg==
Message-ID: <sashiko-outbox-200052@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 18/30] sched/psi: let procfs copy in trigger
 writes
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
In-Reply-To: <20261104-work-procfs-fs-v2-18-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-18-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:58:03 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() for the files in /proc/pressure so procfs
> copies in what is written before it pins the entry, and take the
> trigger from that copy. Only the first 31 bytes were ever looked at.
> Writes larger than PAGE_SIZE - 1 bytes fail with -EINVAL now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D18

