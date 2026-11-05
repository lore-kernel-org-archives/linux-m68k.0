Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907344;
	b=4UmNAL6fcYuPROi0raxqQAWcMV/EA8E1ufzdBRSAdafx0+aT7C8AancwKiIOn74gFVb2
	 PB0qWxBnnza8XNX+sGCVzO5P7c+BT/xUzImc3mBaMV00927rzGmzpWMSTjIxhPfLPvw4j
	 OvOoqbaZpGzpNm3eMSvxJjDP1oAoVWo/Aou/v6S3O3RI541EcdS0OMNMsAvkTB5QBIH/e
	 5xRZmf6ZylyecadohkA954SyC90KAXeom24S1kApQpUxQMu9OqZ/a5IuUdgQIPbp0m23+
	 XbVMWsBaz+k6wPQo/L9W72FEVmQ/1gE04b4MUnpVGZQK3yXEaBidh+qGS8N8RIpCfHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907344;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=alsXUfuEo/F1zePFVRl45Ndme/OflhiQcp41SPItDb0=;
	b=y97hFdY2f12EMAFlBmkwFXVCroxsuqmAPzs6BqjRgSL0ZMTEzGct6Ocn+07MpXVXmMKC
	 JABLBij7VhjKvO3N1xf7vyO49dxgpXxf11S+hZ6v5GJMPDqders+Tqo+orLiKtGEDh1U1
	 4dNh8Rph72gIfyJD+oz+0HcfQbNi3lOfidnKeayAZw1TMnixazellAHdgu1fT4o6Z9k34
	 3J8jcwNz4Sa2hRTCTdoCROVpIF7MKqb/Qj6qSs0yHWvTUuw+w4togpuNSD/5U3DKkgykH
	 FkfLg21ulRWbMe2z3pUWcdokJB9XxHL11H9eUW7+A7AhWgD3DmEHU3VJvLOVWSJ23Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dW/11WUL";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAA7606F97F
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FAA7606F97F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dW/11WUL
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D071C41B33;
	Thu,  5 Nov 2026 19:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CEB1F0089E;
	Thu,  5 Nov 2026 19:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907343;
	bh=alsXUfuEo/F1zePFVRl45Ndme/OflhiQcp41SPItDb0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dW/11WULePWBsogqlKJCGC7JYPbCbnYXRV+C/X7JOVxLXj5zOAba52zQpFTgNc3SU
	 VqxLxyGyN/7wF0BTtfNixYDyxmB3E86QX9Ux9RGZ1zXR/EzZ2ZJyrhkPfunyxJJIZl
	 un+xpBbQSiFaF0jJ6u/VW8rXe40ajptsRa6PjrbVxC7gTAonFrr3x4gk/kvpjOE5P1
	 HarizfUM9JcPoR6EP40r+AaFcc6yhKBRuZw/KiwaBzFcWGsYWpC0CK/E6jNjHZpgDM
	 EXhNA7+mREaW+iD5ECYOta1cjbh7H74x/1uUayMthsMGSyY9SbGLuxXinygzr+5A4r
	 a3NkeRuyCBiAg==
Message-ID: <sashiko-outbox-199944@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
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
In-Reply-To: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:41 +0000
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

commit e52627c4b4d80d32822781f143a8c1245bd64a2c
Author: Christian Brauner <brauner@kernel.org>

proc: let procfs copy in writes before pinning the entry

This commit introduces a ->proc_write_buf() callback in struct proc_ops so
that procfs can copy write data from userspace into a NUL-terminated kernel
buffer before pinning the proc_dir_entry. This prevents userspace page
faults during write copies from blocking remove_proc_entry().

> diff --git a/fs/proc/inode.c b/fs/proc/inode.c
> index d51ab7548b117..df1caa0f238df 100644
> --- a/fs/proc/inode.c
> +++ b/fs/proc/inode.c
> @@ -417,11 +417,44 @@ static ssize_t pde_write(struct proc_dir_entry *pde=
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
As reported by Sashiko on RFC [1], this isn't a bug, but in pde_write_buf()
(called from proc_reg_write()), buf is declared with __free(kvfree) =3D NULL
at the top of the function and assigned later with kvmalloc() after the
count > size check.

Per the Cleanup API conventions in include/linux/cleanup.h, should buf be
defined and initialized in a single statement at the allocation site:

	char *buf __free(kvfree) =3D kvmalloc(count + 1, GFP_KERNEL);

after validating count?

[1] https://lore.kernel.org/r/sashiko-outbox-195538@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D14
