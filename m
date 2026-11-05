Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908652;
	b=hiXrPxmuzQtP6RmhnP7K99T3l56C4ppbFAeEbUx91wFhHuOYSMkk9sfwDoTqTBj4odJL
	 qrE3w3JFmiifk1tCLeaO77peun0EKhFC8FRWThSNCHEM0F/qftiZXxQQk2p/nMVastNae
	 8dgdKO+nFLsA6TOcZOYufzfpcGg31KK1lHUpMwXaY8Pg/rSTZcssEP9GhagYECSZ+jEie
	 bbeQw/WDU/Ql/CryKpp7UL5ESH5picZtmqWfdDoG+Ao2TDXeSWJ/YrrQLLhlQv2R4FF8Y
	 pc5qEDxnGSRnoVAoLvRTirwa56BeY87moYHjJZ8hpMimZ/iNhqZHv97rtzV/VPSVp9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908652;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=SxyrM1+J7zWNaAN4jPGBV/DEjP5xQaaeFrdy3WUKUys=;
	b=045U3SZQNPpvQpwqevFQM/r3rEIr4+chgs/yHEYaL8pLYWE+hkSWDAN9SeROPAPTyGS0
	 TY+lHRacnz4GqM9P7oMid/nCtcee47gSkhOHDsiBsyiNM8wJbAbJ0EsXWphDof58Ly0HX
	 1rVazcL0zva/r3Mt/+R7W8so3B4ceE+Gp2x+c3102Yb9o3hUv63gv5EB0WM7QIVAO2BsA
	 YbBeibTHA4u5ML0o3v9ygbrDP9za74R+RihC2VfGxvLRquQ8WASHrjIXSiuHjdl+BsXoZ
	 RXKamgSsGPPV5MTgd5jF71qwtyhW95vzdP/a/OtFQaZZk2Gv3aYfqAFyt5B9RO+PDZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TMPP9FqN;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8924606A337
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8924606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TMPP9FqN
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E6E5430DB;
	Thu,  5 Nov 2026 19:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918E51F008A4;
	Thu,  5 Nov 2026 19:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908651;
	bh=SxyrM1+J7zWNaAN4jPGBV/DEjP5xQaaeFrdy3WUKUys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TMPP9FqNNmqBY13gma3CLWIVL0EF17Y7rpEjR5oEtGu8j0/5nAccodRqSOAY0XBIK
	 sWJFde8ze/z0E32EKWqSoDwi/VCmGat6qgxYytX30wWPuJ5SIiDpHhjRJsD74+9x5o
	 JbjYd13OPdEf42ZbXWoC2XJfP9LTH73IGdLeCWa/7hWVMAHtgvK8/autJqBhcRPIsc
	 HwHm90YRFACVFy6xgtlWMbABooCDLz+b12aaY+VaZIQmAyZQN3Oia9FdjSnnqXxPC8
	 kKxtPdbYwzMOzpXGVD4u93aDu71XJTcefextyGS5ABeE+dKLGe0TSBdc8Xgtms7//W
	 OBkBLaioaeE9w==
Message-ID: <sashiko-outbox-200036@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 02/30] jfs: let procfs copy in writes to the
 loglevel file
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
In-Reply-To: <20261104-work-procfs-fs-v2-2-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-2-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:57:29 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() so procfs copies in what is written before
> it pins the entry, and take the level from that copy. Writes larger than
> PAGE_SIZE - 1 bytes fail with -EINVAL now and so do empty writes, which
> looked at a byte that wasn't written before.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D2

