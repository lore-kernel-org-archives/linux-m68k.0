Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906933;
	b=PhcFKsi3aieprCZEhmecjc00YB1o2HAC9Is4inLMbQmhxdQNiVopguThyrREAxO1wZYn
	 yjGtTNuok8C30mE2YMv7oqEGqTPfkmel/tlHBNr9n5GkGM5f66elER/+2acPa9xUpBn/S
	 CkjxgwnDZuDhj7qMgM2jrrUKzC5KEJmTRkqRZ5rbo1f2rHkFgzcG+rBqVGQUxot/w4Ey+
	 VZqwVhGYrHJRggsrQijTVCg2SYDB6+8g2hBDWboi7tdwNvYT1+gkdn2qNL20c7TUysUyr
	 NCe6PE5FXAspAJk4gItFml86f9vn0G8+b4AGuQP5lWfHT6e0tZGDHNZyQ0B2misKuVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906933;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=VSHZyt2HX6jrf2329Ijyz/9CIcWqtdZcAyFYcq/4Bq8=;
	b=DTM9qOrSxtej9z8mQxNbxJ3SsTtjqh95ER8EX/bol957htIL6H19GUTpu3tr5PhRbGsa
	 tzmf7NfX/KcuTD0xkFkKJ+9QQICeiejadr0ygaLVeHVieUy0BiSANcrC+YXMh2c4XU9VM
	 WswQAGo2vUcSEQvg94UPQUIfOCa+Np3y9gvzvaGaSH/b8J24pTntB7AB9uox7hk77QunU
	 z09oU5uKz6Gv9FXfEkwDTFvH45BvdAa6uK+5CNnlEm4z/67agLNzTx+OgkWXrPaY7+HqM
	 COYURn2dw/rq59ZmdCAK/9yWt2c27Yi7H/OiOQfCa16TGo0VGYOArzpWkciWo932WSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bw/WUc87";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFA7606D827
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BFA7606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bw/WUc87
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40E8C6017D;
	Thu,  5 Nov 2026 19:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BD71F00A1A;
	Thu,  5 Nov 2026 19:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906932;
	bh=VSHZyt2HX6jrf2329Ijyz/9CIcWqtdZcAyFYcq/4Bq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bw/WUc87dAK9OgwLDerM/G7Pe9RKageq/S7vyIMIV+dxKfDT/6+AqyOaZ6Fy24Sf5
	 xZ0+NlTB1ife40KhyEO8/2i3RZt4uYwfQUof6r8FI5lnRq/LcyHfWASkm3/MjWrdRi
	 BgQ8a/ZYKTrhKL/NQvAtS4X8/cdEouDrtzAKSt2JTd0adgchhl1YlumOBJltoAEeGN
	 vYbB+LfXceHt3UW6QGLdXHtaAnZDe7rNdeXAjPjeo8fIdhcgFV0G7rwEhhGvDXSfkE
	 wVgK162apTb1SAAInG0qnJMlwH5s5bUi5ICww4nLneNlWhcy3veuvsSne6hkFWvg7u
	 jpKMdfeHfDQsw==
Message-ID: <sashiko-outbox-199865@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 02/51] scsi: esas2r: don't copy kernel
 pointers out in EXPRESS_IOCTL_GET_MOD_INFO
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-2-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-2-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:28:50 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> EXPRESS_IOCTL_GET_MOD_INFO fills in the addresses of the adapter, its
> pci_dev and its Scsi_Host and copies the whole struct back to userspace.
> Nothing in userspace can do anything with those addresses, and the
> ioctl is reachable through /proc/scsi/esas2r/ATTONode, which is created
> with mode 0444. Only pass the host number.
>=20
> Fixes: 26780d9e12ed ("[SCSI] esas2r: ATTO Technology ExpressSAS 6G SAS/SA=
TA RAID Adapter Driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D2

