Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908702;
	b=m46KUqyc7fzQ4FPqcQCf1NoxL6CkH8Mkh8CFukn/AzyDhaApAaF3so6EX8vEap8xsEov
	 QLB6Y3LGujlgEwLC8Sp63tVvNtf4+sxX6JdyYXlhx4MXnK84My9WKXgOufNSWWwtyV0wd
	 DdW68d+6G6OD5kvNIiyLBjAjIzQX6x++SqMQWT2FX2e/+701IhLGyU0yq6wnAaWTYIzuu
	 IFB2Kmnrn3rTTB6eJjk/TlIkHHgTgVF236DGkKEFIC6zulrmNVjWJan7q/jaxNSdk6QwD
	 4Mu4gabgZi3og8d7MKYBvPuQBFwqcoL9+p5qk4sbTycIyqB3XzNN4KIO5S5fdBWDHBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908702;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=7/aaKuldQgClq8ReLax1ykoSxafbF3ZgLD9HjMju1WU=;
	b=BQlHYUqKOf+Fq5IqtBvk02TAT0I0aCpxtv+SktX7LHt8pvUZaOczxQRfBoTIjjMG0pPd
	 9ib8vInXgx3SI+CjIOToO37zw8FwZ3hdPhP5lguoWnCkO+T+6UUMQdpSZ0HRnDQ1Y+ryZ
	 nZ0XJPW2z6cQAMZjFuR6FEkLvDKTDQ5md33oPAe9HABf/vEIfXf2lEVnK9qb90z2kSgma
	 vc9AUdH9pKecMMF7h734g2JM14JLgIt3RTP5y5f5S/iNOAd7jpm4+gwmSHNs6K1BasG7z
	 vTO/YVHlt9GM8FAjVwTlOMmqcar4xC1XXrbTw/CmgdEPuq4EEfzkoV4xVnfO6Vp3yOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=an+GaGrP;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20B1606E436
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20B1606E436
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=an+GaGrP
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC40D40991;
	Thu,  5 Nov 2026 19:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3891F008A1;
	Thu,  5 Nov 2026 19:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908701;
	bh=7/aaKuldQgClq8ReLax1ykoSxafbF3ZgLD9HjMju1WU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=an+GaGrP6TdrpWnLckWrPSepsWmHkQ5XptZk4tHL+HpcEfNPQTKp/wIE0YEjMyswu
	 OrhN9uEyMFoYjQkeHuikFpy3e0zddTttGDFkpuIaMkcA6eGsZ9PG+nZXuKxpHyCsrC
	 SNCEbh0wSxS6z/Jb7uu4cFZEto4+IHTnO2FVyeKD50/Tzzg7HbxicNYxazMsJsheZU
	 1/idVdBK3MZnCoSpbo06TdxRXrO5ag6849zDW70fe0dwn4m5M5QgW3y7jxda2zX6CR
	 doTY9qkj5Jd95Yv6hY1F0fz7SIzfsktjfoFB86+JK9Sn5qjY0BS4iz7RIoQ4TBqsQz
	 j9OtHEdlaVesA==
Message-ID: <sashiko-outbox-200059@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 25/30] alloc_tag: let procfs own the seq_file
 of /proc/allocinfo
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
In-Reply-To: <20261104-work-procfs-fs-v2-25-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-25-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:58:19 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the seq_operations and the size of the private state and let
> procfs open and free the seq_file. ->proc_open() and ->proc_release()
> only set up and destroy the ioctl lock now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D25

