Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906931;
	b=xYp1oDUmVukmZEZiSo8+64y+TF0Ia4w5w6zh7xNEHr4lUi6h6mGdolL62IgwpWRvU3Hz
	 OHxh2AEIU0Qp81jNYaQHF9Z0rLIVSc36vkXwgDvRAvkWY+80Qxxb8Ha0nL32GFDmovilv
	 ccJgWBwpvSEkb+qbdUAeHRt18ily6H7I7+cVRB5ih6WdZETTFo9NI3jP+B3vEkC32ZUS/
	 1SLTv89WZSHi7YpoAowGSAHQNOjUKtr5JGCcC18c/Vnmve6KWqmat1LqErBiLKd7N12G9
	 peXEYgqNOWqnFxviWj/SFOa9RlTRek+H5MdwQLJPZlgtcbm/ParASN790o7E5TjS2CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906931;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=t5ltLRfeO7A4ze3tr9EcZS3s3I93T55/6iRGXRatBcI=;
	b=Z9HIzc45lBComrQwh/J3vUfavWHHM6VxHsm6cARNXHrJD2kFkMXAzZO+kd6MjjTAL/q1
	 Wi+5MHZgi3npnLAVtVnSGF8RJZzZK4UtcrzbMtgh0FZEdz6KMe+/thH70fXhaGEbpxwPK
	 pffLF0BCzfWidElCyISJB0xZECEAtBGLTgEm6EjlTfKZPIo5hcilIRwi+EZ5/CFlgIuYy
	 B5/fgKSx4H83lJMLRQToqp04eXxs75ux0gpaR6fDKVD5IB7SdIvDoqpgogWehZrtdetcv
	 JivUNSJrVuOZ9Y0egdeWiOMCH8ruHa3uGD9JI6sM2PWoK6OSJivHUYD29bt+5XgMAtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N8czzOm3;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D97F606A338
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D97F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N8czzOm3
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C4684168D;
	Thu,  5 Nov 2026 19:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F791F00919;
	Thu,  5 Nov 2026 19:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906929;
	bh=t5ltLRfeO7A4ze3tr9EcZS3s3I93T55/6iRGXRatBcI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N8czzOm3uss/Nev41wWI2HCgtA/JJ30J5ZI/5HvqHyryejYB/vPH/hBylXVkVGrv6
	 OielTQZZJsAgzXMX0XY5+ywbGo0mmqbyFRwY2koxZomesAs/TJ9/gk+vP/71ryRjrz
	 T4vkNotZqPxmBNAvJ14HURgj7iVi6JGCZi7FoFu5UsPJYhvBEXafmV8KZulQt0TLUa
	 bnhBhsrybsI04J6qaEoTmohzhtxxwuJRWFtL3gmSrI+vhB1bjBR5l4UtjzfZC6c0lO
	 DCD02LTUhjPPRIlhUjpD4vyOQAhRmKBCDZpyL6ta2I03KLDunRpmQHSavStcgYROjy
	 RlifknHgKJUtA==
Message-ID: <sashiko-outbox-199864@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 01/51] alloc_tag: don't remove /proc/allocinfo
 under the codetag module lock
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-1-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-1-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:28:47 +0000
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
- [Low] alloc_tag: unused function shutdown_mem_profiling_async() when !CON=
FIG_MODULES
--

commit ec0095b3ecdd2d01651f48bc80cc81d976e06106
Author: Christian Brauner <brauner@kernel.org>

alloc_tag: don't remove /proc/allocinfo under the codetag module lock

This commit defers removing /proc/allocinfo to a work item when
reserve_module_tags() fails, avoiding a deadlock between remove_proc_entry()
waiting on active procfs readers and allocinfo_start() waiting on the codet=
ag
module lock.

> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> index 82e2c3448dcf2..7d7ad67049537 100644
> --- a/mm/alloc_tag.c
> +++ b/mm/alloc_tag.c

[ ... ]

> @@ -604,6 +605,26 @@ static void shutdown_mem_profiling(bool remove_file)
>  	mem_profiling_support =3D false;
>  }
> =20
> +static void remove_allocinfo_file(struct work_struct *work)
> +{
> +	remove_proc_entry(ALLOCINFO_FILE_NAME, NULL);
> +}
> +static DECLARE_WORK(remove_allocinfo_work, remove_allocinfo_file);
> +
> +/*
> + * A module's tags are reserved with the codetag module lock held for
> + * writing, and a reader of /proc/allocinfo takes that lock with the ent=
ry
> + * pinned. Removing the entry there would wait for that reader for good,=
 so
> + * let a work item do it.
> + */
> +static void shutdown_mem_profiling_async(void)
> +{
> +	if (!mem_profiling_support)
> +		return;
> +	shutdown_mem_profiling(false);
> +	schedule_work(&remove_allocinfo_work);
> +}

[Severity: Low]
All callers of shutdown_mem_profiling_async() are in reserve_module_tags(),
which is inside the #ifdef CONFIG_MODULES block further down in
mm/alloc_tag.c.

When building with CONFIG_MEM_ALLOC_PROFILING=3Dy and CONFIG_MODULES=3Dn, w=
ill
defining remove_allocinfo_file(), remove_allocinfo_work, and
shutdown_mem_profiling_async() outside #ifdef CONFIG_MODULES trigger an
unused-function compiler warning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D1
