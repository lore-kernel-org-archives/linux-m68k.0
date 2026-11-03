Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719148;
	b=L9GLKXn2+x9g9QvKKDJw3c2AJGoGFsusSg4bYMHUWVy+xtJ9luXBm4X4oSdAHd7Y2LsU
	 ppA4tn6u/sv55tw4SxIaKSFhzIQDJII8S+4zuQVTtlxxu59uWk4JIa8j3WjpvCWmMB5C2
	 eqN8pDqQPMUb6fiV8+BcaXSP59ItI7PLyk7h2/sRGGWjIrIym9tBvY3cOqBcewB+r6TXp
	 f9dxAiMNPJ6Xnyhe5XYVfgzGigSHvNcwMtSIXs1rRTHDf8HQih+KJ5ogsTNQ5KEjs15Ki
	 Bdb77QZcxWlvPtJyuxTJjTDEVamorIRZV4Ttcefo5ewSDY10B92mOOwAqAE6lLY+ACQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719148;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=1669At5pGJiRDZ9q9xSvM+3vv7+5NMnsw09fzaDlx10=;
	b=DTzG+AwjN1iXvVt6KH3WpDR/6JNaurVEpdgfAlM0ATjmQ52aX2tqzdZfxswCgQU0+uFy
	 uebirZY5IBoTQBUbg6vMP5BR64Rw1pUafDxUZ0dD0QgAtObVadauskZfppS0LmSlc9hZe
	 4txwH+oES7aWaIsaZ2fON/vPbnR4yJBNdkZ9/aAxPeIyclai2wQ/uZNAdRdHZKge4xP9r
	 JqPZ2dpa2fT10oLNLg9O1nJw/UKbBrD5h4E2rFsa0A5SzKryAvvEYli5Cc4gyCuMK7yN1
	 EhIypXFSkO6NeZQmd8q1Iq+QuFnmWiUVZPAEzHiBwmJjbYAWaHQTn2FpAQxh59+F2sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZfT8cxp;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E487460A3825
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E487460A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZfT8cxp
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF6CF414E9;
	Tue,  3 Nov 2026 15:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4961F00A15;
	Tue,  3 Nov 2026 15:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719147;
	bh=1669At5pGJiRDZ9q9xSvM+3vv7+5NMnsw09fzaDlx10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JZfT8cxpUtmS3Kfu8V8PLYWnJuG3QySVD8DWoG504UE/BwxXpC7dHd7PKrOTZWHmz
	 I6RJLz9S/hhhp8+eQpZpz+oEIOWxmfWCL4bx500g2aQ1hg05iA/9HRVNHvNFfHL/Lu
	 tBIfPhSNRR3m+YTao2Y3H12toeLC5vMYzC3SZN6bbXZOKGGZmByWURolhYAfLYTvaz
	 zimX68IlrTRwQB5vLHbS+EwZ3rJnfI2C495z2dd+hJXKtSlWsTPyKeCr1H7ROdmD8w
	 jA4rMhtSMKdq7Fq20Y5PzuwGOJlfb0TFWxTgVxa0smDFU7J4nuTjB+0C0F7Qu3VQJT
	 86sM7gi4iXHYQ==
Message-ID: <sashiko-outbox-195599@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 19/23] tty: sysrq: let procfs copy in writes to
 /proc/sysrq-trigger
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
In-Reply-To: <20261102-work-procfs-drivers-v1-19-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-19-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:19:05 +0000
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
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D19

