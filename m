Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907008;
	b=WsCAGiuIhzhqw9eBB6ebFtdXk/Vrwzm5O+pwxBYDcjEOEwbW50u3iEz426gpXydbBhWC
	 1h+wwPmTKmCKKt365ebE2pl6veoswRItnfUb0ZFRLsEOfCs/9wrVOGPj8BL8JNSus4xJ1
	 TVv9A5twFVfXercoDDRIpbm7Ei3G+cyKUoKl+gYMoUpxANvF092jZeK8WOX3yV9/J3vLL
	 X1s01uAn4l4APVoSFpz79n7SqTVturSVKJRPuyQ11bw1tybGdxB4C7q71DgWHcaktE0QU
	 cWrapi2FdlSGbR+pizQgeNSxvyM3vAMeUV+Qtz5/7Ucezrgmdp9ODkhU0kHzTXO7KGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907008;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=7PHyXsRCh8nUckWf/52BHUGTboWFHsh+IL6ljZbS9tU=;
	b=GRRh2FuSG7ucSsv+3vcetwMCqtTFjYBh/4IQZNB44jSb++hE+ZCgvn+aLab8zJAqbez1
	 tcwcx1KfqDssXbkS6Qg3WqoOiSildI14gQesvjiJbYCIFjIf4k9SrrQh8EKu7hinixXYP
	 PDILDMOHJh0XZnfAgC7EQlU4/cStAWKdE9K0pmkFv37XUsu9gTuSbZk8gff2UstctmbUq
	 KAQ5B9Jpc31ZtVNW3697P9KMpbV9ewKsdT3HLhy4YW7JW+pHJD0mCL+PHi09zoBQntZgS
	 waSgU1aZTCplJ86/69OeEgNEIBJcDFPbV0NYKp/JMEUAK6QnW0xuH4FWJfJQB6qyRaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EzbFf2vH;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5433660A6F6A
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5433660A6F6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EzbFf2vH
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC3A1601D6;
	Thu,  5 Nov 2026 19:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058331F00A17;
	Thu,  5 Nov 2026 19:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907007;
	bh=7PHyXsRCh8nUckWf/52BHUGTboWFHsh+IL6ljZbS9tU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EzbFf2vH4rdYmLSxg3HKN+VvXLe/yE1Tm+i03FhW8mezL4sHWQcUkoSNnFKVwq0bi
	 AzCp++9TnQnkMVuRyQ7av+BkhgA/SJE164Miit54lB2OO3Lai0csSIQhWlpUru6waD
	 +VBsr4BCGwCfqkHgRxJDlwr2XEGmEoMwpsrj5goVIQBSCqw3VOFqGx53PTILkt5ust
	 nbutmvvSCT+eOLEdguPUYLn5ci6I+dEQYyb70GenJ18ODID+H7xgdB1VM3a+sCkvVh
	 WEBmPTJH++5VB3kciDdK1xZpG8yPpTWbkTU6g4v0sBHmmzlPDXWv2561dDq3nEbTxS
	 FmCid2KQ7rxdA==
Message-ID: <sashiko-outbox-199901@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 38/51] powerpc/crash_dump: check
 ioremap_cache() in copy_oldmem_page()
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-38-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-38-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:30:05 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> copy_oldmem_page() maps a page of the old kernel that isn't in the
> linear mapping with ioremap_cache() and copies from it without checking
> whether the mapping worked. If it didn't, the copy reads from an offset
> into the NULL page. That oopses unless the copy happens to be a user
> copy, whose exception table entries turn the fault into a short copy.
>=20
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns that into -EFAULT like any other short copy.
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent copy_oldmem_pag=
e")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D38

