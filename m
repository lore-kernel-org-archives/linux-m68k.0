Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908707;
	b=KIFJXugKb/GoNLnSWdQ6l6L2CVzpmbkdS5tCopjUFjlHyPOw7Yf/11lhXtyIuA8poIwV
	 vVdhcP4fkDMmHwYvSGR5lCO0KWwCeeTCFLowvCLXEEHfrCRMfd8nU/KvYFg09v4I/fOOY
	 Hw36wlkc6dySfDT1T+Y3OtFBDb2ZN37JIi2wXaTru2H2mQuuqMdXRMbgJKvEJK+p3ss0W
	 2yu9FhGiuLlIvE2Hifyz+9+Qd8IpPEG5hh1UxM/wI0Z2nfcgZkRgJ04MkipCPu5AsY/Lj
	 zxHuKF6PxfY7AnANMAlNq10Wy6mWm8OwyOTHex6JrAD/lFfUPnBFP6LXJ/e1yuH31/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908707;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=QCq+/Fw8y7pYoOo2Vq9cjoQwmb2wvkDQOJQ13WVM94g=;
	b=PvW48cBVFOpwt08SYKF7DHLYH9e9FY2HwC5MbHakU1+OThGjCVvIUIfNXueIsrpPLYuk
	 gSHJ8sU/8o0r0iA2DLq/h6QhuWV3nmLTPT0fEY/WPjGmiuC3IPkTm92vHsHjtpK4177/3
	 dj1AxZXgjDe7y14xVOkj26dk9vMNvIT5TMAiy6rW+ZPXb7VqSkmcle0ss1cAk5YQPKjBo
	 sR35v+aC5ySV2Fjp56r7TNfzQjbCQrfeuS73h755gcmwpYMak54zTc7k1AnoOThIDEkG7
	 H1/QZf7R9s+i5ZjxC6x7eSQ7jzQmIZJMjDcsfA0/kHNMbuS47cSBMLNxlzu8V7D0o8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i/CYgvco";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5FB606EEA3
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F5FB606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i/CYgvco
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E7BC4605E4;
	Thu,  5 Nov 2026 19:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6241F008A1;
	Thu,  5 Nov 2026 19:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908705;
	bh=QCq+/Fw8y7pYoOo2Vq9cjoQwmb2wvkDQOJQ13WVM94g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i/CYgvcoLrin2CTkYgx1vi8xFWzEuHmls5KosmtGQNdgSh85S9e4TB4IJC4eocMTL
	 Ry67D7wOzIW8YL2JZzYC6aH0P/NGwi3UIy4d//bHBH0TkYaOuZmlG/oeY3JUaqz2Op
	 S5FnuLuvQCwDKLXxJgeF4xsPIadF/qLWyf2YOU5FHq3Bb7qDVswvT3kN4m/IQO8Dov
	 6q1EdR54MnceiWzoM8LUTSHx7pr1Sd7eleF7HBY0F1fhrsAnS+mEjp42ZLzCbflK30
	 uAWYCeiyI2OnT/oCV11AVAdnPCpeiQDiVnRdPxM24JpNKbhLnIDBuxuEmZhiT+G5n4
	 8xxH9tRkRDezA==
Message-ID: <sashiko-outbox-200061@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 27/30] mm/swapfile: let procfs own the
 seq_file of /proc/swaps
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
In-Reply-To: <20261104-work-procfs-fs-v2-27-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-27-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:58:23 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the seq_operations and let procfs open and free the seq_file.
> ->proc_open() only records the event count for ->proc_poll() now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D27

