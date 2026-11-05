Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908683;
	b=qkHAyU5gz+VhxufeCnYpwDh2ph5qC77ksZQjLeoWNZXpqFWF75iGjue63TCvf1OOwjQ7
	 8DrlsiIqd1daclDjiSXJBqFUTwWwel9QXXqCyAz8kYmpnoTC5elkcQeEuCOsTlYnpYAkf
	 hpkFe2oYLaL6szfiZoLOmrLeHTktJlWx8AI3K97T12mEReGvQXRPqlUCP4EbgA7RqJ36F
	 ExMZb/cFvOS0k6BU0Ejjv7Y+9E3Xp9jY9mUFwM97LFaBugF1h/U7dJ13azPxfVyMtWLUA
	 VrobD6TybLfIUV17xCRyDWfZeZvIXDeL88c40hk/qle2oJaCOdFhTTcIJgCBLhBjqLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908683;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=qvTECsoQq7diLH63c67HY1Y+MAl91kcvdxj3Yxdj/RM=;
	b=DUoi3ZJiKREcpM17Tlh5JqrnlkjXHsqtWik2wpyJl2O7e1kmu3C2JpkA9fKw3IoP+eii
	 h4JPB7KLfrF7HK8Skreg+5qDQ61MFukMIY8PwmjZEOk9szifvPsZJ9LXKxd9kiwKd0pn0
	 7jbaKdYS59Z3ufXk3R0BtrhRFuGl/5O4MKZj6wWP0B1qZY1VggCafrD6hc7fRbXv9g/fC
	 VrnK2rZcAYkQVpLW+LKPyWwdQz8eO/9fS/iLHNj+oUUwB7wSMRwucNTHBBDo3/CH/5GaV
	 dvJsfIftRg8heCQX4+Wf/GPBsn6y0ybj7ESidONPv/RFoGz2Ipq9hVxOcvj1xpMrpyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTDh6JUZ;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E77606B04D
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13E77606B04D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTDh6JUZ
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 397E760214;
	Thu,  5 Nov 2026 19:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547E41F008A1;
	Thu,  5 Nov 2026 19:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908681;
	bh=qvTECsoQq7diLH63c67HY1Y+MAl91kcvdxj3Yxdj/RM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iTDh6JUZxiIl7ZAL6qlwQn5+v0vnKTderRK+PLsTJN/oQxZhqZs4NvItFQ/UwIiwR
	 0ytPs8j3lohSXxg5Q8nkA0JeEf4xX2VinKsIB9Lhkj7Pdi8C17PHoo2xrKN5CgnCGn
	 9OwnQMlu1+G9K1qePU+Nfoo7dqS27iNCPpwMb3Y4Z/FP4V0CJWTDOqo0NsI7MIrhKw
	 rw2IwQxBa/bBxkqIfSbS3xUMeJ17ekXV5ZO+XkfF/t8shPIX98nm88xOpyW2INzSGQ
	 wh+8Br1s5sA+ebYY9Mxdlw4rXa2kZ3od6LuqlR9YyuVfpjVwxJvXZJjwCXp4kzM+0V
	 6oTHvAm1wJb7A==
Message-ID: <sashiko-outbox-200050@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 16/30] profiling: mark /proc/profile permanent
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
In-Reply-To: <20261104-work-procfs-fs-v2-16-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-16-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:57:59 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> /proc/profile is created when profiling is turned on and never removed.
> Say so with PROC_ENTRY_PERMANENT, procfs then calls into it without
> pinning it.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D16

