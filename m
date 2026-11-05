Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908166;
	b=33Gc0PDWosC0PxjS0eXIdAnsJSc54YKIQiBkhEUO0lgWavDDPlVW2tZYEsyiLDSUh6uQ
	 ISRJmWlRHHBDnGTCKbnnO1llA/eu7WTdCnwaqvdy5yaOedIr8ibUVBeOX66dLg9evyr2P
	 Owwe/3/EuTFC2pQ0y6TSo1r8JxlyADbUnvPE50y5FB756lTKkcO/BnE+8TJAHHxtVR8SK
	 DYXmYVHygbuRA5GW9aMGs/tDU4lYXPO6MzvOVQKndwrYrIPCG9AB1WsvSTyC6ObiJ5M2u
	 7+x4nRvnSpWQsUCQsOWNpyCRhoB7vaibpdJoH8+MrwQJ6wx7B5wdEzghiuCg0fK3guw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908166;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=8DCpDU22GwyUXXU78uGXllQ2v7g/KeXfhEOkcmL18gE=;
	b=RVEFSUmGRlAEhNF5dqT8MCdSAFLCI080h0XT7pSKCKfkL5pLp/t2xlC6RqFwecUOG9c9
	 xqPfB/2ToXSJWHRfPbdJNT+g4+ZaIj7K1kaZZDyCZWvJEVQx0aAP1+pSLjn62LMunw8fA
	 tHqjZwTKUSaZktEj7wEs358z883584n9Ry2ggL7/QKtNznodM6jUovAPAzNuXSYI2bsSg
	 s+Y23j5DWDaYRPDJKtSjdpfCVLCEwxXMimFL9N+rUJOFjwaAKZbLoZQcYYGs+K3jAS2mM
	 g8s83brj/Kqv0qAS93Fx+hqOozp2muZLky2Um7kD9SihjPQY92hmhl2C5sJNwlnftTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gNWgV/+5";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45A607112F
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD45A607112F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gNWgV/+5
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B7C5423BF;
	Thu,  5 Nov 2026 19:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02B31F008A1;
	Thu,  5 Nov 2026 19:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908165;
	bh=8DCpDU22GwyUXXU78uGXllQ2v7g/KeXfhEOkcmL18gE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gNWgV/+51cBdvmdPY926JR4IK8rz+/vZcfXSGI0xBmVXiL/t6jRq8/4Nqruoca4Tz
	 vawcVK0vQ9bvbGYHY9vTrgBf1kP1H2FyzApMaj2XIJwxAdZnPiNgFfrkmuYTwgBV6W
	 ZHCA//Ds/anFgU6W84v0MbRsTtA99oodwUjdj6/yr2ZrPpxwRu37LQ1EcMS8nmtakC
	 HVIopDwR8rn/Ktm/iUbTBoBdm8Ixhns5YqW4IMJYiFdG8hS6tuH4aHxrgj1PRTNuD5
	 +QRw+U9ULXFANcWxWoLkF1r36NWsWdEbl2HcFDxSQddl+XsQGSKgmTtqWuR2itRHyK
	 vK+cx9EEUCiWQ==
Message-ID: <sashiko-outbox-199995@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 09/26] s390/cio: let procfs copy in writes
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
In-Reply-To: <20261104-work-procfs-drivers-v2-9-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-9-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:23 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() for cio_ignore and cio_settle so procfs
> copies in what is written before it pins the entry. cio_ignore parses
> the list from that copy, up to the first NUL like strncpy_from_user()
> handed it to it before. Writes larger than 64k still come up short, now
> through PROC_ENTRY_SHORT_WRITES. Writes to cio_settle larger than
> PAGE_SIZE - 1 bytes fail with -EINVAL now, it never looked at what was
> written.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D9

