Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907026;
	b=0giw9PpZC2CpFQoIVoJ/HHitAG3LZsO/cFU969sMWtG1Pt9Wp/G+C8IR3wZITMRJKNB4
	 97V7YsZ3u0uJ6udpTyiHPd8aUGXMF/3DtRows/Vl2JKRfLte1vWEjK4QyC3uEQAwDflc/
	 AgcfbrjqDLrmz+dXmJfy/euFe8GN/LDK62NFoyfLa2AJModCEJD7Q+alhXJhiamg6GDSG
	 QSA5EZdUfBlgcfHmhrk7XuSiuhzasZi5+H7Xc+4zldrKBr/CjI0SDrfSha38UePcZl8O5
	 IHTHIpaAPWa7b1FPpIBnXY9MaBmhP4jh2DHqyL0xL1fOr4E11ekHygtqbbV5zKmthew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907026;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=2ZEFR6gjnP3wVSksugK0Xi/aHT+AN/UQkRBLfUojuMA=;
	b=oLsvgiRreK/TbS8vIYHvm7aiEFKibMfcDJanNWu7hHLQVMfKkvdYnSbo3GHVee5BomkV
	 jJ1IsiYNouStJCINA3dRz/K2sYoO0qbAiAlKknmpUKp4l3gPWgk16rMvJ70RUK2uceXAN
	 L+7tcF9l+KB2STJBP5SQRkJjx2naiXA6itvjwBljZ9UpU5RjpenHOZOmVbRHDaUsV2SFR
	 fuDsaXhpEFjxaRECbYK2/5DhlwfI3xbvb/dlVfCslG1sMimHadUiOk2t84hh5tunF11Ce
	 8cgdw+Z6mU9pIJAdcX7yMTgrCo3zpQkJ5/bTneFhYfpF6t/CbURzAK3ntSXGG8vzvaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aFb5Yznl;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DC2606A32D
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2DC2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aFb5Yznl
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30FF0601D4;
	Thu,  5 Nov 2026 19:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2801F00919;
	Thu,  5 Nov 2026 19:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907024;
	bh=2ZEFR6gjnP3wVSksugK0Xi/aHT+AN/UQkRBLfUojuMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aFb5YznlYnipR19+u+Im8pSQa+/x3WULY7AoYCqTywnkISPlw9ZNAM38Fkr0pYgvi
	 6cp1ijVNCZRYHKjlbb7mp7pruaep/7wtvEt054PrL+Zxw8V6yne8Cd+u9HQSVVaeWR
	 /crGUSwOp+7vR5Uci9LlccyoZkEnJUeSmLK9Ve7s/+EFwq4GsVFjKdQehhVg+5wuGX
	 w0RgAwmJ2guiBQr2AyG8R5mOMd+mWgU2cUDkOUbrm62IVqlgFWh8+X0/UvbreN6eUd
	 orSAqTkhmHMjsXQrmyGsTaiwsc4DUpcbRA79TZz6uGLjaUzMpDTmJ0UWgvZ1kT77o6
	 QnN26MXG0YM6A==
Message-ID: <sashiko-outbox-199909@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 46/51] proc: sysctl: copy to and from
 userspace without holding the table
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-46-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-46-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:30:23 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_sys_call_handler() grabs the table, copies in what is written,
> calls the handler and copies what it produced out to userspace before
> it lets go of the table again. Unregistering a table waits until nobody
> uses it anymore. So a reader or writer whose copy faults for as long as
> it wants, with userfaultfd or a stalled FUSE mapping, keeps
> unregister_sysctl_table() waiting, and its callers like to hold locks
> while they do that. addrconf unregisters the ipv6 sysctls of a device
> with RTNL held, so a stalled read of /proc/sys/net/ipv6/conf/<dev>/mtu
> holds up every RTNL user until the reader gives up.
>=20
> Copy in before grabbing the table and copy out after letting go of it,
> like procfs and kernfs do for their files. The buffer is ours, nothing
> needs the table for the copies.
>=20
> That moves the allocation and the copy in before the permission check.
> A write that can't be copied in, or a request that is too large, now
> fails with -EFAULT or -ENOMEM where it used to fail with -EPERM.
>=20
> Fixes: 330d57fb98a9 ("[PATCH] Fix sysctl unregistration oops (CVE-2005-27=
09)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D46

