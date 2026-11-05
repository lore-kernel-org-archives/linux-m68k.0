Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906963;
	b=angAgKv/wv1TkrchU25c1ZjtK7QM0Q5F8VD22lNrCRmyeEBaYT6acCjXdPaP0Xh1/Xsp
	 sBIerlEtCvutwrWOqnq/NKtccJhilUibqMf7Y4YjRgResCODrnjQfK3W+j2BcP2hkgjpx
	 sp9E7svViLqT6JxgTPoKCSVWGN8RDUUwGRrA91ov50fp4hYSzf40wAzgOUWX6utKxtsMD
	 GzMArAHt6uC8urnV1GlSFvQdS4mhRMnpymzf+yoCqz+WqWyceIGCj697sFEOiQfLLmuV0
	 m7daho7UT4mFt713s6p2Gd4cPDZNGsm+24ylIH0qjpeYFwyXZCclUltzk+x5Phy/CmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906963;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=3aycYEBDbjdfc7/kYe/T64Q9jvyJ2iWA9tEfOPLcA+E=;
	b=xBbJ6lnKE7di8OoMMPyoG9deW1QRXBzvGHhmNoejzc12wC1apsxkoM8PLLwg4Ct8TApB
	 GBbI3SwkGUjfSPdRzAaoKePwMcow8jPnx1AnmtE2Yu96SjYAMwykunmStckztKZzo68Mr
	 O99FPEmmutYC8yFwYiA6ymj3GdlK95Fr01vKV4m/TbO/2/++0Vf4yt2VKxCeBSGNTfs/E
	 L6oLhZ5Qw4i//K1u1E1WvZgqQfdB4mLqKVhLXC/ByB2Cpm9Ys+bRDwaR5QXF6/qyYmYi9
	 0QCJ7aCfpsZkzVmv5OS/HclUge1tfjt2WMcg7JWRqFyXVZrHP3gjX0IykaPJGYtBOKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MKTd/AG4";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B326082BCB
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B326082BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MKTd/AG4
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 75BD0437D5;
	Thu,  5 Nov 2026 19:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10DE1F000C1;
	Thu,  5 Nov 2026 19:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906962;
	bh=3aycYEBDbjdfc7/kYe/T64Q9jvyJ2iWA9tEfOPLcA+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MKTd/AG4bVwkR+b2GF208LnMZfWrUlqFbm1pMBbSDD3WYnbXwqUy5VQ+lWyM6SNJu
	 lz/dclSSpegfq5SEGEfBf6625Y4g8OyF4QW4OLSTxiOfTue470fGd1TPQdSpTqnj43
	 ICV2RKLESKaBxJNaibArgn3ldui1C2dpKkNatkQarCY+t3PhxnSOeaKuRbWfL6/xAE
	 ZShLGqZSqpc+z4DdGoHy5h26wpa023m96jQ73G3zVSjOVmGegLWzLyUhy4LNOhpUwH
	 uKO6G2AHPC0IQqrlvprv/L1ZgqClTdg3drPRJPRNRieMLhpDrh7lJjuN+buWWBl5ZP
	 SWx5hlboXGHTA==
Message-ID: <sashiko-outbox-199879@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 16/51] PNP: isapnp: don't read past the end of
 the buffer on a large pread()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Jann Horn" <jannh@google.com>, "Josef
 Bacik" <josef@toxicpanda.com>, "Chris Mason" <mason@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, NeilBrown <neil@brown.name>, "Eric Dumazet" <edumazet@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Al Viro" <viro@zeniv.linux.org.uk>, "Jonathan
 Corbet" <corbet@lwn.net>, "Christoph Hellwig" <hch@lst.de>, "Greg
 Kroah-Hartman" <gregkh@suse.de>, "Joel Granados" <joel.granados@kernel.org>, "Kees
 Cook" <kees@kernel.org>, "Jan Kara" <jack@suse.cz>, "Jan Kara" <jack@suse.com>, linux-s390@vger.kernel.org, coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, "Takashi
 Iwai" <tiwai@suse.de>, linux-ext4@vger.kernel.org, "Chuck Lever" <cel@kernel.org>,
 =?utf-8?b?UmFmYWVsIEouIFd5c29ja2kgKEludGVsKQ==?= <rafael@kernel.org>, tytso@mit.edu, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-16-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-16-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:20 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> isapnp_proc_bus_read() truncates the position to an int. A pread() at
> an offset like 0xfffffc00 turns it negative, the check against the size
> of the configuration space passes, and the loop then puts everything
> from that position up to byte 256 into the reader's buffer, no matter
> how few bytes were asked for.
>=20
> Keep the position as a loff_t and clamp the count against what is left
> of the configuration space.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D16

