Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907346;
	b=gUuVFSG/WnUE6LZdUKIvqkdBEk/1I5/u3IByAqtPf9XGb+YgittY77icKNQekEBxJPS5
	 EeK6MWFO9e3dVi2nppMNqzchTNpIwOhw40pTUw5fXwMbR07Pc2jmqAGevquYEeEp/krLV
	 uFhNq8S8kZvBCublGZ+OGdTBPYKwXrBFSMNVeZ+kDKXu30lapAov7NNBJzCn+jYUgFEBo
	 +w5GlrqB15QxMZuUrnsvRGlKoIMPVF5mTqonIkMOApTZyCDjUjapydEeSsk8kEffPr2l2
	 tqDrZmahQ8ROZqMEfJHCOIchC18em+Scka09aRjXVgwosrX+l3JVoOLn8gsN6SlvAOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907346;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=gJEjJHr+63DkRgcn2DucJbOp2pD2WNeYTaMSKLiQVEU=;
	b=4RatzmnC1J9LB5y8iyneUQtvHPLjaErsga6CMqaGYeakOkcS5kUVXBYiMjAywCz+jwNd
	 WYpZP1t6CnZTUELo34lR+GsPGUAKgMZa31UCMIzHiirEkXfABAzdIAG6BKCC8pPYPV1Mj
	 90l9OceH8OtS9gv6CjyIU0+ofjc8IiQX+upqbQtrPEu4AGyShk9x9OnlmOCQkatXcRrw1
	 FjOlUiLvbRe4KAk75KVgNlxjAp+zprqeEiAdaOUo/NT7ntqAg1RTkbXXttSA8FTyL84XR
	 V0uWfaJbwL172UvAb5o5qAcBudVQrnkHKh2JiSe86fXXvCYeWoNrSXO9YFkzrhPYMEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lowCxpM8;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A16079569
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 804A16079569
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lowCxpM8
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DAAFD601EB;
	Thu,  5 Nov 2026 19:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A151F008A3;
	Thu,  5 Nov 2026 19:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907345;
	bh=gJEjJHr+63DkRgcn2DucJbOp2pD2WNeYTaMSKLiQVEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lowCxpM80XbQiSSCcFv25ROY9iPwr8AIjymBRSEeCKy3QRBb1FptmRHlNq0Wjq1/k
	 K8/iyufGkzQLPaSJrtMq7r0Q59oLYpv7F1FIe+/GUzbkWybOWjrwtgx6MUmauz5Wt4
	 oV10UyRGTXNAt7W7iafOiQPj3dtAFzUh5XC4pmHZNFWGPa3YcQCFuCi93JRRZ+uDtH
	 jVMDhvp+8GKhMC9jEJ2uzOHXpPQBE2ukBHORlZ+DaGIimf+CjVuQPWP5HCJVMkLor/
	 vhFuj9C4hZBYSNwdm7GtQwF9416SSchhrxNZmyQgRKmmww+fsBfmslktFGiW+AZaab
	 bv76fZfTqneZQ==
Message-ID: <sashiko-outbox-199945@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 15/23] proc: copy in writes to the network
 namespace entries before pinning
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
In-Reply-To: <20261104-work-procfs-core-v2-15-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-15-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:43 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_simple_write() already hands ->write() a kernel copy of what was
> written but makes that copy with the entry pinned. Let procfs make it
> before it pins the entry instead. That covers everything created with
> proc_create_net_data_write() and proc_create_net_single_write(), the
> afs files and the rxrpc stats.
>=20
> So a write to a proc_create_net_single() file without ->write() can
> fail with -EINVAL or -EFAULT now before proc_simple_write() gets to
> refuse it with -EACCES.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D15

