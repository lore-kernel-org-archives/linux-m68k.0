Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908670;
	b=ET7J8fDwLP6RxIPz9TgkWUyLWIO5fH8cVOA19hlBNWMO4QPiyHE3LY7kqvi0LhesoCWX
	 GAE6UzX81Nxdx5UakgQ/2FxvHUnuZFK2Lu2i9JmcWWgp1c0x3N5qwDhWvuHMd1JGhCtdj
	 MhQT03J20tez5SAMdxQyCb4RWfLMPFtUESVHSmBMLIpUcLxj0KNDHNPTaiVtAYoW1tdX5
	 0cabYaIEuVQsxx37kzWpJgQcgSCaD65Pl5EztWjdWzsa8+gaLBOV2JUukATI9s4PCKhbp
	 lbxo6/1HVMW8+WiRDCw5iZzwDWijMUyTySLCveITIawZuKjnpsiKIdZnxVYuXaGoYuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908670;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=NRKKgBaULAjA+HtCrE2b2BaKHLWg/IWOGmXDRpIt4CQ=;
	b=rzMJMzJKed+NgRI5rc2cYxkizesd6c+SVdbbHMDQ2xqHZ0F3WgMAouD9GMl6AZZcLqFK
	 td2LkQrQ04+5fCBY9DueUaxC5+iHOUwuPPOjPB1m20YKbysNpHEVPtrRv5h99J4kHJCAx
	 A4+hT/yi04EfGXuDAro9cJwgzvHClHMIZ1jyFEgMHsqWNLiy1UZlbaD6Tl9l2B//tzL8/
	 tQXs7QnQEz8jKRpDg+8TGqIm4KP3vqa7GfdbMJj1P4G0MRlnGsjmEuV8/bFEfwE6xAARE
	 6tWJGQ8g0+GsxhJadOzAZmrZV/M8IWRnj+kJqXla0dcxEHtjd1K30aNuVjfmOKFlRqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zhykm1PJ;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77375606C892
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77375606C892
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zhykm1PJ
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BE0343BF9;
	Thu,  5 Nov 2026 19:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1571F00904;
	Thu,  5 Nov 2026 19:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908670;
	bh=NRKKgBaULAjA+HtCrE2b2BaKHLWg/IWOGmXDRpIt4CQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zhykm1PJUY5wvMtL/zZjQkbyq1PyvwZC0EOgbc/mXkTXjW5jEDUFBHmJDkJa40t3l
	 GIpVPB7pCfyT4P5CA6CEZXejqjXrq+ic8kl3YEXNxI1//5Q5Py0E0a8kNnqcjW6hPi
	 K09iDwRpN/qRrfyGrXfrtzedYO2f0xYg0e0CVFZSUsUaxT5QaMI//WK8iMNBQsmWUg
	 QYwurgr8Y9JSYLqma2wGeJtJYAI+2EiMBA6btZmAUfr8ngEY8HBKKYPS4KNStW+JAC
	 Nmg8t5UHwTP7n5VK7s22hm26muMFtPD72IEuPBkcb9I0XmHhmyLKRTBgGvV//TFzuF
	 uHK+79shUVmhw==
Message-ID: <sashiko-outbox-200044@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 10/30] genirq/proc: let procfs copy in the
 affinity masks
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
In-Reply-To: <20261104-work-procfs-fs-v2-10-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-10-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:57:48 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() for smp_affinity, smp_affinity_list and
> default_smp_affinity so procfs copies in what is written before it pins
> the entry, and parse the masks from that copy. A list of CPUs can be
> longer than a page on large machines, so the files take as much as
> memdup_user_nul() could copy in before. Anything larger fails with
> -EINVAL instead of -ENOMEM.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D10

