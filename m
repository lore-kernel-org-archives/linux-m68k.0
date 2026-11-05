Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907317;
	b=hcrQouYsqu/iMRc4BWK+g81+6nc6EPwX9yivmIFiqoTusRcH3B+xtE/ajM/NScm+iozb
	 qTG7afHHcYgxMbVbeFIDhn0G7FsQOQc/tHab7+qcN6PGcJBT6xvoPUD9XVgtgrWg/lMu3
	 H+vw4/To3w9csmMrRKLdgN6PPMddWhov1TWLiP1LDsRV8/QenQ/lFHhIL3VK94zNVDc7U
	 7Mddo+i9S+H3amjL0tBVxZVz3AQtBxK6naP/09G4tPAYfuRRD6mh0J6/1TGGPS4yv0gib
	 DdCNZdssH2I5ZN0WM0aUhejIuY76mQr/gqNoj5+u9hGdxPxkuIF8ggxhVX3NQSHodAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907317;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=6hoRvIBjdvZcFdce6OvLL9wYKZneWoJGVeTND16Hg0g=;
	b=C1m6a4UDpxC8y76Nh7TeO5u/L/ZritGkgrkaZHwPVSNcfgCyNpBr4irraaEPBS18f4c+
	 ysZnUPrDrkINCsHSZP/M+a8tAl71pYR9Wtvyqq2eiy0fivUK4pi6L5bHMvQXeyTm3KOKf
	 8oRPYtxo74wG6D8EABDlVleDmRXpwecn7+PUSTElvwZoTReoukkISDPNVKxJqlNHaWLl/
	 KIiBQxt5PFCMkG8A8x5jbKAHG2at42kMNLuTpQCtbvRr0SEseogsGdinB21CXNB7EeO80
	 gKNupPrqfJkh41AlaDEg5fIB5lcBidAHz5MqpoMUjuVxx7bn/qtGTFnZS0Ia0NvitCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H/IGA7VD";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2997607728A
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2997607728A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/IGA7VD
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E04F760148;
	Thu,  5 Nov 2026 19:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FE91F0089F;
	Thu,  5 Nov 2026 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907315;
	bh=6hoRvIBjdvZcFdce6OvLL9wYKZneWoJGVeTND16Hg0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H/IGA7VDolTlFuDSzsR9PpNCLOc+MOL9Jlb497kin2aM9CsKSdGuinZsObzzhjKLu
	 vZB5+O9pGI8nVCo/32oLJsm4VfhHALYRw69cQLc/OwWudG08CrlbhwGxTj7hUqCvjm
	 zVfPAInrWuotxqB48n1/G7DlipPyNWJuwaJ2BWS/mluZe9QG+3hr62O+EHJHS7JbdH
	 R5EBZoDlSrf8ybUt+J6V3XvBz3x5hj9FNHwo4MzJlMjxhvX4Q3MmE7R6Wst9YwTNGO
	 WDDxetp3K1AY572xeDhT4SHRoltfwdfx2B4GtWjR4CUKwVTi5TNf8KO6vilhKxp27B
	 EnYkpbISY24IQ==
Message-ID: <sashiko-outbox-199931@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 01/23] proc: drop the compat file operations
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
In-Reply-To: <20261104-work-procfs-core-v2-1-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-1-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:12 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> procfs has both sets of file operations twice, with and without
> ->compat_ioctl(), and picks the one with it for entries that have
> ->proc_compat_ioctl(). That's from commit 778f3dd5a13c ("Fix procfs
> compat_ioctl regression") when a file without ->compat_ioctl() went
> through the translation tables in fs/compat_ioctl.c and one with it
> didn't. Those tables are gone since commit 77b9040195de ("compat_ioctl:
> simplify the implementation"). compat_sys_ioctl() answers -ENOTTY for a
> file without ->compat_ioctl() now, which is what
> proc_reg_compat_ioctl() answers for an entry without
> ->proc_compat_ioctl().
>=20
> So always set ->compat_ioctl() and drop the second set of file
> operations and the flag that picked it.
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D1

