Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908157;
	b=0PER6Kw3D0rqgINLzDC+GJZq2sobrA+OjN75LyFdmotv9glmPwmd2MHytYrxppTWRMMy
	 6YEda18aAeHAKOsEsf+83qnQTB1KhVjLtN4RT3Jft1zlo/sEoUODA+k611eENxDyGOmG+
	 Vb2w5IGPWB/9IlPZgkEtYKotMdq/omYToPRGNk6GKshZhKk8fdSYwfNK3hNGC9JC+V1l4
	 LDpppU60fyitcu1BZiUf9kT7OouIBdHmB7E6mWkB7tdCYEydyQV2Qnu+mILe93zsoH5VW
	 GHU3IMySDr2TCh3NdYABZJRq3JCCwdGifLBBC9353++L3oXZmeYcxqIUkHzjBYsUAWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908157;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=DJ2FuCOZ25WP9BjL5sqJhCN93sGmznOaPNO9Soy3liA=;
	b=EmDJT2CdSYp4PJ/6JneCKEUjQNzjcxbJXWPDQXUNu4IMyP7GWWOrh3TGLa6ka6zXIbq/
	 ES7snuAeJTUzHWXF4NKvMhSrqGXGoAAxbwv8Lh3l6fYFFD5BBifQ9TE1SsdOS/k+nAf+t
	 8QE3vS1wsmRQNeh79cof/wC9q8VS+wC7v8KvgKOC1++Nx0JMQKIki28Laxnn1ChGNBJ3m
	 VWQ+9cVNfciLlhuASvGAPF96anQJdmOTJYtHN78xPY3EZstc5OWHv4w+0YgAZW+cZFPfP
	 M7sX/RRtK+pGCYsCDHdgsLKUfSg/hls+FWpXfFZItatkFDgrrAnzoaJGC71rZfqFZbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDNZQIwt;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7D4606F5BF
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B7D4606F5BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDNZQIwt
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9158A60219;
	Thu,  5 Nov 2026 19:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EAD1F008A3;
	Thu,  5 Nov 2026 19:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908156;
	bh=DJ2FuCOZ25WP9BjL5sqJhCN93sGmznOaPNO9Soy3liA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iDNZQIwt0cb0jQc+O6KdhC9zGQbMi6UO/u3vkRuj84S6NYwrCMMgKBWk2lRKtl1Bm
	 OMrKDFZ/N4us3R1WBxlEVOdXmKsUNMG2/ZYOeQAqTuOvpoCgTsf0y/DWEkXqwq/4eP
	 ytp8wA84Xuc/o5GwBeATfwVp82Kdq+coa5UqQgN3VvWZXc6I3jIJeSoD7B8c/yuc/E
	 VlL5c2FH4+UVDbMt0zECtukiTyAx5nk+qywTyLYhvke6cK68jQDWL9UPhYFWTSw3bC
	 qvZIYjyJXKKaplWXlLHQZ4QPeH6F86BG0T4n4bJy18hD0f1D4RaWPvbu6T8rmjlJDH
	 J7pTsAzwsxqVg==
Message-ID: <sashiko-outbox-199991@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 05/26] PCI/proc: let procfs handle the ioctls
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
In-Reply-To: <20261104-work-procfs-drivers-v2-5-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-5-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:14 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> The PCIIOC_* commands take and return plain values and don't touch
> userspace memory. Implement ->proc_ioctl_buf() and list them with
> nothing to copy. 32-bit tasks go through the same table, so the compat
> hook goes away. Unknown commands fail with -ENOTTY from procfs now
> instead of -EINVAL, and instead of -EPERM under lockdown, since they
> never reach the handler.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D5

