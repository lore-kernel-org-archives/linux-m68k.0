Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906957;
	b=fPnqJdb8/eM4IYojK8OdhqFD2D3gZCgd4Mv7WO3WeJWHbUTxqgB2oy/GdjKaL+ld9VNq
	 9MYifPTBpaUJbmS8ZGvW/Ha6PQULumE4Ktv0DseS0MIgiRLVp7ehZa5o3GHhzr1tK33wE
	 7maE5PnI0ntXy501GzsVL/lpvmRXV83JHVBtpr+O+Ij2swZ2iq0KVm/zHANQp1c1k5fuI
	 ukNqbU/AaZ90oUvTYW1xJhnkrmjDKk89/PduVqvc5d6sMFWeSWsSi34hj1KRUNvgqOjAw
	 wfxWPzxfbO8OfQOMO7YZBbmxwyXcpjA7+d/KXYqFMK8kw9pornfNHjKexrIjI4ftGTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906957;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=Nyk6A7Xm43ba6GqhnkPuqyLDv4V2ioid2McoXcJIDec=;
	b=q13ZT97QCzeeDbFDWcSzW7wnc7bmoiS8OcYPHkSXL4+D7AkJRj4SPfHNpkUjrS3Yk8tU
	 UaVQl6yGcRCkScMCFhDLyEKeQniUsyK4x78UPcRLPzA8M4NlIRMRvZqqru3hT0Gqng4TG
	 3kitgUUakgV3UNBMg/HDYvfJQS5IH9Co1okBxDBtZSZ6zC95hfUpyB3UTbBssm/nr7J4w
	 SAfk3P/meOsGXVvp1q1ff1eybRy7j3xcGT8JMFWcNQ8PxJ3coqQACXT5AG7rUlHrc5Jpa
	 TIxH3HTn+jDGWuwIYdKr2x1/dSHb4lMZTn4G7gjq3s7X36eiv5JldKqRnKnJKEUoZvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FKfmSIG1;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F560606D83B
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F560606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FKfmSIG1
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B600410BD;
	Thu,  5 Nov 2026 19:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB75C1F000C1;
	Thu,  5 Nov 2026 19:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906956;
	bh=Nyk6A7Xm43ba6GqhnkPuqyLDv4V2ioid2McoXcJIDec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FKfmSIG1UN/LwBVQXjOkvO7J6MY6CD67myw1qrW+OIpPGU2VpRAVBUgr+00ywjUWT
	 wLAm/Bi+zzx7OZ9FQjICLzYsmc1028tuWSIQeurLxH8ygiIABX308i+7xPLywURc/W
	 7ILU32xExlaMpEA2rjZnORa7iwKiD+dh6YvkbgZ7JZXLtf1bwIEbU7n8vEFRB7/ma6
	 Tswhvw73a0gcOElR+tDfQALqyP4oqfrfBTv8JnT2i6bX4N7GoCW5irT/YJ10btLD9v
	 GZ/E7p4fjablgkPiTgV19jmiyQHA7eshOJIpKb/a+kzle33JJ/83PDvWIIc14A1u69
	 eI/S8mKdJSVKA==
Message-ID: <sashiko-outbox-199876@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 13/51] sched/psi: don't drop the last byte of
 a trigger write
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-13-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-13-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:13 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> psi_write() copies at most 32 bytes of the write into its buffer and
> terminates the buffer by overwriting its last byte. For a write shorter
> than 32 bytes that is the last byte the writer sent. A trigger written
> without a trailing newline loses its last digit then, "some 150000
> 1000000" turns into "some 150000 100000", and a shorter one like
> "some 150 10000" fails with -EINVAL because the window doesn't fit
> anymore. Only writes that end in a newline parse as intended.
>=20
> Copy at most 31 bytes and terminate behind them.
>=20
> Fixes: 0e94682b73bf ("psi: introduce psi monitor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D13

