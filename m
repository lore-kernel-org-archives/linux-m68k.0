Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719145;
	b=I/QXJix2NuLni5CbOprbLn3Xym1pEB8qLVyi4mj3jenJv9y4Ur/JnjjiLGE0CwGOv7eG
	 Ij1xAwNvqlHyoi/qLag8FfTpdowsWToE6Cqw+3V15hrIkqJqh/dWjRXZQ9JT4EJFYUp/L
	 mv+LHLjEz/sBeg8++thMUlQWMSxVyuORmwiE9syRZfQRKW6qPpAzF3KVDEKGLQmRoYWiX
	 6tWDeV6/c7HXpanCpbPeBZABeYfY9A9WaUWPih8OSieVhyKqgeYZjrxNy2cd91uqKLR9h
	 MeFdE+TXMd5wngrNTUfqTSJFELjoELS5vqUG1qoWeUpZbK8CMXEflqF8FOWxwvYg85Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719145;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=SjcUx5oTPLgTGLgzmcu2JufpKTLPRg1ew/w/ZvgHMGQ=;
	b=Xa5OR3N7FJ+iB8oGWtCfLCIU1gRDPAk1haLG7nK93TzHrz3KJf7u7oluYZ7hByqNW1ip
	 ezIwf4UyIuneKnrMLqgQPGFSsOFeSkkqSz1geAuU8QJYMcfygRwaDf8bOAJhfjX57NqZ4
	 URbTa/Um68bj5VNJGNmXfWa2bBVci4A/ji5xZMTy0wf/9e9pwdbeDLd1vsoHTC7OniDEv
	 G+OotG5FGlQ93QFgRKh2H36ylMYkdsvBDFIq1ZUfgMeY370dV8ecfSdxPHgNrKQqOvXVo
	 2Ogk2fAeTLb+0kG4rA0IzP3AI1La6PEGJXU5GB9DOSWy59rOX7n5i3WMAnzQ5vOZ6lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H14nd5Zm;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00F160A262E
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A00F160A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H14nd5Zm
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFA5E609FD;
	Tue,  3 Nov 2026 15:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D181F000C1;
	Tue,  3 Nov 2026 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719143;
	bh=SjcUx5oTPLgTGLgzmcu2JufpKTLPRg1ew/w/ZvgHMGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H14nd5Zm0HOMmUow49/EVrlsioyc0r4b4F2o2FArNkwr7aVd2fSN+Yi+iAXccw4M5
	 Hrez6lVhFAVFW//WwcipwXCOlWcXfetVqSC+Hja7cB2WYSUxxSs8b7ilDnEXXV+YgG
	 Kzk5MCNjv/Z4vw0jG51MNllEeI7ATjJgL/15EIN1BVpT6LY+VCwu8YYlMt8wKRHZbJ
	 okPPnQ07EmoHQPM37MzbUMh4PUpDYEr4ijJPybDBs9yFmhlOJHAw684kdnTGf75k1n
	 dtWfihYM65eHFj7xYgCF6qY7OBa56KZmFdPeZl/oOc+JWcX05Z8c65nphAxmh0Tsxa
	 rDXtJMpHvTgqA==
Message-ID: <sashiko-outbox-195597@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 17/23] usb: gadget: function: rndis: let procfs copy
 in writes
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
In-Reply-To: <20261102-work-procfs-drivers-v1-17-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-17-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:19:01 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() so procfs copies in what is written to
> /proc/driver/rndis-<n> before it pins the entry, and handle the
> commands from that copy. Writes larger than PAGE_SIZE - 1 bytes fail
> with -EINVAL now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D17

