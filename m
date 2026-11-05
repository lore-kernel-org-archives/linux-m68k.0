Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908714;
	b=XbE8Xi2WJ25lxnO3ADeZn90IZjTp0c4tg63V5jmHKXkGCHspAyhWIAuVDQFKicou3o0k
	 GKH4BOEat1LILmDBzODy+QJgfE5g0N3xaLsOpidSe8LWsci2GJMB11cA1ViPYJHhKZMmJ
	 4QjAWpxGxCpC3W94JtAX6Xl71F1IQIo+ygUE8Cf73bW/pMyRYILdrzbA1gL2VCZkkYtau
	 83y9ub6UhhkYMR4EdUtJxDc295e6v8HpGTQEkDmwwm9F6Ps95tNmbnGfiwtW19CdXpa6M
	 qLI+EKtwDuQ3U/NaxqNsf0iKqqHaHM/+SkjaqP2Rfd9r/2ouuRfQ0/bP3QK7gKbOGAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908714;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=Fu3D7KbVL0XALbxpOg/99/chjuCyMPlpg1MAOjhFXPQ=;
	b=yP6E9UgKtxU9GDH3TvFxEl4dRzUIzHWyucJ0eyYC8AqKr7q5A/7SPwwnUASdVoaZXyRQ
	 uxeVU+tov5PezO4w2lOEZyhruCwtnT1knMZux19HezRYUEbRchANYbUu+nGu0XesQRCFw
	 UaFcz1twXOns9R5Ir7eR5qkR2cpQnKUFfzpdFfndy+KXOn9Hp4i2RLjkzaWTha5xzJiVH
	 yHL9zEzfiSpNwfWcImxNg+LPHCDCv7wQir2WtbmNfAMuYRBchpDHvUNQL3tixwaqj4d0U
	 2N6m2GQjB/XmlG9uhELTC4ETrAhJLvOmiw2yqmZbbR85goZ0picpggEnusKLWiTdPeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OumfSaDw;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EEE606B9E4
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15EEE606B9E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OumfSaDw
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 55894605EE;
	Thu,  5 Nov 2026 19:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA431F008A1;
	Thu,  5 Nov 2026 19:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908713;
	bh=Fu3D7KbVL0XALbxpOg/99/chjuCyMPlpg1MAOjhFXPQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OumfSaDwTNZBpGJOWzIaiT6pjsiHCqCuEdUaz66yitHN1nNu5txd4yS9N4qziqeuA
	 jKo6oOvNVnrmW1Ld/SRNRJlyIoYW+xi575vQWaVzSfKh4Q6aHkYPJ0bu4ianMe/ryp
	 FY85+WivxPFkJEXo69NxZ98f5CWKvFEwF7vR5O7X1Ds9ii4+w6KQI6rHKutuqKTC/5
	 PJGugGwCCkbyMgPLbKXpkZegV1ou950ZWOzXqy4ZhzEAo//gqm2NGT/LmV6GGVGIFw
	 GkRGt05JBCoUhdhRlgBNsfNUA/ok0dXb29KIdwCOoyz5PlaaZL7x/S1TIIAEL/3HQI
	 uTDOX6NycFX8g==
Message-ID: <sashiko-outbox-200064@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 30/30] selftests/proc: check that unloading
 configs doesn't wait for a reader
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
In-Reply-To: <20261104-work-procfs-fs-v2-30-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-30-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:58:29 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Read /proc/config.gz into a buffer whose first page is backed by
> userfaultfd and unload configs.ko while procfs copies what was read to
> userspace:
>=20
> - removing the entry doesn't wait for the reader
>=20
> - the reader still gets the page that was read before the removal, and
>   nothing more
>=20
> - and the next read fails with -EIO
>=20
> The test loads configs.ko if it isn't there, skips if configs is built
> in or can't be unloaded, and loads it again afterwards. It needs
> CONFIG_IKCONFIG=3Dm. kselftest-merge keeps the =3Dy that other fragments
> ask for, so it skips there.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D30

