Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908674;
	b=o+UGNrYiIHGfFEMVp1O/haW+QfxDcDg9v3kTgfvcmzcpNNVIccn01JjxNYuUgWcq7BZA
	 rfbGEMM8/GDk6zY4PO4T/469Q6kojOoDshlGObF/P2NrDw7zg/av0nUkznug+l5uDSqFj
	 vrlCbp8U+eBnXpejjBLPT37DS6VIKNwTSs0Gmr0m/EBaJ5Lyf5w6OOB6grqNU20VniA06
	 CpkiVakefVphMfwfeqikG68ZqEHEE6/cd60lZHyJQ7q5qknhCMwGzKz7h+UXbEZLeMl+O
	 NsnfZH/WsSwYm04gaxgv++9rrLYhF35RAgY+RuLkv1K7AuQfLnG7Fqwah2nGfMq7QwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908674;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=JeUycd/X3QAMjGkbWRWLv0JHcDa8SO4ZWx3DOn9WWrY=;
	b=bezJJvYzZ6VHJugOPsu+qfE1RoVARtQdk6VBgLneF++G7ooop9wJDdBO9nXtAELQGxUK
	 K6a+jwIeaPwDWsU5gOzLI1Xc9rUBQSHO94hWzB5g5Hw7xtLNzBeW6/xXvJIhrbp+GX7PB
	 IER2kfUSIKe1fof4Jk+yfEjwmF9baaQlLyI47yo9jd6EmZZYZnCEuXWO9vCy8UMj4HNIz
	 bBGodAel3LFr+/6OGmiyH1E8BcFMgMgLrxcKQI7jj09Hc/HqStAJ3clNlzN+Qd5O7MeP+
	 oxMqnbkS35SE3QFAhBPZXgmSjrSavOl34rHZWen+mTRWMCGp6ihuU47hIJVHYNy4Oqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KBygoTPe;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32618606C8AC
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32618606C8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KBygoTPe
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0339C43F93;
	Thu,  5 Nov 2026 19:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782D81F0089F;
	Thu,  5 Nov 2026 19:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908673;
	bh=JeUycd/X3QAMjGkbWRWLv0JHcDa8SO4ZWx3DOn9WWrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KBygoTPeNolnWEgh8FZs5ViL8Ujmj1WIczSN75XrmLLh8kxMZe5FC5un7pt4khl8d
	 l4f6yhPiJz5zYJe6v+theCb/axVS5RhhYpA/nv5uABjed6cl1Mr8W6vE600aMtwosP
	 u4FzF41WO8SF/z4xVZPrPsrp6oS3edw1bsAa24GmArUDG/OmO3HWmGKoqxCRecln5T
	 w/jecDwFPd24gj+Adp9XEXQQ4nRKmS0imJl4W9dPNxrIMthUNIeVg2Mj4azykbTMn2
	 /UdBPkx9cGZLnkh5r61yrqDUrLdF3g7yYI/unhfTHGXckCblzOGUY+7vDs6k0zETDK
	 KyT+vTJP4O6UA==
Message-ID: <sashiko-outbox-200046@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 12/30] locking/lockdep: let procfs own the
 seq_file of /proc/lock_stat
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
In-Reply-To: <20261104-work-procfs-fs-v2-12-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-12-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:57:52 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the seq_operations and let procfs open and free the seq_file.
> ->proc_open() only takes the snapshot of the statistics now and
> ->proc_release() frees it.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D12

