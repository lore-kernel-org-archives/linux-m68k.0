Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717292;
	b=LFAakuoD9FiQd0I1R+te0rXEcv/Qm9PalMacn8T/AQE+AQD/txnmIuKMfRofgtYmJt9K
	 e36xQ3V/r6+9R2NtO+ebuKmbiRw4rRD7Ofbr7ytkwUuYVbU8Jihp6mk75uQC5+R2s53Ph
	 4rAZzHmL+OyT3zkSsBhWQEpBZye/+AkJMHu61plPeTKTfFAYwkD7m5oSSF4ZCliGhJlpI
	 JyIHJoptqbLjYJmmK98LyKJU1KuAvZpY1GJo5r6EGrrbwBLhXpV4wET2QxYMozTC6x4zf
	 pVyBh5SHPsDSI9sp3l+V/Z+RAztm2FzDD9b49CjgewlYmKJ+TXIcfmpm0YEgGfIBylw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717292;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=IjXeEs0cvKJ9BEkMWj983otFpIRGB9/uiTG6eTej6SY=;
	b=XWA88cpUH5l8CDpOx2DVl3mHCmVk4e6OIYBVjCTzP/QrIeWv98LXCtE/IWj7ivURTYnj
	 ZgXygqpJsOBnZ3C/g9gzD7wcmSK6XlGwbXIrGJYp3fMb+659ixQXIlSSZC084V1S8S/ol
	 gtfAy5eJgXAkeOzMwTkhxW/j/9k4MO4BIVQLp5qzF5RRhWr5GCocxEixFv3LWBNBNH6Xh
	 xKagbNesZw28wAru06OLO4TKQot7IajHSuf5xYcGSgRytghH6vGvYwl/VKnezdJnNt6C2
	 ptlx+650pu4I4QD7bSe/iHUUVkVb1tHwdtXr1jVMrcLyLXJRseiSaeLumCKeADJfCdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNzIAkDc;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7378160A6F4A
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7378160A6F4A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNzIAkDc
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4448609EF;
	Tue,  3 Nov 2026 14:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA6E1F00919;
	Tue,  3 Nov 2026 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717291;
	bh=IjXeEs0cvKJ9BEkMWj983otFpIRGB9/uiTG6eTej6SY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KNzIAkDcTAyZi+bMDBEDiJ2ueX6+YuNBqQcpX4aSHRAYfT+9O1WnTJ+pT4zRQBBHX
	 p25i441sJ/pPELfnxtK22X3a1lcSIwpcUY38RMAWCOPurdhPZg+7wIe+xltR5RL31U
	 u481RToVHFbarFTlUWzAE9MGCxYh1xelMTlElM9jsoGQWFc05EGBAhMboLFT0D6o3c
	 ZdwQlbqPOxICYuQsuQoNiBroU5anKaeSmXCKUvubsHl3FSv4AlbNXkVjqgO6mUx1pR
	 swIa23i3wGX82qen6c30FEla74FnYQVAcQdkulRdqS/OXs8CaHc0ie+cdiYQ5eL3YC
	 V7rdW/Ghfh0qg==
Message-ID: <sashiko-outbox-195494@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 22/38] proc: warn about entries left in /proc/net of
 a dying namespace
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-22-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-22-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:48:09 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_net_ns_exit() runs after all the other pernet exits and frees
> net->proc_net right after removing "stat" from it. An entry that some
> pernet exit forgot to remove is left with a freed ->parent, and so
> PDE_NET() hands seq_open_net() and single_open_net() a freed struct net
> when the entry is opened through a file descriptor that someone kept.
>=20
> There is no such entry in the tree that we know of, but nothing would
> tell us about one either. So warn about it like remove_proc_entry()
> does for a directory that isn't empty.
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: e9720acd728a ("[NET]: Make /proc/net a symlink on /proc/self/net (=
v3)")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D22

