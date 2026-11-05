Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906947;
	b=jO/2Dit7PwfByEjyVcwP55ob4Zf92N7mZTLBT0qq33nS6eDrdxavYe5Z4LQEh8OFLDb+
	 WkPQCfjsHAykLnxuinbmCerheFZEpHe6FUA986gOVLwQ4l9mh0z5MX6mvlvks3e/Li232
	 iLI2pHagRJHDHM8XG3tFPkCW0AZ009CTq19oKuxeiu7qq9AKhwW8RmdDRlGXbyvAnPkfk
	 RBLFvUQPeWpP5UsuvgLtI8eqv7vgGggGCUaC7aMp0YW/0C7T947R8ZBh+il4VQ8JyOmRY
	 TSXFcUE+4xEttDXBWo1oau1VOHJuIS0IKuVZrsVoxlrM6h23eqdISLqPQNwRcqO1mpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906947;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=EJ5x6oSnf+RrWzbB6XOjg/oJy0lPZOuvIIJGGMYahYs=;
	b=djyqSWLr7gHZIwjtibKlfLtxzJLMe8400T1ruEDeYJA5nvUuM/wJYCB1lBsbaZ+tLfc5
	 bbTMNEzWGqRT6fi7S4wdZQlVSI+RtmzM7u4NkAWL49o/58PlFOW7Qc+gzb/NowvlkonJJ
	 +IsILGojpjoJ/U3aoMEtkvcXCqzuejgoB6IJjClZVQk6gw+U22ds4wH13OnBVqzizmjl/
	 9fAeo5aW8Ocx8vOJL7+KiZ5DEwgzJPx91mcHbP7dn88Z3BAkkGK0wVrNCEUBqjFEl93hW
	 +1cLR7ERrMp58oYoj+jMCjiP4/1q91OguoHH4V5VSd1qLwTS6ASQ1TMrl9wIpBrgU8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hhwYqi2Q;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4216606EEAC
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4216606EEAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hhwYqi2Q
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DF4B42E60;
	Thu,  5 Nov 2026 19:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3DA1F00A02;
	Thu,  5 Nov 2026 19:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906946;
	bh=EJ5x6oSnf+RrWzbB6XOjg/oJy0lPZOuvIIJGGMYahYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hhwYqi2QU+5PCxcWnPTB3hxrvFDBanBpjqltnKnowdGwOrQnCfcILl/BCmwovaNzo
	 wp68GIO/nSzr/nY+0O2mYBFsgas/t8X9pDclsi8l3rtLr8f9yNbcTsGRq+iy4MJ65n
	 iPM2oWsFb0Z85B1qPfkhGzqkfncZWH+JeXHP4yd2t4cuJpVO4Y7yY85ohQIrqcGzeA
	 C7/bMiWsDMhTh5YJuMjMHWRP5Zy9sUTojv9oJFEyBgQPOPeojiiAhYUcSybcJI2n7t
	 19ML9X1uaSQk/DmhtxZof8n0vxdU5xWdxA5OrGQzUPOsV+PQEYss0Ieh46MVONkx2a
	 deUWye+6T8JuA==
Message-ID: <sashiko-outbox-199872@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 09/51] profiling: report it when /proc/profile
 can't be created
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-9-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-9-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:04 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> create_proc_profile() returns 0 whether proc_create() worked or not, so
> a write to /sys/kernel/profiling that turned profiling on but didn't
> get the file reports success and there is no file to read the profile
> from. Return -ENOMEM like the other failures of that write do.
>=20
> Fixes: 22b8ce94708f ("profiling: dynamically enable readprofile at runtim=
e")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D9

