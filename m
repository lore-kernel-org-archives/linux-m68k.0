Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908665;
	b=P+MqLzRPFsTgHVlQgZcqvZdX4Qdw9lBFkJhJi8rxKLpLwHIimx6B9RXkSfbqTtVG0xEb
	 KvprMg83vjEQB+vUaIUmH59XPcIcMxMJXP8g9ed+ybp24jbJozGaDq2gcueNF2JOCzJcj
	 xluTwWN0yXK672SLCtIop5StnR7l8Wmo/iuM2Xz4ngDeqUILlXsi6kNR5pgV4gmxKFinK
	 a+0zNnZSa/oqa43qI0A04Btw5EwL8Olh1l4uhxLbploFgIWHDq40g2zImDmW2SUlNScAA
	 qx1C2yoe3yZqnk0hWNwinw26hOSdPgrYB8IgvxVDY4vh+XVCdTxrwJweRvdAtlb/h4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908665;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=dJAkA5QDVeK6/YrZazgsLWvhYslgluIDFpPpO5CO/k4=;
	b=LpYFV2hC4TSCS2iZ6YdrGjSpcfDENrnpA3v2hdEiPyNupFFYWtYeQL/fUWWcbHqrPELz
	 PHyPzUk3/9s8tRdblKbsNb0SPqO3fPMDAbWfzQsqMWSapw8MmWt2CVTrvr+KrqCJh3sg6
	 5KLQQ13RC4h+Ug67/flgPibQjEcPew5Bcpglz9ET5eJKIpypSMQRJn/gP+x/FAk2ZKSiC
	 FboNJuHsK+tive5QJNQlUG3jJGJvk2VQmLZYqIkiuqX5KoR1Q2jf/yhYv4Qa9lFU8y15g
	 P94QV1ZyiCjKT44O5Q5h5qjGHEKEQTTYyVX/4qR347S+cNJ97MT17Y6ofqa9QhPCwJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XzU5PbQN;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A28C606B9D4
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A28C606B9D4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XzU5PbQN
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 96399605C5;
	Thu,  5 Nov 2026 19:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA38E1F008A3;
	Thu,  5 Nov 2026 19:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908664;
	bh=dJAkA5QDVeK6/YrZazgsLWvhYslgluIDFpPpO5CO/k4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XzU5PbQNrgnaDApRx90DQ4kjNwEFjalsK/Ugt8C3EjiB3qmFHbzDPVH7p+aVkSROK
	 LArRAsXDJ22x/485+7lEAYVBvHAqiC4NExeROUMJ/8LBcNjwuhOeXyTiEI5ODKItgz
	 1bMQyP8cSPHUevmn7qRnsiSuoNi4fuWHl2zoJnC4Bs0UvAx5WHpS5jtBM6XE9CTLaO
	 j5RO97FP06ylY1GxZsrhdwk+ZF7ItucHGlLlkHWa+hzQl/cVo2nlpvqWJVWEQt9jY3
	 FMBU3XpGo3NVyebaz9pnGaoAmod+c0f+r+TtQy5pQYpdK8w0ADpee5Gqfe4XRpus4m
	 rcvgDpQhA1u5Q==
Message-ID: <sashiko-outbox-200041@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 07/30] ntfs3: let procfs copy in writes to the
 label file
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
In-Reply-To: <20261104-work-procfs-fs-v2-7-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-7-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:57:42 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() so procfs copies in what is written before
> it pins the entry, and set the label from that copy. Writes larger than
> PAGE_SIZE - 1 bytes fail with -EINVAL from procfs now. A write that
> large only ever worked when most of it was trailing newlines or came
> after a NUL, ntfs_set_label() refused a label that long with
> -ENAMETOOLONG or -EFBIG.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D7

