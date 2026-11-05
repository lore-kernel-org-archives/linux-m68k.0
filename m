Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908184;
	b=q6/bQPVMGOmVLBqiJUB3pTHc8TBx5DyQEGhI4n9lloihEhFbd7TQLE+9jMfr7eTI+7Fh
	 nB3bwXCkvFmk6wkOzY82uuJVrtk/AtndlSaTVfcaUX+ukirMukfgR/Vg1q7Z6mFmzKHJX
	 pH18cSjLYDkywN/OsZBjmQ5K36sN3VgxB41prVK3QeIO3V/DhClUA0KvrATe5j8P7Eae8
	 Twv+uBVwokQF+WA6XPbPgC67NpdkVBeUxD7YKIUSD4v1amUtSBmQ+u9r7grZf1BsaeEmd
	 uPXZAMbdoFqMRkuM8lkI8LMmOnMyTdOixdYMDp2V8OhFOwSGq5mjejFpkqAWvmFdyJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908184;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=y30rUmZBthh2E7w+0fysBQcYWUpkGcdPObgng4j+tIg=;
	b=pRnesOf6+S1hdbf2jlGbrKmA/SlvnqJ9+6hXNwENDHzW1Q2zMcbI2hRnjsi5BdcNe+OG
	 dFky903q87ojXydZrxSlSL/S2YyXp3mytRN7mnnQnR3LuGcgLeZpjt3KoSGFR6rPlqDGA
	 r928n19MRQeU2m8Xr249M7660LwOhQLBsplXb9P1IdUT/ggsRs2ujfMTtIqomwU2QS4jP
	 oAluznbFUNMYM5fERyM9OgPaHSdbazLrjJhdkDmwdYSOCmH88IEq1OkiJAbDum2igB4Fw
	 rxL1WlYgu+RCKwA/f7HnK4qkGAr1aBHVC+TeSvIivVWr2pjVdEaKumItwTE/rrp/8SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b/w2E8Lv";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEFA607533A
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFEFA607533A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b/w2E8Lv
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 441A360261;
	Thu,  5 Nov 2026 19:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748201F008A1;
	Thu,  5 Nov 2026 19:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908183;
	bh=y30rUmZBthh2E7w+0fysBQcYWUpkGcdPObgng4j+tIg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b/w2E8LvVx8iHqx7D9Ue0CrcEJDGjUmIXNOxnXqQGdQ8CRIytdZZV0C3FEoMsADj/
	 nJYY3Wvl7EF2S79oY2/r4412cFfniNBCO+blsAIXkdBnMSFelCv83eSKqxIwYS1DBa
	 FPl9MuYwM3scd8uuhT1rCemD0JfzZMYYMzmX1Z0qT2M0a2NUJGjRPdvuZLc4+h5oUx
	 +WIsia2dVnilP+Ymj37NjDa8uQIEaGtGt+DsnH3VmLYTfspWj4RkA0GcSkDRaFFEOH
	 YgWmHOGaCFnkKHRaeEP37l0Lf9NgIcgl4tZVX60AUyS0L+5dBRmBr414+nePdIbpxh
	 ylPy64WGp8cug==
Message-ID: <sashiko-outbox-200003@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 17/26] fbdev: viafb: let procfs copy in writes
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
In-Reply-To: <20261104-work-procfs-drivers-v2-17-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-17-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:41 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() for the files in /proc/viafb so procfs
> copies in what is written before it pins the entry, and parse what was
> written from that copy. Writes larger than PAGE_SIZE - 1 bytes fail with
> -EINVAL now, the output device files refused anything over 63 bytes
> already. kstrtou8_from_user() looked at the first 10 bytes of what was
> written to dfph and dfpl, now the whole write is parsed.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D17

