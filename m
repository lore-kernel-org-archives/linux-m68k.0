Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718083;
	b=4nCzuPuZm3mbtaIGyXYREmCLgUWKN1rGaIC/+r/+8dyRuUgxYwhuRcvzIIRQKemANZ8O
	 i3W9bip4Ea7XNLnuo0FtSoZg7Di8w9eWXX6tY9NyURvSXRVq8ZQ4qxrCd8nmG+pv8Vo6n
	 ujGiaIj66Xjct79BkL3HJSy3j3g9fr8GhKzxbvhOwRA9ApnRgmsk5eZrQI5aLvZ3Lfukt
	 RmivSuDR40sBHnP8rU8lZ7d2zmyblfyfj9wl+UdFd+MOQWXC+DfL7bCWiHp+NbeuvJStX
	 nENxKyjQS0V+sU59HtJSgqdwgMivDvDLL7chIOa2Y04y4olBjCHC2y6bvIh3aXFxB6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718083;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=Syy1LgUFNYfSx87H66aCq59eQL5QmobeRV7Tv8sgLNY=;
	b=om5dGUhNsUee2MIaLmWi5mgDTsFDz0SkNZn5w7BhU/dG5Xd163qeeJ8UWGx5Tp39VLO/
	 nEVCeTIdezU0t76QkLtPXVJ9oNFTjTI+6X9AAOosDO03koxtYYnhhPaiBtQQxQKqu6xza
	 Kg1HpwzIb3DFTR+7A+SltyRVkkOoQavf/6zLVd/Be9TkQ0umh1kLYDpYAkiwpYTJ+fHnq
	 PoHCdHlx7LnV9EjWcIR/wxstGvuKhh4pzW0AwAOp7uVllwyiAtFIFAw2QbJHTD3bMFuX7
	 PVGEI3Xp0fgbSlmXKXMLF9ElzUtWANF+D80NSxc0/dVTdkM/pEG5DyNwz6g9GO9PQPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQ1rFM7f;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90F9606EEA6
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C90F9606EEA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQ1rFM7f
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A5D260A03;
	Tue,  3 Nov 2026 15:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443D51F00919;
	Tue,  3 Nov 2026 15:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718081;
	bh=Syy1LgUFNYfSx87H66aCq59eQL5QmobeRV7Tv8sgLNY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XQ1rFM7fpR8B7CuMfEAfO0MPeFB7bviklzJDC9drMf0sVFPBUxtSxRBwsAET6uLuq
	 86A/lVnXs2ElYSj4vKDjmBCYKvJP458x5hONgHu5bQd7fbGpMj/t34dciWXfi7wqDJ
	 fFU+zJ2crZV7Xpsjn+tHMvlBjozine7jdlnmk5SGbQsExLyqTK/2RbNWtbH4IIfczT
	 j+/yszVdEI2WEGpOCFfohvzHDpftk4H2/o8Xj1NATPp/4Sz/Frs7Oa+VUWRBUk8Fne
	 yAUJyeEi14LhQD6cE/FmxhetOv8CXAF3q6i2fz2LXak81erXq8XJdvZZpFYfJ57Z0O
	 KP55d1fdx2dfA==
Message-ID: <sashiko-outbox-195536@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 09/16] seq_file: add seq_preallocate()
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
In-Reply-To: <20261102-work-procfs-core-v1-9-75df35e4f8b8@kernel.org>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-9-75df35e4f8b8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:01:19 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> single_open_size() allocates the buffer itself because it does the
> single_open() too. A file whose seq_file is opened by somebody else,
> like procfs does now, needs to do that after the fact. Add
> seq_preallocate() for that and use it in single_open_size().
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-core-v1-0-75df35e4f8b8@kernel.org?part=3D9

