Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908171;
	b=eqCQ1S2CYLSA7decigE5DC/HB3zBe87V47B9tNbozDX/SoxnUtVJTAqds68XfiCXJNai
	 U7gqDBXz9cH7P7CfeWeDaOlDdtZMCixXVx118HAkvUFnplxSu5XgguCEUmaXqIqFTT1Q1
	 kyhKduYteXX9xzNBHz1U0OYqJD6pwTgOgX6RJwCPivoWF9LN7yHXqL7axRJB4iciumaIU
	 l+P5x2tohvddE7ID2q6llBZ2bGnBqHgapnHQiackGmrCrS5PLlEOaTsQqNPnhekTGuSVI
	 v/T4d9ptdH3xrdH7WR6EM+mXWrXbzCX2wuuoO0L2l3wqK3KJMKn1qFywr/jzQjnt/WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908171;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=8iqvj1j0PH0IF6Pq8SLYp4U0CTa0deUsshKxdgFjrSU=;
	b=Dv86kpbRsVPwatJCpcOrmdbNXxocYvdNjZrPc/hfuJucLYKdZl9DrG6mnNHfpW4eci/y
	 8JyeWZCdxGjkgxpmQYaissR7KJt6BK9oFrd/av2UraZsQs82+E3VFtqwcVn+xNR0dpc8Q
	 TJXyrW+OXQxs5RRSDkYM9WGtIt4uoiaLCc3lqt+LVHf1b8v7hXldEEUyQILTX/1DSKXXB
	 1rd05xGp/1ry/OAEP2tIrLWkGoMagiVWIJQxyGPdksLxhKmoas6N6lIowtEiZIAz/oKtI
	 aNW4fgiT75cq4qpGrZxbklwRpoCUuz0g+Ii70R2VXJMhgOsKNX4WDBw70RdKm6yYb5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e/7gvIZC";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E1F6072C55
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E1F6072C55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e/7gvIZC
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 845B66020D;
	Thu,  5 Nov 2026 19:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B731F008BF;
	Thu,  5 Nov 2026 19:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908170;
	bh=8iqvj1j0PH0IF6Pq8SLYp4U0CTa0deUsshKxdgFjrSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e/7gvIZCknBaFzJk1RgkLwVMr4hs78B7PL/oV4FLAzy/Q5FgSU+3GZA7Xlv9b7h97
	 sOkvwq6wF34xuVZKXVh52l/paydNnOxqbPff+W5bbrXpDh4/yvE1F3UShXMByo+45D
	 ZP5FoizEXgCQAv0L5OiypTLx4sSXgSqmby9CzJLA8KHoGb/YLurZBQ1TKSA+yvkM7G
	 bivfF57fAYinyJoezBGyj5X4rL2+oMAJs7h7PIDbP2fQWTmu3frru4bUG5Jijdi1ek
	 fft2l2rYhfa/l4HQMr/2iqtHxa5FQQ/vkF3sjCMJ8uUvc5Kkaof2EtZ21M7Zq1aqf3
	 /fBPNQAhSnZVA==
Message-ID: <sashiko-outbox-199997@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 11/26] scsi: core: let procfs copy in writes
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
In-Reply-To: <20261104-work-procfs-drivers-v2-11-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-11-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:27 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() for /proc/scsi/scsi, /proc/scsi/device_info
> and the host files so procfs copies in what is written before it pins
> the entry, and parse what was written from that copy. /proc/scsi/scsi
> and device_info take up to PAGE_SIZE bytes like before. The host files
> pass the copy to ->write_info(), writes to them that are larger than
> PAGE_SIZE - 1 bytes fail with -EINVAL from procfs instead of -EOVERFLOW.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D11

