Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906934;
	b=d21Gg39+Nlxz4Sl/xvVTpTlmtl6KGVAdXJZIzLg/cyLhB+KQXCCUANxoApxtEEdFYlxk
	 sI2nVJue9LgMOby6N2TTX21Kg4velyhHnsuo7QTT5k5ysVRIKDDzgxoMclqDy3Rd0eK2Z
	 l+cifdBczRcRMx1WJqtx8n9GaRSCaA9iNFGPsdlRshPeeF9WspS7BVfDtHKTpSbyVJm7W
	 qYUdT/PnurYSxYuy0ygY/SUZ0rdm9km7RaqwmXOfnNRJSOwkFpOABWRzmI0AcJaH2IanV
	 h3UWZZma/n/vZoMOt0uYu7aNWw67dqhhXXYi/De1aEHHolD8CIAijcD4OWLZAuol+qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906934;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=Dl7+6TE3klHc2brN+bZbN2jvo5bJeOK9y0vggKbBQEw=;
	b=oiJ9zSe2GWbQBjx5QhPTfcY7wxyN6HpUK6XsshQIyB7aIHxHCYHEc5pevl/Lf19rDsAn
	 e/jjAW3yYe+sJ851EE4ZLnJX5zV/lJBkM5xWaML8IqbFCa8tAJVnLk/+YAFlpNbPQzVjm
	 A6os8TvekrdyCianGHEV4w63T5OQLF99N85hI6W7TP48edlGjw1Nj8FOXOq6y/8C2eKjI
	 wG3JnJyGl8IkqRpzvu5ksecuiXTTtA9QlCALwTw/9/YB0SjK96LFlT8f7TLMYwaesomuG
	 ZrzANsSN9wAgUfSuETzRK/F9/r3KXE1esoAKXYHYmZhKwKbP8hT9+z+tmLkd1oigsJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jS5u1c3K;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6258C606D82C
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6258C606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jS5u1c3K
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25F9A41643;
	Thu,  5 Nov 2026 19:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A841F00919;
	Thu,  5 Nov 2026 19:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906934;
	bh=Dl7+6TE3klHc2brN+bZbN2jvo5bJeOK9y0vggKbBQEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jS5u1c3K7ImMy0Crh/Iyk2SB/21MWY/WEpvgJVP8JqocmivL2vqyijNAqT7WiHjiW
	 6Ua6xCh3Ij5H7KLcgaQqR8ixyHADZco61udOB+jlfTExiv59U4z+85rPVir6KFx0I1
	 ObSC7TmsTyRLViUk/SGlKk2mUSVLDinXNea60PUpTBUb3+Z2hC3lUIZS8S2tOJbqUr
	 AKLtI1OGNz8Uwoag5jqRzukuHqTD25SiOWs27vYk4NAWf9jGI4TCW+iBo9EUmmHNnG
	 9mVPo4N3xUODMaacXqbONIqxB5Wjo2lV603RHlVY2XtZFGaIEcNZr1t9RV/1OvaXBn
	 v83WwqOK20reg==
Message-ID: <sashiko-outbox-199866@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 03/51] ALSA: cs46xx: hand the region to the
 region proc files
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-3-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-3-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:28:52 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> snd_cs46xx_proc_init() stores the chip in the private data of the five
> region entries, but snd_cs46xx_io_read() reads that back as the region,
> so a read of /proc/asound/cardN/CS46xx_BA0 and friends copies from
> whatever sits at the region's offset in struct snd_cs46xx instead of
> the mapped registers. Store the region.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D3

