Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907321;
	b=nXOU2iEQrZFtdvx9/h+H8TYEYfbvGD61G/w8S8KeizYYImcZFikcBeL/QpA1pldEdtWD
	 5kMiuCztq24euMAia6C/biWT6hIBFrY/7L25uSY4XzO8RH60NKXreU9I5oOf9YsTnIc3M
	 yp3AEReDlQLzpHQQ2RiX5B+joiBBxCZviLCSMHcdKDThbTfvP4QlWMzIN6BpG7dlvHzMf
	 +MlkwlS2gMsKTXB6hX000l8yW6PfI7hxaia0ucwfNvzZgvmj21FGkcfZhPxzxqM/s3jVK
	 kyas5V5j+/ObRJxHJ27rgkDw3t22O6Z4JkPobKDKiux8au2vfgt6kjM83PUelH/cs/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907321;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=6kdeb8slgi5Epc3AUJlZlnTJq9uw2LtJTfzJG8aoTok=;
	b=q8ioEbgbO3G71B01jP0GlrhDWFdqqFxiYYW15DYUDCqHli8Y7nerpU5tSQEvvoyR4XX7
	 Ylb619YiaAeZRe4YJvjeKJUB01lbVicbWucGSmtvmAlovEukgeiMaCyHwN/87iLtwvyA9
	 9Hk+nI84nPyVW/BCbrgt9orU7F9OQGgDMO+HSkjA+3pl/03u92jyxydS31u/i+pw3QKa3
	 3f3eSU+Bpu6J/VC9UCrIfPNtR3ODLqB4AK75zx8sJEHcs1oIsovXYEqse1t1LGyFozb6f
	 xxFD8qpasV8J9igJIOj8PpX6wde5oP1pGMWoZg4hBQlxvIri5QmR0tP79uvbXblpv/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nB2XodGr;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0613660772AC
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0613660772AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nB2XodGr
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F70F6014C;
	Thu,  5 Nov 2026 19:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879B61F0089E;
	Thu,  5 Nov 2026 19:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907320;
	bh=6kdeb8slgi5Epc3AUJlZlnTJq9uw2LtJTfzJG8aoTok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nB2XodGrsltbbE61/MY+yy8aN79qXnaMrW8LLWpZP+0dzW4JXJ0pwkuPXIFbqI8o+
	 aUuDiq/2IV6LrgueMm0fcGlLznRR27RNE+StoOyZgUUBrn113C9xbA5rh81VwXMVPK
	 VUjsVxMGM3JYpmYf1PTEDk/e5Uf7TRieH5oanj3YbSEWS4MEoLAes6OJHouq9acGzE
	 TUHH7dJOYKuCMwdG4wrNuNFJ7FHrzzaOQAVegH3vF65CM3UFN2gW35V1Z8zXxDuW+B
	 Eq7SEBOj2oNuM5B+HjWikWursJuaXfKRpHoFMZ/wvqpsIgG8z33e9DQBOwbZIzS+yU
	 fbyKBvVlkA2pA==
Message-ID: <sashiko-outbox-199933@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 03/23] proc: share the readdir cursor with
 sysctl
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
In-Reply-To: <20261104-work-procfs-core-v2-3-76ace653a773@kernel.org>
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org>
 <20261104-work-procfs-core-v2-3-76ace653a773@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:35:17 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> proc_readdir_de() and proc_sys_readdir() both resume a listing after
> the last entry it emitted and each remembers that entry in the open
> file with a cursor of its own: the same struct, the same way of
> setting it, the same release. Keep one in generic.c and let sysctl
> use it.
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-core-v2-0-76ace653a773@kernel.org?part=3D3

