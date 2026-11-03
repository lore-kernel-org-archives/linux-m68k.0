Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717260;
	b=mfXXsF/g/O5daNfNGxPYYmK9T1sM3L74R4ooAuVM7Z3ghvsmCBtZ4puuKd+SwQNVCZA/
	 ynEMltvar4Y85ehhxg7zRh32LH2nu4gUPZ6sPNyCDTAcrz2fLGPTApa5A5n/AcYODl+PA
	 56BoT6UFB3iWGclfDi36tCuVXL6mqkiOcBMFm6ZzLd/yBisiPuLlHg05g2x4e0kiVwG8n
	 +eUF36X76itEy2ReiDJozEFTgRs35zNYj6MPb+opNIHGhJNejvmCgO8yN8I20gfjXQYka
	 RLJAmcQlXF01kg4ACx5r7ydtVFQlStZ0TYDIxQZfB5dinEl9JsMTyDL6rrSv6h36Yeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717260;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=AHZE5U1/G8L/MKk7wGGr6FGK5Q6/1gif03quLsojNHQ=;
	b=RGAcPhs+cqV0DJiZMDzE3prDGuCIZb1oB2RXoaGUODB5L8nya/jbpnVqUo+ezmJHGUG+
	 5ogET8bhfrJ/62w/KJeXgNN1ErnvCWkyrKktiml7uTIb7VPCcVd+rMD8VjjNfxW1xXY7m
	 GrIweg/8yf92ocyFihvZSWmYp+oGXjtJlyPiKHJq4ZImsCuIPq3R3liUcgkR+2i2vvqfp
	 OXFImgKu0XTjzVY0IUgKb6XoNToOmCELPC0zY7emlDqAxURksKxQU6bSkmr8e/mmzgCcF
	 WD28rgUk1/LOMPZClSPTkP9vPDkhh9J64OyHqDjI5NOvN8CMxwC1ZXl8h3iD7DxQr2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SMSRzi2i;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD57E606A339
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD57E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SMSRzi2i
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B41B643CDA;
	Tue,  3 Nov 2026 14:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DDA1F00919;
	Tue,  3 Nov 2026 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717259;
	bh=AHZE5U1/G8L/MKk7wGGr6FGK5Q6/1gif03quLsojNHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SMSRzi2iAFg28V5GkWAlM9QpBqGeZuRWtZTUm0WRq97ectI/p3rTRq3mnpNy7ngxS
	 UobvvqSTuRoo9QscSCN7Ayu69nZQ2kTxWUzR7HxT93yBXyY7WzAqTZdcWVI2zEAQ0Y
	 wqTqaA4cjw6oZ+WaCsoJFAWRYr0VGsPFK2+ApHxBe3UdltXRfdUBqr1CozJORTaIKE
	 Jgw4HsGMz1cEl/teFT45xpUxDv6vM2m9aCJlOtQfMTOAoxPRwRZc0ehArjp9mz3UJW
	 tgQf+8MJB+svNLyVTvanGS3UaTeuGomFgYbJOww1liMOiuGQbS1iPFbGiH199iIbXN
	 HucjPbCeRQYaw==
Message-ID: <sashiko-outbox-195478@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 06/38] xtensa: simdisk: don't read the file name
 without the lock
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-6-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-6-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:47:37 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_read_simdisk() looks at dev->filename without holding dev->lock. A
> write to the same file detaches the disk and frees the name under the
> lock, so a concurrent reader can copy out freed memory. Copy the name
> with the lock held.
>=20
> Fixes: b6c7e873daf7 ("xtensa: ISS: add host file-based simulated disk")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D6

