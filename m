Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718091;
	b=vb6WH4Yoi3pooCSi2N90A080CRSh6CypMPfQrno+LeuPD/x1FfAAJP/jlrNeOCWC1NM0
	 4WzQ3pTenCDZJ8OiP4VAfIubWJwlOiW0oCncslaT0HuJBLnP6YA7zgmndxkSrU5cR+/Bn
	 vGaO/bDIDCHpgFJ2A5MQ+bXX60THSBCmIhcBjKqLfRgtfOiWyXLuc9NV4NQeRYaZxKYgb
	 hfbHnzlxTmJ8Q34ISrQTUZqGPX2+/3F7zAvmE64m2botW70HbQHP4GIO4Pi1mHSmmpmg1
	 3riBAYr+UJs8wiCele6g89CGI8V0I1pXdmA4brh2PZ1mgmB9rWmgnnkUHl6+lOHFgGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718091;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=WfzPGb0Mse4d7j/Ua/7Hqcs84ZaSl689mor9HstQNz8=;
	b=5DksSy94M5EyaxCxtbCTM2uLlBw6DstFNluUP3SPpJdToPcJNgR59TOxsA5pXGoWqghP
	 1PAGv0LsvMnvRlEb9pWveS2Wyf8bEV0XXa16JSZcULhGKwAiMlVf3Ck0OecYHQa8LTyeI
	 oxyhcQzG/4TR52577r2DnSPFG0AhmiieZd+Dh6lDUzOtKzbxk9A7/KZe8Z5ReSY0zMqW3
	 iIGqEm2nKI5Yk9WYloUEb9xo2IwC6fV5YsrfMzCA0h5/A32McG7VJMsQhALqgkYVdHLHH
	 mo2N83hDPaDX3c1XUJBtWyER5qTmux2TV8eGk4OPwTF3Vqw0Y28gBNnJZ6OrLTL0HqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VraLAnBB;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90B560A382C
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90B560A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VraLAnBB
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C9BE40DC3;
	Tue,  3 Nov 2026 15:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2A41F000C1;
	Tue,  3 Nov 2026 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718090;
	bh=WfzPGb0Mse4d7j/Ua/7Hqcs84ZaSl689mor9HstQNz8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VraLAnBB8iEvmuoFb3nDU7FUs/OmRWlZd9pI9El7xtmvFcFjZ+qsTCFtm8qJ9xnTM
	 kZFFNDj4VyO1XZNaC3TdXCV7k2MHalKXAIfEl24qYuy3Q/kp4jATM2kbbUSYelPIDC
	 tyQNwhUsx40ck67Idycq/g4Mx0MXAM8L3yCIUU5aup1rNinI8ezvlj8cI9SIkBs2YI
	 YhTRb9/DSO2hApTFTlEyef8iIRyHggmy1jCTzzV2ScJbqWgWFlD6/4XdOY8PW+tzGA
	 rELCIcGBlWlXAgY4tOu8FssC4VZR00sq7XeG1Rh0Am+N2IMnn6IPB3We00OphZHjDm
	 jWEsDfW5tAAQg==
Message-ID: <sashiko-outbox-195539@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 12/16] proc: copy in writes to the network namespace
 entries before pinning
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
In-Reply-To: <20261102-work-procfs-core-v1-12-75df35e4f8b8@kernel.org>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-12-75df35e4f8b8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:01:28 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_simple_write() already hands ->write() a kernel copy of what was
> written but makes that copy with the entry pinned. Let procfs make it
> before it pins the entry instead. That covers everything created with
> proc_create_net_data_write() and proc_create_net_single_write(), the
> afs files and the rxrpc stats.
>=20
> So a write to a proc_create_net_single() file without ->write() can
> fail with -EINVAL or -EFAULT now before proc_simple_write() gets to
> refuse it with -EACCES.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-core-v1-0-75df35e4f8b8@kernel.org?part=3D12

