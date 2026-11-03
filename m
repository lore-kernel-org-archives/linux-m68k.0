Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717301;
	b=rgx6L2zbSF8qSqJsRxIm35h/btzJsYkYwpb1NRESKUbqusywjF2CcNfxeF3NQW+1e+7B
	 cz+/S/MSaMT1ESpc3UX5VFkXS0SFdr3jIqgs9bpY05b/HvFBrlZtxiTWI5nDyR0POm47h
	 i6qNd8Gt7i3YO0/CQZcB9mgyQQqMAUabcxAQIJy14JLbJa07yGhQDRBLjJzuOvF2fbsrY
	 EDH5wBmefqLWp/rJVueSs2HD3dow2HlxHTQytRGQXNcG+wKYcBXCbWLQk8vGUSACjsOBs
	 A7gRVrfr+DyfrlqyHWlgXuLzaGPsbv2vRfozVsCBkxcCDcHcLEuwnmtdD5uwaGZMZcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717301;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=/kElDKkabdJCRO6xnlGV31zxVfj0y3IarZ4wubDtz0o=;
	b=HuAb6UpQrl+IgPuSSwBGSe533jZ5Dsu1H8IRrLKZZdjmx6XdxoWEp007hTDDWVugH4qs
	 cjihYZ/jPS/ZSe2AwEL72t7YowlcxPt0MLOkUbJuffl8BiDb+k03ylE0WAIVWNZqyFL6d
	 rJ/a1NnVZIMiLbnTcDxtDJUstjLaLq31lsBwedtjFNzfLKO8cX5ycBLyczn/Uqx5TBn3L
	 IYFmH2RT5gbuVnj8PkbMpWEsIXJx3VGUdYVS2ERaphoWkcGdafXAPIG8t138/7ll5Wv4/
	 gZ6rgCGedlLw3uNRrpliBYT2UOClE0HnLgnUclQpT/VlJMBYlN4zF9WuxdUFmvRYBSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LexbkyPl;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F79606A782
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F79606A782
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LexbkyPl
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EC27609A2;
	Tue,  3 Nov 2026 14:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41511F00A18;
	Tue,  3 Nov 2026 14:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717300;
	bh=/kElDKkabdJCRO6xnlGV31zxVfj0y3IarZ4wubDtz0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LexbkyPlz2zQIYc8bF2pRjKX/AkvfQPkVIaTn+eJLpPY+XRILitZ5nAWg6f3Tusuh
	 HQNETtvJbmEhM0aoKtzkgu0kgjOexpa4LlDw0I6/3+mwhTU3usX4A/HlO3gr8J6oLM
	 IgH6VaEhvysagiE3cAOglcKn4CUmS6tVKtwMnQexbp3BGK7R3zHHh+uU933vnYx9Ua
	 HvERM1FpNfN9QoeRRHMNLIBS3U06l9Wt5PRzW5n7A08d1qMfsTfUwwoEI1pq6/YOvV
	 5vPuxcrk8/zjzD9bphuDNnUp+Mj8VlIBw+rT8egZkVw3b5mCtS0M+aGGgGqwKCSnhr
	 y91xEUDL0eaDg==
Message-ID: <sashiko-outbox-195498@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 26/38] powerpc/crash_dump: recover from a machine
 check in copy_oldmem_page()
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-26-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-26-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:48:18 +0000
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
> vmcore does itself.
>=20
> Copy with _copy_mc_to_iter() instead. PPC64 selects ARCH_HAS_COPY_MC
> and there it uses copy_mc_generic() for kernel and user destinations
> alike, which has the exception table entries. Everywhere else it is
> _copy_to_iter().
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 4a22fd20379c ("vmcore: convert __read_vmcore to use an iov_iter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D26

