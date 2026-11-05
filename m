Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908710;
	b=WQqLqks+pw4u8QL4/ZRgRAvn1NKOnWsYaNJ92qmLz2Rzks7E3dnfizNHXxTd5rm2gvQA
	 bxIkxOdiHg5bJ27w/lS2LpfHIxorWHYsZVBhQAs7CC4j9qziChY0WsaUPB9e7qMi/c/Cl
	 pycwAm16EonxmwkIG0peGgPl4Ii0FVRkjZ28As6oyJb7JriWeVFibzlrsRO1BD96va9UZ
	 zEXRgMAW8guyuPtHp6DU1UFUGDANrchRtr9jUyUr6XJOnFyRnfAWrW3W9fsq7Uw8ERnXJ
	 Zs2edWyHdHXj5kSdnJZz0LrScARFz64Wwx8m1i+vEBw8ZRZXirBXZzvRz3oZSDyNRRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908710;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=qSNK1g0gSW8NugUx9zVEDY63C5++zrJDEhwhYFNbmMc=;
	b=FkOzqKfsMjlqa4I5kST7Q/GyaIRnhWPqOJuzXU+sBn5eFRkgUmg7/L3ywmWLCZiDRZ9b
	 6xsMQ4FxKVJIqf5ehtfIxnuig3O4r9QWDvqWv7IO2kuxMiYol3SoaUFFQJG+zMxEXW0Yt
	 AZDYxWQaYdjNivTmiLueRKgR/Rc/fg2dSff+fibOObfuy2KBQYEd13mdO2YCkyoGZjyHD
	 2C2KkAxs3JHP4EPs6+AFQJ/LiDw+hMA65eJF3vS0rQq+3zCrmrfC+pDjFtmYOEgC2hxnc
	 efVnPO4MJ7oq70O+zWNBT4Kpsk61KrHPYJ75fGQzcvkCYXQyWxSOfGUzYxf8Apm9Hpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUfhOJiZ;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848D9606A6F1
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 848D9606A6F1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUfhOJiZ
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F3E3F605E7;
	Thu,  5 Nov 2026 19:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252B71F0089F;
	Thu,  5 Nov 2026 19:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908709;
	bh=qSNK1g0gSW8NugUx9zVEDY63C5++zrJDEhwhYFNbmMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cUfhOJiZdWr6DDCQTnU/s93PJB4JOqbWSoZ17+yjyziH3vJoQR2wves1ua4+azPA4
	 9xnUL0g8bwEZO/6uFsybrC5mVZzodq4hJVZC9a+qjACBfuaBvEa1w4RSHE+p4rAIXi
	 yR4xvliAgsfXOGdoZOMUuWbJi5VULyFuULx7vceAZqqhtyxLRa17ifJr6uZPDVOHat
	 DXydvmoCU5SqPOOVKdhaY5XZ40FQu2UC1b9rBhrwM2sWt1WWBtJ9AGKxzZsqP410l/
	 3YM2Bzq86iRR/+aFKabvgF/Pk22XU85bwHWRmCq4Gt2ERFvOGy9inAPLsEAMITZ/aL
	 ZMBw/vQ9y307Q==
Message-ID: <sashiko-outbox-200063@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 29/30] kernel/configs: let procfs copy out
 reads of /proc/config.gz
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
In-Reply-To: <20261104-work-procfs-fs-v2-29-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-29-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:58:27 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_read_buf() so procfs copies what is read to userspace
> after it unpinned the entry. Unloading configs.ko then no longer waits
> for a reader that faults on its buffer. /proc/config.gz asks for
> PROC_ENTRY_FULL_READS so that reading all of it at once keeps working.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D29

