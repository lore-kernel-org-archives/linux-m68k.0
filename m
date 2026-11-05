Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906999;
	b=AvQXPffbcZTk8pEg89vGQrBc7hSE4NXlmQi5aOO7us35XUVMNvglpyzxAb2fnZ6nHIMo
	 ofM0+GabbhpkoeRUR7D7zdByxZPFdfh6kpFaKe3F8t0jM/cEkYVnWSfFTpqaH7g9ePbUb
	 v7eayrkbTlQRC7dkveCcbkDkrGEd90VFeZZUNZl1hIA+v0MnEeOEq4KntR/eY9OFmmyMM
	 iRjlkkPFoYurB/NUb3TcH0WRL+uWhXyEolsKOMXUhb7N+qGSYE+c9NUux73K8bzdmXZDK
	 g9/OcgE1Dqkjc50GxrnwWaRvJfmWRZL7Bde3aI2zYrhUh45nMwtpcGYTt3TXRBzseIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906999;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=99n2ODOrbk/um2zwUpcCRu9OBem/Bf8KyNf1gWCS5EU=;
	b=3h4OLuM1IM28rMs5z+wQASLI648UlMplssYMqpyvTnA69J/ulXJcNnobySZ0G2ZmrHr5
	 K/ZoKh91XYwVpXPL/5BCS/dLAp5q/qHZThhSR17mQ0ckYykFa97X079NUIPDEFAqrgcsl
	 7HRe3T4oCEfeh5Q5IjtHIEgkG2+SS2kE/4AjQ2f0jr+BSUymyEPof4NT2kf0E9uK2E9Ef
	 HCcn5ZKYJdNkjVgp1vGIPzPGIMg0l3fD4kVGVKhyXCFNsgm2LbuLBvZL/iC0vOXC6VU1e
	 SGHBlS9ovfDx9TEBMxx8LrC343v4rWrXR8dwqsG5POT2Ihw2E2tafb+FXMYCPYX5AuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="M/LPrtHi";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0908606EEAD
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0908606EEAD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M/LPrtHi
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 705C0422BC;
	Thu,  5 Nov 2026 19:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6F81F00919;
	Thu,  5 Nov 2026 19:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906998;
	bh=99n2ODOrbk/um2zwUpcCRu9OBem/Bf8KyNf1gWCS5EU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M/LPrtHijTR3RtO9AShzhQ19Zy5Kl5YlzepW0MBPoQGraVjX/QE98eHLqfNiVwE2W
	 C1UMVWmoW+TyJVni1OuvV4a4mXWG+qagXGKRLgUbC4j9LV1740dwMCB8C+TsrHbQTF
	 2uHmzIHBpCoO+mXz8Z9IsohhYJr1jQBdiHQKaHAIMz4YzzN8aFm39Yp482vS8dhXIB
	 MXvy6YjsBiCNXf2trYuQ0BhqcErucVFF2clU1PSF3obpkmtHf0jhEvMnYWRJ9cS54E
	 2jxXTltfO1qXjaW4YvahpH63B9VKj+NIvBinZspqJjXvsxnB9IrHfzidrPZ8jB0NRQ
	 WxxAtB2Y2uCEw==
Message-ID: <sashiko-outbox-199897@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 34/51] proc: let proc_remove() remove the
 entry it was given
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-34-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-34-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:56 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_remove() looks the entry up by its name in its parent and removes
> whatever it finds there:
>=20
>   remove_proc_subtree(de->name, de->parent);
>=20
> If the entry was removed already, say along with its parent, that is
> either nothing or a different entry that got the same name in the
> meantime, and de->parent may well be gone. Two removals of the same
> entry are a bug in the caller, but going by the name turns it into
> removing an entry that belongs to somebody else.
>=20
> Since commit 895b4c0c79b0 ("fs/proc: fix uaf in proc_readdir_de()")
> an entry that was unlinked has an empty rb node. So check for that
> under proc_subdir_lock and otherwise remove the entry itself, with the
> loop of remove_proc_subtree() moved into a helper both of them use.
> Nothing can help a caller that passes an entry that has been freed
> already.
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: a8ca16ea7b0a ("proc: Supply a function to remove a proc entry by P=
DE")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D34

