Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907361;
	b=UBxNmX2K7o+5NFoi7OPmJddGVdXC0WgjruTQisBhru84aFyMHanEdN8hMx9ggxP+Huev
	 3wmlGGVeZSr3qvaxrynzt7yQLxcvUUDsm1+PhRNCWKlQkWDbSMg9ifKoVFJwg8RziRsTf
	 1jUIbr5yZXoBuA1xGqSWkisEa2CI0NP8dFWv0tujZDJzprqA2FJDpKnjEXowTHaL8q522
	 eGFo2l5TPvWOdDPCIJCnFY3etZ6111bFvgHipyqdo0lkGdAO0biBT5qnwQX4j4fQqt8oM
	 WAcdt7SpPn27NPIC8m1JqAZ8ENBj+/3LeEhZ1dpjovWmSH13h0htonBD+S67+sbLi2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907361;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=f7pbLgB+bOANV7ZH7bSfet1egKll+CXGNKYzJQU3Yrk=;
	b=EQC+fEF3FaKlOZIXvC3/5cKsOMS51qOHhZ4fcdqKOchw7T6l/9DuK08KqyR/ySc1q20N
	 13oc9nByGjjGyJz67qvd1zNSSPT+v55h4HvuH3+2DsXLjf4MEmCCP/XW4lzou2VnqH4a7
	 mTsP90IsLuPEcdDtHp5n342RVjeHk4PC77HnROIqns8rGurc4oO9KnqBlSoKHAFEP6/SN
	 SJgbayV4ZRjG41Z4TxRifPMIkQ194KPKcRIHX1YXbhTS+23qXIOUXfV2eQBoefPMswvSx
	 OxD48ppTBaWPiGERf3jHoQasUYDYrspktFZRXBC6y8z25DeBShig+SNaQoeomE87Hqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMGngCoO;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD362607A675
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD362607A675
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMGngCoO
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B0E3601EC;
	Thu,  5 Nov 2026 19:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E9A1F008A3;
	Thu,  5 Nov 2026 19:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907359;
	bh=f7pbLgB+bOANV7ZH7bSfet1egKll+CXGNKYzJQU3Yrk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iMGngCoOl/U4CYIB1rTzS3RguQRqLRp2sKfBp3odJCcMgrP4Y2V8PmtfZZo1x5Xkv
	 FLC9VNWmdujwFQtrFCf8Mg1QUR9V0cBoPIZOnqaamHivU1nhWiKlmj37JQBwx8Nw4V
	 gnJGb6AJHKNc0HghHI9fJU1uQS16q3fA1JPSybQgU9VxlezkJg9W+I3Lt4LPHuBS+G
	 M91zjKny9mmSeWhknnqhOUNYocrnIZ20lXgBv1WbhSSK7LtbVS4MpUGhBLakgtch3v
	 NiR+5uPctDAbSjOlOz7BSSMrEU1NCpxJBHKCCILKG0ymIlPQ81348+1c7a3Gat7yd+
	 kdKHITt2fXI3g==
Message-ID: <sashiko-outbox-199951@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 21/23] proc: let lockdep check the pin
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
In-Reply-To: <20261104-work-procfs-core-v2-21-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-21-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:57 +0000
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
- [Low] proc: kernel-doc mismatch on __proc_create_net_single_write()
--

commit 095fce4c95ecbe25e644f1a3fe90061f695e9271
Author: Christian Brauner <brauner@kernel.org>

proc: let lockdep check the pin

This commit adds lockdep tracking to proc_dir_entry pinning so lockdep can
detect deadlocks between proc entry methods and removal under held locks.
Entries created via proc_create_single() and related helpers receive a
per-registration-site lock_class_key via wrapper macros.

> diff --git a/fs/proc/proc_net.c b/fs/proc/proc_net.c
> index b78d627b024f8..9ddd7c323dfcd 100644
> --- a/fs/proc/proc_net.c
> +++ b/fs/proc/proc_net.c

[ ... ]

> @@ -232,11 +233,12 @@ EXPORT_SYMBOL_GPL(proc_create_net_single);
>   * pde_data() on the file inode.  The network namespace must be accessed=
 by
>   * calling seq_file_single_net() on the seq_file struct.
>   */
> -struct proc_dir_entry *proc_create_net_single_write(const char *name, um=
ode_t mode,
> -						    struct proc_dir_entry *parent,
> -						    int (*show)(struct seq_file *, void *),
> -						    proc_write_t write,
> -						    void *data)
> +struct proc_dir_entry *__proc_create_net_single_write(const char *name, =
umode_t mode,
> +						      struct proc_dir_entry *parent,
> +						      int (*show)(struct seq_file *, void *),
> +						      proc_write_t write,
> +						      void *data,
> +						      struct lock_class_key *key)

[Severity: Low]
When proc_create_net_single_write() in fs/proc/proc_net.c is renamed to
__proc_create_net_single_write() and given the new key parameter, the
preceding kernel-doc block still documents the old name and omits @key:

/**
 * proc_create_net_single_write - Create a writable net_ns-specific proc fi=
le
 * @name: The name of the file.
 * @mode: The file's access mode.
 * @parent: The parent directory in which to create.
 * @show: The seqfile show method with which to read the file.
 * @write: The write method with which to 'modify' the file.
 * @data: Data for retrieval by pde_data().

Should this kernel-doc comment be updated to match
__proc_create_net_single_write() and document @key (or moved to the
proc_create_net_single_write() macro in include/linux/proc_fs.h) to avoid
scripts/kernel-doc warnings when building with W=3D1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D21
