Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717263;
	b=MfuU/0gF0kqGIVBXoLnAwF4JyOzAXmqyZRdnA0kLdokUGPtQjdW8VNNmMSwksnBEjJAC
	 qLEsJSjKWSdNSM07JD/8qO+Z2OjXO+RgAs46fW/dnMx3XGeL91A5eCzZzNTjZ56ki2yLd
	 dNRhHl16RGVnp8YVrtCnhuOmLN0mjC4xOKOyC/xVqBHgN+fTAZ4FmjD7BiiwOIoYzUMII
	 tfd7joE86MjR00JgQ6TMA8EPIC/DKi3qkWbx4HyzK+4NEZh94WfDPRZu25AZowxLdg/JE
	 vcPt7YeaV8bbEwIq2Yo1F9cwnyEF0l4BJ5VrdI9L8lyGwWpQyAA52BaCRHx2LmyuC9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717263;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=qAOPaMWfnZdlwVSHYL+9rw86rJbtw6B991RXjr/ZT6w=;
	b=ihJpkPtCIJoyM64AWpG8W5XzU9J1K6S8HBLgdx5SsD0UloGSftokVg+czwHUDDbr47CS
	 mRSU+T9znK5T/vl+AIdQezUro5F45Ko6gpitzlO6QDE+KlCrm7wAPTFJwvUZMgyz0x88S
	 upQqAok1lyOxan8RoImVHSymScPzupQFQkYtoz0FjLM9buW6nD82+eyPf2VPf1ufnoqHz
	 UQApcGcg4A6Qtk5pICmlGOfYLHDPGAGUgcXRXJGs0ZqCek5d33cpG0rtuuu9dna9lDpN2
	 9VG/ozmfDFZ1UXDeX6ZICNCj1GlUl4FiBF9uZxtbSdAQ+OOGB6TDhZnvFcLWfXKITDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A468O/vZ";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA4E606A327
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA4E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A468O/vZ
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B95866057A;
	Tue,  3 Nov 2026 14:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B431F0093A;
	Tue,  3 Nov 2026 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717261;
	bh=qAOPaMWfnZdlwVSHYL+9rw86rJbtw6B991RXjr/ZT6w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A468O/vZdHBCD7UZ8UlB4cSW6Wo1lS1VWajhi1pTgPoFKYre1RGq69cqrrhcrxsuF
	 k422eyUGzdP7ofPMeyLy6mjVTMbhvybiUdIWqaAx7URHqDYYBVQn6dZGzbDmUfE6un
	 qzuotRGPVzOaL405ACUuj2CaDtKcaw8pCw0kTqtzCJN67C+LtIgWy3OieZgcrwMx2t
	 zcaPbLjrTJ+q8VGMuwdq9ud2hPp8483QXmk3XHJSNg2Z2p61qNJyklOPHI9wXFujkU
	 I6veXuBMM5qIzCu924WMLvJ6+BN/lGnAxoVA5YXv2Dy7ECUP/Z98JhXC/AIwYDtl6B
	 3k+Ju+9+jEFyA==
Message-ID: <sashiko-outbox-195479@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 07/38] powerpc/rtas_flash: don't read past the
 validate message
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-7-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-7-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:47:39 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> get_validate_flash_msg() adds up what snprintf() returns, which is the
> length of the whole string and not what fit into msg. If the update
> results the firmware hands back don't fit into what is left of the 256
> bytes, the length ends up larger than msg and validate_flash_read()
> copies whatever follows it on the stack to userspace. Use scnprintf().
>=20
> Fixes: a94a14720eaf ("powerpc/rtas_flash: Fix validate_flash buffer overf=
low issue")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D7

