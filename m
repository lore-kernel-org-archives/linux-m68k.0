Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906943;
	b=NHb4OyMc1yNEFxkQ5A7QbzDfdKht5Rx1ahvJZkG7S5LEJkZUDANnx2jHTAbHUYPP/4+v
	 ewlpEJGgLokFocfEI3Gyht0yR8bAa021nz2Rl8d2rziHNi4f8JAr3wgAwHFs6xfjk2sYl
	 h9DOOoKe32HpFzzahJstQ4As/7Otk9uZFMXZ+Dz0IW+iDJKRn3n4xBO7LeAJABvOOxsw0
	 1H0ipbUdhF8S9XQM8qW4p5XHNiVvqWUncwQgD7j7h79azOZUK5WoPmhqtAYKqE3ECfetN
	 jM1XFGz7+WAMzUBVePv9CuAuVUaB7Zjp4ai2Rviu4broX5B8F2cCEJB/Gn0kGJCwG5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906943;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=RPopwINq+xMgMWtXglTyha+UOv+CcUS7lcSD7KMhNFg=;
	b=p0Vl5XU+zZ4Joc1pQi+vZ1sNXl9+PgsQ+AIF5iu4SUe4KBRJ+5o951RRQ38mL8kIOCb9
	 cjr99R84BI8mp5KuEms3EqIbBeRrpIKvKNXprARNzUUwYIOQEb0zj8f8+4N2xiDCTNa+l
	 Mq//sGspG1jUB5wFFfgERliJaHOtzJN8dl6zwVokqX6oehCbQqbm3fr1nJt8XlZPBoeMg
	 tVmA9WpJQ18ONEgd56CrZ7cYwAq2rEBDhJXY9uugNZKAzrXlPJ4pNBIIY67xGp/VQclPj
	 20WQNZ96Ykt01TuN1R0U0nL5smlljsBAVJdQOiBVkXJedMhaiAhrcswrl/2GOy1BFiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MRlIi4Su;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6862A606D831
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6862A606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MRlIi4Su
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC66860180;
	Thu,  5 Nov 2026 19:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB1C1F00A18;
	Thu,  5 Nov 2026 19:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906942;
	bh=RPopwINq+xMgMWtXglTyha+UOv+CcUS7lcSD7KMhNFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MRlIi4SuEm+9lYf675R0mxP3GdNLM2xUEtY8ZG2WMxPIoEfeSqyBFYM2gtCBsBs3m
	 WLw30oAHvmuPRU77FU8jeUvz4+Ind8Zmzv1Ekyjvc/tn8qGqLccX6vUQqQSX7hq1/k
	 Y8Bgfu+NLVYMkBEN9Y8HxMzqgT+miO99k+v6W3uJKkYJtPSLid+kFxUhwkrKegwdQq
	 aec8VpuFnlT1J+sjdVpGBEgq/WGixqqQvkO/tslmViTsizxwSIjmrkO988XX0OlAJW
	 1qP4k5WxxEbBvXF8Yd4+nLhk3lLXIWrGZE5yrlrRH0hPB/6I0M1oCh0q2rmSXP6Ekk
	 kU0ykjAB0e/9w==
Message-ID: <sashiko-outbox-199870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 07/51] lockd: don't hand out the terminator of
 nlm_end_grace
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-7-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-7-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:29:00 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> nlm_end_grace_read() answers with "Y\n" or "N\n" from a three byte
> buffer and hands out all three bytes, the terminating NUL included.
> Leave the NUL out.
>=20
> Fixes: d68e3c4aa416 ("lockd: add a /proc/fs/lockd/nlm_end_grace file")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D7

