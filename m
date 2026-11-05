Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906975;
	b=LR5/wWlS/7ZQHkYNztwJVvGT3sr07PclC+MJo+z/EhfOqgMlI5QpKxKeDCXKx0ZNJRBh
	 dsVXDJzmV6TPtRGjwlbvBtH+juj54mAp0fJNmzSQc984t7vHFTQkb4DuNmQz4WRbyGKhe
	 pFpRG43A3dwCLGWhOoQr3SDHu9vBIBiCsK9cHpjwVrkxzmqZzGXT0CgmLfGV/jaGFMOnJ
	 Z6o1CoPU0gEB1P52SGEPzSTC9NKP8WF9I5o9lBfH2brLGkw+qqa8aA+SJhvP9o9OXx2Q9
	 RZ+YybahCzSJ9vuxGvqzP9unrLnPYqoofzBh0PpCz8IYqtiJm3iaxEhsf9SNVRWMqag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906975;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=s7YUKef7BFu+t5XEUf27mYgbSbBWVu+8+BCQQodHQIM=;
	b=OeWIIqltuQSqcFGPQ135cZVscrxJ4gWte011/IbReQO3qiBXk8WTul9X0dCZ2EqxedMr
	 uWgS45khePAqkz0VrtkjtSrp8cebdSKCifCH/ldLHFZl46iBUglkMIX9tC+cRj55HiW90
	 xlwVbPfQcsbMGT+D4FHORPughTmFr81h11+WoVv4SSeAJ61+Hb4W7iCA5JFUa77Nz6HVA
	 K8gV7fExnSfBV7go3icORbBp/BDIuS1plMQYKGVZ68WzxpqwP+EIJE4gEGmBOdG0rTGcw
	 VRP+93MsOq3+JZWMXRKQZOFEG3W5CGekSK4F5X4MaRA+9axdSo+fuqpwSTD92UER9oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CFNYPAMS;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463B66082BCF
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 463B66082BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CFNYPAMS
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 936DB601C9;
	Thu,  5 Nov 2026 19:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC85B1F00A17;
	Thu,  5 Nov 2026 19:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906974;
	bh=s7YUKef7BFu+t5XEUf27mYgbSbBWVu+8+BCQQodHQIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CFNYPAMSI5sCEW/YyUYklINU7Fxf6ltbRx1ZNXJcQdWP35xfHkg0R/GPGuwwjVhAQ
	 741BsxJ8ZyxlyoKvWVueb+LM/CfsURlJUffTsWq6x0TMNVGitAVn5fSer6YGg6jgv5
	 lEFH8VGQ/Gp1VbDBp2HhNH+CUoLREdcmmtmppYOGsauk9TUUPCY/9c9PGDpKUaF3B6
	 o0PkinsVwNNc9DxjZ9DL+nXM70cpj61WAjeZzoMf3v8QXBo8Tg/22oM2dzREgu1T6W
	 WjDrKtTyZ/gXDCTEIX6ROtbou8/AbAjJa7/o9AM+4cnv5xJEfcIIpjjZx0lr7/MsiY
	 Qxk3XrczYpl6g==
Message-ID: <sashiko-outbox-199885@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 22/51] ALSA: info: don't write past the end of
 a data entry
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-22-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-22-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:32 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> snd_info_entry_write() clamps the count to what is left of the entry
> by computing entry->size - pos as a size_t. For a position past the end
> that wraps and the write goes to the driver unclamped, for opl4 into
> sample memory outside of what the entry covers. At the end of the entry
> the driver gets a count of 0 and vmalloc(0) warns. Before the clamp
> moved into the common code the driver ignored such writes. Fail them
> with -ENOSPC instead, like a block device does at the end of the
> device. Returning 0 would make writers that use stdio retry forever.
>=20
> Fixes: d97e1b78239c ("ALSA: info - Check file position validity in common=
 layer")
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D22

