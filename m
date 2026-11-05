Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907318;
	b=nfZyJcMlCOe66RN4rDPqUU8oqC7VqBbpqfVmeuwg1hZuvf5/MjgwHmLrzWGBNTLSNxns
	 4jNatkMqmr+wdpNO97jjcFma7buYp99liWTTGV7sEDCx5DtQc4esF9NvEAbrEkfVoOIvY
	 Kz12RtNNwWIgB3Nr9q3BMaJhBbVTqTGm4O2PfYK+12aZuSLZaT+MmqAdiz0DXolJqe5oN
	 TEEPCgMwGPQcjbGruakUQcrkE4Nizc3NOR8G47FAhMKpb5MGb1mI2d3S1TeZQn6W44qBj
	 45IiT5aRSXpyeOSWItlhs8MUFqF4QWfcZhccwjhZ0/EJMFXW4E+pVT0HXgWYWShgJEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907318;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=AP/9HXvjjFp+N4Xnk9ZhfHtJP84zQAgGJz8O2YcoyD0=;
	b=kTs67JB2zxleC/9vXcfYUOYnsfiF9sjyJI6Y0CmXx2M/rlZBe4hzwwGnMjBD0tENX0cS
	 pG9KhmZZVeRFLl1FBndZaL7XTFx3FNSWAydzkOAYOgakwGNg3FuE7NE6uuznpQysxbfKY
	 DSfnw97PhwjqhxzELFbZVfpi2VjARl18BkzKjVnHzuO3yXax7x/2USKM7JajjwE7gQ7ct
	 X2/leiKHWS3m8mM/AeTkwpUB0AaZe1sJeqTfxf7/CHa66eLC3zxBoHF5TsZWAYfAJA806
	 txcfq1u19UzNkbPz8UyJUGXszvEjOOtpSnUzYID3JDpYH3889g+b8M3vu9re4WdOc/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VV39f5So;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27DA606D52A
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E27DA606D52A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VV39f5So
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ABFEF4029B;
	Thu,  5 Nov 2026 19:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AEA91F0089E;
	Thu,  5 Nov 2026 19:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907317;
	bh=AP/9HXvjjFp+N4Xnk9ZhfHtJP84zQAgGJz8O2YcoyD0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VV39f5So1g49N7W3UbazXSKQL1BbkHKsfLDbb5QZyU2fOrbmB53+C4PMQy1tfCByM
	 YeDx/jfn/yLKwX+us/mZVBJDDA91+KXxpBNNXFRm3QKM0f7cji3TwH5M8nHjoaQe5/
	 PdhGk3yZ3xaL42g/7f8054+A4X+UPyrne9kb4i1NQQwmr+H3CYFASt7DcN/tUrZHBj
	 2/O1yXa6ry8ceB9fU543h/I4a9F+hfGsT5rjTvnX1LOe375Qwsz5tsvk/2r3vt3BEP
	 3JguqV1jlUZuRL/eoYBu9vyZZu4WXiGAEVe3tKSHV+xvGFYZJ3KO+vhvrhYxYSS0a4
	 ypRBTWf9dhnXg==
Message-ID: <sashiko-outbox-199932@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 02/23] proc: add pde_pin() and pde_unpin()
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
In-Reply-To: <20261104-work-procfs-core-v2-2-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-2-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:15 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Every call into an entry that can go away is wrapped in use_pde() and
> unuse_pde(), and a permanent entry is called straight away. The read,
> write, poll, ioctl, mmap and lseek methods all spell that out as the
> same if-else. The next patches add a few more callers. So put it into
> pde_pin() and pde_unpin() and use them everywhere.
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D2

