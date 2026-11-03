Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718094;
	b=T1rTbIz680BbbA1+KbKZyI4H6nzP9uFOM8QP2webmwgf5nTLfk9W4U3rvMUff3jNX4qQ
	 mKmRzEsxdHcd9jTbhntzRmhlrVryFVzsiphpQuDKcVwxa+4k0kVTIWWy7ceS2cvey+CNm
	 pT4YzxpqyjXnfcME0Ad5qcBCDyDAaZKrNBI2G2k4WjUIBn98KwkaL5Z74t0e9dkydylTr
	 rCK3odZ6dcShc3CwCXm7WC0gTArk0SF15I/jS1PVGrKtomRP2v5Ah1reeGsLU655xMe6c
	 XuK0CMnH65Wp+oEdWv4dRF10i411G2Y4LidkU+557mkAymwaiEG8OnHjq4beEKGYcmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718094;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=r9QXWEwcwVsmD+gtjv1V0GbX1OqeCi9C0moHpPKkhRQ=;
	b=tKNR/bAvFsRM8Wx3Ul5A/FkpyShcjXj/zzeSPBg2rfisX49PfBXzdef3asuwGXaKjjYI
	 5+hFa134+wOSHQJ6rvWcMsgA3D0TjzUeOA64hvb+qhcfTwh8TW+zB6dwxQ90wlSaK7vof
	 WSte4+6qif9Ny1Jp6Lxbb0F/CBka051MI3EO03gTuzIuZsSukm5SiMDM6HWPKmUoFrDiC
	 j4m87hv2AG8QUe8COoTh4RIBS5brxjWysvlrCCb2HZ8cDcuAg+YbmXadmmvoMJE+6ViFG
	 Y9j241qqJ5LCcPF/GqIEEVeohy9jg4WdUItHThzW4g6P4GQsDUk/ia+Zro31HoMdw+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gp4zIMJh;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455436071C08
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 455436071C08
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gp4zIMJh
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D15C9402E8;
	Tue,  3 Nov 2026 15:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F351F00A17;
	Tue,  3 Nov 2026 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718093;
	bh=r9QXWEwcwVsmD+gtjv1V0GbX1OqeCi9C0moHpPKkhRQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gp4zIMJhOwNqzm61c0h9XNd9e0AwMrFelEXQHKRAAlQ2LDeEpeF5m7tBEoFMtPFtY
	 uS4RsfPUfBZ2hRlArgVukP7X27SDUoJHgd88tPlb4o1OnQzVSaWgr3kNiGA9hxIq/E
	 7mb+cQIMUcKjUtjkRzdgBHMuNsu5EauysVoMaNwzoPfPD0sP32Kk9v3DT6vIUEgTNp
	 cOzOKQMESWOupzjY/ff38B2v3OsIMhrG6ZdWGYcCgTBgg6ho7OLcY+ImD//T211CBM
	 0ZuQsQcQMsjbrmcE+Eu/aRaJ5b+O1TMZX8eMsi4Ysf8/HRob1Y5+l5qFso1ia6iabK
	 z49HG1oD9fXRg==
Message-ID: <sashiko-outbox-195540@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 13/16] proc: let procfs copy out reads that don't go
 through seq_file
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
In-Reply-To: <20261102-work-procfs-core-v1-13-75df35e4f8b8@kernel.org>
References: <20261102-work-procfs-core-v1-0-75df35e4f8b8@kernel.org>
 <20261102-work-procfs-core-v1-13-75df35e4f8b8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:01:30 +0000
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
- [Low] proc: define and initialize __free(kvfree) variable buf in one stat=
ement in pde_read_buf()
--

commit f2c1eb05c1e48ef170c932c3f77db0e09db3d058
Author: Christian Brauner <brauner@kernel.org>

proc: let procfs copy out reads that don't go through seq_file

This commit adds a proc_read_buf callback to struct proc_ops so procfs
entries can fill a kernel buffer while pinned and let procfs copy the
buffer to userspace after unpinning the entry.

> diff --git a/fs/proc/inode.c b/fs/proc/inode.c
> index c0bb40e7ff964..3f29a1663d266 100644
> --- a/fs/proc/inode.c
> +++ b/fs/proc/inode.c
[ ... ]
> @@ -400,11 +402,67 @@ static loff_t proc_reg_llseek(struct file *file, lo=
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
This isn't a bug, but in pde_read_buf(), buf is declared with
__free(kvfree) =3D NULL at the top of the function before the early return
checks for !iov_iter_count(iter) and IOCB_NOWAIT, and then assigned
separately via kvmalloc().

Could buf be defined and initialized in a single statement at the
allocation site (char *buf __free(kvfree) =3D kvmalloc(len, GFP_KERNEL);)
to follow the cleanup.h conventions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-core-v1-0-75df35e4f8b8@kernel.org?part=3D13
