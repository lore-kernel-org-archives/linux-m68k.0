Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906938;
	b=Gw705/QQO2eyTVIXHe/Wf7S5KuyNb51b6aIzDJeRjA8/VBqSgcm+61zu9A12wxe3fDgP
	 zb+HQSJJeXggG7TTeSp0vqLrQAPqqY/MozmHNUcd2cpuSzI6+xQgcXsAoJ2BH4GH/DFrr
	 fxvygPtJXQvkzVVQWoDk83rUvvQCJl3z6F7rsBIO9yWXB5LYglsXZsyMxlIbH7GXCN3g/
	 H1U1xG5Mrx6Vl47yaxRoQ8EWPM5t5C4FTO9zJATaf9rOF9DgJciK3InykLhF87g2xjB48
	 Y6XI7j5rrNMYz7hgF28MGk8mQ/PrYRj54WhdIKwI21mlP/4nCSxZZCipjwGdZyFv7dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906938;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=8+PUUisCWtmjpXGFSnEzEH85bwtBLwjRqMOjM3Vmjmk=;
	b=a7PeXBZUEZMn4rYmsLHOFeu/AoD3ASkeqV6TmxwBUFO839TBUkE2duEe7LpePGpxBebM
	 kqbmhyb88D1TIpywAP670DgGfmp5do4XO63ipeMnnqzm4PC/GbzlGQqcr189qLpI5VjSm
	 9KLCyc9LfD+6usirRqO+MCnOIzErJP/y/NhPfd27DN4j1HpLHb3zLsgbGuuXDPrV89ZA3
	 /we05LRAZ4+HsoofBpsgPO4vrEm8HO7W9vPjxfDhgC1w/gFav0bXzDp3Nh2kZHhCX30L3
	 1jUKcTL7eaWwizHldc6Uedzukinh8BowAhHrw8yraM//JENP469Xiu4KdIzqyZN9vuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGXjVaZA;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487F6606A331
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 487F6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGXjVaZA
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1650D418CF;
	Thu,  5 Nov 2026 19:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680F41F0093A;
	Thu,  5 Nov 2026 19:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906938;
	bh=8+PUUisCWtmjpXGFSnEzEH85bwtBLwjRqMOjM3Vmjmk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JGXjVaZAK0CFDggQJdQ+YxBvHhKA1VCtqeH0C7UlBLv6f9VG7skZu2dEAbXlkszW+
	 sJTw0vxxWmvEmoZ//n7adNnR8rVGdWKpWloXAc/ZnMiIcC1Z7LfAxfJ1lZKXvGWlIS
	 PhuWRh2l7d+X+aiKaVkZ1til7ZTDouBvsGp4ZrUVot4KXntqybtMcWLZq8dMoH9KMN
	 yQdRKjUGTGwZGlm1bL3/t2/RiEaT3aD77Fgz7S3aVXIsJYSEDz2AoydnPR6UJrVtty
	 1L9zuHgLTxVXIrW2mhh+h+95gf4FNjVSdlwVAZRJPDPN2gARWlGlHNxwoYxHNUqah+
	 h0Hn80dmMBTsA==
Message-ID: <sashiko-outbox-199868@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 05/51] xtensa: simdisk: remove the proc entry
 before the disk
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-5-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-5-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:28:56 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> simdisk_teardown() frees the gendisk and only then removes
> /proc/simdisk/<n>. A write to that entry in between attaches the file
> that was written to the disk, and simdisk_attach() sets the capacity of
> the gendisk that is gone. Remove the entry first, remove_proc_entry()
> waits for a writer that is in the middle of that.
>=20
> Fixes: b6c7e873daf7 ("xtensa: ISS: add host file-based simulated disk")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D5

