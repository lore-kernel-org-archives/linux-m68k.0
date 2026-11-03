Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718101;
	b=Wyh2NWxDoh2YadoW4TJW6orZToHaupbz+36MivcBmep9nbRBgS+2Oec/KcNtxwx7Y8i8
	 cffsvHS7Pkp6JyuBUgfIBn5RjfTyzyx0DLX3lEQ+457UGfyaAg6wO+SDsUVY//PHkVHof
	 FwGYo2Td8f3LOzehXgu3sjbevyTiK0BQIS8JkzdloiiP2OeuXjVr6gvYwJV7EYKTY9IIu
	 Nsy8R7Vw6KzhA2jLI6n0D1V6HerN9UBxw6FvcFd8aQAAicIYy35OwcW6iP4mkOglkONkI
	 VgR5vsqmVU+7ABKOy8clWHQ0TbDS3bR5W+TC/nYi4UDZX52x+Lj3ZF9T0AxoydJdC1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718101;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=/loBqHfb9xyTXY5jVvnLeUezXneNMR139AeDEeuZehA=;
	b=AAQBqmSwNwl3S5+3BzFQaeMeXShvDk6PoOsESMY4lAWQGybcrlmAQpBowQFC3llVKIVQ
	 R0HLItrVgQEqNwQgAlK16bjH6xhQSoNdgWO2AmQv88lkpz9DPWe43KFrODY6LfA2r9xnQ
	 OLvC7QedsqA6nrQ//vI+DEQEf+KL7H7p7y97e9k2MMyhbVKTHv7ZOxPorRP/4gddN2Z4F
	 E60nlJJt18zWW/Il4dojqgRy1WMhzyM48EKzkYG6EVbia7h0WUhVn0YRTlSaaDglwXsBC
	 jzSww+IpIgveHayH/U65JsmarTSSMnZ9+VWYOIzuMwadEudRH19l2P8j4HdjQQ/eryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=POgogA4c;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9471606FCCF
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9471606FCCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=POgogA4c
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FCD84400C;
	Tue,  3 Nov 2026 15:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0B61F00A17;
	Tue,  3 Nov 2026 15:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718100;
	bh=/loBqHfb9xyTXY5jVvnLeUezXneNMR139AeDEeuZehA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=POgogA4cI5wWOeMz1/cd+H4XvoMVMIqL2V+G+9Xb8VwCCRW83BzcmpLvxyFEpcbxe
	 /mCmUg5eXDwuaxyPwlwAvbKSw9zAx9Xa82K09Vni06bzfAy7YLvu6siA/ipSvBj2rh
	 qF1ewX3Ll1Mq4U/1lE3GqVU9xpuJunXOk7qadUPJ7/+1WlPF9/quSAmT+Y6x/gL7C5
	 3liOSC/FI9jN7BDbCH+iEIkaGanVOlPqZzbv9g0LZ0T+zR7LlVVDb8k8ypBMeF0A0o
	 YrstH3zBltw7mcoX5EIv/3z5moFT7qEVZnlXcgdb6E08qa2zhuTeeC8xgwd0aDyljl
	 khtjX69PBXsaw==
Message-ID: <sashiko-outbox-195543@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 16/16] Documentation: seq_file: describe how a /proc
 file uses seq_file
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
In-Reply-To: <20261102-work-procfs-core-v1-16-75df35e4f8b8@kernel.org>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-16-75df35e4f8b8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:01:38 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> The example in seq_file.rst hands proc_create() file operations built
> from an open method that calls seq_open() and from seq_read(),
> seq_lseek() and seq_release(). procfs doesn't work that way anymore. It
> opens and releases the seq_file itself when the entry declares its
> seq_operations or its show function in struct proc_ops. Say so, and
> point the extra-simple version at ->proc_show() for /proc files.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-core-v1-0-75df35e4f8b8@kernel.org?part=3D16

