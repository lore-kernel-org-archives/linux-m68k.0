Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719136;
	b=Iu3D5LLmbCDsIc25SQGnCQENY9tFL9DdZkfZ/vcQjRt5kK+1F03XRTxx6yVJa4OE+fed
	 3KH633zFEcL6OsOw8/1VKaNrwmyj07sZ0TBwKUT1OHFY5bW6eoqN2pH7UQxnYDCZtGF0n
	 jfclkkyulC1ycvWdDcY4tH6zQq25VmvEzjlau7Fi2aCijfAGB6gjPFR570jaKr+fa8nKb
	 6J05LYm0LwrWvrpxgTbu0hb/sNj4uMC15HuVNLa3wGXvfKG8epupITt1i03Cb82atVA8T
	 0xxByHBAROWVguo5mPSuBdti7dCWxZt8BXYhxmcdroMCPsX8RarWeunyEzWaKRg4FXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719136;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=iYYDAQ4EAaFTojHj2S/IS/DlVIcz9P9xTbXP/dOtwJQ=;
	b=rmQSR3KYdpc3i8oHELQIz/i6ta26bq8RzMrJDASmDSWzBVTNbqe9ODguFkWactJbHLdD
	 uvS5PfkSydo/ojMftmmmw/Ht2nfyO0uZ6zE2XLvMJDNLhlqqyl8sR6Srf3oybfAyIcNgB
	 tVK5mRQwntvGEw9xkWn/cG158tow/T83jvHfB7BQS1ANRs44aNnw+z6w9qlehgqeylrpP
	 V9hw3T+WwOyGUvVuyVzV9x9A/8Y4/th5VRPW3nCzHLjg2IV9czYadIEvztpkZMZbig6gY
	 1pNsSE1b3Yb8LtMnQ6CFjtH4XxfhzXWXJYrx74eVWKbpbjmTZhFo8J/1UPog2L1mWaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+3F0H5K;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2B06071A32
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B2B06071A32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+3F0H5K
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E47EA60A54;
	Tue,  3 Nov 2026 15:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363BC1F00A15;
	Tue,  3 Nov 2026 15:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719134;
	bh=iYYDAQ4EAaFTojHj2S/IS/DlVIcz9P9xTbXP/dOtwJQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E+3F0H5KbEJBZo1I24LPwaX+Na4LHasmV3v4LtadaUaTQD3umUuYdZ8ca+KGfkDAP
	 qNrBUn7y9LjD/oybvflZdkENEKMguqn2R1IipnoivrEj21pGQL6d8oVnm4Wp6n41QG
	 I1WY6ZGFPNQVGJvuZZ2fT+xSlwX5FrZygE0DGw1KiLlprDoSQ68MdVoXik0agD95Df
	 YT883GFnPCcBmGGBRCDtBQan08iKSCeJT9s0may3cbwXZTQ9qXWgpU3QOTOqeSphOQ
	 RLFiG9EFcDDjvp+V5Qc+pKgtdVL7R/TU5Ji0CHKr0CSHpBLxQSyDoBcXjRSt0XfCLc
	 ncHjXD9/H2xIA==
Message-ID: <sashiko-outbox-195593@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 13/23] scsi: sg: let procfs copy in writes
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
In-Reply-To: <20261102-work-procfs-drivers-v1-13-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-13-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:18:52 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D13

