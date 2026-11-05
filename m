Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907365;
	b=UlHM9SwvdcvPWZO5V/5xArgln+OA7kuo1LhduY/Pe3WvM7l0do9x/DhjqapQSB2KlD1Q
	 DcweSwuagTvwgnBpSWADeM8oa5qjHgmoaifeb2BSZV4mkszZdzzd+ustPJdBxPU82fG6O
	 Sl5eRaVwQ+1gopv/0fU3oL4bHyuf15JfNrqRjGN9X6biAOVuKu5MNJ41TxbA+xsuWtZNw
	 EYLPvs4jPG2ze60Ctxv+GOPlqMnfx8ZnKnCCg2aRxY4RGN0GMfKFUCOz0dek+S+jI6ECb
	 DqujP7QaktWT7uG5UHJANJHsBSqJ/pXj1pUjxD/vTgrPi/UJpS3Nd2oRqWLFRJUqC4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907365;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=gAVlktWGI4QeSuJoAwfYGMkH1PJUJetPfF4oCxqFFe0=;
	b=jrPeb6Cqff8ElxS6RCyY7xZ7ACyb22IpXxIFibtf0d6O3BKD2e6v06+9OK4z3kFMIIBK
	 JQDgUAgwmGO0mZyOi2oDketKw7R7uCg3LlejDaGb2yzNtswp9eJTMAcZqRYP9YWcFG7H7
	 AsZdZymzifuGMkXREhS2P1ctXgCdgYz31JAVGNPpikMpSeIz+iJC/xNdiBysncGh6XIKO
	 kfvUK+ox3NAX6YJOVdvAVnOK8uUDezGUuEDb50x0JRTr4CSKhUFWe1a2RCWWHunh5+3OQ
	 OwVRxB2+h1cbUxJcJAhvIOF/UZGz+6LjgZ28W9iAti14Xrtv99fGspZWfwbtxpR6Elw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TQSr4R/D";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EA5606EA69
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1EA5606EA69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQSr4R/D
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 680D2402A2;
	Thu,  5 Nov 2026 19:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C754B1F008A3;
	Thu,  5 Nov 2026 19:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907364;
	bh=gAVlktWGI4QeSuJoAwfYGMkH1PJUJetPfF4oCxqFFe0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TQSr4R/DNc1E/FXbeW6HC3m1wCeMgc9IIMGiHJaOK7TVm2g5ZgNiUoNKqCGvkMsls
	 e80ijNz9iXptJP1sPdMzJ3n9rcbsCelmZ++Z3uf8wNwjL0bFsRjGZ0W+orZm2yOGGT
	 MHWHtJwm9E+LGUV0XYeS7ZUb631YlqElIEwM1EGlELy4RjUHz608szz0/Q1TsxHjQC
	 sRQwE6PrOlK8doE+ZCiBF8WQRnKJ6xM7BYNVmcDVPI2Hr9/eJBOxU6R5y79dTXTIws
	 2IKZFX0+5DkFSsq4cZPsKn0DAwp99uEjMEyNObggujtHKxIXTeECXEcKidjU+y8LC6
	 gXxtrmCBTSTsA==
Message-ID: <sashiko-outbox-199953@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 23/23] Documentation: seq_file: describe how a
 /proc file uses seq_file
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
In-Reply-To: <20261104-work-procfs-core-v2-23-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-23-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:36:02 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> The example in seq_file.rst hands proc_create() file operations built
> from an open method that calls seq_open() and from seq_read(),
> seq_lseek() and seq_release(). procfs doesn't work that way anymore. It
> opens and releases the seq_file itself when the entry declares its
> seq_operations or its show function in struct proc_ops. Say so, and
> point the extra-simple version at ->proc_show() for /proc files.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D23

