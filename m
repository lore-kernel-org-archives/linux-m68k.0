Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907334;
	b=m+OpL7NfcPitmX4AsD9T+XB8wgoo5icwLPZhbAhfjwLdZ6Ut6ehTXDWOfskvUVPT4Iku
	 J32ZyWG0e08xyLnVOsNK2AqdLUQpPlHGxSh+X8uq8YZxUbdfI+ukxc6LBIPZIzeNzzD5/
	 jC7RTO8PlCYuxBYk9iLFbQ3pyF2AKEPYSBNJxrwSM2BN79j7zCNnL+WAjGufo3NLiFdq3
	 lQo9qBZ/bX4eCNDeFSkNU+V00BaxbRKr8yg+NWJ+/np8qq8sDzBeBJBB2fnRnldcbv3VN
	 cYveqYXcLm8cxiwAgOGMls6K0fwUujjB/KpK+W0RVcfVQ317qVHrZ9v5/s6wbN3y2bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907334;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=mQEVulUxsU61vokIx6jmHabvMPsxzjhVa8rHi8fRknI=;
	b=cR2Q7Kx/hzwgEPvTP48SKKIOrnizEoGpbVIxgAwcca4F++yZbIg1QqZS0JRTz9GKiAg1
	 Qqbos3OOhDHJyBBVMx8TeaSPBmJzvmFRuzQjTynqnpTj3T4XQWfwDPatEQiMMr29o8mTx
	 ECBrw0AcA43fxONJSarlMvqlbKA6+YjS0eplIAN4CZxvLHnsgpW5tf1eDpFF2htzbBW/M
	 PEYbOemUK8Xc6SOdLznteQ8/FVSqHihCT6YhBbaMhr322bxwei6G8DydlssIS5bRwd0yg
	 qqzepd1qrRbm+pp2hrcnCPSgycUxHOB4DdbX2AMHAMDNQex9p7jTo5nVvPBV/bWpDNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJPRbspg;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A3B606F58B
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A3B606F58B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJPRbspg
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C7DF141ED4;
	Thu,  5 Nov 2026 19:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D02E1F0089E;
	Thu,  5 Nov 2026 19:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907333;
	bh=mQEVulUxsU61vokIx6jmHabvMPsxzjhVa8rHi8fRknI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FJPRbspgI9rk/ntnFT1Cz7ur8bIM5VssB3TQzm0TW2aoD1RFCmBj9VlLj4hJBQb4/
	 3/FDXpGt5pRBVYUQLnI6BUhnjhk0qTTW2X6mOTlAQFnrxBKc9wf8/43w9BURk4upJW
	 3VNEO+qgIAG0bqC5kDBUhoD0IF2gAAKd+DE2AwVQh6jvyFihiqkp2dzzMcl5jFJ5r0
	 i2c/y7bCjMI/F9vPg2NyoywBBItlJhG9YfDhWfHMm4cLjcGerM7HRyFf623GBrcyEz
	 CHLXwj/sU544msIsOKcRsTFRCBV/+2TizsDpFZX0Bbjbrdl++J4WiLF9eJNZcq1/bk
	 FneIVv4bPKAOw==
Message-ID: <sashiko-outbox-199939@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 09/23] proc: let procfs own the seq_file of
 DEFINE_PROC_SHOW_ATTRIBUTE() files
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
In-Reply-To: <20261104-work-procfs-core-v2-9-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-9-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:31 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the show function and let procfs open the seq_file.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D9

