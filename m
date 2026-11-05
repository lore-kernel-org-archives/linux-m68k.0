Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907031;
	b=Ev+/fSYf1sBhULCA02z/RMJUrOQ0hw2h9gnVbKFd13VDwXoCQBDf5J8XmGXWGDzr0/uT
	 CEeQtpCGex0ywsSOZ4XnpQH6m/MPJ6ZZK+9Mwwcmo40RcGNyVWa9w+fguDs7hVY1WfFtn
	 8TQAgQWA2irHk3rl9L2Db4FVfuCWUEJTdAXts8q8S2DJi9BHfmPq6m63fnDeQr+OFExF0
	 s3u8MSmesGh/rF2U/KzfXqgcX4LVk1l+sWWv/8Pv5k2KdBcmTTqZGGnBIzu4DkMyNJ5Wx
	 FVOQ7gaZr15/ZWX74U9M2rQkYyyIJshaGDepuJjojnmxQaTer9nlcghyURVSYX5SZAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907031;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=5aGzsp5KdgMuXiH4cPLLqfuaFSwdYC0fVhuh3RxhPKI=;
	b=f/wFq6ZJv95fnQo1esSQrMeATLJaJLzhsYwXQoE69qkm0Gx25YeesLhnKCmWe92JhFJD
	 MOt3cwptMc1aP+WaYT3RO50Dj5/eTBZn9bOfsPZsYzr7nzfKNOv6bkIvTdz8RKHuz52od
	 5kzmoWEJsqhw94V/5Vwpk1/H55D2hHJQGkICq893EHFSFwH01f0MCytP0L36Wvd3ZptVj
	 Csfs6QMCiP+valIHrQpH0ek4pR8tiNnW09ucLUuVqwP1JLVdfaS8SrDkluw1brH7PrxMA
	 UyiFlq/wvomIPVUDBHuvt+fwwI59JwEJBCv/0UOXghEL10SkZOLFhFnvsILuN65+viQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="K2B1lxv/";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2CA606C894
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E2CA606C894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2B1lxv/
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E26DD40E48;
	Thu,  5 Nov 2026 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F19C1F00A16;
	Thu,  5 Nov 2026 19:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907030;
	bh=5aGzsp5KdgMuXiH4cPLLqfuaFSwdYC0fVhuh3RxhPKI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K2B1lxv/jKFYgwMG1NDGekYrwHfux9B7Lr7YpeIbjYFC35OEbhjW8Gpq8v4zquLqB
	 Z4pB43t0ZFCbMfNEQFK14pwDCS+MJMSzNhKmk4jye3m4E8h1z5FlvpH2Ti6nWmlmXv
	 PD4sVjRltWsq+GUhSR8G+N2nMA8hfy3KQopKQglQ52iAbw6oo1rkFrb2wRdkx4DFbD
	 yAw1hWQRYtDcwJ1O5ly6RFK6tEeSZ1CDKnU+TKvYYEVsr5f+ntmDyz/BK/XOWfo5X+
	 SdsaxDQDu2u1NgohRkw33LgDeTvk29zCkDLG7cFajkOaw7uVHNhan/wbprVyf7LjAW
	 sAMrc6/lSDo7A==
Message-ID: <sashiko-outbox-199912@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 49/51] selftests/proc: check that faulting
 sysctl accesses don't hold up removal
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-49-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-49-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:30:29 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Read, write and list /proc/sys/net/ipv6/conf/<dev>/ of a tun device
> with a buffer whose first page is backed by userfaultfd and remove the
> device while the task sleeps in its copy from or to userspace:
>=20
> - unregistering the table doesn't wait for a faulting read(), write()
>   or getdents64()
>=20
> - the read still gets the value that was produced before the removal
>   and the next read fails with -ENOENT
>=20
> - the write is copied in after the removal and fails with -ENOENT
>=20
> - getdents64() still lists what it looked up before the removal and
>   fails with -ENOENT afterwards
>=20
> The tables are unregistered under RTNL, so a regression stalls each
> test for five seconds before it fails.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D49

