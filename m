Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908690;
	b=l4pRBRqzGBVXK6fjR1Kkvru9ZX19fsuNsCFbeOLSCZ+6zu4a6s7n5xMyU4soAvbNg0Ge
	 wnZJTVUrgZy9nJx9ftp/cZkIGu6A4ZNhcfUvX5vzCJPpju1yGqk1v2zWxR05B0JT3/VVf
	 Ci5CtsbVA8PnrUkWIeGfMQPstMazycMfooMEEQnr4EhJHGzbWpyUTJEAPdWBTZa0/DS8a
	 +K4dty1v+2yA3cDcZZwsa97BD18eFduIpIdafubU0jlkNE4sXimmk/vfKhlr3iG0ejB2p
	 Uga4kbcFZhSm1DXNahuRorMNy6lfCRnsb+ouStXCx3NkKMAk2K/ZZ0ZdFxuFyfaogPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908690;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=qyGxYG8j9RHg2vyof7KTGe46hg815xlN1LVcZ72aA7U=;
	b=ue6IR76PGhMOFCsXwg7CRwmrRUihAEy4FAyRBqMKYwh0yA0ABwjVp4tSjshzeyYlxb/D
	 ElYcj6PZZpf3YjxiWkUKASt+XZ4qXFsgjhp9g7J8VKmQ3zxox18Usn+bUmYig+BNOqE26
	 por4JMxZA1CGNblsVf4PjCFrEyBouZwZNNgjL2qFDHCwZHczQetcrBdHG9E40dWf+9lhb
	 aXj3VQSqA89rsCYUTgKfANwtECwHTNo9Jsm2/g7CSpH5Z4Vn8s8NQBszkFjMfEQxmVCbc
	 E2hZyWZk3ciQFgu9X1wHpJ2UX5JvK9NZ3VJvZxmzVcVFydulrp+4AI+oNDAfaXVXu7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTpjODs1;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08488606A6C8
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08488606A6C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTpjODs1
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73ECE605D2;
	Thu,  5 Nov 2026 19:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5791F0089F;
	Thu,  5 Nov 2026 19:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908689;
	bh=qyGxYG8j9RHg2vyof7KTGe46hg815xlN1LVcZ72aA7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bTpjODs1yFu6YRN5fmCYLdyRvgUUVxxbu846Aeqw4iGqXmWrXiCiCnYZPXasoab4i
	 WJUixvU6EfxiEGSTH8p5m6geOsF2FwabLkl8QCKrLRihS90PkxPQvXsImqBoq6fFpI
	 zXPjdUBvvvwz66/+OxS1xiVA7RcTezVhvc4GfvsAwAc8LsSQy1bEWSsOcEBB4lRmfo
	 ocuNeivszTUjoQ2nmvR7p2FOnQgUPyilwusfSiwQhItw9JJ51vQ6W5SqV4sXQcDH2n
	 B5Og2Tn/U2epxnQVrz5GgRaNh5DnwOIPoDojQJuxrNePqy32coheNJG3FyfeA33AJQ
	 zsiW5uI6//0Dw==
Message-ID: <sashiko-outbox-200053@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 19/30] sched/psi: mark the pressure files
 permanent
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
In-Reply-To: <20261104-work-procfs-fs-v2-19-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-19-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:58:05 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> /proc/pressure/* are created when psi initializes and never removed.
> Say so with PROC_ENTRY_PERMANENT, procfs then calls into them without
> pinning them, like it does for /proc/profile.
>=20
> That also takes care of a rule the files bent. psi_write() takes the
> seq_file's lock to serialize the triggers. A reader holds that lock
> while it copies to userspace, and now that procfs owns the seq_file it
> does that with the entry unpinned. So nothing that runs with the entry
> pinned may wait for that lock, and psi_write() ran pinned. Nothing ever
> waited for it since the files are never removed, but with the files
> permanent nothing runs pinned at all.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D19

