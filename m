Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717319;
	b=Z3Ts0yJuHRW3Zy1GlN3Repn7uGrMrlbkw3rgJSzJU3OO7gSdclsqmWl0wFjpJEFGKrSO
	 KMMRTxLQL9/BGjlaH0DQBOb2E24p3GUGhHJyzFDk7CXoj8a2QIhbaoRqEVe/7sbOXgYbp
	 O6yBzSJjeAUR9JQuq4VevpCJOm945vZS+zGAsjleEmFKgr841GzH2SO05WGNDgzkhTA0v
	 OtB9s4zpOKvkRNBBfV7WhjjnoOckQZHVBrExz40Ss2Ga2QRcj4FBPWyyHDOMpzVh3dEvN
	 xEfDG65kvW0S4AB/TBlzRgoo5iEpvwIUDrcvchcp1olfigiOHQqjU7p9ALEtwf8pOGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717319;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=w2/IP9Nbbwaq1rM5X5TI+Z6uMBVhleLl4dqv4RtKuWA=;
	b=ndkOfVPCaCA/FFyPSHWSMmvh/YfOLuW9MItq+erG6HG+5C3+dDALG0XEiAr4Ug2IiIyT
	 j5pKZaxgIMsxtA2SdGOwZOgq74XKlYjhbpb/mW8fHmvPAKYyIgYEt6R7YBrejiuhSuaHd
	 IK2Fzm3FCv//4+yZZMYi2xDKMglUBea7AYOgYdQfLrhnHp7EZt+nlGvGQjyZPV8VvroOK
	 Zm6Xhs6iPh0rshLD/KB2i+p0lnq9p8l+5XwEdEL5Wzp3lWVq9n+t8qjeGQvtYym6des/2
	 y3eX+VmKdcCLMQoGpIsCc6B4RgzJZgnIiBM05e0Oe3sZ0Xc4jsK+Y4HS7yzv6QOljAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Y7X/3tby";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE322606C85B
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE322606C85B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7X/3tby
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D12040220;
	Tue,  3 Nov 2026 14:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BCD1F000C1;
	Tue,  3 Nov 2026 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717318;
	bh=w2/IP9Nbbwaq1rM5X5TI+Z6uMBVhleLl4dqv4RtKuWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y7X/3tby5ok9JWnFEB65JWWmANthXkUjcXdb9uSdjW0JhmR9HZjv1YT00Y4DsNv+W
	 Biuw8DvsjPcl772z7tONEXXEXtYepxE4vSjBigB6zSeMFdoUu1aYEPpOnorED4q8/6
	 jPTA+4fCMfDW09aVM/QBTydO81RE7CgVc1Pp6JLW4SpOJYkbo9BUyN8EiUCyyjZQlp
	 kv0bhokpcFD78wxy4BaRRF0TZr/IYs/oBfNzPTLQzgQNoJpQ9WrZvetS4oHr4FTbxa
	 gW0WNwcqv3NgJchB8vagqoYRJIHigOkbqStPD4Hh4/ge7N18B2zIy8QT5B5D4G6wz1
	 nY9eJEyDXdkew==
Message-ID: <sashiko-outbox-195506@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 34/38] proc: sysctl: look at the table under
 sysctl_lock when creating an inode
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-34-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-34-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:48:36 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_sys_make_inode() checks under sysctl_lock that @head isn't being
> unregistered, lets go of the lock, and then reads the mode of @table
> and calls ->set_ownership() with @head. That's fine as long as the
> caller holds @head in use, which keeps unregistering from getting past
> that check. The next patch has a caller that only pins the memory of
> @head. For that one the table, and whatever the owner of the header
> keeps behind it, is only there for as long as nobody unregisters the
> header, which happens under sysctl_lock. So read the mode and set the
> ownership before letting go of the lock. The ->set_ownership()
> callbacks only look up ids in a user namespace.
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D34

