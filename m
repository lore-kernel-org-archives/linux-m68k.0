Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717295;
	b=SzsUwty5HifLJA+zoy8gXZy5EoNNC1O/VnurgHXdABW/Cwi4JwSF+fEw8hd3cvFYA/LS
	 Z0P+JtGsYhLDPr5hpW/zODvt6HBECCAeuVAIB6LRzTHy8D0w/4Tlkry/yQA02Hmd9BPBh
	 ZWDKDRreNEeOm55P4+7tVhcrnquAljFwMGZQMCf8jfTu7TJ2iDs1FkGhUyLrAlBNFZOC6
	 uMJw24tcwn2dGUE7QGZLAE5d5mtAwETJshiPQEok4sjPRPUO/NouOZeOX4vTSMVGIgbJF
	 Ejh5FN7UTxapkDr4GdLLg0Dobz34KvrtDA7YiUnroUXDfWH5WF/3AKv8HCxUWEauoSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717295;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=UPzqk7+6Hl7aBBk0FqNi8TIlMxqX8AAV9w+mELiQtKI=;
	b=kVCV4HfRv8lGAxrR4qsPim8IQzR/V6fNsCgI39Lat+KZp4p/XJELJNj/0D5Ik9DNGRp/
	 fkYqRLmMt63k6oHJSfhyRCfMu90NQgKmIDq9URhHbgoUJB8sBbSY9rDVU3vywtalA+FZO
	 WJDs3MKdS7AlN4YEIJ4eWnzF+Zye1lG7y14EKrBURpK2Mze6PEmd33Cb6fmu0luW6xhIS
	 KVG9xFdP55B5K14bSp+lYgFHS9Xw2wdaOfJyXGmNdANeIpTYexarworV7psMTWSxSLxCw
	 WOPlP5vWKqZGq5v4RJFo+6CJEwrIIWn4QLx/K8RB1ga/5a3h7avqZTHEYPRCFCFh4RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KyP0Q9eL;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F95B606EE98
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F95B606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KyP0Q9eL
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C5C3941874;
	Tue,  3 Nov 2026 14:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8171F00A15;
	Tue,  3 Nov 2026 14:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717294;
	bh=UPzqk7+6Hl7aBBk0FqNi8TIlMxqX8AAV9w+mELiQtKI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KyP0Q9eL1hFy4s0NX1iEANFqNWyeYeRsq7ov2+9cVKjWEzToC131fOzh5r7yFlHar
	 pIVojox+9qRsPY8VX6mwReyYX3yM4SFOa3iFCUR8BcHSlpdr+HkALlcvSK2dwXQvk+
	 HMq+2JewLsNDNoadtorpcqyv8VmsXaU+6ywYj9q8fu0Af5xcC0FEy2hjbC8xdQfcsf
	 dvZi4J3QGSXjFPKV0tBhEW3a5ygQMYHiaBbiGSmEoo2Asd7E0ogclqFTlRO95k9T0A
	 bUc528cBptya5ifedq5lG00IS5w0DzqO8jOfnUVY117pj0lbTuRQLJGRAkw4BQaw/M
	 y5RlNwpIYj6xg==
Message-ID: <sashiko-outbox-195495@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 23/38] proc: don't let NOMMU map procfs files
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-23-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-23-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:48:11 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Every procfs file has a ->mmap since commit 786d7e1612f0 ("Fix
> rmmod/read/write races in /proc entries"), whether the entry has a
> ->proc_mmap or not. On NOMMU validate_mmap_request() takes that to mean
> the file can be mapped. procfs has no ->mmap_capabilities so a regular
> file gets NOMMU_MAP_COPY, and a private mapping never calls ->mmap at
> all. Instead do_mmap() takes nommu_region_sem for writing and
> do_mmap_private() reads the file into the copy with kernel_read().
>=20
> Reading /proc/maps takes nommu_region_sem as well:
>=20
>   mmap(NULL, 4096, PROT_READ, MAP_PRIVATE, open("/proc/maps", O_RDONLY), =
0)
>=20
>   do_mmap()                          // down_write(&nommu_region_sem)
>   -> do_mmap_private()
>      -> kernel_read()
> [ ... ]
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 786d7e1612f0 ("Fix rmmod/read/write races in /proc entries")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D23

