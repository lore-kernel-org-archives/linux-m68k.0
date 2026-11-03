Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718064;
	b=OHCxKydKSoAHFUviyryMl8VvFdyRFrHM0r1hRMS960HpvFRn2UgYIN+qLCtresZSIxcm
	 FQ5n7RJEUUZ/5WKWE9VSsvtfohtNSWsam6i/qIfu2E++uLaevATBU/pQHWXV6Qq8EyO5l
	 qTVHjwGyyGj12MARCqmrIEqYsQzNRiXjiQz4ThI5iVCC49YLeIttvzRTjVrarCxa8NUdN
	 D/xkZbGyG9tK13rSuoaUJxiZOVUkbhCT58AAzBx7TjnJQtpzsPfF+3A21kzdL4L+wkTKV
	 cOXqBhkkTaO8leh2JCGk4UrEcRnWQ22YgMjTMjfg+0v73e2TnGU9szjEJ/htK2jxYLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718064;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=O9ttEEMk5aMI0xnyyX9rHNq+bDAQQVwO4bXVwqZk5oM=;
	b=q/OeXTtQrRzUvLcmvPfwWjVk9LxAa1GCqlEuv5VOEjtB0qeo7gFvKrzmrj0zV5MYPTOH
	 Lw/liL1mUdDqsMzUMXgEfhVmChuYE+rrgJwLR8CL5l1lf6e8Jlirf7MBdyzUqxYK1y5lM
	 9vZoV2n8BZUTJ8spV+06bFab9anVcitb2MMMK3rbRTCncgt96Dohq3WBSgOzOtLD1xRjM
	 pBt8YHZtVSOBseNiixAfaaDupvlbq0FB81ZnsUMVUXMUF6LJUEQNbI/zDcV5IjOyum686
	 F/b0dajijgN5MngiaOFuq6cTrfnT3hZGJgAltCZI5efiiptCNsDZJ1drKtbWr4XooHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZtKCljk1;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ADF606A795
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60ADF606A795
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZtKCljk1
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E939244000;
	Tue,  3 Nov 2026 15:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057A91F00919;
	Tue,  3 Nov 2026 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718063;
	bh=O9ttEEMk5aMI0xnyyX9rHNq+bDAQQVwO4bXVwqZk5oM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZtKCljk1LUvJX7KWDQjGj4wiHw+nMT87rtLCGJRTBYFOnVKhOBYNUS58KOesO+NiT
	 ER2HFmDawKCWeqirKD1bgeaaWLAsw7kaZahNvdMxcZ2A6tubEEU2b+KyISPnVnH3De
	 VlS8UWmQqfvhIjxe0gW/En7sarJ3yWhvP+J+F29JCEifzwOto5rP9bGZe97qhSS6Yi
	 xYFyCbF6HeTNA5fWxqAfDBvJNHBsNOuOBdzH4kWFRyOW2Q6tGuyciAiivU2E0CTx+4
	 6M2yffCJdgdXWLkNu3Ruz21vUDqhU/xAJMYjVWhf2ZqkxGJXsbg8JOCIzeTSiOCTh3
	 /uO8boCh8z46A==
Message-ID: <sashiko-outbox-195529@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 02/16] proc: add pde_pin() and pde_unpin()
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
In-Reply-To: <20261102-work-procfs-core-v1-2-75df35e4f8b8@kernel.org>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-2-75df35e4f8b8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:01:01 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-core-v1-0-75df35e4f8b8@kernel.org?part=3D2

