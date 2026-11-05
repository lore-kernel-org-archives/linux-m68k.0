Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906945;
	b=gIjh4TJ8sUw6qApCunyRk2f4XHUJxzrDFAy2mDN7Ohh/RUH7GN9h29fYzwS+RPbe9PrU
	 ZKaR3cG+Tfdqu7LhtOm5SYuPw8fzDkhjsirri2fepDWZVT4b6Urzluc/ARuwvVCDou5qW
	 L6ooDEfX3hlBJhgicjaU0rJzbCxOqk2/dtFU7lD63ftGPcrodGJbCGFwB3fZ6pzg2Uo7+
	 uaFFJNpDwFGMBm7iLEokh+0gobMv5PWRrEoEFHQjoRxdLYrN5R8q7A81LsWoaGccmM2fw
	 nNHH2WImdMWL+p8QT9CRbTy6aWTeJXnq6twrPMKnQs/xpDWvX4P1tfWulAzPi7psymg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906945;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=r1ycZKD70M2O9nWABnZxAo0Y7x59PNQr/eG96uelaDQ=;
	b=UpO/cJAoPmnl37Mnpok3w4H0bJnTEM7Ie5hKzInvXYM5WpMn/sigLJFc+6AbV4wdRl9S
	 X/wXW0ccB8IIXFj+qA1GNJEujkCRDVMbc8qFF4EIeXYeEkiQlwecsQXq9Rbh07IUc2TL6
	 tLLGhnwjPwcdZ3ZaEdRrMbE19i0flLwbUzIaKIoWNHSkRApcaUHwyksvTOVQrhLu2b9SQ
	 fr3uDvjCC3H3uAa9R59Xy+bZNgFCmVdbm4sNtpArGqZWHCKWAcw3k6gzZh+8wl+OG2mxb
	 U7Uv35YCUjdOQrwbc2xRUf4UKLav8ZkU/i2oFLQA903KTm1kxNtqkzr2ynfhkA+XtGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=necGus7b;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82C0606D803
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A82C0606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=necGus7b
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F98940222;
	Thu,  5 Nov 2026 19:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA70D1F00919;
	Thu,  5 Nov 2026 19:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906944;
	bh=r1ycZKD70M2O9nWABnZxAo0Y7x59PNQr/eG96uelaDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=necGus7bPU63UQk4B7+jV3XV3fUR+Vt0nlBwWy50VqFwECBf1aibdVwEQjnZEn+Ny
	 Nk1eietSenvm5xqR/gzPNGNzZbvkkvnODaOzH7V35V/oaIZYKDA69EZlf4qtIWl0+y
	 CLJx1JYEb1VEmZX7/x/KIzKFm4AvmAQYSTJwVI3oNBp4hYilo3LyLI/24/DmSHB0xR
	 KeFmM+pyBdtCJHSurwLaWys6yP1tn08WuWeskCI8YOyZaldAhv0TS5sXvEaDm8Qah0
	 JT7nN2+bgKA94sYD+FKbGDigc0ESaJpkTtOL2xP5JtOlGB9U35VVcN7RlPkTRv1UsF
	 KJpyB6HzUFV7w==
Message-ID: <sashiko-outbox-199871@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 08/51] powerpc/pseries/lparcfg: don't drop the
 last byte of a write
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-8-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-8-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:02 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> lparcfg_write() terminates its copy of the write by overwriting the
> last byte, so a write without a trailing newline loses its last
> character: "partition_entitled_capacity=3D5" is parsed as an empty value
> and fails with -EINVAL. Terminate behind the copy instead, and refuse a
> write that fills the whole buffer, which can't be terminated.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D8

