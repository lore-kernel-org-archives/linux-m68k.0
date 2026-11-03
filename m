Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719142;
	b=lY3mpz/IjY25SxbK9Xi9ZCw48Kd6zRy8I8Yq7g1pTutnAok97t0nUW+hml1XRcFUFqfL
	 WGSXMsceX90HIGrXEKVeq5mT64Jgh8ij/VfAX73yz2QLRm00rxervAkQ/CxxlkhADZ05S
	 trcQ4sCoNv2/tDV9M9XUQ3dLe8b8twRaFKpMfMe0a27FbEJHTbyG0+ZwpW4W9GbLdwUpk
	 LM4Zhmjgh9jfTxsMDua1ivnmhay+qzYdz6M/LYo+jTHL1MmuUXFD3FiOVavT7H0qALY4/
	 Nu80caMSWbI2wCjikgUtx8DYXcHHeK8jbin/5DNylqmEUDT5nhePiUpy2/Nw2LB2U6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719142;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=odwwA5dfKcUGiw60p2ABSqsoXHD3TJfwohDjWQjtLjY=;
	b=bmEIbLPjD1tbB/BQzZxdsCgCp4ToRxytN2af9T+XC4bCMHb/N0iLSPkcnQ639NNj/l6w
	 P/pKGRCAA4c2NcTaLuYhqJYrt7QdMnXhVhzQ2VxN4w4kae4WEtPjx3K/1ow2wUUepRpqF
	 E27ZUU8wGMr1ANeHLnz67d+uDOE1HyXgOWMgCzGMLPnYPLDIF+fF7E+wH7sOvR7wGdzY3
	 2vvCyW2si32/jegSmw525Cr6E8PljUuNrulcvkRdCMEyC74X8gal/K07o3NmUU9idhWLK
	 ZcK4rgapW/N5YGSxgRTlNP542uObW33ouyfN/xZCQPZAtwUXIRam8+IUepBJP6CLCUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jROEVxEx;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BB760A2616
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1BB760A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jROEVxEx
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA6AB43FBA;
	Tue,  3 Nov 2026 15:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56581F00A16;
	Tue,  3 Nov 2026 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719141;
	bh=odwwA5dfKcUGiw60p2ABSqsoXHD3TJfwohDjWQjtLjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jROEVxExIThFpbsqA5xAGqUr9cswA8n2qHqo/aORqRE3FqTOEu/Om15ERmPiYGlIu
	 7g8q1aer7mGKtPa4BqJW1SZkElmqfbsX5POPH2ZXnXV8g7aCzKJTWAAN/zeDNaVUwi
	 kOyemUyjCavVCYeryJNauavuuGZorazBlwZhrNEkZ71VuyzAeAKZS7rSdw1kZNZ28p
	 oTmkBcf0kJ37lxjbSjKNMU9ItQ3w+BlCooP4cmHM0J5+lHMYE5pCxdn7eLYdpg+45U
	 WKo06U7ovfEEyFZ2fAApo+ge7BawSBRBymU5M7v3K7NHSLfSZkLVc/EQaw+9hkcs1y
	 +QDI9KvU2B7Jg==
Message-ID: <sashiko-outbox-195596@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 16/23] fbdev: viafb: let procfs copy in writes
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
In-Reply-To: <20261102-work-procfs-drivers-v1-16-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-16-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:18:59 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D16

