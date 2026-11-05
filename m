Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907340;
	b=yR2D+WeYDSV+voEI+WkEqRnexmmebCuwGO1KWoV1RhYP1olJdSKePwmiMKkwJTcETl3w
	 Kbm1pujWFR3JjdTou1V0bElT841HaTKVeRQhSys1VuC8vH8nLmm1/7+Aoe6I65pGQMZz0
	 rgXp+6pNh6gykq0mZHUePx4njgTUIBc6dYio0rYN15uPCWC51YeraHVoglinjOriedC8n
	 d1vB0MJkVpZ0B8y9PochTOU97hzsazUfpvH136wUilcDF9yi+OKWvZsp4XWo2tVGzfhPA
	 lzXO4adF214LyLL9lgS4uVsgq+2mJI1UYTcarZ8WFHnNSGJHnFxXaK3cbJuQopTsMkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907340;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=aroUg095/6TmMJBeZjgIoSTvyvzHjk9A05ABR3Cu2L0=;
	b=4Vh+ZincsHVr63lYr4qOi2PTumzHTQiAGZPBVfPDi6m6XMl/7KmTCKElfO8t7yJ2zqEa
	 UqwA8LPLPh6Lqtwvgsa2flVTPVQNppevIWN2IHpKaczmY8E2dI23zPCtu3WzfpefWkoJi
	 szAq2FF9dcUW3J79SjMGi6SOCGU1bJx5zWcnWpmgiLTG3rEXKcKnnnzX2ybSRBZRmiB0w
	 YAcSU2vsrRg/oItLBt3kNUhLebD2by/mwhit7CvtJW1bCEkzQLiUGjQQon+3we7l525c0
	 Gsbd/yK/7v7qf4szIZ1UtGpxZ51Rm18oJCJWDMQAydQS2oyT5QRECPuEQmKZcHT3GYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aCFaxZX/";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A22606F955
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A22606F955
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aCFaxZX/
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 93CC743DD9;
	Thu,  5 Nov 2026 19:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18721F0089F;
	Thu,  5 Nov 2026 19:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907339;
	bh=aroUg095/6TmMJBeZjgIoSTvyvzHjk9A05ABR3Cu2L0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aCFaxZX/pXJMPefHJpV09W2+w61KUBSGqPrg6CbRySAMTOMm4JaDr3tcTx2cKIuLk
	 JUa1MBKLWQC0ZETuEO66QAJpJgqhbjOyxojVM6ivSCYHHkGowBxttDYjM2eIGpwnEJ
	 APEOw5JcwA0jVhqdTOcM8vG9gm6Rdg56kD7z39j9iMGTnOcL8jgcdJyaHFK4JxakLN
	 DPKfZb5NAMv6q/AFJDp3292ogJxaCXKsP0BD31LNcI437rpmGwZLQz5zNGjx6DHRiH
	 nhsuxsTVQ4aM+It/sbt2s0keUKgj1g/u2y0gxfWVs6QUw26QAPF72OyrzpNfLCn3PY
	 1jEvLMm8/QQ/A==
Message-ID: <sashiko-outbox-199942@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 12/23] seq_file: add seq_preallocate()
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
In-Reply-To: <20261104-work-procfs-core-v2-12-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-12-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:37 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> single_open_size() allocates the buffer itself because it does the
> single_open() too. A file whose seq_file is opened by somebody else,
> like procfs does now, needs to do that after the fact. Add
> seq_preallocate() for that and use it in single_open_size().
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D12

