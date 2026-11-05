Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908694;
	b=odB/shYEPQgZW4yG2DTKcCrlZEqu3HOVe7abeWDCjHny/S5I1DEo2dWdSfXZtszQ4Fy3
	 sqDNNZF0wUPOCULlghK+EmHiOjnW3um804HSGaR5Lyn9BfSUdOxPRRQhoAfZZCiyA420U
	 yS/PiwXgPD2psCmhrh5t8uV7l+7SdnPxkuRsgetF9tX1xM8q1f/q4VIxuQkgpg5UJWegp
	 d+4hPtLhAu4yV2Ud/ngkju2GKkhzGU+wbT5eoBeoGtkGBUklN8cGmtYd2Ji6abZoJSdNJ
	 dBxuiMM34uMxWWT22CgpOMZCMc9G98rNQQvK3T8tE1plo1SEqlwkx8IfCQvovhZ8jtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908694;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=YYAZKkMFX6DHW8NngSlh8ql7fjU785sF7HqECiCsMnE=;
	b=z2fvkAqg0yT64job3IsqHjr39KAWyRuaMU1goz+7z2cjxpYvmKaRIGqWvzLe9fM4yv13
	 jxnGIoLn3vxd9abApoHD5AY0D+Ca8YBiVC3OSmNdrLwvCbMoMwfbSL8gN160a+p9MrGHx
	 YLgGv+vWigY3zBzSBCEMHyrPI/L8FYbLrY4DW+vg2FClyqAp9DulniG4kNAuGYlVSjWPi
	 pTIY9V5+FJ7wTkKmfFOPvONADLyTpWFhJqS8dZ0omZ1tJ5M9pIVAapW+/vh11kEoXq/aF
	 cfSAZbQ8jK1A32F5r4S3HUs1kaJEVC2MZjG4RkFG+YWmoVH6AmicJaK9EoTLZOE2WtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghRyAMem;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFAF606D832
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDFAF606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghRyAMem
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 39293600E4;
	Thu,  5 Nov 2026 19:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF031F0089F;
	Thu,  5 Nov 2026 19:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908692;
	bh=YYAZKkMFX6DHW8NngSlh8ql7fjU785sF7HqECiCsMnE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ghRyAMemqCpDi7g7rwz8fZ2fD4rQ64uE3KXgrCCHOvgfk5ulfB39FlQp35/h4yLvz
	 dJdBvRlAWS/PTN7GeRmMV78w7VqDHy1yw1SgfdLtFs5/ro8pCEevp9I5o2mEV4hsre
	 QbUCFmiC0JedW6U3cu7OBk36CzsUKVdpFd8AlKrLBUaNINm0Rq05xkuO59vGhcKc2W
	 MbZC6M0cbvo1WoSsE5wbuIKHahbDptO0PVuWiY8t7K6A87m6Vc4FyueopwrwYcHZaN
	 KqSAWANwgQUzptp7Pyc6sWx7RRBy4Y1o0Tz3+nWkyqFbUtHlNjL5USIuJJe5DNfQ2k
	 Q92b2uhcE9aIg==
Message-ID: <sashiko-outbox-200055@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 21/30] kallsyms: let procfs own the seq_file
 of /proc/kallsyms
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
In-Reply-To: <20261104-work-procfs-fs-v2-21-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-21-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:58:11 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the seq_operations and the size of the iterator and let procfs
> open and free the seq_file. ->proc_open() only initializes the iterator
> now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D21

