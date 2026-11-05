Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906949;
	b=jszvjFE6nBsEr/PZlpwhD0UBJoHx7D41diS38cuo5ynl6Z9V+JpKrAQAvSUKzMd0x+mJ
	 zDKB3/oIKn4VS2nfY7VMtAk7UxUIte8z8Ge4dYDISUyrVc3ygI2X20aN78LHLSHdjKhbj
	 5ESV/wXQ4Bo6f17OufR+E59UqWD8JjbE/7+UoSJM11n2rvqukeNrEkkmdoxmC4McUu8Mn
	 6qlyVBvcsy5MIt5GT6VnUmNwOhtJFaO24IkUpZ3lT5E0CvGsOWmiwybWajbXCEI/+Femt
	 1OoxPwAFShw7lOjmu/ZD83V6NFjjZbdc0MZjlapPBFHec7YCDpENmddf+7PZEy0AZxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906949;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=WG3GFTWAkJDkt5Isqmjqi8WehM/x+yRDWX3FB+RPiNc=;
	b=iniRvj+xIPYmBnfqHYtjrgsU52PtPZCoZPBpcypj7/R/QveQLcDzfcDPxMl9+elYEJ59
	 SIUv+Z3nM0B2+81mI95tnR1gUl4ZObAKAqE9R+5oneyd4H+dVn/Qsd+T5nLNcz5m2H1U4
	 qtVwbM8HO2mn4hq9fIH/LCiT74N7o1xG24HPNxAHsXHOREFuea7nABCw11KtSwS+sSiB4
	 VwZHbU9a/PSEiBNrPgU9n1ujyA+EYVoVYj19IVR8SdQDIGbwKILwDedF9aKG+NEajQ1ea
	 X/bDZmCN6W0ZaVF1qnb/IacqT0HeI/4hw+KM0hCDHFZfz9GWrM5dHfFiZM8FSYt+xDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ScsLd3rU;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872E7606A32C
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 872E7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ScsLd3rU
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 50313406AA;
	Thu,  5 Nov 2026 19:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25A51F00A02;
	Thu,  5 Nov 2026 19:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906949;
	bh=WG3GFTWAkJDkt5Isqmjqi8WehM/x+yRDWX3FB+RPiNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ScsLd3rUpDEsoGG4uwZPfedtyuaPFIkZIqnroJ2uSW01MPdhv2idSC+1XlNMnTbQy
	 u88LGM0YQBO1Mrlqg6jerItStf6+LzwF8Lsr7R4v4U4kuY2c8syp+rc9bdcq385jw0
	 SxzzODvsIb0aRcx1R2Kvuf/rtT0cKt6nSknSCqumzX96T91e5DtA6YJURkuUNYJI9n
	 3i8gyASNFFAdDsgsqwIHciGpNG/SqEafO+JQYVTTHIZzuSs4Uh6bsYTE+P/pxKW5OW
	 OoiVYGwGUHk1o1xftCnj3aU84SDpJJjNmbrsAYtky19RWlV85+fbPUVDVRZD98sJ2Z
	 VkSIOvrj7G9Xg==
Message-ID: <sashiko-outbox-199873@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 10/51] zorro: size the proc files like what
 they serve
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:06 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> The files under /proc/bus/zorro hand out a struct ConfigDev and seek
> within that, but their size says sizeof(struct zorro_dev). Say
> sizeof(struct ConfigDev).
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D10

