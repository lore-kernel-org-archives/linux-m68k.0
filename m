Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908194;
	b=bJeBv9VibfQ/ayari6rJgnKmNT7EX7wNvkC+gH6hFMwnsf5KqVLYntKpK5yXKZtTLTVF
	 B5dyXrAqRtkNZyRmcpRHB13XIU7EZNT0YL+63eiwaORPTekNArXBLyqrzW2fPUmGLUyUg
	 nA1KjjVH+0WYc4GUMAa5n8CC/puCGoR0Mr2q4aKp4PmEeV0666/hyFjs6MNrHPKtr3I3P
	 zwhAVz3wyN8VZmEmNp+WFyTmuYwj3qDR3D+dMBYplLC4eOiirgT7FTEv6SQRywJKbm8MM
	 bW1uGWztZPpKZ3npURI0ESPDPw3w6MgPYNAzOrf1VBIrs738yKlw56WSJbnfzpEy8Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908194;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=qIp99IO+gNwKI0Zdc0Aql+IacK3KngpUDJck0yFiZBE=;
	b=1of0MUrstvrL/lqS43RpPrLO7sIx9y5fVXY8U6TXs9Sp5DI8dIARMHZo+xPJ2MEGU0+v
	 8eJYhVDXXCncKPsAjYC+f2+8SwDgUveotjNl+5NyEBtnUTyyt/wSLuNuvSeVbDxmDwLee
	 ZlA85OKGJjCczZNBPos99xfCbhbsziLE/JKhLEN3/AgRaSvz9A/Y8N643qozZhAzss3xP
	 MUOw4XkkXRHUMaByp248OtFpdFjqKA7XYdzmEQibYSPwHekGX6FFf3Q/ri7LYN9GPqOuu
	 JTWP89oTGYVosVjf3n1CKD6IpXvhqBqO/Jm9Z4h4/vtuOh9FdBpRZO1anG2Y+Y8RlVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfRGTcvC;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E612A6077B69
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E612A6077B69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfRGTcvC
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EE4B410B9;
	Thu,  5 Nov 2026 19:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3AB1F008A2;
	Thu,  5 Nov 2026 19:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908193;
	bh=qIp99IO+gNwKI0Zdc0Aql+IacK3KngpUDJck0yFiZBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lfRGTcvCEjW1gWGiNrd238DspqkbshDpQm/7ZrTBiY33r3aIzQWnw1bFldseUpf0J
	 62T9Z+rgvSnzDUjQ1R+vmOIGeviwUG/81T47/fg3pCJGo+dAsOMmYtvwb6RPJE5PJz
	 PVAELLiaEV3AAM/IBb4QhbhAm4nIpCbxOhVAsmXOirWg+Ja2+GWNXMvOrmMg9ogvMu
	 71EEpW+ntYUt8dF+XpHJJPkxOHHOLCpNVuxb2GV6NwhxHQX2MluIGnoC37MtbGPEpb
	 pWvFUBjEPes5aghGFuknUaBHTmQX1P3Xrx7+dp1nnBbdYhdTM7wd6JyCHdd5cOaphB
	 de4PoOJA8WHQg==
Message-ID: <sashiko-outbox-200007@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 21/26] Input: let procfs own the wait queue of
 /proc/bus/input/devices
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
In-Reply-To: <20261104-work-procfs-drivers-v2-21-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-21-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:51 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> input_proc_devices_poll() sleeps the poller on a queue of its own.
> procfs owns the queue poll() uses now, so leave the poll_wait() to it
> and wake its pollers instead.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D21

