Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907004;
	b=EUYbJzl0B59kVpo66MGQdg6Ekf3torqfIiW19ymmUcIKONdtnrld8aDRr1CXSAGee3mE
	 0ohntZEuUN0cApMG9Ufghj9FikmmIu2o5CJVlCPyfiJXmuhpDq2uNNVJEn0B0T5nnaaji
	 Jyp2jEQZPppPGDFFi8Go+MvjJ7rAc3sHKWj0rPLUCLs0bCrAvG7/pWlG6UT4/hW5exEMz
	 o4mj1VhDYXIzoz75w7u5RXkqBgWypp8Wjqw3lNiHNmH6CFX9as/cfdYbK6UWtALkFrxmL
	 L/8uRO0KBjDci+m5wm0hc30PSA8/+hI/FMcCJuL9QaycYblNnFcKgPYzHzdPHqPvZjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907004;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=bT7cdtBA3g4ZjNdxCADmBOubkwzRkbH+TQ0hoqO6tiY=;
	b=x+WJ+0mNDrU36E8331T558K1H57sDaUwLz7v2o5RQ5G5H//IjDUNDGmaISUHyz+MicpL
	 dgOuBZrhXltA56fY6YCAlIoVEtSrsKDJorIUKu6bqmw0fzS0L1OkPxtg6QR8+Mc/JdBDs
	 wNrpdixx067StAJQdmkZHm4zQA6TPVGcYd0+iKc3kRQra09mEm0Dn1d+WksgbsCM0BRNs
	 JIB76jsCmNnpyBveSUhL6YR7f+K+3mjl7DTGQ3yD+a5Tt+mL347oz527OLyq1GkzysuBr
	 x8/y1r7p4fOufgw7KKVd6Gxtu5gXyQHj+rvSJZ5qaYEdRzN0ziGZh02VUwLKQDDRt9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFkFtso3;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406E36082BDA
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 406E36082BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFkFtso3
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86072601C5;
	Thu,  5 Nov 2026 19:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551AC1F00A17;
	Thu,  5 Nov 2026 19:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907003;
	bh=bT7cdtBA3g4ZjNdxCADmBOubkwzRkbH+TQ0hoqO6tiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZFkFtso3C96AnTUnqfat70nSvPWig/+mlWw5M0UhnuCp5QJxgxNGQrORhQlrQkJ/y
	 hC3IYuBkO3IUK23KYNgrztoNyDYmU4MR+D9gL2C8VjvK7vkMSvevOunoGmfWD0JNml
	 vsF9OIiPC1HM3aRMk6Mbu6p74Dq5+9CvuKroZEovRvm/WILib1QicWaO1x2FWXQ/Gh
	 4URR7CizufYYPnmywgHmy0LbSoLzZeP9pgnBeUiBSkH3rjb0o92yRGCn9Np6O+kLCX
	 Go0H2HcVBVV+M9zicMMj4k9ffVIUnGBdI26ePeddA9J3Se+pxAShijM1YnU9ctvKg+
	 O8G91Qj2o2VRQ==
Message-ID: <sashiko-outbox-199899@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 36/51] proc: don't let NOMMU map procfs files
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-36-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-36-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:30:00 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Every procfs file has a ->mmap since commit 786d7e1612f0 ("Fix
> rmmod/read/write races in /proc entries"), whether the entry has a
> ->proc_mmap or not. On NOMMU validate_mmap_request() takes that to mean
> the file can be mapped. procfs has no ->mmap_capabilities so a regular
> file gets NOMMU_MAP_COPY, and a private mapping never calls ->mmap at
> all. Instead do_mmap() takes nommu_region_sem for writing and
> do_mmap_private() reads the file into the copy with kernel_read().
>=20
> Reading /proc/maps takes nommu_region_sem as well:
>=20
>   mmap(NULL, 4096, PROT_READ, MAP_PRIVATE, open("/proc/maps", O_RDONLY), =
0)
>=20
>   do_mmap()                          // down_write(&nommu_region_sem)
>   -> do_mmap_private()
>      -> kernel_read()
> [ ... ]
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 786d7e1612f0 ("Fix rmmod/read/write races in /proc entries")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D36

