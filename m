Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906961;
	b=MBKClTeDuu+bItwhRFKx+vlmAFedwuIowOz/Gx7bZs7QchQ9jLYjrSDB6aSL7tzdwbAn
	 CVZH0f4aL7lO0n5zVZxfSUEuRcn2yqLSYuYNrpndROk7s5DM8ijXNnCCW+QzrYnm2onpn
	 hkR0ZMWIXvJQ51wzW6x9y73pJn8b4hgSvx8MV0yvtzURWAM3/K0YPqLSEFX27i1F7EucI
	 M68OYq/NDpur9udyiD9Meh7c1d/xNaGr2SquY7UasbqhP2lh4AsZ1Z8eYeUDVEE1TSWUH
	 imT+aBkqLV0Tz/yDospEtr1y6jXpkZLA4ZB+N3mmx1CcntGeWEHS5xeMbc0a5Jqywkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906961;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=Qw513NKzixnVetQs2aPch799inLwFwvqjGlTZsHFgHc=;
	b=LwnXpl3L8G/CeLyyHHn9Wl9VfZ+FM0O3lNBqbrSjdV2fu61KdRkdRvbhgseboRlLpX7h
	 XtTZhWot96WuDCoD3f4ixTYzgubuHZospYbYKYUcGCtEDZlHDbN2MEbvk0MKAU+0e4IIo
	 zmQDhFmtYkAjUVyTYip3D3R0QDocFHPtRhRtkgx290KB8jVQEGF3h6i1bSCr7hO2IRIMR
	 v2O3AFEldvJZ0/oEZqQQCoUPbAjPZjpU4z5Wf/1Qxry3yFNgshtsN8a9SZfWsW7NDxynF
	 qcwqf6WWmX9yWoyeiEygUfAHqON3bx9s6iSo/HJsDZKS/EgWoMfm4k2VD64Ci8ceZDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WP5zysBl;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F43B6082BCB
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F43B6082BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WP5zysBl
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B405F60154;
	Thu,  5 Nov 2026 19:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3F21F000C1;
	Thu,  5 Nov 2026 19:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906960;
	bh=Qw513NKzixnVetQs2aPch799inLwFwvqjGlTZsHFgHc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WP5zysBlV6QoE+ebdO994NPOQCHtVK69BSl7GA0TkgCejzw4yv+Qi/dIb/BiTtwJI
	 CtwiPcppWeOxu8qxGDLb2NNs4muOnWOkbdTfgMZetnT6EYIraiEzVZgwrSfKYuy20p
	 lq1YQ+ODYgN/fNYKxtV+Y3MBG2phtgSlbN/PnX4DhhLfO11dC92+odtKZZNAdRC5BY
	 cOK2uw6yB5xGSlQ2pqLEJNTrF9NrssiHaYNsRIIVDX79TmltA0T6xLv6ahSmhYnicd
	 7xH40xuqXjCm2XXdHJHYyElfh7nUle5CnSYYX4imcJF/N71eKI1RK/06V3FFapNV/j
	 F1VfvpFqH1/NA==
Message-ID: <sashiko-outbox-199878@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 15/51] PCI/proc: don't truncate the position
 of config space accesses
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-15-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-15-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:18 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_bus_pci_write() truncates the file position to an int. A pwrite()
> at an offset like 0xfffff000 turns it negative, the check against the
> size of the config space passes and the count it clamps to ends up
> larger than what was written. The loop then reads past the end of the
> caller's buffer and writes all of it into config space at negative
> offsets, which pci_user_write_config_*() pass on to the config
> accessors unchecked. The write also returns more than it was asked to
> write.
>=20
> An offset above 4G that truncates to a small positive value writes to
> the start of config space instead. proc_bus_pci_read() keeps the
> position in an unsigned int, so a read at such an offset returns the
> start of config space instead of hitting EOF.
>=20
> Check the position against the size of the config space before
> narrowing it.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D15

