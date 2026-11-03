Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719126;
	b=ZPMGm3yyBXqUWE2lGbqtCh1gTwD4nQ4hPlyWoLDnOWiUsMNVr9DLTZnFk+utI28KDAPi
	 5ahUxiT6sCQ/1SHbrjWT3tClLxZKyFjni4GVJzhkjRQhWe756La/KMcdtq1Dk5DeC3cy2
	 fze31pFRxRO3M+GSh5rAGNlkSR0pU6J6GaUIg86CMNBEdo0hKP6xLh1Tmi6JdH6qV1RJV
	 0J6MxwkYirbIKfdrY4YdT4kqkXxxKpQpLZbxvshKtgVgt8FHwQFiT2hH9UkxKX+VeN4xj
	 Ryfd9v94KNRjRl+mq1Ydkl+XwY6IP33Zi4OTnVs83OuhqWyDfvWd5UKFRQnyP+i6ZSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719126;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=phsvqCB36HE5sELY0/rInYjEe9A+U+9Mkk9QZ5NX1/s=;
	b=OIqw9d5P64Y9qkAvfCilMGCa3KwmVLAPbG/AeGw0PMdLjTrfeTES9N4WoSFiRQcoYoQu
	 TN1pQvuu59qhWtQnSPp5ZAqodeigozchTwZnwZGqishmX56kQ8r6XQsqzdNLQp0bacvOG
	 tm8LUid0JkCC0TBg32B2jDUlFrI2du0E8FGU5IPZe/aqMlVpKdgweIIq0fAwdvCYvcn6V
	 WWCzxXjc5/Wm6C5VEAPns76pR1pSAlWV2B0Y+jSdmj+UAIb1elsYjUKEqInzPIkKh1uiB
	 +xBxAGJIWjsY3ul9ekMV+OKAKQrB67j8D/PL4lxbwwRsTSoDYAq+epD4YPU0olP1Jow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KKQjc6qe;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB34606F63E
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB34606F63E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KKQjc6qe
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC01B60A57;
	Tue,  3 Nov 2026 15:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40131F00919;
	Tue,  3 Nov 2026 15:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719125;
	bh=phsvqCB36HE5sELY0/rInYjEe9A+U+9Mkk9QZ5NX1/s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KKQjc6qepO2gqHcvTGoXxHF9p03eElgXkZwT0gb4LHjb9cYDFkWKpIJ8NSAW1lYDz
	 1U8Y4y6QkittHdf9VZjS4lTWM80tTjz1K2bkIiHkjuXkA5Kgqh88q4lx3XaUch514o
	 cekfhMRcd4YGGXX817s9kANAvztbs421COqKGftvoBo7aA12GYDDBOkHN+un27PuXx
	 i2Da4XJX3H7JwBQzj7yO7BWJ6LssAsDzeZiJ1BsOlB9gCQYUO+RKL1cz8HQpUvjZfg
	 +AZ73h/Gv9kWy7Y/Bal112XWIHskhd/6B9QlxXjckC6nmYEyH8m7FiF4fw32DiHONs
	 RtW4Yxv7qH2Jw==
Message-ID: <sashiko-outbox-195589@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 09/23] scsi: let procfs own the seq_file of the host
 files
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
In-Reply-To: <20261102-work-procfs-drivers-v1-9-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-9-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:18:43 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the show function and let procfs open and free the seq_file of
> /proc/scsi/<driver>/<host>. ->proc_open() only preallocates the buffer
> now. Reading the file then no longer holds up its removal when the host
> goes away.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D9

