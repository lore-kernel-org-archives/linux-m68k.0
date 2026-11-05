Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907326;
	b=JdrTSINyY9w25f2rz0nS2fqDE0/5uIk2k5tsZnhctSDnIEDLy4DQL9m7Il0VHAV2nZk5
	 lZ0pPJ8z25BXbyCyssBrTAIEcUZlUcbM/BswAU7r6j+Fi7/UkDeVeDcdzHoJYkNJFI84F
	 3uiSXADjscUdnasZ0k+Fz8z9MURbOESPBx6ByA0CcTgmN0o8qgBmzLYXQ0PjY/WUvWUBY
	 XoSgY0lzZS2Lr35VvEwONA+fQ++u064oDXgm67Xttvn0Ku6AxQcwnD1yUeVh8Q/9dk9oz
	 ZjEbayQSCPspIkY/1yxOazl7/Xpl6DcDea7Wp8XjnsFMyR4dnNeOx+c4ud4QsR4Niag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907326;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=KYpEmlst2RMAqFXyOGI9xQrnSxV142QmlHBMWmUsiz8=;
	b=K68fWHgYAqLMB7mi67EdjQK6+dsCuynpW2hQIoTY7n3iGe0pxRHP+6FVoZVFBbqiH8p0
	 FJwumu0Q6iX/KMW0cBuuokW4VhChrZHRjbMC+UJzft6qd+i6IL1ELfoAtuOM50RuTOSBq
	 Bnxr9nzV3TgHX0+mPozfMeFFa9dzE/PGBiu/BPp4g9glCB/iukvJliNufwXdsIutWPX4o
	 QkN3fbvKABtg7Y4r+Cmz4J4qn/O5k/E+e22OOf3/20SZsji2xv9UIextVnee4Td7izbIb
	 cWsYrMumX+B8uiFsk9kDz9UA9Ay3cYEyBT3Vv8T6y+tCnVdSSpO+T4dry4ZN2dOmIgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7HKWZpd;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC1260772B5
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EC1260772B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7HKWZpd
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EAE49601DC;
	Thu,  5 Nov 2026 19:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1833B1F0089E;
	Thu,  5 Nov 2026 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907324;
	bh=KYpEmlst2RMAqFXyOGI9xQrnSxV142QmlHBMWmUsiz8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D7HKWZpdJlBXoSwsMjTjzNPkVew6KHrh4fawwQ2ulEULxhqG9XivG3Fp1ISuAwQMs
	 Hbq/80xvcy5mK2zclNAv5UeDsWP9xoAeq/jUyUIkH4aln+AG0f8NlrzzD8Lp/NDA2z
	 asdv9M90m9ShsSX4Ou/gTVHerHVAH3lLWi5CocYCqRvM/6bWUqB04QX6LVAK7e1GKK
	 UzVX0OSOF7WsaBpjey4MAjogWboVvhDsYVxoh9AXfTdllPpwKgRpIWe53zpJYPr6YQ
	 eHh6pR2ZAvzxF2Dj6TA9K/8Ca7BrjKlLNX6M0uWnkQFqgU9vYgoQJLLUshku7SS+Fn
	 EUH1IEGMOTXBA==
Message-ID: <sashiko-outbox-199935@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 05/23] proc: keep the open files of an entry
 in an open node
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
In-Reply-To: <20261104-work-procfs-core-v2-5-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-5-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:22 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> procfs remembers the open files of an entry that has a ->proc_release(),
> so that it can call the release hook when the entry is removed while
> files are still open. The list head for that and the lock that protects
> it sit in every struct proc_dir_entry, for the few entries that need
> them, and the next patches want to keep more there, the vm_operations
> of an entry's mappings for a start.
>=20
> Move the list into a struct pde_open_node that only those entries get.
> It is allocated when the entry is registered, whether an entry needs
> one follows from its proc_ops, and freed with the entry. So ->open is
> constant for the life of an entry, nothing has to look it up or pin it,
> and the removal path stays what it is. kernfs allocates its
> kernfs_open_node on the first open instead, but there every attribute
> can be polled and so every one of them would need one. In procfs the
> entries that need the node are the exception. Permanent entries don't
> get one, they are never removed, so their release hook only ever runs
> when a file is closed.
>=20
> The spinlock stays in the entry and now protects what hangs off ->open.
> Moving it behind the gid fills a hole, so struct proc_dir_entry shrinks
> from 160 to 144 bytes on x86_64 here, and it ends up at 160 bytes at
> the end of this series instead of the 184 it would have grown to with
> the read and write limits and the vm_operations of its mappings in it.
> That keeps 32 bytes of inline name instead of 8. 34 of the 68 /proc/net
> names a network namespace gets are longer than 7 characters.
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D5

