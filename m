Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906959;
	b=Vix0dDhchoX6nm3UvOzK+jNEF8EgdnAtgc4YVhn0S3M9J8BbfAJUgdt4vLroqz2qTkXy
	 6v4Sg6eUSHRybbdy0DWtXKsC9zA33mxbXGIihxDNfF72qdeZYHR9PADzFKZDUBxe0bXSi
	 Epiw8b0PosskMTBDUy1woWqtXk9idw2f9MKeEQ16Ox87akL6oS+SWNJuevqMOhIT4L6ph
	 gzLlha3H4lNbKkPK5xFYQa8IqE3AsAEAkEWmMRbikh6CNI5PnNfTIiWwl2CRXBGDzyka6
	 6gRdHGrsYJBcSZmhqs7Ha9C+07d9RE2NSx8ekgZwwoDT6WUWEWyw0Az/WiDDEswy19w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906959;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=2jOjP+w+HiO6pPFlf+UtXLVpbUo8fVoVCMG/gzgxPSY=;
	b=WagQw5EplTaCLdLsaEBqszXq3XtNI1Ur0uAgWqqgRN4/HuSz4k8kCJ9uLmUqENGKd2yW
	 C2MgGeD/na4LAJGSIy00Gw4Nqmg4QtWe5v2V0yf3dYRa4Dx+MWj3tVQqmR8ALhc3F+Qoh
	 lhsSA0RzurznOcHJpSfUsIz9hHcz0T4NYyIEI3XvDCzE7PfK7ZxPmsDNePm6p0rSMerjG
	 T7XhMe8iCNdV5PzvPBfHgIkc3J2HOu9bCGzJ+DT50tD7PcB0nR9Gc3Ah3pMmpbqk+mHqR
	 h2F6JBIYvQlT3RNq/8OxPuo8Hjw7qF+1ss7gzieBp6yfio6fMe8+z+haT49b7SYv+5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dlMl9M/r";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D44606D831
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34D44606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dlMl9M/r
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8159B6015B;
	Thu,  5 Nov 2026 19:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D611F00919;
	Thu,  5 Nov 2026 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906958;
	bh=2jOjP+w+HiO6pPFlf+UtXLVpbUo8fVoVCMG/gzgxPSY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dlMl9M/rPNxEZu6+Ri3OXa9FPI28S+nKPOVBymLRvAUIbEdACYesn7GaasG71a1si
	 Jkdk1nguj1FW0I6rEhmRyL6rCf6iGgz0RsNmgA2Aax7T6dfl/bLd0reMK3dxl47No2
	 cZOPksbLnHyzXhnv8X6aqtgNCaUxaH8zvMCcgysEle4NYPvSVucRgboVQsljfhslI1
	 t38Nm+rBEGJUAgtRVOrBLiUgvSsBb85o5UOO6lhjVE/GMpZGzwjSdxGKJTR11kjWCO
	 BXN98+TIo2Yx9dB8Tl/s4rDba6W5uK4F2hW8KmNF5r4lJJBlBYlOLW1lUh+7tDsUMj
	 MzavIifWHwTQQ==
Message-ID: <sashiko-outbox-199877@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 14/51] proc: sysctl: don't stop readdir at an
 entry that is being unregistered
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-14-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-14-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:16 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_sys_fill_cache() creates the inode of an entry that has no dentry
> yet. Since ace0c791e6c3 ("proc/sysctl: Don't grab i_lock under
> sysctl_lock.") proc_sys_make_inode() refuses to do that once the table
> is being unregistered and fails with -ENOENT. readdir takes every table
> it lists into use and unregister_sysctl_table() marks the table as
> being unregistered before it waits for readdir to let go of it. So an
> entry that is unregistered right then makes proc_sys_fill_cache() fail,
> proc_sys_readdir() stops there and returns 0. If that getdents64() call
> hadn't emitted anything before that entry userspace sees the end of the
> directory and never gets the entries behind it. A listing of
> /proc/sys/net/ipv6/conf can end early that way while a device goes
> away.
>=20
> So skip an entry whose table is being unregistered, like readdir
> already skips a link it can't follow. Lookup treats such an entry as
> gone too since ea5751ccd665 ("proc/sysctl: don't return ENOMEM on
> lookup when a table is unregistering").
>=20
> Fixes: ace0c791e6c3 ("proc/sysctl: Don't grab i_lock under sysctl_lock.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D14

