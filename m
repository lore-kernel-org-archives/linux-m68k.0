Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907021;
	b=lU88o4UE8zAZoWPkNh7pGHDkm21hOhEAGeVE3sx6FCWZD68b7DMDVR7txwRKlVhzKAIe
	 SEywW+8uQIfzuFVujNIhAmFaxbW8b3kYTsHkaDD6PIVOqsglumhmrLNwaDK6MZZKzgBVD
	 O2eGFpFxmQgO+lNF092xDyMkyYsYOQeWugbf9QmtGqjEdfCsz0FhKUFW/2IDTbd9yMUiS
	 S36+aVaIo/CXVPfZ7QjfDR6KjsRcsBIn+HqWha/BLF7T5zY7dJDw9gI5WI7kELbgizxNl
	 ymyZBN4TAooAnGFoXgVijQZkVa+e0EN/zq0F2fMKkVU6CmZXREtVQaoHTZAQDLffSUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907021;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=y9V1CIpIY4360pJxVlHm+5yZoVNA43rbHggh2CYfgcQ=;
	b=ghS8Uyx3GLXNH5ckpHZQRNi5g5Hec6GbEG6Cfyy9WSXqZ2EWG1k09braGyjRmyoG/cbG
	 8NEIGY9DUmn6AYoMgs06ndln9aKme3WRlFdjRlatGvufgk6+BLwvhdAp5OeweiLb4h1W9
	 P3mafYrbp7XIyhktCfwovtmc2lsY5fNUIpWYWi2FyTYbJIvj5lRRWXfDKFLfYYM3GDTdR
	 OxnnpDkmtiRTSvdYsx01q1Ln8kl6JG6I0KqEtCYdO5FQ73rr2AThxql+d3PI227siitLz
	 Rj5h/CBzeeemyX599oNBuZOCkF4BysCa1EyfjN/F/ABMY2OHCy8n6p+x3QsCsKLrWJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U6caPqpR;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8AD606B05A
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE8AD606B05A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U6caPqpR
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DA4340487;
	Thu,  5 Nov 2026 19:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0FC1F00A16;
	Thu,  5 Nov 2026 19:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907020;
	bh=y9V1CIpIY4360pJxVlHm+5yZoVNA43rbHggh2CYfgcQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U6caPqpRAcq7s3jABurFLTYAOyQNLF7KNwFcz7vL0owaKAFz2/Kmb1CSUDdsXURja
	 KndJt79cCtvWCvNOTwi2inAusJtSM7xFcxVXh2P+h26yFHpcllhdCgktUZVCkwtiG9
	 /H3yjzLcrbjdiUSj7RiWzxjqFY9BFACxF6rXGygYvdaL3HgamlM8WqSmnW73wwg/9a
	 HWJvJwieWwnyodMNwSKhOSyeyO8OGNd1qplxfETbINtVIeYgtd4CJo1Ro5mX0HKNqx
	 xq+lWhJhP5SWQhNMI4K00P+V9JGUm/enmo6/5lUN5kqo3zAD4JBvrPHNPgj7bQqo45
	 NaifRmjsniAKg==
Message-ID: <sashiko-outbox-199907@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 44/51] proc: sysctl: resume readdir after the
 last name it returned
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-44-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-44-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:30:18 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_sys_readdir() counts the entries of a directory and resumes a
> listing at the number getdents64() stopped at. The entries are sorted
> by name, so one that is registered or unregistered in between shifts
> everything behind it by one. Listing /proc/sys/net/ipv4/conf with a
> buffer that holds ".", ".." and "all" and registering a device whose
> name sorts before "all" makes the next call return "all" a second time.
> Unregistering one that sorted before the position makes it skip an
> entry instead. So a listing that takes more than one call shows a name
> twice, or not at all. Even the 64k buffer of ls needs a second call to
> find the end of the directory, so a device that comes up right then
> repeats the last entry.
>=20
> So remember the name of the last entry a call emitted in the file and
> resume at the first usable entry after it, like kernfs resumes after
> the node it stopped at. The entry itself can't be pinned across calls,
> unregistering waits for that. If the position was moved by a seek in
> between the listing counts from the start like before, seeking to an
> arbitrary position has never been better than that.
>=20
> That also takes one walk down the tree to resume instead of a walk over
> every entry in front of the position with a round trip through
> sysctl_lock for each of them.
>=20
> Fixes: 77b14db502cb ("[PATCH] sysctl: reimplement the sysctl proc support=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D44

