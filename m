Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719152;
	b=y+2+XGn2U4zxwqcRleuHTUOV6W9oif18lt9xBsNMiaKw4SADztxx3z2vMMt/8ZqJ+QxJ
	 rWQ9KmuWMFHgATEy37KrmYKbtYRIMnn8PhVlWsTXuHefADCAEroiYTQ/x2Dt5y2K4fNUo
	 mTG8f5DvJ1t8zboU7Y+FPwleuCy66KJx7hNjIKAF8DzzKPw4xNgGlVPhgG5XH1PUWQBrq
	 KcjdEvRo7xSx/H9wGiRzioZV3Fm5YXkuMH4KL0lNMV1PxNI8/+PPnMwTJsPdFhayyY2ZZ
	 CuwMtd/uZoPGbJ4t2TJf/Fg/OOYKag6pstkRds2mV6uSqiEzcaemFrLZN+0JxRDoSJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719152;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=IE8V4iOQ7iI3noML0i5KQeIyzNJfUBdSgWgy06IridI=;
	b=Un9k7NrnCGveTiEXKrqON48PtkVXJUNmbkLTiOpw7OuGNsYNcMiWJvzq6ru3FroJu4qg
	 ThuXp+WEoMeIQ+UyDnha+oWfx1GpIXSy7zSVsqc6kUGMZ3DGWxYD3eOokoqNfstmVy/fM
	 afZjlKIJTE9Fr6YPfrgJL+kaUdXac83Ew1K5ca5OlXZn4cq31388XqKX3YR6DaaZNo2Fi
	 5d+ztyRyamk3jgUl6dWSwZGaD5mgQcOSrA4bPA7oWKwWkke0XCyjs4v6D4kGVH3PJPAJQ
	 Emf0vgiABJ/NjWsBGaQX/yXlYW3X2MGtGZ0pDrHFw7t+Uddu8FLIb8QaQdAQ+WIsmBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cs0xmh0H;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6A8606B26C
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C6A8606B26C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cs0xmh0H
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05F404040A;
	Tue,  3 Nov 2026 15:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9221F00A15;
	Tue,  3 Nov 2026 15:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719151;
	bh=IE8V4iOQ7iI3noML0i5KQeIyzNJfUBdSgWgy06IridI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cs0xmh0HG7ocfJncY6yGq152uWyliT7jK3rRJJRKtLfkqNGd4BuVAJlOcb+TB+c0Y
	 m0Zz6URXX9JFhDTjvz0btUBc2CWv7FjEi3y6D5tXMrKmYkp9oyNuzqetMapTf/+0DR
	 2nMRuZTjUqzUKSfEQTPamTNPXOGtTI1lOCkmiX322AlBF+9FPWIY7SJfqsYtgr3yOl
	 xnDfFDDLRRbH0BOzQbHQ8WOunVlJVuUeRtZ+RcN0G0MEnwurIY+Un6kGJOKkXOmJn/
	 cVi3EVheLLtxmmdwiWpSBGXkZu1R/PXVQuUD6eJ2mFWhwzkWYnZksSTusi17FIGRdl
	 JTP7AxeqzaokQ==
Message-ID: <sashiko-outbox-195601@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 21/23] ALSA: info: let procfs copy in writes
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
In-Reply-To: <20261102-work-procfs-drivers-v1-21-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-21-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:19:09 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() for data and text entries so procfs copies
> in what is written before it pins the entry.
>=20
> Data entries take writes a page at a time with PROC_ENTRY_SHORT_WRITES.
> They used to get the whole write at once. ->write() of struct
> snd_info_entry_ops gets the kernel copy and opl4, its only user, writes
> it to the sample memory without bouncing it through a vmalloc() buffer
> of its own.
>=20
> Text entries take up to SND_INFO_TEXT_WRITE_MAX bytes at once like
> before. A single write that is larger fails with -EINVAL from procfs
> instead of -EIO now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D21

