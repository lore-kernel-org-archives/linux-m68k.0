Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906980;
	b=wcEgslKZMiowfxqfK89MDzmSSpd0yJQiuAY3deC3tndvier49tIudFxQFZyrB9iXffqW
	 mP6Zfijz1Ia4xbr3KgnZyjG0nJ4qmWcTewneKknfg0tNyHP53cypB4uiceqXzKQOZcLAO
	 UDgXoLFdBkS7r2GkG0NG8Sw23z3oix/NPLbC43iY8f5zw8DV+w1F6n3SNDa+46kLi4zqe
	 5M5twUE6z+Yq4qO1fe9lUT3PdMnjhle0OB49AN19mJzpXz5baWpxtLcpz0UKjD43S6bBF
	 oO1qM7wNPHKAdqWpLuIu4YeF3dEVaA5mNCkrfO56yIUTGDj/Kcz4/AloF/cOylkBEiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906980;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=b6fUC6kkwZa6jGlElTDwWL2u3gjCO7plwWOIGlwpTiE=;
	b=KUsk+XmCUeEPTvkMY+xwcUDW1Je9a3yw+541BAIyYrdxDdMGx4OiTG6uK2m/lq5UuOzg
	 BRBYlkMOUVMUIDDKc3SHI5hjRft/9jz6ngwZBXmsLp+pD09I//bTcirKopPF2mbGgWTYl
	 9dVjoPqqcLeDwWBz7+XCpUAZqAIfEJbiJSNxdMle35M7Ryc1vVlMCXLP+VWMXt07WWiHF
	 iSxbsTGPdwTxPYbozgwOmkm7cRR8DWclH520t5S7/w5HEYfi9NSGXoOSN+K+0ElEBxdKL
	 lvxSp9+5Al5XA2U5yKibpWPU5ujcC/ckjU9n/pzOKNoZAC2k0ceguXar8TS0GK6SwUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqLSjmTq;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48248608362F
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48248608362F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqLSjmTq
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F170240269;
	Thu,  5 Nov 2026 19:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759BC1F00A15;
	Thu,  5 Nov 2026 19:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906979;
	bh=b6fUC6kkwZa6jGlElTDwWL2u3gjCO7plwWOIGlwpTiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MqLSjmTqIqsb3uOWNf5itle2+YYZN7QrWSpoAg2AznNJeMGlmfOcDv+I+qQC/PV4q
	 oM/ttZIktk3u2UEYRLi7imIYWeewjGd3g46pq6DVdFDvsmQYVdGsBKqCqZVdWS7N0i
	 tpm6VNMiWBiuscCgtZGDWjujl0tFlJwCL6trdEqlTYYAMvmUvXMpnGyxWVrHMwosBq
	 djqV34NaddaXWJ7uOvgZCHtGYdGCHAEcWmVpgX6aM+BtPqPLPWgB3dldmaWXncEaVj
	 WhGPLyMA3oP8jfMvyP0VXsBlKe1NFyI8lrBj+VpezDdETg3MRYQS3J8VE12drFITzt
	 Ytd9Y83ZFgpZw==
Message-ID: <sashiko-outbox-199888@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 25/51] wifi: libipw: don't return 0 from
 writes to debug_level
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-25-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-25-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:38 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> debug_level_proc_write() returns the length of the string it parsed. A
> write that starts with a NUL byte thus returns 0 and writers that use
> stdio retry it forever. Return the number of bytes that were written
> instead, which also stops writes longer than the 11 bytes it looks at
> from coming up short.
>=20
> Fixes: b453872c35cf ("[NET] ieee80211 subsystem")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D25

