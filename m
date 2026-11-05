Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908191;
	b=V6Fyi1X8lYnggjRjNENgo6vzY89KmNGzjjSFqOCx760+iH6YIK0Pgf11EO31QeIBfzEA
	 TZJ3YQTW40LxOSZZ4HJv5CKk+tKJ1Y2QQWtzbxbkR89ScedSJkzYf7OEU5NwKweNBEFm7
	 cbnbGrnCCBxtR9K5E3648awtY5uZ4wNleu28Rs28E4T2fDmLJ2PG6nHl7Y2FeHwc9Cx+c
	 jjgC06q9seA1luS7Z6+8ynDkgSWDzy/MAuV7SfYi2/H/ssain9cjzW02ugkQSDb3m/pkX
	 vCSoEMMcP2U2lTZZpE3yLK4k/bZBvQnjeYtcu+j5SFzEUbgDIIa5oHU0brMDgtT5uBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908191;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=wcOgF6I0KZL3tk97PgTaU7xCFlwNk82oM8K3Yy+AHys=;
	b=vNlbW5BESGJvfPoYiAxHVve6Qp3qGemZT6rrPldpdsyY4ftQs+y8S8wzpcLgRJtiB8wQ
	 AJirCaPgIRlG55BGktJiYH0Tpv4Ti13OZd0kaFdd6Iis1BNpAqaDwbDol3JR/83Oal43o
	 A0uGpf5KltXZEIShLBD5aYhR3OtfADVWvo+Utidv4ZkoSbHCdSWQRmlex5MEkZvlbhM6t
	 MILG6rBtMY9wH1taVp8hWXOX1NotkTJ7mVTAv9VlA715KMpfFQigE+IoX9jwDnYA4e+w9
	 zKc5rUBQLM5ErWshByL7mwUXWplp9hmjXUkxVdTiCPL/fK5+CaRmbf9ePq8EU+LjKxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBpWIN4H;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F06607728D
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F06607728D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBpWIN4H
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C818444EF;
	Thu,  5 Nov 2026 19:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBCE1F0089F;
	Thu,  5 Nov 2026 19:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908191;
	bh=wcOgF6I0KZL3tk97PgTaU7xCFlwNk82oM8K3Yy+AHys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aBpWIN4H+IPXlAf4uhQaT4gTnkT8RNUC+7KT0a19CGAzuyrH2d/d5QNIzOsDfREmP
	 OHKxJk5tkuz5k4DgXe7Wh5+1+7YWuRYhCjC2WLPI4T02sD3XGSQ7JvmzEGX7Id003S
	 qr+pMLJ3DE26ABn/dOtypdvXbUSh/97Bq/1VIZT+pjFsEp35N5jpaqxjwMn/jnbhOE
	 R2p5HLaB3AYWWLOynqVOowHnGoXOtdUD2DZVMSB/CNWgILqXfvQFedtAWyoFjZDWQk
	 o2a9Hsr2lNnZH4Uzfq7jkIJjVPvL/wlCIvzLWMQ9KqbzHH+jIPNP6nT3AVZrusCM3J
	 Mh6j2wX7Eo8Pw==
Message-ID: <sashiko-outbox-200006@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 20/26] tty: sysrq: let procfs copy in writes
 to /proc/sysrq-trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Jann Horn" <jannh@google.com>, "Josef
 Bacik" <josef@toxicpanda.com>, "Chris Mason" <mason@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, NeilBrown <neil@brown.name>, "Eric Dumazet" <edumazet@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Al Viro" <viro@zeniv.linux.org.uk>, "Jonathan
 Corbet" <corbet@lwn.net>, "Christoph Hellwig" <hch@lst.de>, "Greg
 Kroah-Hartman" <gregkh@suse.de>, "Joel Granados" <joel.granados@kernel.org>, "Kees
 Cook" <kees@kernel.org>, "Jan Kara" <jack@suse.cz>, "Jan Kara" <jack@suse.com>, linux-s390@vger.kernel.org, coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, "Takashi
 Iwai" <tiwai@suse.de>, linux-ext4@vger.kernel.org, "Chuck Lever" <cel@kernel.org>, "Jiri
 Slaby" <jirislaby@kernel.org>, tytso@mit.edu, "Heiko Carstens" <hca@linux.ibm.com>, "Vasily
 Gorbik" <gor@linux.ibm.com>, "Alexander Gordeev" <agordeev@linux.ibm.com>, "Christian
 Borntraeger" <borntraeger@linux.ibm.com>
In-Reply-To: <20261104-work-procfs-drivers-v2-20-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-20-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:49 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() so procfs copies in what is written before
> it pins the entry, and handle the keys from that copy. Writes larger
> than PAGE_SIZE - 1 bytes fail with -EINVAL now. They used to trigger the
> first key, or all of them in bulk mode. procfs allocates the copy, which
> is as small as the write, opening the file allocated as much already.
>=20
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D20

