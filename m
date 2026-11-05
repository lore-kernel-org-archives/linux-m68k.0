Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907342;
	b=RRunQCpbC38jFDuLYtI7GyWY6HeIuvroro7z3ZG71hoFO4Du0hTYwYM1RL+tUuHDwGvX
	 7f2oI8gewGRPtLKHBjZmmsvFsd23aLin4GB8Rl1Anb3ZDCmEKCrvOp3ak7394vfnYXUPE
	 /ffCYPxqpiswwkZu3FhGwVsYA6Rn39mQ5aHl9+OebO3QEq6pYpZXwgGx6xUHuk7JcztCe
	 oWABwnUiM6RJKKbl/Ma69PRWhwevOYgFBdFOYHdFfjtBELgT3M9F0zsG3peJJpEG6GnTN
	 h5NdJ9SEqYC/qH4G9+M6kdVqR4o2yUG2Hier5VQJvt0KHV9DItLZL9pPqIhT8C/DC6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907342;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=cJix24xlgst9n1WrSlWeglZeAB5lHupKhKyXWNZp4cA=;
	b=ZdznfGbtgmBhpEsQpZmYFSbR85WNfBuZq4Y+NuPvAbmZCIsCvl9qRxG+yiiXOmStW1CL
	 KD8Y0OVmDs0cSc73GZZ3OHg698OLo4OksN94H71arb6tZtOgTjzR1AQw/Pdb00WafH3TA
	 i8cbcYoMxC49Q7qu1S385WI51eL15r72WepnaepvW6h4vMpx0vG79/sW3i4g4QnbMwUnu
	 YXaJR3Ho+AOiSoM+y+iKSv75zltbNdOZWC+VepMw0fqQGYMWNcf13fBnWIinuTjmnoLws
	 4PvKKnF4OuUSRDoqyxZtvzBltghSszmWlVspXM7Y3lynpY0cUBy67pyo+XvIvuX4XDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+xOHoP2;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A67A606F969
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A67A606F969
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+xOHoP2
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 809D643E8B;
	Thu,  5 Nov 2026 19:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9761F008A1;
	Thu,  5 Nov 2026 19:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907341;
	bh=cJix24xlgst9n1WrSlWeglZeAB5lHupKhKyXWNZp4cA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L+xOHoP2Qx5/9+jDvNfdYODhXjxiK8RqXCJAGAloJ6qzD7Elus2F01gxdiUGPSQLg
	 3hE59XNDGx3Za7IV7IDFhB9LofEWxPBNwNN/k2HxtiMoqi+Vht+upRCGoGgUOFkH3t
	 K7IF2X+TmYn4ZurNmoxh4WyCS1bWuRxOE2FTEP388C89fXUcunpJ8ImJUn3klOcRfi
	 1QcyMSKwSstZGjhnH3nI7Wpv2CbW+x291Woe+gaojDGoMmhzCTYy/uDNTr87TxD1Wq
	 B6dVO0t+pEqWn986xFrR6AlFJZfPthvQSSC5s4G8lgOL5oeFUjLAQkfCfoj1cM0Jd4
	 LCM5TqqMHZEYg==
Message-ID: <sashiko-outbox-199943@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 13/23] proc: let procfs own the seq_file of
 /proc/stat
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
In-Reply-To: <20261104-work-procfs-core-v2-13-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-13-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:39 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the show function and let procfs open and free the seq_file.
> ->proc_open() only preallocates the buffer now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D13

