Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908198;
	b=3AVI5w0tz20A7zVUZxwzgIfPJjko6F+9jtS7I+qGXiVZzeZBbO7W0FlwDydnFP4bEG8L
	 dcJ96tKXdBzO9nScj9zy28x0CK6htOIk16t0P1TFLkVtLFvzQkumipDuCDOXsQiVmzE0f
	 WRdKBwYIdnPg0taiKjSSQv+q7SKcfN9wChrMeLc9cwpIkvSbdJqC2V4bqF2DWreKqBfew
	 mZUN79jpWvr9bctnvJ7Toeoq7kbv4HJmzQdNw7+IFyOTq3ClKWQ0cm13oAh0JLbwFYJvH
	 /cScwSfEqd6nnsbTRglwOcd79kVpH9xyUXlYiMhZ/zverf+TWulHO3YY+ixO6Q4HTpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908198;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=g8VIx/O5myc3jTrcBAbF/1LMhr5RQoOacgBMQZch0fY=;
	b=luND/Tvf+RIVd1jHa9SX/kWGTXQnuZexkfPf9ACPscvdEe9eUvptvNeZb+WN3s0VvEmk
	 KaJSOT6INstKEi/jEMS0GkMJjVcKWac/nSh8CWBu+YBWt47H3pyJcwpL18ef9KuFSt2R6
	 VP13VcSX68pDKH3LOqjZhxFpKnd9wlQfRGgngPMYu4SW2GOyNo4XsIKBHoNw5WxUQ8k44
	 nqK7Bxz8OcXmvz9dYx0tuH6XdLjpgYz+4htJlTEdTra5ZqS/z3hbjWTnh12jPMA4fU5Rm
	 hgJ4hxjLPKO+4Tkz9wYYH9DKRjnDJXkf6nds0Z2vDQ7ri0lbmr7ulVd3G+V+3tLcc3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GbszhkNn;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578A36079C2D
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578A36079C2D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GbszhkNn
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB8EF602D3;
	Thu,  5 Nov 2026 19:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC021F0089F;
	Thu,  5 Nov 2026 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908197;
	bh=g8VIx/O5myc3jTrcBAbF/1LMhr5RQoOacgBMQZch0fY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GbszhkNnwvO6EsO7Tch1L6T1eoBkSqg9wjmNNLPmyAxG2R9masinYXbJsOTY+WBND
	 YITcHdDZMKJ+ys/om6N2Aw168qXvmq3eUzTRlQnt6fJlpF5HBR49FB7wDRwc5rDV1v
	 Fd8qgHIJaRAOCVy9ZmIJ7vbLdgajX1iuSBveVNu2Sw/RE0P6xePPXblZ1dfK5I0ul8
	 bNf+SDcdrcY/2ABjoRIAYw6DURlIUIpIE9xYQSFZSjaFKJvKrVkzV+9TPZM0E6gxvr
	 yhAlJ8/t7+E9RS123LJSEQWtMe87Kufp4SAioD6JROHJFZz0zySPuvUwc8bjxDts3w
	 U6TRi8lLBZm8A==
Message-ID: <sashiko-outbox-200009@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 23/26] ALSA: info: let procfs copy in writes
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
In-Reply-To: <20261104-work-procfs-drivers-v2-23-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-23-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:55 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() for data and text entries so procfs copies
> in what is written before it pins the entry.
>=20
> Data entries take writes a page at a time with PROC_ENTRY_SHORT_WRITES.
> They used to get the whole write at once. ->write() of struct
> snd_info_entry_ops gets the kernel copy and opl4, its only user, writes
> it to the sample memory without bouncing it through a vmalloc() buffer
> of its own.
>=20
> Text entries take up to SND_INFO_TEXT_WRITE_MAX bytes at once like
> before. A single write that is larger fails with -EINVAL from procfs
> instead of -EIO now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D23

