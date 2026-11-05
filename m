Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906986;
	b=yLjlgEIJ9I3Jru2Fv5C3Pgnx/eGc8cEIiwKfiwu6bjd99JF0W0NBHU3NnYUDmkDO+8rG
	 UycO0YmYVM+d1uIBU2MLF4vFuA35mPfHoUrNttASlasGgi6YbxV3MTF131X4W0radREb6
	 QqaIP2l3HNt8csEmgr4T+GJygrOq9aLJ1PRu3dwbpb6OW/i41f/4X5r8CXFcBLVQyP293
	 u2QUY1RGksiZNuKgkIQF7DLvu3nA/R9kV/tRpHjSGBHgvjDRYEtK6FSFnx7BJVHiOBLNN
	 P2ae4YdvJYlPqvOiF0mUCM8STTZizEyIOnlUS2YS2+ceeo15xCriVTcdFuKBh7yEDOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906986;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=qZX6TqimGj0FPnu/ads2TGWZcJdWF3Hg9sf4zFcOy0g=;
	b=e26GMYi+s5nTjCPieA0y91tof2cOrK+1oyjfhqhrxjyXoYUO/qLO1uladXkbvtmTLZA2
	 Ok+c0l5xyitodHN0yWd99+vAjHIiC+SGVVt6e+QxKiU0iG9AWi3LT9JcauSlpvf6Y6cTa
	 kelXUsbE7J6vc8PK0w5pOR/ykOd71nyL73ylyK0RkAmEpQGBCFdDDE3rXlh63To9vEf7Z
	 KXa8vHav/HcNSHy1MlV8jZb9624AHHZ2p3/+ymdIAVOH4Ij/7TBbROBZp0jZ+OBtg0vOV
	 ZMnnENr2SINyyZWtqPv+VAVQIcrz4+l3WtBeDdUXgkzUVagplotd7INn3xjNbAOgcWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVanxKXY;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562B360A2615
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562B360A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVanxKXY
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C9162601D7;
	Thu,  5 Nov 2026 19:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0D01F00919;
	Thu,  5 Nov 2026 19:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906985;
	bh=qZX6TqimGj0FPnu/ads2TGWZcJdWF3Hg9sf4zFcOy0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZVanxKXYs5ktHoZYv4D/uQQVfoZK40PC7mYX3MUUXNsjdgxlVN2mUV1CZyN0px3sS
	 anXxwuSYs+8OfnMy1a61hJGPZSr8HsyYjUlLU0R+HHnCLVFbUeJZ4hqEvcD9OSxhNm
	 b4yUcMf4KwRiwGKBG+O0J1WrPYTgdG7asoElB+ql62bi3qmtvieZQyAcNv0MXUEfLh
	 DNPU06edIHuWUKftt7sZUQ/o1KlFN2EELj5lVnxD3jwTWFSvVtMFCs/jL4yOLC2wT0
	 hwh0T0s0JGhXVBidtrd5QVgPIgEG9Rt/BldgHb+FXPeJchUpFRsxIMco2Y7J0eyQf+
	 Pc1dVZ24TuZ+w==
Message-ID: <sashiko-outbox-199891@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 28/51] ntfs3: don't warn when a huge label is
 written
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-28-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-28-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:43 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> ntfs3_label_write() allocates as many bytes as are written with plain
> kmalloc(). A write that is larger than what kmalloc() can hand out then
> trips the page allocator's warning, which panics a panic_on_warn kernel.
> Use memdup_user(), which fails such an allocation quietly with -ENOMEM
> like before.
>=20
> Fixes: 7832e123490a ("fs/ntfs3: Add support /proc/fs/ntfs3/<dev>/volinfo =
and /proc/fs/ntfs3/<dev>/label")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D28

