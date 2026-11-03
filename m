Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717278;
	b=BUlQSVubEZCx02PazRaEMju9qW8GYT8naJ7m5WaCotRKAT7QxUkxH6t/fMM2MrNmbXsk
	 Ugc7ak5Iq3sliaVvUOkaJx1HJfKEEqi+3VxrHDbxcv2CqTKLqgQW+h16PPts22Lyjy6RH
	 tVggcUKRIRyBXoB7Qf0kBPpxgj4uv8NALpDqMc02iXYZMaSSIZAvUc1mT2hu8r3TB67yA
	 jGn+YYQrAMN7HU1FHb3a9p54194fpwrZjK2tm4rV/1PKJL54PmV8R4YV3jepOGDBDmskc
	 puOmMFQ+xEZiv/ApiSBcUAWYI775gXLr9s/8o4JG3lwxolbWxjky8xALj3uneDPBvcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717278;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=QRmT1dursV1/AbPfdQawgpWX1OE+hs1OgQGe5g88v1g=;
	b=d0bFN+vi3IZ9MGDiLfLY7kFm/9vQ52A2YIZ/4wk64W85et57fnUSAYwy89P+q+YvofkO
	 2pNTGFw45DpLMqrDcSZhpBQRH3fue5FE7SkquSXInrcIUAj/avxDw2pd2V9No32Z6JeLU
	 e0zJ0g0aJsG9B1tg+6RYWtW85Gp8FFopiFGzgrpgtEpoHkTZstXcFRNAL7DM0bZS45xnV
	 +B1WfnFcvYTRDOXVnGwEQbDeoBCTf4Lz1zLu2Wcz1BQXrzZtw4modUpOxh0l1D6Ob85rW
	 IXJIzoSJATlvhl9r5XfK5fAlO46qGEeN+QvTwg239vJbYE2eyCSglQhhrmg5cWksyRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HcJ+JRqm;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E348F606D830
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E348F606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HcJ+JRqm
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B904640712;
	Tue,  3 Nov 2026 14:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D401F00A02;
	Tue,  3 Nov 2026 14:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717277;
	bh=QRmT1dursV1/AbPfdQawgpWX1OE+hs1OgQGe5g88v1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HcJ+JRqmYEiMrWdia1VF/h68+hME8LTqCzLLleewidrGGkT23nLAVx72jBXXGRnJH
	 deW5WlbJslcCL70kgQE/USZ9Pn2koDB3lf5HMQ+VPVhK2NhZBxXINU1jpYDX7AyCsb
	 zx7C3NFyw/w3WUfgqJDpNiOEzMi7KG9GL3w92NOCLX5CEQpNgp8ax9OyQnfnVIOmqd
	 91xXbQvhxesjbGUDIpGvSg5XYWfnpqWG13blZJqrRvr8fqcc4OOCQ4glPo9tDaoFWV
	 HSEf1t6mQ2mTtiA0x+I9dkOFdgeDd9SF/dvfLBNHVQRjp06VJHYOEXnI2KvV4mwZi0
	 9BjYRzDu4BVvQ==
Message-ID: <sashiko-outbox-195487@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 15/38] ntfs3: don't warn when a huge label is
 written
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-15-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-15-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:47:55 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> ntfs3_label_write() allocates as many bytes as are written with plain
> kmalloc(). A write that is larger than what kmalloc() can hand out then
> trips the page allocator's warning, which panics a panic_on_warn kernel.
> Use memdup_user(), which fails such an allocation quietly with -ENOMEM
> like before.
>=20
> Fixes: 7832e123490a ("fs/ntfs3: Add support /proc/fs/ntfs3/<dev>/volinfo =
and /proc/fs/ntfs3/<dev>/label")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D15

