Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906978;
	b=BIJlejN1XJ9WpVweLSxcUpOEnkuMvtILKCmCyh+Vxb1bNdJQMKzYFy0Wa2OhcIyFlsJx
	 ii4uXqptW6N9YusU6P9WGlnYEUIDzVpjqukI4iBCE7gB6n816ciodMQeYhUsWVe9D6Aja
	 Ath+6E2NWjtOT5bX6axuK1ewlFJjUxR+iS6kckv3gwv5eRELq/ylQiFFYSD+oJ52+3CHp
	 v0cZMB6kuXqhqnVd9ywG9RTqiXHOHYANB06YsoupeQ2HRDW7SX+42Quu9egOdQvoPtemN
	 iy2zHHmxzzJo6DCN/Tmf5bGR1b0kUtKBI+A1/M5zsuqN6NSqsVHBZ/HkGUvn42gwU5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906978;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=UR/bGeijImnk8Wnsd/tmizN5U2rV5dto4UZIl+xyMfM=;
	b=hv1TKAUhpd2xw2R18rqxZZYu9mzmmvUcprcauMYyLhFbqjzt4k6bs6XPTT966/zJoPQV
	 UFgSfrRQLrbwWt27cHukYtWIHOWW9cLA4wpcku/ro3yfvUvgbLTvADE4Lhd479ikK0hoO
	 H3JgaZ9MAG7Ejx1UCoPnQHcI1ed84tqxZZL4Q/Zcc+dtn8OTxf76ZL+PPLhEJpJ6jAW/J
	 swbXQIJqSJ+/1bo/ilUxFXo0CmpyhqKzGT+GrARIWOd6Cim2qL/hrJxRpHNzRf/+tJbKG
	 0GMR6D4NaUOYwZnHmMutt8yrKYQiCh3aVafaHAE1eP51XcxT3Oi+Ywrch7DM1taSUZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VxAzMv7U;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BD3606D820
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56BD3606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VxAzMv7U
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EFE342E2B;
	Thu,  5 Nov 2026 19:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EA51F00919;
	Thu,  5 Nov 2026 19:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906978;
	bh=UR/bGeijImnk8Wnsd/tmizN5U2rV5dto4UZIl+xyMfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VxAzMv7UFsyYnoBiL2vhlW1+tAK1RI3G9hd3638uMnnOa+X1Hd/XqYwSl1li8fliq
	 01QhsAxeUKmrnct1phcjHiDBlkTHs7H5HFNvKkpojOe2Up47iBr/sA68sM31T/h6S0
	 s1ItQIwz3EUke9VL6TKuHa6OR4G5BsKdMNyDzHw3sJFWrdLfbdMVss8m2/pslWW3kO
	 Z2bpNVkFCKMDl6PKap8s1Bfs8w8BOM0UrxtXZUW8aAbl0jCRWy07zKeWwaBY/bqScI
	 FXVCXKSbBT0TU1OECjLhNsgTdw455Z7U5ly3rnd8TVtw/5tgWX0i1IZgIKT9c/raGT
	 3wuaupfHri8xg==
Message-ID: <sashiko-outbox-199887@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 24/51] scsi: ips: don't return 0 from writes
 to the proc file
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-24-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-24-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:36 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> ips_write_info() ignores what is written to /proc/scsi/ips/<n> and
> returns 0. Writers that use stdio, echo for example, take that as no
> progress and retry forever. Return the number of bytes that were
> written.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D24

