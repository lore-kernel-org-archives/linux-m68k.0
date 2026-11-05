Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906969;
	b=I4RRorBtH0Sdmu9Pp4RPtGtWFUu/C9jsClojVvlslBBgzM7jR6eQuvS/N/1C3OB+JaA1
	 G89aqJvVJuiZ3lIz6C8aCPiqd9fhKH/wCddJYGGz3hNnx/l9IhER9Bhf2qeQ8vNdpmHo+
	 v8JZsG11k9wU/Gw61Hl9kgaPAeOBk6mMVZpX+tl1rR7KeKqZfX0qq+aA0oqXZ/ehqgPWA
	 THJdcZqsFiAvfuMiMY0BMSUtHuJU2c+j+yqM2FgieAWpvd4rbT+v9fLZJNHmI0bDNiLUs
	 3q88qXLGGAescfimdqSr52Xu+yXj7ZOkMMkT3hlv6w+7+by9hfNAxZkJd18Nox4ccQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906969;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=BQI+a8njiZ/gI4hynXalYGlHTbeuK2z4PeQyurW9I7E=;
	b=D9gJUJsNckr5SmN1mziCw9rVCX5yi5vQ+74ghv75p9F86xZj5/tlVWgbL9cTRk4hUBoM
	 lNkQAuDkJ2EYm2T5gl3GqdlxmDXhBnCL+Iwu3VyzweecE0tl8xuWVpe1yCkBZ8IJElqAa
	 tS6QJ0ogPoYLwpzSfFnHNB/RpK+IHA2MSiHgcECgH1sm/QYwvxYRhZt9upQ92AfUkw2HY
	 ZFRMyBKAPwd/BYvmWpPov68Labyk6tN1glFer5JmBljfGDr7Ir6+35C1N/CqkTNge17Zp
	 w5j3ruk2fyJcwDcW1ptJ4O/Urtb87KACMYNImZRJs1eqZ/f254n4EJsnX025OEAFHgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbZWqE5b;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1509606D809
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1509606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbZWqE5b
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DDEE40DFF;
	Thu,  5 Nov 2026 19:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D932E1F000C1;
	Thu,  5 Nov 2026 19:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906968;
	bh=BQI+a8njiZ/gI4hynXalYGlHTbeuK2z4PeQyurW9I7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XbZWqE5bV1/7AJYMx+wz+v1eHMIKkyE8SQclRs/OPZo9iXZQoLwkmOhiyxQQQlhJE
	 8sowAoifBDVNyDNDLEaP8lelRK7/+buyxRsYnpXg78dXMLTw7E9r/wWQq/tiEDzR6y
	 aX+wD8fLSCGmqTUIYxuEFc1dqwu6r8nwV6Y//hBCH/Ixikoyl/tEaip/uUdqQ2AyFO
	 Hsl7wCQ5MJ8vCIV28zr9nojYTBgUQpEh6I3Qfn7gkQr2IO9fL1vbfhzhhz3jhjCt/q
	 EfQn7sAzxdZYYzvTAFpHP0LITOOhjBJNmZidQGsmC3cKnW5zohL3e3FGKtD5LfWZ7w
	 nN9DEaZl88tjA==
Message-ID: <sashiko-outbox-199882@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 19/51] xtensa: simdisk: don't read the file
 name without the lock
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-19-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-19-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:26 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_read_simdisk() looks at dev->filename without holding dev->lock. A
> write to the same file detaches the disk and frees the name under the
> lock, so a concurrent reader can copy out freed memory. Copy the name
> with the lock held.
>=20
> Fixes: b6c7e873daf7 ("xtensa: ISS: add host file-based simulated disk")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D19

