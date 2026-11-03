Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718089;
	b=x8Dd44JNkDuzd6vyTdA0GXNPRwA7oF/CFojFxjapLROJh+cEPX9DdaGGi189X2hA6r2R
	 sNyJavnYH+GxJAI7tUG6A0vUq9gfKACGkUnnUWg5IKmTWd2jiCrlH4x1yNNB0quQZGTec
	 +UY5SLxOEdDDQ/AXoOLCf8MhkBqWwZEZLRD4sxgws/iOwhuAZLoM9uEyB6ugNLIRrTpNh
	 8YqtJq2weKETj5WYuALhVJOeZFc9rlP24crj2FsnW/pWZa51w8dzK2+COLbrDdXmHa3RL
	 RXbWavV9JWabgWBXbt0UdWkmQIOo0R2zbqBucndeiUOc33iybDfMbsD6oR+4+2G2Vqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718089;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=HJo7uhQ8siYxDw0RZS7+3aCaFL/z+RS5DWNp/kEBIgk=;
	b=JWZ49HgkBbdN3DJ07Y3oLXJRvLaxhDnn1ub7FP8gpfnD/jcUMkEIXanSSODyVxDUP+qL
	 Ba6jErirEFReGRsU8sPUYPZZOwRV8y6y0vZWtDfv+DK+bOYqLUMhM32NDHqkdYOqTZzde
	 yfAX16JIm+XLbGVOM/nkyQEQ6E1kKNBVF4HxhtTBAHZRFTP9CFmM7uMauGnOz2BXoyQWD
	 lODiWNQZVFB5zYegtbf1zPhXdcxLTTuELGzj1I+PQFfyhePS/ziDzVMsureBLOokv8qxC
	 P+Kp2DEjsuL+2QCtUjRkpvY37WhbKYEDw4lWAbVWItt591aahpf3h9kmVwTOHVNilzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="egO6F/of";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74584606F63B
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74584606F63B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egO6F/of
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD1F160239;
	Tue,  3 Nov 2026 15:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1CB1F0093A;
	Tue,  3 Nov 2026 15:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718088;
	bh=HJo7uhQ8siYxDw0RZS7+3aCaFL/z+RS5DWNp/kEBIgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=egO6F/of7CpTd+PoLOWG9TxuNy/r0bVezlWWB3WedBTqIlqmwFVNqYhzt7VSoW8zF
	 L2Q3+erAo9JrU5hHInrg7k+kxzeqoaIrxxrLW7A1xtt/ncPtwSegLy4+TXN3HzG/hu
	 X8lQ7pFsFkuXEdqfkgkDg+lJrU+5qpItEyIjMQvlvx7yavCortIJIC3nuU0t33yVqs
	 dtJ+2iUHTvZB7QICHjQj8YsMjkOoP8NVFK47FEu6xrH8SbXS5x0lCNVOHCX5Bxz6mY
	 dkiORpDTzbslpgezRG4qDhAij5S0Pzc9kdghBEA/Lbr/FhFJu+yj3tH/1YEccJaQ7R
	 /D3PlZ2sc1PyQ==
Message-ID: <sashiko-outbox-195538@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 11/16] proc: let procfs copy in writes before
 pinning the entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Jann Horn" <jannh@google.com>, "Josef
 Bacik" <josef@toxicpanda.com>, "Chris Mason" <mason@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, NeilBrown <neil@brown.name>, "Eric Dumazet" <edumazet@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Al Viro" <viro@zeniv.linux.org.uk>, "Jonathan
 Corbet" <corbet@lwn.net>, "Christoph Hellwig" <hch@lst.de>, "Greg
 Kroah-Hartman" <gregkh@suse.de>, "Joel Granados" <joel.granados@kernel.org>, "Kees
 Cook" <kees@kernel.org>, "Jan Kara" <jack@suse.cz>, "Jan Kara" <jack@suse.com>, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, "Takashi
 Iwai" <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, "Chuck
 Lever" <cel@kernel.org>, tytso@mit.edu, dmitry.torokhov@gmail.com, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Anna Schumaker" <anna@kernel.org>, yukuai@fygo.io, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>
In-Reply-To: <20261102-work-procfs-core-v1-11-75df35e4f8b8@kernel.org>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-11-75df35e4f8b8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:01:26 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] proc: split __free(kvfree) declaration and initialization in pde_wr=
ite_buf()
--

commit d672761b59bb5333b9344e6a78cc97135a5b70b1
Author: Christian Brauner <brauner@kernel.org>

proc: let procfs copy in writes before pinning the entry

This commit introduces ->proc_write_buf() in struct proc_ops so procfs can
copy user write buffers into a NUL-terminated kernel buffer before pinning
the proc_dir_entry, preventing page faults during user copies from blocking
remove_proc_entry().

> diff --git a/fs/proc/inode.c b/fs/proc/inode.c
> index 8425465aae5d7..c0bb40e7ff964 100644
> --- a/fs/proc/inode.c
> +++ b/fs/proc/inode.c
> @@ -440,11 +440,44 @@ static ssize_t pde_write(struct proc_dir_entry *pde=
, struct file *file, const ch
>  	return -EIO;
>  }
> =20
> +/*
> + * procfs copies in what is written before it pins the entry. A writer t=
hat
> + * faults on its buffer then doesn't hold up remove_proc_entry().
> + */
> +static ssize_t pde_write_buf(struct proc_dir_entry *pde, struct file *fi=
le,
> +			     const char __user *ubuf, size_t count, loff_t *ppos)
> +{
> +	char *buf __free(kvfree) =3D NULL;
> +	size_t size;
> +	ssize_t rv;
> +
> +	size =3D pde->write_size;
> +	if (count > size) {
> +		if (!pde_has_short_writes(pde))
> +			return -EINVAL;
> +		count =3D size;
> +	}
> +	buf =3D kvmalloc(count + 1, GFP_KERNEL);

[Severity: Low]
This isn't a bug, but in pde_write_buf() (called via proc_reg_write()),
buf is declared with __free(kvfree) =3D NULL at the top of the function and
assigned later after the count > size check.

Per the Cleanup API conventions, could buf be defined and initialized in a
single statement at the point of allocation:

	char *buf __free(kvfree) =3D kvmalloc(count + 1, GFP_KERNEL);

after the size check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-core-v1-0-75df35e4f8b8@kernel.org?part=3D11
