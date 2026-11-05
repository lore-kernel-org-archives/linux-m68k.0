Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906984;
	b=xhLr2N4x/lqFJiQqHn3bKK3ZNcBQt1wPUxEGRZpofEiCOOPp9VGBq+oM77Ljd0fBaTXE
	 qCuW+y62tymPQzxD4dWgTnJYL6brwY8f9Oyu0I3/pqB98VE+R/Y7NNouovAaj5hkFV3el
	 +lFORLHzzaHFPN4MKR1TswSRt/z4HTxCJTpd1Tt9POMvJltJgMxu0/YERr+Z2tdrPwkmr
	 khBoovT8zhtiLzDLEeUSMH0DKuigSIwNpeIFNx/W0GFx47+Ok/TTbNKbItP4vOR1Ru5N3
	 dzwb24b6UPh4VVN2qk5M6FrsKQJlq0cPeag24ALmUnbQveJzq6Nn6MuaVjXpMsxGHAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906984;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=FD0zXeI/isP72fw/ayOidXLEWS0eS7g6u0vyIbhFYcI=;
	b=NtCUoUxDlPt8LMm7yZpHNFaky6nY6cb442k13XMPcaUcn+KpvgLUMsr7Bu7HH74pL5I8
	 DT4AZs48XNGSUJDLOtVLLDPCmsgJvIkOMl3GbgxFjrUZxxubTo3w3y2xaLNjnPvHB6HV3
	 0xzisqlxpkjqfUcl3bI9WT6vhqsm3osZjV0h0mhMFTEasYpxzcnYbGZLyk84n5GoEXlud
	 UO0UYPjqJ59D4KKD9nc4EL6MjTj/Xi3i+ACZXWTI89m3N5eJoD8mZoAHZIRnGeOdVJpIe
	 FKAxRs4iQ+cirtJTxe2tT9h5NjRXFEmJMot5p6CPn+OWmMbxCJig+RpP9Fg8GmH4h8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1XBvOeH;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBAF60A260C
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BBAF60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1XBvOeH
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C9CC0601BE;
	Thu,  5 Nov 2026 19:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2966B1F00A20;
	Thu,  5 Nov 2026 19:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906983;
	bh=FD0zXeI/isP72fw/ayOidXLEWS0eS7g6u0vyIbhFYcI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H1XBvOeHKHmEnMkDZUHXEyfUtxCM50iTgTdglUxQp7JDN+qlEWTIsqSpbnUlpXjRN
	 988hcRyCOI8UWFHz/f+qK5LDQHQXayVRQ3262j47Zn0Jqh760jpB+AGIZEjmyhHslx
	 Qqs2Y14lCac9UjAE5y2LlNmPZovL0mIlxziAqVpEYWF7VcSH/XugirGbUWyl+1JJad
	 +WoSrpl7AP1ruZ40/ApjycvpY+4AnxyaNTaAT+qJ2l5Ec76Lx2QiGxwb9aykDXG/Bj
	 ZE2WhLZrYRFfMMBbtAErBrjrpSX00IacUpKBWO3AqMz+Y2+flePrBdhMVItf47L5ux
	 lY1VLRG53p8sw==
Message-ID: <sashiko-outbox-199890@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 27/51] um: NUL-terminate what is written to
 /proc/exitcode
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-27-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-27-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:41 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> exitcode_proc_write() copies up to sizeof(buf) bytes of the write into
> buf and hands it to simple_strtol() without terminating it. So
> "echo -n 5" parses whatever the stack held after the '5', and a write of
> seven bytes or more reads past the end of buf. Terminate the copy.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D27

