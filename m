Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907349;
	b=Ejdvb0WZ4eYCZ1CC1IOKJyz8FrM+7oyuDdA0DgAkIJtnnoFEol61Xw6CECkW+B5Uzt+X
	 1uLPTUni6ibINrvUQfIAbRyQQhX7jSU5oGHeK0tL5x3lcsuskje+FKeGZ0i/VD+KlLHq3
	 eg21/wdf2G0tjf691SulvLysDoVKussYu4yV4ezk7TM4CoVwCf1OkqwXBSEZa2bp4N/lT
	 gLC3VgFR2XOmbuxDzDEatgOLvUqIU8m9ZnDVFR9pOog5D2FtKDCF7zS28QZ6bTi0MGcUr
	 0Kg0kTfMnmS+QvYbWeEmZ7nSXgZBu39FEKw0Bpj0QHJ/4B4OXmKx1aJiJHBSdKU5K+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907349;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=1MugNV8TCf3DcwhciMioHkCDdfBEvJqmJegZE7T3Anc=;
	b=ZcCCD0b1h7vvOPgpMVLguXEF+ex5qpqGsaSCrQ7Ec1vt20CGyM59kJzytCvX4TFu/aNJ
	 HqJXE6o3gaFXCZFJN9TmylPtlxpbWkzzlInJoZRQxtVxSBiyCWkIz80dGENLqlLLHLX/p
	 aDXpH3PVx232AErS+F2Q1v1WKkobpBoS8V/g2xHCtKUZCc79tSumMQ45zgXO+uxH9W9Xw
	 RMLqhqu9IuXYJflsNxaeKFa0Ro4IBqy+GRVgMaBVlL5zJPbEYlhUZD6M69a9JxF9GPapB
	 lzmYKE1Kr7Te0J4djNT+VayRkifQ0720Ct03OyQS5Jh/0wSycgh7SOCv9dcOslZPnXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JxUDwRLS;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977CB606B9EA
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 977CB606B9EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JxUDwRLS
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BFE843CC2;
	Thu,  5 Nov 2026 19:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6371F0089E;
	Thu,  5 Nov 2026 19:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907348;
	bh=1MugNV8TCf3DcwhciMioHkCDdfBEvJqmJegZE7T3Anc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JxUDwRLS659AKy9L6EF/sMAUNJPV9IWLdEGgYT37J3Q3xoM9Rgl+/f5tJog9D28GT
	 YMaZHCMQxAz8Q/YhL7D2HkKgLdWMS13ODeIvOVS2cO3Xyt1UiWgXthVq8iKNCfiwYC
	 CBZKMuWNvUYO3GRSHNobx37W6/E4wT6vFZKwM2U+b9rd+Q0o+xU/Q/0vCpfhxieJT7
	 F6OAqSTAk8K2MFcN+drjgRiXeceRcYXDu/MhOHTrRoTOf/Jcy6qlsQJs6CLNabmhUG
	 q0HrKvIx+/XHSn3ssmSRL1+tCAkBs5GI7/FQwPFk1on24fvEEyzBWmsp3oEib+CbCf
	 nnIC8BG7tI46Q==
Message-ID: <sashiko-outbox-199946@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 16/23] proc: let procfs copy out reads that
 don't go through seq_file
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
In-Reply-To: <20261104-work-procfs-core-v2-16-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-16-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:45 +0000
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
- [Low] proc: define and initialize __free(kvfree) variable buf in pde_read=
_buf()
--

commit 19cf278eb9fee57b90ee19764f6b076d9cab553d
Author: Christian Brauner <brauner@kernel.org>

proc: let procfs copy out reads that don't go through seq_file

This commit adds ->proc_read_buf() and PROC_ENTRY_FULL_READS to proc_ops so
that non-seq_file procfs entries can fill a kernel buffer while pinned and
let procfs copy it to userspace after unpinning the entry.

> diff --git a/fs/proc/inode.c b/fs/proc/inode.c
> index df1caa0f238df..caa47933c233d 100644
> --- a/fs/proc/inode.c
> +++ b/fs/proc/inode.c
[ ... ]
> @@ -377,11 +379,67 @@ static loff_t proc_reg_llseek(struct file *file, lo=
ff_t offset, int whence)
>  	return rv;
>  }
> =20
> +/*
> + * The entry fills a kernel buffer and procfs copies that to userspace a=
fter
> + * unpinning the entry. A reader that faults on its buffer then doesn't =
hold
> + * up remove_proc_entry().
> + */
> +static ssize_t pde_read_buf(struct proc_dir_entry *pde, struct kiocb *io=
cb,
> +			    struct iov_iter *iter)
> +{
> +	struct file *file =3D iocb->ki_filp;
> +	char *buf __free(kvfree) =3D NULL;
> +	ssize_t rv, done =3D 0;
> +	size_t len, count;
> +	loff_t pos;
> +
> +	if (!iov_iter_count(iter))
> +		return 0;
> +	/* neither the allocation nor the entry can honor IOCB_NOWAIT */
> +	if ((iocb->ki_flags & IOCB_NOWAIT) && !(file->f_flags & O_NONBLOCK))
> +		return -EAGAIN;
> +	len =3D min_t(size_t, iov_iter_count(iter), pde->read_size);
> +	buf =3D kvmalloc(len, GFP_KERNEL);

[Severity: Low]
As reported by Sashiko on RFC [1], this isn't a bug, but in pde_read_buf()
in fs/proc/inode.c, buf is declared with __free(kvfree) =3D NULL at the top
of the function before the early returns and then assigned later at the
kvmalloc() call. Could buf be defined and initialized in a single statement
at the allocation site:

	char *buf __free(kvfree) =3D kvmalloc(len, GFP_KERNEL);

to follow the cleanup.h conventions?

[1] https://lore.kernel.org/r/sashiko-outbox-195540@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D16
