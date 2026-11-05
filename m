Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906953;
	b=o63zHeQGdFjP3yUG0m4q4FVbOvaCnQRkvcSomqnQkcfNvlBjz1RboPG0lM+48hH4YAF2
	 FzQdxrF27dpeOazmGSfZuGMwKer8+uf8V5jjcaNC7KChVcYQNp8wxUHRUBDrnrgt+uklf
	 x6SNZ/35BjEliHRercbt6NwglkQp8y4QM5P2P7c7t/i8TgMAvvAUO8ie7lGukQxH3nPrV
	 KOoY8owviC2KQrVhZms9ncqxNeDPzqIzAn6T7pfHz+dqZk6eU096JwdDXn++wKaCZmuIG
	 rxIjcHRh3rjKWyquJ+9HsuhPdHCOZqtEhZJjPMZBgTVDEpWYfO7keTySgdNDrpUBJzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906953;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=qYpt67HnextFoZu9a0KvUobhiMrlWn0ba92Ucxvlod0=;
	b=ITkQGU8YGoDbZDCYAJ077JXiB7iXAvOBNm4OD5l2Q1rgrSDQRRTKS0XPqZryWZZxR70l
	 n3hyygiAL0QM27SbSBT/9gPbhFfxiaxKnG8ieXPRtE/WjgUTA4+bWRnmQ9WiBtcyU8urT
	 7X1ZQLcEfDemTVlZ2KR2LEK7jkkEsfudwA8VxotX1Kn8GlfKsBjw8hNeo1JCRL24eAa6g
	 8ykHJhZ2ulKxgSYUcSHpuFSFH3r6eD4PdROx2Tmvkz0V15R+NTDW28GhyYbAIg5lU+dJo
	 srkRX9phBcGPZFg0BllaDcINsDzHEoL/LgP4J0Eec2GNJYFXU7u03G+eUZtNYN0+nxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9LZ2DKZ;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE79606A329
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CE79606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9LZ2DKZ
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6790D4229A;
	Thu,  5 Nov 2026 19:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4D81F00A02;
	Thu,  5 Nov 2026 19:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906953;
	bh=qYpt67HnextFoZu9a0KvUobhiMrlWn0ba92Ucxvlod0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i9LZ2DKZwHnYK5IpY8mSgV5ajhfjdPLY2QdoXn1KOHQtU3MNPMIIkqzWJ+l61PaHV
	 U4dn1Zre5ud+JMQhyzSRt0SahDPp8PERyeSmTGAPSvYaVGithpx7UUiCiDIS5aP7o8
	 yiknyv3w+lNWb8nJUJPnGF9DnIsx87AjkTzdJfhMDt1aWvCVUScDfBwaHfX8FD/oDj
	 FjUdNKDwK332+g6e7b3tL5KcI0s45HVKxfoQTPNCErl+nxaNU2QdXrNYqhlAfGWWfV
	 VnoGmeqjnxuET0EKbWs+mWU2b1yq1VMOdgFBtgPIpmMZpWj0oHgAkiQaF9fwq+c8bn
	 4Bjmd0UpxAgSw==
Message-ID: <sashiko-outbox-199875@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 12/51] powerpc/rtas: consume the whole write
 to /proc/powerpc/rtas/progress
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-12-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-12-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:11 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> ppc_rtas_progress_write() shows the first 255 bytes of a write and
> returns that many, so a writer that loops until everything is written
> shows the rest as a second message. Return the whole count, the rest is
> ignored.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D12

