Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906976;
	b=1BcGiRmWHDs+c5xjVJRSmYreFxOrzkDV7SLZrsu6djaQAGdjfApeOp7JeSCUqLNOXriD
	 ofeAOgKF5CxUWmdB0b754o50n8rIRnINSwHoZtZS9HxFMbEsZZrtsPZzVFsveOwyyB+0m
	 okEj49+9bPTjbor5JA6ht7kcoF6lI5fbGoHfzK9eDGzGqTQMRAReOGlpFRauq3dPep+EY
	 Ve+LncTkFyHZMCXPPm+bmEDL9lfOz7y2QXQLCNKqoaoY9hSmTtOzQuyoo4sA6pE+hCBRM
	 a2rUTOnJs4fjAH41ujKCWY/lboB/gOeRmU1zN/aZlqsyYg0VDF2sv5UPNKwdz0LdPKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906976;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=PTE5j5M1lfXRKhGqS4rQ0FGlegosh6AezvyKz9Oa8vc=;
	b=WEw5Kf7KgV6A1WBmb/sr33FbsKuiBi/F1vZo/Vd1y7Zh2BaY5FO3Tz7rBDkI/h56wMAL
	 l7dpSkjEusRe6KqULVkpKQj4I/dKhf/7ZyMhLrWbBH1HtvKvoWV/rxGpxm2ys0mp3AOKQ
	 3EiQHL9Y5OL9M1JmMD9ZY66HyxIRlL8LfnjeS+ba03PgciITYMetpHTfZIVNzTTT0MI/9
	 3HuUY8C5VHxkbte4X2ZeqBAOegc/1+ieROgc6m5M7bgUeyDiyNjmAwrx3tQODTwNI7E6s
	 sJRnm/IOLkbkRIEgL4/4BSLf5tO1NiPgb+ezr5TxuN0q/65UCKmWmXrVgJlexZxmOJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h4W85jhD;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563EE608361B
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 563EE608361B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h4W85jhD
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CF7941F4F;
	Thu,  5 Nov 2026 19:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC88B1F00919;
	Thu,  5 Nov 2026 19:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906976;
	bh=PTE5j5M1lfXRKhGqS4rQ0FGlegosh6AezvyKz9Oa8vc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h4W85jhDarFXBHG0k6JfyOGr8igxfgjaZBbbaCRVTQ0udlKQRWyMl8x3vyWH1Yc0F
	 dOtLFgk+EUlfavQaPuDi+2NHDf1/BnZunAx0joRjfA786aL3mqNWdnnJweKA1yHUA1
	 iGSfM1C3r+4wCQJidi28oADHFsujWie1y+IVFLXQTuLX56ywi7d9UyNiLTEecy/eLZ
	 jxw9spucN1hAz+xXZvmAdLSzDnD4wAfRWUb7WZpsdAxmdjWIEV2sHgXEXcerAu5glG
	 lvU3C8k5MtoleqtbURHAux8hlkGA1XhQZFvBuFWItTH3nIjDF/nWCIloHR7f5PjeLR
	 QU48cCjz6Zhyg==
Message-ID: <sashiko-outbox-199886@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 23/51] scsi: BusLogic: don't return 0 from
 writes to the proc file
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-23-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-23-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:34 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> A write to /proc/scsi/BusLogic/<n> resets the statistics and returns 0.
> Writers that use stdio, echo for example, take that as no progress and
> retry forever. Return the number of bytes that were written.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D23

