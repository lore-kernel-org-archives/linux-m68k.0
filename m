Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908708;
	b=XOuzqH24dKnZMDA7+ifD/XNZATcj/lc8fonFOakj4AyMS2J+PWlJ94PJefxoF98BrYoQ
	 k93ViHmtzJng8FFi6ezvMmwPl5bZDAr4GC/DRTqvlQ6dGoKr9Dq5GH9G67Pb3C6N5DYJQ
	 +lvc85zFdWrf2lanhYgIjQTQ/8SKmgnCX9vbHz1qfprqjQgpFRV3SBXbzQvAREP2ly+jX
	 k67evNzBdU1aAFyDzTCjKzb2+3thCHXHa+n7eQi6jQSq56m1li1PA+dBn3YobQGsT/AHp
	 Vctr5N9c5FRnW42P1UuQIfWncoWl8J1gt5NCyB4Vlv/dTuwxx8VOfb/eXsvZnpTV7YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908708;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=r6gqpmqY5BSp77CPodMRuus+/wx5qTZqv4qw6w1Av2s=;
	b=t+k758M1lIRFlrEny4duXf9FdB2ND54YM48Ft+/upae9QSk6PqN5RLSvt00OhhLLpWiY
	 nQiM8WPOEaE94lea0o/vP671mSLrp2hcM767giCyo/McSgr0bLOTqkoKJIuiB98M+W+cm
	 OpH20QRcI89RC+pSCj/GWd7HqAtSQx5sfF/AjG5wvvY7MJDRAE6q/UJxYKg5WUh8ciLIZ
	 kSlELimRxmzzWEyMjJXCi1qylD8Ay3ZIXzhFkSZHkeQu853Isf4NnWR6CKVvd6sVSYX+O
	 /LbsnPh7amXW0Sdq6KpAbGqXi6dzbBu8ZxmidmlV2qhTssAbyXXd/8iq9vvi51bwRPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Kpy//3tm";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A554606EEAB
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A554606EEAB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kpy//3tm
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9ED860604;
	Thu,  5 Nov 2026 19:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340271F008A2;
	Thu,  5 Nov 2026 19:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908707;
	bh=r6gqpmqY5BSp77CPodMRuus+/wx5qTZqv4qw6w1Av2s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kpy//3tmzK8eXSRlY2BVYW1b25fjRCsgzpCJrqlsfwpBGUD2IYvbKrdHAaEVVSbrP
	 ZyGjN+t2v8/6+kN4grUx8/k8tV4kPemyBoohf/uQEdB8FBgPexP77AP1PzYBRk+x+1
	 Ot3h6sMQiE4NMMpT1QzeiBj+PT0qvJYX9jyAUkb6979RVODyTZ2bBS062aZ32mIV57
	 Ta7miTInNQznua/cySRKD+tu4AAY4W0N6ubTXBL+/FTmqFpxsKPzsIc1C85dU2e0v9
	 SlsX2rGxgTHZ78bXsZrCdmy/paWzVAquAHRBJoTOEyhbJhiAaTQyPmsp2TaE5cxt7b
	 vkXXUU8xXA79Q==
Message-ID: <sashiko-outbox-200062@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 28/30] mm/swapfile: let procfs own the wait
 queue of /proc/swaps
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
In-Reply-To: <20261104-work-procfs-fs-v2-28-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-28-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:58:25 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> swaps_poll() sleeps the poller on a queue of its own. procfs owns the
> queue poll() uses now, so leave the poll_wait() to it and wake its
> pollers when a swap area comes or goes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D28

