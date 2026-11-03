Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719129;
	b=WLrTWQ7uXOjWoWpzBB4N5bXW0+TzeFVzm4sjZmssj9JR8bbmvqKUPiEs9a9vstCitRwZ
	 Ud8f9JLA5fyAWAlPVEwHMDM9L/+gSPE40utMyB+248c1YgssmXW029fnTgVcDtrziG+Me
	 dDvW+NBdJQH505XS75Fp2L3WCr56OmpZTCsUkH8SV8oXPTrb2iAeZoLkcka8qKZp7DOnF
	 sSYknS1igYdsERuaON161gA0lQCAoUrAg1Y8vjlaYABiClRJ+JZDwPIG1L6k3c9PfLre2
	 U6JPR1UU1VRwB/2Oadv1VpjR7mHqBTDKGWYN2FwOhsyEqPbzEki1jgLlqSqwgtFAg4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719129;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=ZU3+k3TcIYO6YkcHmMmrwZXsUbYIYwH7UeAI7gyrJ3A=;
	b=aXvayrmEQa99DPj7YWZEq7CSF1F00Y1Hj9a9oONDQQMo0gluAUXQGPx30mFBPeLCoJu0
	 RCYzX30GuGTlpQJe0CH8j0i21T0hGxlUKVTWHMBP5A3714EiHkfSojfYly+WwZP8+2kGW
	 4OJ8mH2Ac/rrwgpSKcKrgcNpI2vkfuwOdupCkfJK6RjFnu4DssZqMOLhcOXY4CUDEnMg6
	 94AxCfcef8s0MIWUjaoIpGFbhI3bqY8MTvnKHOXegPUYZ46IUr3z1gvSQe01ZCsif4umW
	 p2T2GhAJOdIEEF66TAOAqGOUi6ALRSW72kMqFs8hpwEnWaqXNo/IPU927bnFlKT6hWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0h9UMph;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A812606BA08
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A812606BA08
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0h9UMph
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57086605CE;
	Tue,  3 Nov 2026 15:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046851F000C1;
	Tue,  3 Nov 2026 15:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719128;
	bh=ZU3+k3TcIYO6YkcHmMmrwZXsUbYIYwH7UeAI7gyrJ3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U0h9UMphxrk1+mDnG0RzJJVioL/TjGuZE/m5lN4g//YG7ZBRhGM3XEQnayxkRQEtz
	 tba6IIRW7Hgbxp6euwMbzkpRpxx6lZ6mJG4Mm8FtFIdnmA1g/guNWt3PrDBwgPvIbH
	 k0wO/CWdhNQvXbaK7Lf//4AHfgVJNnRSqhFGoOYnKnxKwBPIqHIMPoXbYpog8RGwXx
	 4bP356yoryajWtdGcJRHNWblQsglDb2fE+3TkMWCf+62VKtpl6IVpsp0BiiR+VvRHs
	 CEv2c9NeeIaBjqzGREG/JV/GIiQXyAjR6LSQBpr5S3fOhe19V4s329MQ1rWhUQwDT7
	 ymXStWtbH9HnQ==
Message-ID: <sashiko-outbox-195590@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 10/23] scsi: core: let procfs copy in writes
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
In-Reply-To: <20261102-work-procfs-drivers-v1-10-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-10-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:18:45 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() for /proc/scsi/scsi, /proc/scsi/device_info
> and the host files so procfs copies in what is written before it pins
> the entry, and parse what was written from that copy. /proc/scsi/scsi
> and device_info take up to PAGE_SIZE bytes like before. The host files
> pass the copy to ->write_info(), writes to them that are larger than
> PAGE_SIZE - 1 bytes fail with -EINVAL from procfs instead of -EOVERFLOW.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D10

