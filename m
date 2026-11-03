Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717264;
	b=4UEshNVEy9wU0SFltyr8X+6d1HN5xnuQp5bIoOumAs3wQGLI2h3mjsycXB0yTwPatu4I
	 ZUWQ7sGvsKI6f0gC0EFV0hr5iHulAHA0rm719TmASk6s4ojWG8G37VKLx/19M49kz/1Vq
	 rr3kWfY2Qt99B9IAyisp9m0Gd9OXhkFLRWj9gt24yEZikhA8dG+JCXoS5mD4SVdQ90rsd
	 m0eoSO9T2a6XGKJ48ypYYRRYuQL+HRWhnJJi6dc7LAfxp3q8IJNC2SCM+51b1Rxg1gdRk
	 9CoGLpc9MKiLbObbLyGQ5rv+Pq012pdy5M6RlwIOGr7RwDTkRDbEoM1eNSsXMiJk8wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717264;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=qqwJwzLGJj1Hxu0TtHvbrL/TW26gUB/OdlTGsxg9/ZQ=;
	b=uIPvNWjQcfn7Fe7oxFQt5k/gJLRzgU52KSlpZ0PP5rbqxOKNeTeJF5lzAtq1L4ejr3dn
	 rn7hMNwIMEmlXauhOeW7PE/S4j9prDozoEgzFTvbR8mvaoijDFXn6FmX28eQVLgriT8Ms
	 fNlxUBPj9cSzsvp64YzajfsKsDixhNRyFPhOaH3j2iwiw4S+OC/3H5ioEWvbJxGZ4xupA
	 M4M7/24OzayQu/p7fz9vMFI3RXMraPJlh9fcZXe5Y+x1CKTBFLkkWEI8hTmoPHsuEC/Lh
	 Sv7UgVMBTMdxcatwrJWkSDZrI16FtBOSq9bT1wgp0ldDzuEkrpox8w9aJl+mZIfzAcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CDbtOSLZ;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8A5606EEAA
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A8A5606EEAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CDbtOSLZ
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 973AA60120;
	Tue,  3 Nov 2026 14:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE121F00919;
	Tue,  3 Nov 2026 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717263;
	bh=qqwJwzLGJj1Hxu0TtHvbrL/TW26gUB/OdlTGsxg9/ZQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CDbtOSLZ+8yKwhiyTrZueHRtkbD/K4tLmmy4X+oFVLra5s9kAyEBcR1gnyiAxEwvb
	 rbMmayi0VqbgvG1CWLN2RxUjLU0f7l4Pc6HAXZ+5Slm5w/5I4G5mgxQWFAxctBkeBi
	 waGJQ835WDXjQZppvthgegMD7FtQID4nd08fdOYV6vgEWnTHahspHuoOQ/+33AFRYn
	 66fjb+PlsNW//zyn3cyHMf9EzHPX71CXRYl5jssVED/E1mdo6WOQ44t+RR1+s26rfG
	 K0gMlvNMOK7DFg/Trp8u+j9wNl3N53oxeHeaFuWlV6o0eOaUIlpaLpGuUZm1lL/tXu
	 HrVyXF6yAozmQ==
Message-ID: <sashiko-outbox-195480@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 08/38] powerpc/rtasd: zero the error log buffer
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-8-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-8-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:47:41 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> rtas_log_read() hands out a whole slot of the error log but
> pSeries_log_error() only fills in the sequence number and the event,
> which is usually a lot shorter. The rest of the slot is whatever
> vmalloc() left there. Use vzalloc().
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D8

