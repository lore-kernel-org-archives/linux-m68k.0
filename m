Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908681;
	b=oB8hxbTu0tiTl+UhNT0YpCOebShpkbsuSkG+WPIMts+x8VtmyS4s/WzdopvIf7kwh5cC
	 ljP+Z+kynuiT6cBYhFgiSDPd3wlcOqoO4/OByiVSF1VhCl6cB+/jyIREaI7JdYXaJka4w
	 lsaB95+eUZU5Ln/sKnvvrMREWlECy23RSf4Fj/gJoE9HYUOHk+XEKiO9D6XpRI8cAO4Wd
	 LGXQhKB9cuBL7s/GNmocz+cSaSuMOJ/UuCIGuuYF7KyB+EQHWqCuiO6U5S3tWQxjF/qJb
	 6xMD4fLuXaFTW7sfXgF0UhgeSm0r+FFsvBQeBg94Q/hJVQ5uuQ3GQiwEPWK1P8/Iv5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908681;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=gSLc/NFQPVB0jheaKA5TG3vFdDVh7lUm2wF5CPMLjBE=;
	b=KoLY5PzF2cSwaIfl1uu9dUMlyB7tpOclXnhoiS/NypqxWAtxe+TqLpxrVKXcjS1FzqVP
	 M5LGRXz0pQVLClKzhlmIrKGAfebZwlCLErcMYqs987q2m/RWpACnrM1W5fzHFuo+jef3r
	 zad7SDP6ZOeFzAREz3QEsWfDeieWEZ95CNK+t/F6jeCoaTO6OwVTLfM8y2K2z+JwOEuEa
	 D2hBNNOh8uh/mlYlIETMTLiNb4JfECj9ZpgKzTYwBjRd6W6AfaszA9iZ4SHQTtOf4mHYA
	 dh+Mu4TUMdTweBfLB+B9GZ+ZOpqJ7d1OUZgZPatesf/g+oRvGhC3yXCM2TXU7kmwHZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z6BhYpOi;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9860606D522
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9860606D522
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z6BhYpOi
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 068BB601E2;
	Thu,  5 Nov 2026 19:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0EC1F008A2;
	Thu,  5 Nov 2026 19:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908679;
	bh=gSLc/NFQPVB0jheaKA5TG3vFdDVh7lUm2wF5CPMLjBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z6BhYpOihLUJ9I+BP48G0ZYNFSOmcO+AiYj1AAUb8k2LZd2aIQW/Swc7nv4VCWJfU
	 DHtDKlv9N2qiG9qzTkTwwCGFIPw9k93r1XJF3AEFu5fiy0J0WZMBVfvlSMpYGeYdhw
	 yryw8xnqryz2kJag/16i+WPnykBtp5uQM3G6UgfxYyijk+piqbU5EzXTtFkwS4uuX/
	 wc6k8A9uOeN/qdMXjzHeoAqeBHqGjjz921QAkO+pzMyUFXL0yIl4mvV2eIfMpCgJj8
	 218TNw4Q4fOoKCdM5IjaNdVPdMjBKOOWdhv5uws8exAyge4Ilrrm1ePkGt0v9MVEra
	 +vemf0Bh6IyOA==
Message-ID: <sashiko-outbox-200049@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 15/30] profiling: let procfs copy out reads of
 /proc/profile
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
In-Reply-To: <20261104-work-procfs-fs-v2-15-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-15-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:57:57 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Fill the buffer procfs hands to ->proc_read_buf() instead of reading
> straight into userspace. readprofile reads the whole file in one go, so
> ask for PROC_ENTRY_FULL_READS and procfs fills such a read in pieces.
> The file is read through ->read_iter() now, so sendfile() and splice()
> work on it like on the other converted entries.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D15

