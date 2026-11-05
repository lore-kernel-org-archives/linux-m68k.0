Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906937;
	b=sskReRF+bGSEjiELPxOKHA+r/e52ZC2bAez/2IcqOB/vKw2D+H3XLcxtyILZksukkpSI
	 lkrsuF6tp5Re3GoPGWvRAzx4lSgK1TonZgxH+Qen6AwLp/xI77YQJ8/7mHdlKWtpdR8Ps
	 is/rEf0va/4q3AFTjP8E8CcxZh00lzI7+CNskaBQgqbcE6N88WOvbkP3mxWDiZu1ewA9z
	 YRaFBzwy4PmnF+D5aeJqtZHXUw6jdHuArpBba4vQxrD+5FJCCSl1nppJ2/neBGzsu94vJ
	 Z6zbH0rsQYq+JXDqq7+sXTkY0OvjQcRpgmgkNvqG5nS36Vk5GpcaYpg6JL6MerpgP0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906937;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=DrjTmat1J2FdEKELfc0tb5qP5SKO3u8dr9sn5WHr8X8=;
	b=2bmb+xht5+oU94MAfvDS0DZfPKm3fsx21/D+/K0eisQ0AoUr9z4FfObD8TKrwP1uGthU
	 voyqAG+aFhUqerL9Ybe4sR/gnQk9Ha9ult4pUkj2gC9RpkKY/G+G58WfjuTBdNSOfjjxJ
	 9xIUUTBkFaJTP/SEDKHRg+dg+TS9KOcYIUQQ7trH8cwmKuSqDxKYAtuV5VsLw9JEPqwmv
	 Ax6OSnKgqlhzNraLM/QoT67SwhWL8soZQ6GoytJuSTx6l9+h9LZH5VDKD5sjiRzDQL+rZ
	 tg/XrhZnLifo6NWFkNtKoWfu61nhmgGrZ1sqHQ7PGwIO2sPX6iTaZF9c2Nd6liWtd4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWpGZ4Rl;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB9B606D832
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB9B606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWpGZ4Rl
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 312C5601C3;
	Thu,  5 Nov 2026 19:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBED1F00A28;
	Thu,  5 Nov 2026 19:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906935;
	bh=DrjTmat1J2FdEKELfc0tb5qP5SKO3u8dr9sn5WHr8X8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JWpGZ4RlWoj2+o7rDOgbYtLD5GBP94pE2VNBU3WyFn6daNIqMb569ZSjbdA0EeSOr
	 tAzkET2HaIHRbLQu45I3uimLTu8RZeZWJbIffcQ2/w3JGBj4a++BqBYReMLzdb5Sog
	 qVScSeuBZeP4+0XkYuqIPKV1z9HgOT23/QBUP6cy8q34hHyhoqKFStqPtFfmyeBPB9
	 XZe3Tm76jQQVReuVAANs6Njr2e6pTi5vPjaUYZ9qEi/4DpJTujoziNZjE6lkL79ePk
	 nQQYT+CwPf4q1428aPXyvT5gzbZSHUrL2Gr9aiSU4j1DnnvA0JPFAyBjqU1sPq9vkw
	 JeDEpGzOxTYeQ==
Message-ID: <sashiko-outbox-199867@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 04/51] PNP: isapnp: don't go on when
 isapnp_cfg_begin() fails
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-4-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-4-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:28:54 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> isapnp_cfg_begin() refuses a logical device number above 10 and a bad
> card number with -EINVAL before it takes isapnp_cfg_mutex. The callers
> that read and write the device's configuration, the proc file included,
> don't look at that: they go on talking to whatever device the card
> currently has selected and then unlock a mutex they never took in
> isapnp_cfg_end(). isapnp_create_device() hands out logical device
> numbers without a bound, so a card with twelve or more logical devices
> gets there. Return the error instead.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D4

