Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717266;
	b=WGWOZikGoHsJt1FEKTSaEdyHophQRGhwRKwYqbLYYCE8PXZXYCCUO7S3cRH6KXQn64JB
	 sfta3mzSN+LIzHNbktcHTL82VtFrUKZU7yLIhrqkrvl5Vt+hEjgXdh6ZsXAcurJjqytCp
	 MvQdvcDLMdhTcJ35Kh4E94wQobXrD3rf5Nu6vPmIzMlyaDD9rwhJuqlwWpEo0jKo+nt4a
	 v/oidvB8AbaQCmRpigJZ3bYe6xCULWPax1TcTny7pxtTpW5Xqpuq6HVTcdwAGNaq+fAQm
	 b7NjxWbHhQLXCrFbptFtXOFxu6X8hLnqwmSaW7qUwq0UdPoJxKPrcG0S3Dm+uY0kcTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717266;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=/tLnPlPXv9G/A5LSRwB4ABldzL7QTmUhIz0U/QfhmpY=;
	b=X75bW/t9uVbOgXcUP6fEHZLPSBVu/S2Vz06zkXkukml4c9TOE2Z+x6Qw6LYQVOUo5Wqv
	 LOELXONg9xWX1Yo7IkQggIWO1i7tvQVLVbJ6q+6MIDGjuC40sldLnsLnzH180ZXMzrNJd
	 iVrXYLl3BW/2HAKYdxi4Nrf9AQCnj/6eV9SJDk9//Hhl8xa4y/mYsdNN9x4kJPbpyFL0T
	 c04WV+pncgJyTSwTguFM+HQV9MUkMGjzHc1NaVRFFOSRcCXZBypS3GnMeY88En44daYcn
	 V0ebut8JKipLxo1amB2aM1aApNF6uiaAd0Q4TykkCnYetHgrEi5+dMS0/Yw+ANQ7T/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gnVr8aal;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD4E606EEB9
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAD4E606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gnVr8aal
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B548543607;
	Tue,  3 Nov 2026 14:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6A61F00A15;
	Tue,  3 Nov 2026 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717265;
	bh=/tLnPlPXv9G/A5LSRwB4ABldzL7QTmUhIz0U/QfhmpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gnVr8aallzvFHKfX8uMv/E5wuzx/U/e4tluWEOCpd4vxwHOAENFWai+QEj59i2Zbf
	 FueR79cYduQK5Wd5775YLQ1Hnbw6N0rNFl8tFIRymAq3riJru71CWcnQrbOEI+G5dx
	 /PEy6cYs37h8d3VhAVmzYfGRdTRtJZRTHPBg4V0U28aDjF5G7LYmT7YlnuJVVxai7h
	 ASHng6hlOTQ/Rl8NdR8RiigPr1Mf941O/AAQOSUaA9aPrreg56qXg5kiVDOPyVN58u
	 vtE8gdT8BAP9hwnrG5Pw6qYUmibEvlAQY4bRxxSrAdo8QA8keLjhL+hfdLPBx+Wckk
	 ICpm/kdChLz5w==
Message-ID: <sashiko-outbox-195481@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 09/38] ALSA: info: don't write past the end of a
 data entry
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-9-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-9-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:47:43 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> snd_info_entry_write() clamps the count to what is left of the entry
> by computing entry->size - pos as a size_t. For a position past the end
> that wraps and the write goes to the driver unclamped, for opl4 into
> sample memory outside of what the entry covers. At the end of the entry
> the driver gets a count of 0 and vmalloc(0) warns. Before the clamp
> moved into the common code the driver ignored such writes. Fail them
> with -ENOSPC instead, like a block device does at the end of the
> device. Returning 0 would make writers that use stdio retry forever.
>=20
> Fixes: d97e1b78239c ("ALSA: info - Check file position validity in common=
 layer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D9

