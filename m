Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906971;
	b=EdUCv58tiv0GyR5oBj+DlzkCkpTv4GPaVLJTT3wWYRlB/3eGzEheYmzOXmfv2/8dMJIF
	 4zIg5GrmGWjWaM1rj4SKpakEmaV1qSqU5f0UUKcXkBDz+3htrBo11GKFAJF/2nnqrz8mS
	 J86NTOTkOGMOrtnFAvxkjCT6wEZpG/UAhBTc84rRR+Yxq32mtdh9310I1V5T+qiuyvh5U
	 5HXpG3ez5D6Rguxz6jm8cpj5euI1/arBJ0vi8iFcfMvjSiIHU7HMfAxSeZPjw/f9rBi19
	 5SGf6IQAx7DMXEIekaG4towcVT5LmuvsdLSocOrKMnO8GmLQyeZWbqEk0K02gwGGNzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906971;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=S86yJ+B5qGfSA192YZydUPkrd91cCUN2X40z9NmB8To=;
	b=w7HzEGD7bQTHxTwS7w7LX9/eOR8Zru4LeAUXk3AY/2vyHEJAF6hNz2FN7ktZ2Q1bQqNK
	 +td2IAnXsP5RNBEhXH5DJHypCwlRFM3loBtZ3jgZTkdqiFmYBpjAlbW1fFd/ZyBxNIqpU
	 Ivr5sQk010uVm1fvL7ICesOW4IecKMtWyxbe7yuKtM+lihfDWJddoCXhLZotJJFIGjgjM
	 oyIphVNiXw8vi7KWv44djGcjkSaT9iUpUmn9sGLRLZxVkljwn0BmOflMDp3RIf0y4WV12
	 KGukDHnbUlSbkOhXCCzC6c31E/agWON8Z/Vhc/+JejcSui23EUMK4/+J9km6rO/gFSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SeuBgQaq;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5236606EEA1
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5236606EEA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SeuBgQaq
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2544432AF;
	Thu,  5 Nov 2026 19:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7321F00A02;
	Thu,  5 Nov 2026 19:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906970;
	bh=S86yJ+B5qGfSA192YZydUPkrd91cCUN2X40z9NmB8To=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SeuBgQaqVWpGru3W9sij1Kx5fi/6U5rjetwB+P6G5tdeUO4escEUXQNsmkQ8RZJsR
	 N3ad0PsJzqTqBNUpF1Gq9bKq4Gs6PPnGr2kbOldzxfmsAxwk/I0ywFs+3s9dEovcpK
	 4fycBMvMdv+bDBbPSskelSCoXY5q3AokzQXZU4pI9d+YtuhY/MZRj5JY5FqeXz0QwH
	 wFVR7pturO91QWS5cokIA+tbR6398bzKWWYmaM6GJBXeAUZ84sKfMtfLgH3UqLIkJu
	 P5j0DmucSdoJn5dFSjExx6Tv1oP+zwkmPj0euNx6/FjN6JIUAcg6dGbM/GzyKStVRA
	 /FuSc7MXCNWwg==
Message-ID: <sashiko-outbox-199883@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 20/51] powerpc/rtas_flash: don't read past the
 validate message
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-20-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-20-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:28 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> get_validate_flash_msg() adds up what snprintf() returns, which is the
> length of the whole string and not what fit into msg. If the update
> results the firmware hands back don't fit into what is left of the 256
> bytes, the length ends up larger than msg and validate_flash_read()
> copies whatever follows it on the stack to userspace. Use scnprintf().
>=20
> Fixes: a94a14720eaf ("powerpc/rtas_flash: Fix validate_flash buffer overf=
low issue")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D20

