Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907010;
	b=A8BRkJBro8BvlWEKjOVMyS+zurf1kgF35jJrnIapGLhU1aq6382CAfro4RJVBmvyzOCY
	 H14+o364J1nax2W9HZBrZgLAFTfNBmtrjdnzaLhutSRVu9Ck9RWbLxNn2mlYJyjMC4sYs
	 6+GFO7iGD0GANn4ciWpjLH6LDcJAq5nDmdLJ/dLM5pDKJ6dLUbFoEbVMt69ykJLZLK2Ms
	 Uar+uhVmGqosMFOBAGc9YkqrcoVRnM2ygqL+T+ywY9QueeFunb3EJ0NP+bC3qIUeg6yec
	 ByrQqeK+XlhS9S2MOhjW0Os/r1r0UUPLTKJFjyyxE23wxikEV8eP+diZ1qz74tYpbbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907010;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=A/5VT3V/dJzwpelYcF9cS6x7xpOutBaEMG5KLkPXIhM=;
	b=1naLQ+cwLMS/l1hLi7QnCNMc9wbJ9PiVOjPRdW8q8qMabgsDkysZrSKhD064sSXj/t47
	 YVhih9xfaJmgsUspyvZWUzuez60Y2O6tUxOe/fNrQOX1C+ol479kVJq7n0lH6UDs9Gl6a
	 U0fDKXJ6ZDeX/pSAScnCsrq3SxrxKlQ8OsDDZ1AdUivVOies/ElEozIKbBRJLwTIttE/z
	 71Ugs+cgpGBR4hy5KDAkoN+fE9GqE62Fg3Nlq9NwXEr4hVQSFQWguKGnNopSpMbPiAQk5
	 QUoOHudHN5WOrnfwYfl0dphvsZfiqHvlHMEhN0M78NKsoRg6Y+zYIQbjLygEGiz2VzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NCMd5EQd;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B1E60A6F72
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B1E60A6F72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NCMd5EQd
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 48D694398F;
	Thu,  5 Nov 2026 19:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A439D1F000C1;
	Thu,  5 Nov 2026 19:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907010;
	bh=A/5VT3V/dJzwpelYcF9cS6x7xpOutBaEMG5KLkPXIhM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NCMd5EQduKiSLAcILn4CM/ObnRlBb+kiiI+/5ab849SU4+HjXc1QOgHqSAh7M6E27
	 b+FiWMO6CLjTXf1Nj4CyvKUhbV9P2lO6Ravfz73arpAD6MqZyaeurUt1DmNcp2r1xg
	 UEtfUQQPAMqtvXYriH4kf04yzM1YNYSXVxflhjmEiLm3NIsLubCTc7B6pP89rAaYC7
	 vRhscV5ISjyZDOGiESm5OMRWASt0Bg48G9OtHsxwoa1X79Gw2jkS0KmKoFwLBKiagJ
	 sc5Nah8PodeqHU5rOOtjTf5ulsejQkKKP0tx0YH8oCfD6kQ7LV1Lc6tg+oT5rHUsp4
	 dLpYzKAb3IJeA==
Message-ID: <sashiko-outbox-199902@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 39/51] powerpc/crash_dump: recover from a
 machine check in copy_oldmem_page()
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-39-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-39-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:30:07 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> A capture kernel reads the memory of the crashed kernel, and that memory
> may well have uncorrectable errors. On powerpc a machine check in the
> kernel is only recovered from if the instruction that took it has an
> exception table entry (cf. mce_common_process_ue()). copy_oldmem_page()
> copies with copy_to_iter(). For a read() of /proc/vmcore that is a user
> copy, all of whose loads have exception table entries, so the machine
> check turns into a short copy and read_from_oldmem() returns -EFAULT.
>=20
> But since commit 4a22fd20379c ("vmcore: convert __read_vmcore to use an
> iov_iter") /proc/vmcore can be spliced too, and splice(), sendfile()
> and copy_file_range() copy into kernel pages with memcpy(), which has
> no exception table entries. A machine check there panics the capture
> kernel. The same goes for the reads of the ELF headers and notes that
> vmcore does itself, and those have been memcpy() for as long as
> copy_oldmem_page() has had its kernel buffer branch, since commit
> 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent copy_oldmem_page").
>=20
> Copy with _copy_mc_to_iter() instead. PPC64 selects ARCH_HAS_COPY_MC
> and there it uses copy_mc_generic() for kernel and user destinations
> alike, which has the exception table entries. Everywhere else it is
> _copy_to_iter().
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent copy_oldmem_pag=
e")
> Fixes: 4a22fd20379c ("vmcore: convert __read_vmcore to use an iov_iter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D39

