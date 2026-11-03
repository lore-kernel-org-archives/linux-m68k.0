Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719119;
	b=UkrfJjEkw2Qz+tsx62KN/XAA/RdhtiUMdab51QNk/SJpEKvfIphlvfoKWRXBYW5KBhxi
	 w4UT1U0jw4WiszQ6P6+yvbm3ZRzLP1ZKwpxJYbwu0GBKSt8+xFcSlonqwhiqiscDDjBlt
	 IK54mfnpzgDARqYB0OP5xDKBTsTwi7mvoApwpxLcsug1pD4tmq9M9YfO1Oq7M2i6rL2kd
	 m9mAGH0+xKyUEjFXJaEV4rSlPxAFxw/1sGWMWhHLKWmYfv1iOBhxj5DJvrcP17V42WP0x
	 kXExM69uAlEiiMcKRPXyZ5Xfl6NdiPQd3zwQg7I7ynJc9hMh0e99i7Bvk4+uhkhB/CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719119;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=iYkrqCMK4sFn+IzKtXYQ/U5EAsE/ebvjSwDe60Rgl0E=;
	b=hoRUiW/ANxbhpgmmjLV3qQQqjV8t5BkMti/59N4/AIGsJutZdP0xhDMIZwH/q2xQNZXt
	 SNku8oKkTTx90/0cKpZx3JV3v9Nc739bfc7Q77NA+JYI0kfQZ6Sba9tcKZeKVZMokWi0q
	 zM/CceBifmjs06054MJVmka9gEWjId+a/sOMBeb+x7J68vngXjpCHgaSdIi1U88tC3+WX
	 D2GhLHkSvorFjyHpXasx7rr4ZLfQcLNT0Fal9waBYd2tEUEHMDAnpO49KibSMx/urCC7L
	 wFweBMXshE+zCHSYZy9gq1Fm/RZR8QcNHjVZeJagRRADIBEgL6Ks0hY6ih+93lIAoYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HpJXKwG4;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B31606FCED
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B31606FCED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HpJXKwG4
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D83B4037F;
	Tue,  3 Nov 2026 15:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7805A1F000C1;
	Tue,  3 Nov 2026 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719119;
	bh=iYkrqCMK4sFn+IzKtXYQ/U5EAsE/ebvjSwDe60Rgl0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HpJXKwG4c83h/WlMOPfbG+pXRjut25QP4ALof5n4perASl+pG0+XdnLAbH2pMqjWu
	 ZpqwtUvq+pwD25biFv2DLmaWL7DlQpG3/qb8VpBOvxd5wqf/4VNn1Juy6IsBSymW7g
	 LtxumV7l/CDvPksMz+J/phWUSoo1dPWSJ9E/KVqcESkpZHFoXwDV2h/RTh/BVVsupo
	 ywpSTGwrOlS88G9c7TocjGL//IsVNc+C80+riS0EcI8W467Qh9hACT4HrtUR2laHK7
	 s3CQWjYxjczoY5WJryXtrQuJdT8nqogkMRxvjIzU1yLUca1vgAib4Yyq8AR2OjsCdV
	 hQ9tAaJMXUQbA==
Message-ID: <sashiko-outbox-195587@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 07/23] s390/dasd: let procfs copy in writes to
 /proc/dasd/statistics
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
In-Reply-To: <20261102-work-procfs-drivers-v1-7-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-7-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:18:37 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() so procfs copies in what is written before
> it pins the entry, and parse the command from that copy. Commands longer
> than PAGE_SIZE - 1 bytes are rejected now instead of cut at 64k.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D7

