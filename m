Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907327;
	b=M/G1WY9mFRTjWUbH9/Hlhv87W1RfHrvU3Ul24ocoxZ2N4WhPV6J4x0y8V78q6Wv+kDuD
	 RJOEAmAhlyCb4s1lN3SQEFmMdR2S/gIWN4qhU05NPfecP+mHk6glS7+R7nijYhyyy7k5X
	 e2WwhJHVutU/o2BEvHxHkRFLcjQkUo6+43IYWcW+0upa//b3NKm4D0bKXoPyOn/tqP1vH
	 xeMRK+jdTjreR9/HbE4weu74RPYixQv79ZK0zL2wb00yF+4BmJ0r/2ImwGTO1bzTtdV6V
	 NevYlWfGFhaR6er93z6E4IVMzTlbhhTAa13UvFO12w61a12ILOEu6lGg28BR4pUS9gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907327;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=F/UoW+sOc2HdnM1BLVR1TjnkTw0OxVwi9/ME7zIv1Lo=;
	b=xGJ1E6henZQc40fjRoFLYShyp8q91wEcmDKQp9yZhGS32Nx3eacXTvq1L0vJgXrZ2Xra
	 U9Y4/r8dHVmKD9w6M4epJFb6gf2uYXQNhJ8qBwTJ1k3nX+Zr13NPoWOzcDef+xMc+wAD0
	 /jMz6t1GtrD74+Oq1BH8YJFOxogdGmI98zoqB3J2We4CE479bSMLeSQieRucRvdYqCKqV
	 m7s+tp9P3W6iOMjlyWzsRSyPDO2uccgujcdbnvJMUW6uUEdXApHBsuYsN8FqFHHwi6uYh
	 Ue5Q1rpnD0gs7oFxTcHSFRwLTX3tShfy8teMdzO0OXN3/gP+jCgC/FxfyUQMKPF9eTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eZgst+9B;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D4C6077B6A
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D4C6077B6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eZgst+9B
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BF54430C5;
	Thu,  5 Nov 2026 19:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6CC1F0089F;
	Thu,  5 Nov 2026 19:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907326;
	bh=F/UoW+sOc2HdnM1BLVR1TjnkTw0OxVwi9/ME7zIv1Lo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eZgst+9BEKBGQHd6Yc4SSsgM2sHlKEuR0T5yhpRyV1N8f90zfue+56ibafby4dJx+
	 Eg7Fvfmkb3cTym9vc5ROZ1rrKuIJSTFrgExCYgbnf0y+ziiRmsVjJ9dxed4HuCBV4q
	 5uL5mVp/rQjF5m8Ui+9Qt0p0mBIGHNfu0qpzxmjQeaQJJuOzK8OPu6qkpRNMhhgbiK
	 p2ylt7pkb1GuM6sMhTPZ1tVcwsvhXExLew8xUld1v7W90+Wv7p7+DVJm3TEvGfvofh
	 dDCTWZx814OVrrDoYCBbr8yfs9b51aisCQZMr3QWJ7ecXsS+4grEMPZvNyNDiyx1P7
	 YK8pP0IzbL1vQ==
Message-ID: <sashiko-outbox-199936@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 06/23] proc: make room for more entry flags
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
In-Reply-To: <20261104-work-procfs-core-v2-6-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-6-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:24 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> ->flags of struct proc_dir_entry is a u8 and the next patches need more
> flags than it has room for, so make it a u16. Bit 6 stays free,
> vfs-7.5.mount takes it for PROC_ENTRY_CANT_MOUNT.
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D6

