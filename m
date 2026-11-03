Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717280;
	b=nxyBBpn6SwX0HGN/46HdQWf883U4uXNlcMEsD36bb3QgyoMnHDvoNXvCWlL9cpCvJ7y1
	 y+e/ek1Dr9vFRc2tgmIWmK3S4b2BEGdAKF1eTkcnO4wch0CxCzBLCzN2Po5X6pMhTLyZD
	 zNsmvYg9mIHDm+M5lVaUWuknXLxq66sjficEt7vyMMbP/493PcUpwvlxSeMr+TGcKid3K
	 doUJkZMB4fw4H4eeH5vs2lR63MJQnw/MYHKpeLAu0L8PPU7ohdAlMbWwURGIykXPEgKWM
	 GLMPa6n77dxZ5PFERZ4Tr5QSuPSYKN5Wp/W06cRI6WuLuNrHQuSlg5bULLE15PlTDcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717280;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=35U9vRZipm/0ugcUNHxZ4oD7lBPqHisqrJL8z7uReys=;
	b=Rlp9zZLDuzKBo7EOwrbBNKQNVo5hhasreH6bRz1cX4sorSr9KbQp2WmWM1L3ynv3JYBq
	 HP33Pf/ACNwmOk6ZmdjtjoPmgBc0qZsEILR1YwVNEhV9XT4tUJpjkLLPiGWNpC9UQtApm
	 9iS2QexlWrEStKp73fw4jDvb7iIAQcGvPOsQ/8FNdAxh5cwu3Y3O4nQwPQr5gUpJ3H1UL
	 AMm2dZyYG8CXADfOZAepzRPSuPZImj5lxvaLlVPyDsbWCplPgjdAkwJBE+F/U5bxBnRbR
	 YJWzl3NEBZKrCdfVB8xdbyMLyqJqFX0NvD7+D3v+45iy+p4Ywxrvn55Qx8GKo5VnjLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOb2jlGy;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7131160A260A
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7131160A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOb2jlGy
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DBAE96060D;
	Tue,  3 Nov 2026 14:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1531F000C1;
	Tue,  3 Nov 2026 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717279;
	bh=35U9vRZipm/0ugcUNHxZ4oD7lBPqHisqrJL8z7uReys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XOb2jlGyODvVjIsoXLfcQiibie0dXFv0flX7Bkq7YfFUUdCGP9U4bZYuD5rIE+J1J
	 QVVQqcJ9wLtxY79RNRFPsBr5wvWN39EGIoHeohwyVD5LExUMq6fNZQD5vleYwbZu1U
	 RRHp8sm2TlsuqMPTLpg3xjAZOLFon2zhV25A7wzEGfg58Su/olC89JSnQqdrixaGfO
	 9Rqa2eSAMnbZyAyxi/rAB7t+lnni8cKQlavIUW298gxJlN9Oe4/AN6K2ky2Oe+MqLk
	 gtUQ0MIbODOhgwn5ybHL653v1Ihw7dMlBBYQt2dSbI9DmFeH4nVnl+f6pys9S55l5z
	 J6i/00DhD0qAg==
Message-ID: <sashiko-outbox-195488@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 16/38] proc: don't walk through a non-directory when
 resolving a name
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-16-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-16-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:47:57 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> __xlate_proc_name() walks the components of a name like "a/b/c" and
> takes whatever it finds for "a" and "b" as the directory to go on in.
> It never checks that they actually are directories. So
> proc_create("file/x") hangs x into the subdir tree of the regular file
> "file". Nobody can look x up there, but remove_proc_subtree() on the
> file removes and frees x along with it, behind the back of whoever
> registered x.
>=20
> pktgen passes the name the writer of "add_device" picks to
> proc_create_data(), and only the part in front of the '@' has to name
> a network device:
>=20
>   echo "add_device lo@"   > /proc/net/pktgen/kpktgend_0
>   echo "add_device lo@/x" > /proc/net/pktgen/kpktgend_1
>   echo "rem_device_all"   > /proc/net/pktgen/kpktgend_0
> [ ... ]
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D16

