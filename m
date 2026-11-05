Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906967;
	b=1vUZ+KchuZs8Q36IBqt/MY5dNBFHm6rFszZu+mAv+awRqirzqTL4oIcca8e7CPuuURD+
	 CnTZF4hnpjdGPGJ5wxxrDuNlW5XXRSF9pWKvQ6LHjakpl4wekzXj90djccKwpbsO5mg+x
	 vc7Xk2AAnp2ZdTYWgr6/BcPrh/Kryre6NZr5GCrAB/RmCSV8BDrXvjiToXBczCsPSzPV9
	 f52wuikDA9DPA3YJuw46LB6lmcgg69xUEMD0g/9dycphMlfhkPiGZBzlP/GyDO4BO0RJg
	 F5wWBBX3SAGduGk2KPNRdyDIMUp+m/iDybIlcToSq5saz3fZDFw/IXPMp4O5228e7EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906967;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=Yw+/Du8pHsdCvYl6IbYLuKH+OGLUIcbJDiY7LJnllJI=;
	b=ZxiDrG+baY+Amqwk+RmUisE23Eh3fxJk7yk02OEe7+Syk8MkKgsyqAOM9nNRF8hajsYY
	 6Yh0dgEDvvbASrDeY+mTVi4lfArCvvxZNrx3pFOW7diCx2f9nlD3ZGuWkXxK/+Ud8cT0M
	 hWRcWBrHF00js2U6QsF5Wxuhv1Ou2CN5FxehyVzJRsuH68rckd9pctZP6CEKPXHj0cJfq
	 dO5TxSHc/1FPPeTdw+Z+8vBboJWNttqWUoOXA7DtXvnlY0lS8/1jHYN6A0L+kAJUCasZZ
	 EMyd65np3jf8/PEUWqLjuWOW1NUkhaUcWg5fwQsz7FmPri3F/a54Z6VQLCsrMV7G3Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="l4Eko/RK";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493E56082BEB
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 493E56082BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4Eko/RK
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A7F42601C7;
	Thu,  5 Nov 2026 19:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDBE1F00919;
	Thu,  5 Nov 2026 19:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906966;
	bh=Yw+/Du8pHsdCvYl6IbYLuKH+OGLUIcbJDiY7LJnllJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l4Eko/RKkbQXervUh+9BCXJ+sLsI4u38jjERwv2HDU2tKr1bCDnCCw/QT/dKc1MrD
	 nG24sg/ARdKOAaioqHnqlbMFng54iK9sFGR2MBxpRI9bPa3il41oD5LUCxrnPRtNn5
	 DKJ+CPjlIN85/i9wz8h3zAaLEB0HSX87FOiOgckHHu/HvAH0MfRD7oR6NdGDjHmHBp
	 bZGWS58CuzW9/drusy9qDOn77viubLposGHA42hn0poE0IRqBJ9Hb2OJZL55U5B7t6
	 /9ggt31U3dXthnEYRs2zWGFTAlTOnVxIM8pubtNQkp2PuptVcHbgqPWl/ETNFUYpMm
	 KKXNeYjAU9H1Q==
Message-ID: <sashiko-outbox-199881@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 18/51] platform/x86: toshiba_acpi: reject
 malformed brightness and fan writes
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-18-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-18-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:24 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> When lcd_proc_write() and fan_proc_write() were refactored their checks
> were inverted but the && stayed. They only fail if sscanf() didn't
> parse anything and the value is out of range at the same time, and for
> the brightness value < 0 && value > levels can't be true at all. So an
> out of range brightness or fan setting is passed on to the hardware,
> and so is the uninitialized value if nothing could be parsed.
>=20
> Restore the checks as they were before the refactoring.
>=20
> Fixes: e1a949c1b988 ("toshiba_acpi: Refactor *{get, set} functions return=
 value")
> Fixes: 3e07e5baa2af ("toshiba_acpi: Add set_fan_status function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D18

