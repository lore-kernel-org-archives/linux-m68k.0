Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908205;
	b=ePpfZWNQEAUh+hCj3J0P8cmZdGNcIavgB3A67kIRmAmPeImYIwaQHrRRav++MkIw4p7F
	 jS+v2S2E7xbpZS/1bhP+2RaLhAagvvDFludz8lYn8aJqA//74p3KgPzUfZn8FXxsrwvWF
	 ZfkdqjUrkTEJzSkBPkvSIT7orJJmz0633qF3fI2KyyX1Wr6Mf+4EU/3wTebtGB9nRdsKI
	 WJ5kzIT6xlcqe6Z9nGkWj6+ogADkQmkjttfjcxQRlb1YD2K0fAVBZDVSuBjda7O0tN5L1
	 b0tYfvCLMsJSa4KSe/30YxjmBbqR/FllOW+fCmJoLheWiVZ9BIYNvO01NPIll3TRudg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908205;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=R0jppsKfpO8c+Wfs9tyOHakvTx4OM727OOcLj9g2iGM=;
	b=aJn9eS9Oh3wuew54uYWcAzyk757CH07STd3UnmLNhNw2NHrbBQyfMuzsKDdJRV/nqvzX
	 B7GFj0RhUVeUQ38ELjLRZTyATCq+ZaOQ+ngcSAHsNfnU8MS1v0bTuaGp1UjgeF8ojsh+K
	 ht3JQxjgnoNsNb2bBeYIWqzv5KLKHTzOkLJXcpzS0t1IgUV75aW2iPi12Bfhq/oPnAgWD
	 JZ9oobPIvjK5I70A6boFf/+e2dZfTOwfmwzVaKFUAOzTXLy5Uw3sl0s6E4pLNiGeouAUX
	 90wjl6y1jjvb0xhpfbRflQiyU0T15Yzsw++u1x2fe4qtDgqfYBgcW10U7EQ//tc+Efw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nyw43+S2;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DE7606F593
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2DE7606F593
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nyw43+S2
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7633443EC5;
	Thu,  5 Nov 2026 19:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A981C1F008A3;
	Thu,  5 Nov 2026 19:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908204;
	bh=R0jppsKfpO8c+Wfs9tyOHakvTx4OM727OOcLj9g2iGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nyw43+S2a/7VyDX8w6xahvn9ZApqn4TJ0kh3YRsaUxeU/PqvpCGltRfC1pm+S/RKN
	 0nLdp7uPjhnxLJrT4PEIRs99H7SQAAMyW5Dpkk6h/SVdZvIPpBfgtxl/1VwXucqMCF
	 OoxStV4jZM3fRilLNS/gPiJHRRMgCNmYxkJQFK62QUdzRl0BOMQxUyKfrlaAVb+wzL
	 8MBqjgPOLXXRGgYlOZpPHg6AXB4EGv8eXqVu+otJc/X3aF3UdhH2Sq2mQmlcePMx97
	 MQvhPaBzySigSxDPgMHxqO1ydd1YUYiYyo8odeK6rXwGa0X8QKpBySn/dsFO67X87C
	 imselCmGHpGHQ==
Message-ID: <sashiko-outbox-200012@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 26/26] ALSA: info: drop the poll_table from
 the info entry poll op
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
In-Reply-To: <20261104-work-procfs-drivers-v2-26-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-26-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:50:02 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> procfs owns the wait queue a /proc/asound file is polled on and wakes
> the pollers through proc_poll_notify(), so the poll op of an info entry
> has nothing to do with the poll_table anymore and only reports the
> mask. Nothing in the tree implements the op.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D26

