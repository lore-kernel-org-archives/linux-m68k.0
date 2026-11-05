Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908696;
	b=0VQVV+d1rXvMUP3sPwtlfT+QtB65Fbq7ofq/k4o5nu2YaZcbd1byW0+wG1aelJrW2urr
	 gDfPfs5tTyNSDGzGh288iMfvK+OvUSjjmR0CgIrPY3Vd8K7OQMdcqHRA300zSLmvPUNnO
	 KpVaAtQydFYtUfkyTyHlfV/4yELB+R1bXHNWPXVDCFPLtwr6Jo0ji68tH1m8sl8HL9m9A
	 FXju46sSUNQ0JHelqquTGigOqRdcVQ+TUha5/JpVTRSh8rQdYL4Qvlv7YZ9QbdQ61t8ZI
	 Cv1WSN+pol7N5T+m3QScVsBrNuymBE62YH0Ef8gSBaPeJg3cr7grliVR8QTYEppJQnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908696;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=ya5aipYlG9tbmAZIPBPshAgEJ4z8MYbt6drf9ARpCk8=;
	b=otEcFBHinZrnYXEVWDXuq6OyfcqZvOnkkIFAsjYDTr/GZJN3JuUXN96ulxJNZ8ZnKFey
	 4DGoAXP2oSBUqRiOi1OXiA9NvPWrx5ywVNvzzH6t0HJiN7dY4yLZJCbqRBPJrEq785B+E
	 4Gbis53HMTMKfkV7DmiA/ut9n0hv/q8T+j/CLrNOZDxvy8LYiNSIG3kTfGBeueTF82AjX
	 doSpxmRvTyv/alW9IAK+NW/WRhmjMbieLZleUAB+tbXtzE4LlpbJwCYd7c7nR1C1MnxiG
	 foFWKLzB7/o265DIsFlsr6UbxEFzWOuZaZWXIkN0M0RgmmSexO2bdHmnwhGmRMm56cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MphOF8R5;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43E1606E405
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C43E1606E405
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MphOF8R5
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2188160534;
	Thu,  5 Nov 2026 19:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D021F008A1;
	Thu,  5 Nov 2026 19:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908694;
	bh=ya5aipYlG9tbmAZIPBPshAgEJ4z8MYbt6drf9ARpCk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MphOF8R5xAqSxDTABFr+KD9GxM/X1ZjHavkYr28Wi0W5NixBsux8BGwG8FVQ8gQxC
	 n0muH1BId/zm/GOJnc/IV91Vn2LL18FZoHW1z8r2xjbv+ub23j3wP8j/eluc9yIIJh
	 v3yfOr3HIHpd1Np8RpuZrW/wTEaJcppbwgvfZ90pMtj6JOZp5MmFL7iUaIZJapelnv
	 6stnGSu2Sp1ZXD/Yv5+g9S7t3B2JVDiXGepncfr5zUghYMee39n5xqg1V0xSTssuth
	 o8G5wrUf5Yu2JmwQx0TX74oO+WThyTMhYg0XmBz4L77yCzdKvfTWX2IlW1D0iPWFpt
	 PRKQgQI8gnTVg==
Message-ID: <sashiko-outbox-200056@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 22/30] module: procfs: let procfs own the
 seq_file of /proc/modules
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
In-Reply-To: <20261104-work-procfs-fs-v2-22-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-22-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:58:13 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the seq_operations and let procfs open and free the seq_file.
> ->proc_open() only decides whether to hide the addresses now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D22

