Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719146;
	b=Qs/VBE9OtFaaw5D3IvEyP1LB1W1wG3hHVr+Vgb5EfYyc0Gbs21kosajMgyiP7Pf0p+nu
	 GgVoC4KF9cHuYZ+4Unm6MqbyuFRCJJRZfzda9n78ZIvUoIP1SMu4ijQTcAfb/gQD4QRNW
	 487c3QEQK9k4tR3SCeI3p2RUklc4mjOO8soJxngRiyT29c+iPp8+fiAVGjzmuVDy9KD36
	 NwQN7Jhrj6lJcqL2ywJTspFfJEuMmjYk4ItNUKifr60j3ZKT/Joc3b2s/JFK3IMzOpQ4i
	 cjxY8w1nHfwoCvk8MZwdt2L3P/G5iIPo5U4mocEApYvPuPIEh+2uNtMPVJUBLjvee2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719146;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=9VM4VycIJxG9B23kFs1jpcDVPOgTfnwXyJOXznUgmT0=;
	b=cvU7ZWdFk7KrhJ9DPh/XFY5cLSs9titoUGTdmKI1nXd1PEgsd0T+aKGLhXxGe8Hwg2Dw
	 lNPvnBGfgcnFXNU09us+0O8kOD4ZCwlYq+zUVC4nEsfF9T0LvrfxMjNKvu14sdFvndsjN
	 VwnNOD31Z2jORaWvx2J3F63wwLV0myZrW4yiWaOwI9iJcvrSNyG3FP4Ta9utyPw0V9Arn
	 wXLKvwP22xfhwgyRARXIW7DcQ/RrYQBVjBDHputsmTqiN28MVAdeh1dfoMovOFjruyUXr
	 XBwYVDDVNKGw8AfeuwksxyARpiRQ8wdOiw9E4z4D2UodwdvFeOX+n7uAlPTv90YmGdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TXLZhHtB;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804C560A381B
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 804C560A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TXLZhHtB
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D930960A5E;
	Tue,  3 Nov 2026 15:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0E71F00A15;
	Tue,  3 Nov 2026 15:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719145;
	bh=9VM4VycIJxG9B23kFs1jpcDVPOgTfnwXyJOXznUgmT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TXLZhHtBBQ/MwOWloq1a719SQTAPon23w6JmMKZCt88Jd96TH83Ml+nM4Ur+GAwBf
	 HIGjyq9tA314fRNV+6HTEn7xJ5G+/lUkqqaajiwpVTla9zE2ZdMK9TN9R05B1lhMTL
	 gG7iev8TBAZ1R6LRWHTADcOV/KA8ODBmZ6NAAseQrwJ8cTF7zrs5wQjrg8m7amlIy2
	 a5D05LqkfrZGcwMdNoPisCJwwcI8ZAno6RdiJNlyxhj5f3WJeUVTRcW/XBb2wOgDBz
	 C1Qe+80yXKtcjrTSgvFLmh4nF9st0qRHA6dP8yeGfACHozhzWrcxJDaIto8ZtRYuHc
	 drplGlm4GLlUA==
Message-ID: <sashiko-outbox-195598@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 18/23] wifi: ipw2x00: let procfs copy in writes to
 the debug level
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
In-Reply-To: <20261102-work-procfs-drivers-v1-18-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-18-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:19:03 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() so procfs copies in what is written before
> it pins the entry, and parse the level from that copy. Writes larger
> than PAGE_SIZE - 1 bytes fail with -EINVAL now, and a buffer that can't
> be read fails with -EFAULT instead of looking like it was written.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D18

