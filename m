Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908672;
	b=R5lqQHLaKmLy3Cf0Gh83YnA/YLDitrbMP5l/+GAATUyWsvPDMV0JXQAAtY4vfXIDDf8y
	 CYS0lsN4bVOgKTaEK2gfOrenUAJjwLCnWZJLl7YWA95SqYvRIrTCHpGfFhAwZvi6gibtU
	 fdjr9M6PEHyaQWfUWDjhWnhbN5wMEdr+tudgRrmY/+GoJM6r30JkeoHqi7wA8DguOgoJG
	 ZGbuQEQqFxNIyYlnpATl0cg6hNBSiaI6gHrIzahf6PnjdINg2ebSveT7Rd+5MlNizcgcx
	 6XZqnzSO6oevSheYU7MgOyrHm3sRUR+T3B9ZwtFipY1aWAf5BHUWQnTcs1/lI3l9WBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908672;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=wH1L4MEaZ7mTO1+v+czsA7Bd7wFLluxTEf1+OMXx/G8=;
	b=l5njMXR7NUTmD3Eez8rfPm6rr8iSIZMh0z0+U4THzHtt6Nqq5tGXqyYdVcxTOMs2edgi
	 wnjLHfUjZPaGCvsyx7JLz5bAnBDFVzJj0CJ55gLicHe0jVHbBCPjzyvWo1c9r+kYePA5f
	 kyPUJN+bxEZNtZUQaW0QAX/OS6FHF/MTRR1pPCQRh85Gl1X5KlX3zirJHF384a+GF5OdL
	 uhfuMk9CJngME9pooX1IXUI+Hgl1J5BLro7CHrQHpbqNLJBJSV6iN3lIU+LV2w9ODWf+C
	 LyMqXxooOGdZ+E3POfxGVZFPbmd6G1u3h3GDwuQ1bDYR5V90tLFxG6OOAz17HG65uEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="K7L/GY8E";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D95F606A6CC
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D95F606A6CC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K7L/GY8E
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21F95414D0;
	Thu,  5 Nov 2026 19:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888531F008A2;
	Thu,  5 Nov 2026 19:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908672;
	bh=wH1L4MEaZ7mTO1+v+czsA7Bd7wFLluxTEf1+OMXx/G8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K7L/GY8EBAiMFhQN1jBxInyHUo7dNUqa1zvrbYPCV3cNlvaj0uRTG8m5XSXkg5qBH
	 NxQgrlhnCqVof6ukdE4MBihCdgWAaKYJdSh5pmD/29Ml4etIsfQcRmUKoFVe1cyGDP
	 q11+nFgfYJfO3maFGRlex7SnG2VtLRY23TP7Hza/2OShi8+SVSRRCqK/F/Ot8puN7A
	 BIImj1rK3ldK8sG8OeFyPl3Ecx00bVxpaKA4ZbgnFfd+/z05CVTEd+m93B57VhW2YZ
	 NWYy1/qXl35HEznR9p8aOsKL+D5Ca0SsAiDZCtE/ab89zfKkPK8dJVNfErjO5zAKnp
	 FWuqFZDvwWXBA==
Message-ID: <sashiko-outbox-200045@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 11/30] latencytop: let procfs copy in writes
 to /proc/latency_stats
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
In-Reply-To: <20261104-work-procfs-fs-v2-11-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-11-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:57:50 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() so procfs copies in what is written before
> it pins the entry. The write only clears the statistics and doesn't look
> at what was written anyway. Writes larger than PAGE_SIZE - 1 bytes fail
> with -EINVAL now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D11

