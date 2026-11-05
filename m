Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908177;
	b=4gXABmG7DQnh2lY0t3f8fYCKleYMu/OOIUH7X7C74OvBZK5eaPhXk1qhuz7pNeffOqon
	 tnfkF4ti85L0JsDqloVp5DoREQ3IaC0VgXEZ3Wzq4Zta88fXyvARYZV6/sUuuxoHVcldq
	 7QmkKgGqbyidnI9N0RIrEAUJ+poSv33HVKaaWirrEDdX3jJsEvtQKLcc4tOjE7wUpB7ex
	 Hqx/foFpG2daCz0zt21j7htBpq8KrhQr0a+jnolWqcLobdfh+DHV57KpmiEyJE8vN1LdO
	 dJb4n0qdtN9ERTuu1ertKQ5wsHpexTgGrcWWsPJ0oim1A40+TGAvqJEwEY+VoyKZ4Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908177;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=YHZ+8uVKChAh8PF+oYupBqKKIHEYIQSDJ+Uo0ScX9Xs=;
	b=y3W33vQg4AWk/dggpXWAAwGRLL82RCzBrsDq5yRosCWRwL+6ym501kNAHNX8ahQ3ZeJx
	 cCfPldBlB5NKjj2NDMwbfdd2nAxqfNsv5D3ZK3AHdPA7daDmhBC/nkdYK+bNPN4Km4k7U
	 G4Y/hCcL2A+0HU1v9aFRLrVl+Y64/ca/21brKOLi+6RwXNOwIf8zjbFesYDG7U1VeI2xo
	 QgjIt65IUzJm2D/yhSH6vg4ZLg3A/TM27LKvOqbeAaVqqi05LVY07asu9XtmCDhvVss3B
	 SRNwZAwOCE26NVey83DRZDah9c0JSvuO8evzk3DiBDmEb0G8Au5Yv1W6LX0WTvPZi/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTUjZ+LH;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE16D60741D8
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE16D60741D8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTUjZ+LH
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BDADC41644;
	Thu,  5 Nov 2026 19:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438A91F008A4;
	Thu,  5 Nov 2026 19:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908176;
	bh=YHZ+8uVKChAh8PF+oYupBqKKIHEYIQSDJ+Uo0ScX9Xs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oTUjZ+LHGRLtXvVbZZDdkvr/3FbUoJ5JC0paxyOu5pDlfJHlHkOBsOwNasDvP0viT
	 Yt4Mn0dAlZdDu3946ErpKG3x6Iu42iqPThIm1GzwfjcnQRX8wGZvcvvClj+htNFMSS
	 TM0wu3gZzNVqMHpO7vFYfD8I8+qfweL9IwVhZVjwxSX5WvnfuuQ5RJ0xrIOlMS8Uug
	 M42glIfUq5MbHJN9B3onJDrdfoMo/NDXrTNDCA+5igP42UCzVhk7hD/zyUwE2ljVyY
	 jtZFjNOA8fUJWzqMOUwZQBwuQj1gzvehH4N/d3NUHSrF+ADcUI+y6Is7zLK/no+YAt
	 GZNTVxlfJVdQw==
Message-ID: <sashiko-outbox-200000@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 14/26] scsi: sg: let procfs copy in writes
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
In-Reply-To: <20261104-work-procfs-drivers-v2-14-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-14-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:34 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() for allow_dio and def_reserved_size so
> procfs copies in what is written before it pins the entry, and parse
> the number from that copy.
>=20
> kstrtoul_from_user() looked at the first 66 bytes of whatever was
> written. Now the whole write is parsed, and anything larger than
> PAGE_SIZE - 1 bytes fails with -EINVAL from procfs before the
> capability check.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D14

