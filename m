Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717252;
	b=O1P8Y7NrDpoHzcLeZXKGTz8iK/onrXct6kiPC/ou8Ra7EVQfGdHN4DfnxnmkomMHUVSI
	 qOAp6KqWEeE7AX/k8QtPHKXJiCwLXvT0Do4/t7TqBIejUEo7iMQMPSswLPZP3XY0Uahhv
	 nrxdNS4jv+B7Ysa2iWKEblBXZyRaHQv8iE0n48ZYhVsst9tKcNc/AIEWPmaKXyO6/VAex
	 aXNXgZjO76jtxKH29FRYlmBKDHs5mjiHxGb1aAAjltOUoXHI8FF/WfDGHn6Gbi8SF8ldW
	 j0pVSFB2tOIPJWaljlmW0i8eAXRTKqsEcnIpXhKgSTP074uPp50Sf8yXhBahYlqM9tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717252;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=0X7QfirFXJ6TGEt0F0HTrCg+kq8+2Z7EgGajwy7tHN0=;
	b=TgTrbVcZDar28++uH3C4vaAvIqrb4uq2vJtgckGuZzP6t736wY/nkSSBoaL0liao7JYG
	 rLSySqh3bAsXpTu3Csw3bxE0iA2v70Nuke/AZBgB3a228eTEi92up5nSuZD/mT8R/APCL
	 b95SyObdJMdbNDdnSxf/RuyrCl2XkBXUsoOXY1xs2VZAyvSyvrkyEtQoXKaOoivmCOjJy
	 rrj9Ynksn86FvzevzlRYi2qy6YyaylvMrENm18GEC802k8jwR8jSXWQE1K0YlmQEV8Xvf
	 6WrWTWrs/9EBiiQ1XGIFnUOxb690SBHdb6YX3C63qlIG0Z/5s3wzXXObJXnx6PKxLxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJTPNleo;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B1606A33C
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E41B1606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJTPNleo
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A1C8C41869;
	Tue,  3 Nov 2026 14:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DCB1F00919;
	Tue,  3 Nov 2026 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717251;
	bh=0X7QfirFXJ6TGEt0F0HTrCg+kq8+2Z7EgGajwy7tHN0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eJTPNleoTplgC2QGyAMCEdjZXP18HitdAHpzSVn25D2DW6ccMaFWAr2LwluZydLLw
	 ohVn1cisxm5jNlK5vxJuJIhskLbddiSBnOvJJDXiE3Cu75jtXlQ+8SfeBkpGpWHjBn
	 i28pGRmIIQunBQfMvgJEeYVPdFUqghQBhDG5qp0f+NtoUe1/ghWBC/xCF0L4SXMPSn
	 SBEK86gW2rh0XRAw4rFfYn2bpevpOMJTo8Vf+khdDv+g4gS9a5A6fT8mlg3qaBlIVe
	 /HqY/AYZ/tsDjOSd+E4CKNLsEU1t/Ch/2G5hhpWYurg9grTBe6GvXEvrm0lnVyKiZR
	 b5T/Q9eMN5Dkg==
Message-ID: <sashiko-outbox-195474@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 02/38] PNP: isapnp: don't read past the end of the
 buffer on a large pread()
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-2-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-2-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:47:29 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> isapnp_proc_bus_read() truncates the position to an int. A pread() at
> an offset like 0xfffffc00 turns it negative, the check against the size
> of the configuration space passes, and the loop then puts everything
> from that position up to byte 256 into the reader's buffer, no matter
> how few bytes were asked for.
>=20
> Keep the position as a loff_t and clamp the count against what is left
> of the configuration space.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D2

