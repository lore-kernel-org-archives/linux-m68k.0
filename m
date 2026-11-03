Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717271;
	b=GHuYPRmrrbTT3VgXVWSror4HaRHJqBiXWbO2lf8cv/+j3Jl054oJTZ2+mRnbUWFLfia4
	 bh83jwpKuM8jzz6j1UUkJ+EO72Ye66Ypiyvbxd4+jAvb18VZehTlvocNWqRtlxL7SKlkl
	 Ew51Kbp/HNkwaNoJRP+rrx0StLBPgrWHw9bZ0+wQSdAXfa/iI0asAiMWO+m2lOxEPvgeI
	 +ej8relOrxyrELtuuIRBhF9DYS2W2v/ORfbzjiMkqTJlJUsvs3CpJOk1g/Z0fxQhnYhIO
	 qMYrMuf8Vhtf0j5f35PKr/ioDpzazd7hrPTn1UNFv/PXg6EF2+MA9at2kSqz+Ngimkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717271;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=AI0rGhRzTqGYKRLTB4K0BKBYUbKuh2b2KCu/bDS4bLM=;
	b=HJQjrZ1mGCMwEgc+5QhK4spqTDrhIGjJJs/xw86RJW3IEXqDw341uwUJap1KHuK0hciu
	 Tf6X1ZyYi6FATIybeKZ6T38fAi75wBPjxPe4+ptK2u+qrKdxsuMlF6wyfogjx+I8bfMz0
	 JDWpw6y+tQe0fdnL233O5tXwu0DefSBj3dJCalDII+rsqxDbjd065x95t0D5qJRfp02m8
	 zvCyuZ+49CrYR6kRcXONCVTnSP3ueUCpHAuDDb0K3+KJ0zyPn52hl4dPoMfX39UQO/IZ2
	 XqYOqGs+o03EcHaRLlj+5EV078iOW1J48KHpF9eYBSdvfiCPNgUhEEuuRjKKSGeuFMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShMAFIe9;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864B7606D823
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 864B7606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShMAFIe9
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E4E640BBA;
	Tue,  3 Nov 2026 14:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F4B1F000C1;
	Tue,  3 Nov 2026 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717271;
	bh=AI0rGhRzTqGYKRLTB4K0BKBYUbKuh2b2KCu/bDS4bLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ShMAFIe95BTdZ2y4kYVfQPHLm//wuCkQQIPlY09N64k9vZ1VUW1lmnEqdkl0tWce+
	 knySIL9/DVo9aQOZYQkJG93Wyzcd6C/0Erm0JdbeY5hpN2CyahPgm/LOQQv98jl2VZ
	 Hs9IowAUWCqL1UitWEgdsFMjAqrvDmd7D9Y4C6j9jU51K/WOU8uJ8PEvTLiQR/wbXx
	 aKoA8OsXfqxzDd6qpl2ukJsC2GUZJ9+0eB4F6fsScC07klIl0X9a1IqUD8OdA0MlIl
	 icJQrYztLOnx3QIlvIFAO30B3GUV3EHclXPPks/c8ySMPgjLbVipKODsdqGWJXlGa0
	 Nh/UTh9DN36ag==
Message-ID: <sashiko-outbox-195484@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 12/38] wifi: libipw: don't return 0 from writes to
 debug_level
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-12-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-12-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:47:49 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> debug_level_proc_write() returns the length of the string it parsed. A
> write that starts with a NUL byte thus returns 0 and writers that use
> stdio retry it forever. Return the number of bytes that were written
> instead, which also stops writes longer than the 11 bytes it looks at
> from coming up short.
>=20
> Fixes: b453872c35cf ("[NET] ieee80211 subsystem")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D12

