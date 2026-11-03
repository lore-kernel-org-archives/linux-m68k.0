Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717299;
	b=trUfsHAO0w07bGI7oLCZJI48w1Sd/3HZyi7H50mIARuWlTqjiseUd5b4PyDmuUknBp/L
	 BgogbJejvrAnaVVsw60F3TwM0WNPceBPL72Udi1gfPsCEY+UKj5DXd/P4hMAXu158G+IF
	 cBXIiJ4de3F6ycrfcDkWZZ4LwG/gthIKa/tmf7vYqdW6KBuO2BYUbatMn5G/jkKw1BYqH
	 x1kn48CVcpUO6/Z43631mrsFhDq6a/LJUbDlAwsWXjut4WfecmHDbmhpKLvYlFUaja6pC
	 wUiIP67vQYOjzSb3YcKTGgI8dIKlDAOWy1uQJohgBpB2bSZxzjUYsCofDHntXLhEo/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717299;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=a7PYmXCvRfg0BwzdfEGz44ga4Pu8BO8P1McRUIl/QmE=;
	b=j8tYFh7i8/zEEfIUiHjLHM+NtGfYqwkIdhKEeR+5z/q2KmO089uUAUbH2TmcahDSDO/4
	 wIuWp1NW5WtuEHFQ4cwsS/WAqSk5Z1Mk4GS4UFQ3MJYgG8u+1ZotuJ8RLrJ3DOt74KOpo
	 BYoy+tVm2H5ykA5RSuA3cTSt0dz66PIngRmWvYLWuVSfI2rKLi/dzLhgb8qyXE49dkx2h
	 uJr6ejKSEtO46Noh4nYUZAn43cqMzowBk0zrHSUQ3FCxV5v8FjxGIZgNtBQPlks+14vnS
	 GrTfjxQuY0SabdaK9njTFJJ8aEh4qygLH4t6pKdXmyoYHKzHBhJEuHNc41Yf+r3+zXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYcaZ7np;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE62606EEA5
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE62606EEA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYcaZ7np
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A046E43C89;
	Tue,  3 Nov 2026 14:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308B61F00919;
	Tue,  3 Nov 2026 14:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717298;
	bh=a7PYmXCvRfg0BwzdfEGz44ga4Pu8BO8P1McRUIl/QmE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LYcaZ7npTHcFZjRzH7+Fn7MvhHCtX0Mfq+N7asGR7lT4O/D1juNNOdkQoItQPXgYp
	 izFBnUx2NnP6oS7/UFWY3ZtlEiHQGAb8tqYNXHfwpj3k+q8UhKlx3Y4Pg97Y/XyE6C
	 xkIjNo0WOFg/e5GUKQx1UXiaj6PoeUJ8Rmrh0A+WWO6gWPU/v7hy2cXWYqJOtZ4R1f
	 AJe7tJP3tO80byckeYCg7WXwCIl/UiBUMp8jrZdTJOebfpv8qtOWQYXX6ex20nPx2Q
	 aG3CJ/kyI5aKfpxI+HIjIsP6p5FlMEL6CTbtmCCpK2w8UzCSgTGpCSlE70jaIGX3Vm
	 wS/Yy4/2pHR0Q==
Message-ID: <sashiko-outbox-195497@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 25/38] powerpc/crash_dump: check ioremap_cache() in
 copy_oldmem_page()
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-25-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-25-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:48:16 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> copy_oldmem_page() maps a page of the old kernel that isn't in the
> linear mapping with ioremap_cache() and copies from it without checking
> whether the mapping worked. If it didn't, the copy reads from an offset
> into the NULL page. That oopses unless the copy happens to be a user
> copy, whose exception table entries turn the fault into a short copy.
>=20
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns that into -EFAULT like any other short copy.
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent copy_oldmem_pag=
e")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D25

