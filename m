Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907006;
	b=DzM6llXKsFdtmJ2wBGgG21IpN4PUKm4cjv3wfBusrk/4KfqE8o8yueK4LE+dWsIdKupw
	 uHkc2DWL468OMcHE51hMYVqc4cGrAd9yg1Snt41zSzoU75LIjGQes34WUod1wUMo0VV+G
	 U0s2qlN9UOb8y9RCpfdQqwj3oZG8VjHae39gsBYcMzlUsM1ta7KYlRoGZUbKDrbE3vkCO
	 nyUn6/g7gULE6CWaV1mktilt2oWOPXRCXrLTW2O4JNyDQpTQMk10Osf/XHpx/yLH3AOj1
	 cKM2T3bSDBYDaPYhRRMEAeiWkUttV79FhxDVyuxrE+eMESBdP6nSjvLApSUPU+t4ybA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907006;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=hsy7qPadddcHp1yz4RskpjuPCs9z+iyUZQjRxWR0tno=;
	b=NiC7ad2222JUGXbls6XsGXcq4ankahXX1J0cGaONLL/DTVtadYlz7n+gVRBeQkTkvJee
	 frPDxiz7wXI7tZjSfMPAnOxp2qeOZT7mQlOX2Q8D4FFe0OBLVfzPvrCECyTu2xITWhvWL
	 T7UkTJI5JdOPOGsfUezIpZefpPpRxeVkYN1EeDhm2AQRioRK1DxcI1GdVB+zO05s4TL8m
	 LONnJl/6ZcdyRgJt/LWMzP2U6lva8CMp/rdN1YgGIPxgKK2Aw8AxrfMs3YMhfLuQxZAEr
	 A0QRkya3JIibbvPWIDwbhCdl1OKZpiIPbPVYbyZIsqYES+bUkmAgo2jRFjS7PbLeK5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1pRV84z;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E51606EEA0
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54E51606EEA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1pRV84z
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C8743601DD;
	Thu,  5 Nov 2026 19:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D006D1F000C1;
	Thu,  5 Nov 2026 19:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907005;
	bh=hsy7qPadddcHp1yz4RskpjuPCs9z+iyUZQjRxWR0tno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n1pRV84zJKUUtgUv1TYLImkQPkvmaqLjvwYZrx2oyTCwObzhdrQFqivFQJG2KSTyQ
	 eTIbvYnu/am2gKJ0v2gg99xx3HGgCRhK3jtKYYV/hEN32FiOkUwOd5qfCd1EvNlRbU
	 /wDWKpQlTW9sg368vKkBt979aVtHTwB7aqgs1lZ3cZ7yuOwpmH/5K72S+3ZXzvHDZJ
	 zCVaJA/NGoQ3f5O/ZIg5OD8CZV38pYz/7PwHfRkFO2BSCEBpwk5KemMFv7yST4FY/7
	 ke1edsHonMb+SJ+aejvls7v7xGnvSnNsG3bwmscXuAXx4DTCqwdtiudcPMpO6x6AMq
	 QMz7+TNSVPVMQ==
Message-ID: <sashiko-outbox-199900@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 37/51] proc/vmcore: don't let vmcore_cleanup()
 run twice at once
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-37-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-37-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:30:03 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> vmcore_cleanup() has a single caller, fadump's release_mem_store() on
> powerpc. That checks fw_dump.dump_active without a lock and calls
> vmcore_cleanup() without one, and kernfs only serializes the writers of
> one open file. So two tasks that write to
> /sys/kernel/fadump/release_mem through different files run
> vmcore_cleanup() at the same time.
>=20
> The first one removes /proc/vmcore and waits for its readers in
> proc_remove(). The second one finds the entry already unlinked, returns
> from proc_remove() right away and frees vmcore_list, the ELF headers
> and the device dumps while those readers still walk them. Or both of
> them free the same lists at once.
>=20
> Serialize vmcore_cleanup() with a mutex of its own. It can't be
> vmcore_mutex, removing /proc/vmcore calls release_vmcore() which takes
> it. The second caller then finds nothing left to free.
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: b500afff11f6 ("fadump: Invalidate registration and release reserve=
d memory for general use.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D37

