Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908181;
	b=cm0Wprz1BpoqIpXRzgBZbFGOL7d104aI8wlfh4VPPCUZ0WLZSdTbDboF8YYBeSaUWMo4
	 4+lD7oobOGmkGeGjrsXsg4Sfe5yCcG6dbuWgoIL+IvYguZZ/TjxZ8ifYk3p+mO7uGcVkO
	 2XHp+GoSdm8w+bnAq6ZpRBkNACaAUOVSHvmmIiysBcWZr1jvWLb91EIu0bAWlsxCjLWMg
	 5MStwpxx/tLpvzk9xNelH21hp4BZiN0w1h0mn5pwk9irbrJXIO7zx7y7qiEnF71blB2tH
	 Z7HQXo2Ke/KzkCkXZrmzELnvkPLuT1tUWlknFIojtPUzVC/qfOQZLiB8UVoNRMhKNJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908181;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=7Djl1QiL5dGG3+hqSXIciJOl2M7vmre3NWilqCBHK4s=;
	b=XZEqfKsQxT14XvBWWjHxhyr+15vgrJwkwEWgDWkQs9ufo5dwR+Ml8TSz0KkqH74yfjDa
	 rJV6fVZj/ecIcdBhqc+4g/d9dk3O+kJaO37Xqv6yIclo4vkCs7Bnht65TECL18J8GhDJv
	 pcU/pd12nUP+3J9B5VvjrNtvOg5sCY6fQB6pqzNbBuFSR7/uZ+DoxRs3iEo1orvRVBnTA
	 nBq6h5jGvEHNH1WiQr9JuBIwCqVPp4wbqQSYLX+I4qkx1MWzafK+rBmWClxEMZMcw/y2G
	 FsGfun17KLyzLs0K66846hthcCXIxQVOyu2og5BH56c25SozVVaeZs1jXHP+yaEA6hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gVTF/DeA";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BF4607530B
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33BF4607530B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gVTF/DeA
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19E9140662;
	Thu,  5 Nov 2026 19:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C851F0089F;
	Thu,  5 Nov 2026 19:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908181;
	bh=7Djl1QiL5dGG3+hqSXIciJOl2M7vmre3NWilqCBHK4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gVTF/DeApM1r2UkSX3BbyQWqcY89YeD5NRV2LSch7GeeuU5KhRBPab+JMDFG8cN1A
	 GdMGsJR6HlcXdZxXBaDVO0yYzoVGUEBmuITdPOPGnZup50Tt36LsyeBXXyTO7jXqO7
	 MSwYN/BhLDomcOHTRo0s8dbFJCcAWnvNDuv7aEVQNHEdNUkfyO5btDTI8EL437WKq6
	 CpQZ9iEJaVQEuUEHv4xe8T7k59dl4qU3XQ/IAkuUUVmfgFZ8gDE9oNOnyGumscbVo1
	 5w44l0n0v6cSl9+sS1ZpHN84/Xjw1YkB+D2kkFxzPRrSzwEP6waImkgF16hG+cOWGy
	 k95eu6tjsdqcg==
Message-ID: <sashiko-outbox-200002@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 16/26] hwmon: (dell-smm) let procfs copy the
 i8k ioctl arguments
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
In-Reply-To: <20261104-work-procfs-drivers-v2-16-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-16-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:39 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_ioctl_buf() so procfs copies the arguments in before
> it pins the entry and back out after unpinning it. The command numbers
> in <uapi/linux/i8k.h> encode the wrong sizes, so the table lists what
> is really copied: an int or the 16 bytes of the machine id out, and one
> or two ints in.
>=20
> A NULL argument fails with -EFAULT now instead of -EINVAL, and so does
> a bad pointer to SET_FAN from an unprivileged task, which got -EPERM
> before, since procfs copies the argument in before the entry's own
> checks run. 32-bit tasks can use the commands whose numbers don't
> depend on the size of size_t.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D16

