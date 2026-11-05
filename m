Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908164;
	b=VquoW+vO2pazqXizUaBHHa5n6YyR6yGqRTeVsr0Dybl2766JIiIf7viGq6gzZyP9Czxx
	 U10I+dqF/BwkETJbpihQoj82aaDO9i3LyQK8fSdjAe46ZJZLeDpIEC7yVbh7vMAC1miUG
	 FcmZuKVXSTuG1UrPrDiJYQns1SHhlh1yHVjWxN1BlYPe7RSxvs0OFfy0FSFIPOMshbtF7
	 apNauHToEmKBBhGyraXL2tlaOB1EmEtsnykUuiDtiHp5l5LFhWnKTj5frGX/cccDw+2mE
	 F6EQi5Vae+ohT2uTIuJ37YoO/g7I9Wu7mmA6aIVUtFkow3Oqsk6DDRcWBofh/PJCVLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908164;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=N0CtYubMYF/r7d6Gxu4w4PPm+wbOFEVbT1err3hfmPQ=;
	b=oLLvxaQH15zi+PQYYJcx16bQVVtVhYyyaXOn/uyr7bQJmuGZI3cknCet7/QbMaeRpQS1
	 4IY2bRMzeIrweVPJncorwRqprP2PIOBYE5PAnaK9ZWV4izQ9pRTYEJbUYeKc6rI8/Mi55
	 s7Sa0x4+6UNd2XqmsAZ5gzOrzCD6s/Zdt8spqIF/oeZveRu1NteWzZiZFFkTjr2HiSXsI
	 eyNxpQVDj0i3nkJ39B3MnKJxhp13GekL/x/mQOpfoKfV0MBm/e7u8ZG1iQwJays6H24Pl
	 sSxi847sbny0yfsfyTK+6SHNywAUccD/TgkJyLfqgBZaCGWR1wXZTuZ3lXJBrovpyww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g0UxjNU8;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8710A607112F
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8710A607112F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g0UxjNU8
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C037F6024D;
	Thu,  5 Nov 2026 19:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23A91F0089F;
	Thu,  5 Nov 2026 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908163;
	bh=N0CtYubMYF/r7d6Gxu4w4PPm+wbOFEVbT1err3hfmPQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g0UxjNU8MZbO8udDcLYgRqRi2q/XSDyFGh1z9C8i7ejWdnpfWqIymFr+1IT0mc9pm
	 vUAHmObKLivs3T6QpRP5aX9275s9ITd5tnDA1AjwI86MBGTBRx2/EyT6iZGLyZTtcu
	 OBobErK0P6T4ovFlyV33ng4ldtrIqOe4K7GkXQiz/YxTKqVm9ihO9UcmDqZgtNZPk3
	 5EKghk8uC69sNlLzeG5xPOlXepVcMjZD9U07VlnT9ijbQ3xiy/Cl7PRs3Z8ghaxbYv
	 wY0bQtFDWpVNvA7aIxkVn6jiWS9nrKSqT85gUiwsLitaiKs0zgUwV7wiBMRPCCCqGR
	 iOwywSNM6+ANQ==
Message-ID: <sashiko-outbox-199994@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 08/26] s390/dasd: let procfs copy in writes to
 /proc/dasd/statistics
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
In-Reply-To: <20261104-work-procfs-drivers-v2-8-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-8-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:21 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() so procfs copies in what is written before
> it pins the entry, and parse the command from that copy. Commands longer
> than PAGE_SIZE - 1 bytes are rejected now instead of cut at 64k.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D8

