Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717316;
	b=nBrv5C1tnuxQ2Ic3cWlrYRCAAsFA7dT9QzRCH4HPSScemoR7dyB1p7aeKhwvtg+89w7j
	 X+XLo2p3ViEhyqmCQuluGCnJUnTPofW36GcpK+nhHbgAWQ6I2hWZEO67RBN0rH1CsNp99
	 GSaf0IiNUYt0LZOJ2P5lgcRiijC+jpr+MnqVzA/iPVB5vc254T19HaQY5hmL17sBCatEu
	 1doxE+NGosu+cR1su6YuC+CND3U/tMd1joQiOH1tUBZin6EMan1bQdpye7RFEdx9IMSnb
	 Stas2/Yxm73e28bGPGd2cGNmonzQPXwatPXaXzTmHLPRV1PKgsyYw0aWU0C36ybIUjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717316;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=8ompXbSfKTmar/iuaOX9JIZ9dqke8qGTDkyO8zZl7i8=;
	b=sY73M47Ul68mouszxkdV+hSyTmwWAkqm6a7LjULSN1wmMsD84aZ/g1/OlUPgKq17MdTI
	 byNv6BExkNoouUbc/VfMsuNr4KBAA6OVPu3vU9TYtn2TtxgdIOFgdl7Sc7xoIqmxmR38d
	 nIMKHl/GZtL8LJzkbTD9gvoSjN0gjnfQD9bPKfr30Cq4HenslDZSfEi1HjU20iY/790aq
	 kc1cJmD9kToxOukcf3+p8hY87a1gIJX9CQkhmtiFqV74FU6/+b1Z1mWcQAQoP1iJatb2v
	 LKqFjySIZgCElVyqLHfImAvFDrNLzlo3aLAQItHmTc1cCMLRgn9uZGSqK3I20b+ObPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="T/AbEilE";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1381D606B269
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1381D606B269
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T/AbEilE
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EDB7F43978;
	Tue,  3 Nov 2026 14:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5079B1F00919;
	Tue,  3 Nov 2026 14:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717315;
	bh=8ompXbSfKTmar/iuaOX9JIZ9dqke8qGTDkyO8zZl7i8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T/AbEilEPu+993/i5YrlBe/LjW0S5UQfpCu5Iccbvzqd12sRlTgFWsgrSVjw2w1Ji
	 feLhyt4/KDJ0nKFxA0iTxvtabCMgfYDOWi9/8DtzToqxMu4kRB3J0iRi9xaoOeAiQe
	 bxCJ50IHJLdREO77IDUbG52cQ8VgBxK7kEVyzcedFS7bENBc+uy9QX+tlio1XnTzH5
	 DAdRilCYdO6cIMJKRAY4DvOH9JBzziLKOpYIkd+hmD6OOYQHSsSMOdLVBXppMe1DNg
	 BVkpW9rOFYDyLgabcNoUfGp6p/nPWyKE4kB6moR5RMrDeUbDs9DqAMXxdrGzppmBuD
	 Pn7dOj5o6ylrg==
Message-ID: <sashiko-outbox-195505@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 33/38] proc: sysctl: copy to and from userspace
 without holding the table
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-33-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-33-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:48:33 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D33

