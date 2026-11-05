Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908197;
	b=Oh7p4StpbzdIxegnGfPsEN/Bvfx/YiSWPC4ALE5+paQP2faBWpq3hMrIt0W38IZWuO58
	 3QkY4BUzadW2Sm6jLgmxWQ7g7J0DsK/IAkiDUH4ZA4OBNEbkHzHCEaVuGbllXSwlbuiA0
	 vpsWZh6Gx2vOu/qCuFDFG6bAelmblur6uZWumXKWil81UQJnoh3YGhDBvVaKUjGIBf2aG
	 LRcIHM8WfllkEEJLwcfUgn1u0fTRKhdVYS2PwxbxLLfjEYUrNBH9krOjtsp2iyFvr8Pqf
	 UqKRzFg11M0vUWI3ERDF6DTORNa0jMTgOCrUO2fWKs1bgy9MfzZQxFU+U5prb55h67g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908197;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=s7WmN61TcEwSAmrgBFcR3i/+X59X7MghGqj63dVkFh4=;
	b=wua/eszDZYcSichAwIJz5tupdNJaNwfq7+3RB5QY5V7Li7nbhXvB7tN9W2mKAQyaZ6b+
	 m7Qc4dSNfRe0BygHn6uhit0ekyOzsxmninQ81Y8Iz4dzmuV2z8IzfB29/iTpm92wobc1d
	 zxdsE4yYR0EfVv77P6CeqM2J+zWhCCHhAHWBvxxwl3VmKLQy+gPE1IBOHv6kxJnYRKLMs
	 saITBdAiHHpBkSW2iuZ+NbYK5/jjKatrs0zGLRzfBOROByj5NP0vDKeO1t3XCloaqTIK9
	 n5TkhvRbIctfcTDqrULE3qBeTSdmZ3T80qM2pZHUwAxB/dfaX6f9Kvs7DbRZ3Tb/cvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2Onwvw3;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B7E6079C24
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B7E6079C24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2Onwvw3
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E8CB560222;
	Thu,  5 Nov 2026 19:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4085F1F008BD;
	Thu,  5 Nov 2026 19:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908195;
	bh=s7WmN61TcEwSAmrgBFcR3i/+X59X7MghGqj63dVkFh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T2Onwvw39ZN0/OoOXxQL/uqI7Po22o2Y48NdiniZqCP/DDbIer53/gM/4OjA9lEb1
	 ZcA7n+7DOArqei7j/E+89ZPKGaiUE1Emcmgj5cNgnfKk3nHic6m/MnYB7RXIp2aTDx
	 GhNaIma7ViRMcjw2Q1iINaa6BRamWn/B1y14v2KnCxNcnpxa6PdzbCS6ZMZ1DEeckZ
	 YWnktcnAhZ0oNTq/YekqSeJaTix4kwO8wQBjblo16bnpQWE3/ln/50BkNHNm01s0ZB
	 /g6GiX3KmmymfcwBQUEuk9hji1rPknI18H3GRTuIJg5WNlSHp1zjuKJTaQng099E5q
	 xL6S0rA3UEzKw==
Message-ID: <sashiko-outbox-200008@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 22/26] ALSA: info: let procfs own the seq_file
 of text entries
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
In-Reply-To: <20261104-work-procfs-drivers-v2-22-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-22-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:53 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the show function and let procfs open and free the seq_file.
> ->proc_open() only sets up the private data and preallocates the buffer
> now and ->proc_release() no longer releases the seq_file. Reading an
> entry then no longer holds up its removal when the card goes away.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D22

