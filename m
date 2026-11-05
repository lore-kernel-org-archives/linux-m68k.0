Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908153;
	b=zpnPHfhVaFT5VPp2PXWa5Xuj/bmQKDznSbMM87k04JXiB7YEqEKtd+FeUQUdNIoUYsfM
	 6rgohudzXx3rACPsEBTOweuI39FuieNLqGOfBr3QMEv9B9dDHmCwboRxsi6P6qFH6QeB4
	 5BES+i8nnPxckFjMi5TgFfCrylL9FTomkcFUvXTP+H8oA8zGn8qEUdWldf0J6+Ig/327t
	 OiMr+5/teCSgAop7HG8910orj+3U64jzz7TVkcQovCCcYlxDE6I/yfVHO6+PxR5grYpHb
	 yjxWeM5Jrf5Qe2P43f1sBzGA/5sOJ6hDMwzhqOv6u7uWyIFHJCjwH2bTZLcsLcRS/MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908153;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=13OVfMTrikaZUTOk6+ejChRIRHwQsK2sfHV0GLAx2hw=;
	b=SpoO47CdY76x1MQN6R880NjSmlPWKLdtLg7BpLh5S9iRdPIoLH8Zcvf/Fk3D73SOwZHO
	 h0Sh/JFvGk3RwLyRPoproQf77EJ6qC0BoN/2ZmEFDHrsp76CYhEKTqTPmc5tIYFkdXRqW
	 6OlYQ8o8ewFWDHx54kqT1N6gp9afyejKhQ60y4Taab+KBZTL+VqcgrtDIhQQ8KF9H2Mfi
	 du5Yl9g+l8fZiBkLvvURVP/dCT6Tf6sO6xA5+pT6HuBsilAOYv9p8sLLUNgzUtqNqR5R3
	 HA0irDNm5zYi1JFCprAaumJ6+poud5jjY+co9FUb34IpoZbciH84pwbtlj9uoir1TkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSi2J4pz;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A889C606E41F
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A889C606E41F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSi2J4pz
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6563A437DF;
	Thu,  5 Nov 2026 19:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C177C1F008A1;
	Thu,  5 Nov 2026 19:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908152;
	bh=13OVfMTrikaZUTOk6+ejChRIRHwQsK2sfHV0GLAx2hw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BSi2J4pzlBHAxuUAmYn9Unewqg1B6u8/oGNlJMu5HkD934fId18GQmiA6lQyKNwke
	 lBN5Ww0MnstCp2jFb/4vUdwGs4j4bBIqSdJxXQ9kBUV7X73Gp9kCtxZq7YWAiZNJJE
	 RLxtodWp6/+YZGahtAlv7ukZN5aZyEOCfXVWBUwaCIhBw0oDDN8hWCicNrL8GXktJS
	 vN6UcCM7eiG+2pWqK6ysHkui7JLuuOdSXsxjafjv2HX7CSO7+M5DZGKZCAJ6QpEB+R
	 j7XCjr5KXgY7bDsNnRKFEvIsliJ67HY+j8VEOQ95F7n+t7hL1xzYGGMnglfe0MfyZu
	 Wd8Ez7mWqOSZA==
Message-ID: <sashiko-outbox-199989@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 03/26] PCI/proc: let procfs copy in config
 space writes
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
In-Reply-To: <20261104-work-procfs-drivers-v2-3-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-3-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:10 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() so procfs copies in what is written before
> it pins the entry, and write the config space from that copy with
> get_unaligned_le16() and get_unaligned_le32() instead of get_user().
>=20
> The copy holds at most PCI_CFG_SPACE_EXP_SIZE bytes. Larger writes come
> up short with PROC_ENTRY_SHORT_WRITES, like they did before because
> they were cut at the end of the config space.
>=20
> A buffer that can't be read used to write zeroes to the config space and
> report success. It fails with -EFAULT now and nothing is written.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D3

